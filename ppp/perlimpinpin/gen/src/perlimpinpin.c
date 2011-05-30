/** @file
 * @brief Perlimpinpin implementation.
 * @date $$ppp:time.strftime('%Y-%m-%d %H:%m:%S')$$
 */

#include <aversive.h>
#include <string.h>
#include <util/delay.h>
#include "perlimpinpin.h"
#ifdef PPP_AVERSIVE_ERROR
#include <aversive/error.h>
#else
#ifndef WARNING
#define WARNING(...)
#endif
#ifndef DEBUG
#define DEBUG(...)
#endif
#endif

#if defined(PPP_UART_NUM) && !defined(PPP_UART)
#define PPP_UART
#endif

#ifdef PPP_I2C
#include <i2cx.h>
#endif
#ifdef PPP_UART
#include <uart.h>
#endif

#define PPP_ERROR  0x80   //TODO


#define PPP_MAX_PAYLOAD_SIZE   $$ppp:self.max_payload_size()$$
#define PPP_MAX_FRAME_SIZE     (PPP_MAX_PAYLOAD_SIZE+5)

#ifdef PPP_I2C

// for now, i2cm limits recv/send to 255 bytes
#if PPP_MAX_FRAME_SIZE > 255
#error "PPP payloads are too big"
#endif
#if PPP_MAX_FRAME_SIZE > I2CS_RECV_BUF_SIZE
#error "I2CS_RECV_BUF_SIZE is too small for PPP payloads"
#endif

#endif

#ifdef PPP_UART

#ifndef PPP_UART_NUM
#define PPP_UART_F(s)  uart_ ## s
#elif PPP_UART_NUM == 0
#define PPP_UART_F(s)  uart ## 0_ ## s
#elif PPP_UART_NUM == 1
#define PPP_UART_F(s)  uart ## 1_ ## s
#elif PPP_UART_NUM == 2
#define PPP_UART_F(s)  uart ## 2_ ## s
#elif PPP_UART_NUM == 3
#define PPP_UART_F(s)  uart ## 3_ ## s
#else
#error "Invalid PPP_UART_NUM"
#endif

#endif


#ifdef PPP_UART
/// Handle pending UART events.
static void ppp_uart_update(void);
#endif

#ifdef PPP_I2C
/// Handle pending I2C events.
static void ppp_i2c_update(void);
#endif


#if defined(PPP_UART) || defined(PPP_I2C)
/// Compute a packet checksum.
static uint8_t ppp_checksum(const uint8_t *data, uint16_t size);

/** @brief Process an input message frame.
 *
 * Used to process a message buffer received either on UART or I2C.
 * This method checks frame size and checksum.
 */
static void ppp_process_input_frame(PPPMsgFrame *frame);
#endif

#ifdef PPP_DEBUG_TRACE
/// Print a trace of a message.
static void ppp_debug_trace(const char *way, const PPPMsgFrame *frame);
#endif

#ifdef PPP_I2C
/// Send a frame over I2C.
static void ppp_i2c_send_frame(const PPPMsgFrame *frame);
#endif

#ifdef PPP_UART
/** @brief Send a frame over UART.
 *
 * This method send the UART frame prefix (two 0xff bytes).
 */
static void ppp_uart_send_frame(const PPPMsgFrame *frame);
#endif


#if defined(PPP_UART) || defined(PPP_I2C)
uint8_t ppp_checksum(const uint8_t *data, uint16_t size)
{
  uint8_t crc = 0x00;
  uint8_t it;
  for(it=0;it<size;it++)
    crc += data[it]; 
  return crc;
}
#endif


#ifdef PPP_DEBUG_TRACE
void ppp_debug_trace(const char *way, const PPPMsgFrame *frame)
{
  switch(frame->mid) {
#pragma perlimpinpin_tpl  self.trace_msg_switch()
    default:
      DEBUG(PPP_ERROR, "%s(0x%02X>0x%02X): unknown message ID: 0x%02X, plsize: %u",
            way, frame->src, frame->dst, frame->mid, frame->plsize);
  }
}
#endif


/// User-defined message callback.
static PPPMsgCallback *_ppp_msg_callback = NULL;


void ppp_init(PPPMsgCallback *cb)
{
  _ppp_msg_callback = cb;
#ifdef PPP_I2C
  i2cx_init(PPP_DEVICE_ROID, 1);
#endif
#ifdef PPP_UART
  uart_init();
#endif
}


void ppp_update(void)
{
#ifdef PPP_I2C
  ppp_i2c_update();
#endif
#ifdef PPP_UART
  ppp_uart_update();
#endif
}


#ifdef PPP_UART
void ppp_uart_update(void)
{
  // processing state
  //  0-1 : waiting starting bytes
  //  2-3 : waiting size bytes
  //   4  : reading
  static uint8_t state = 0;
  static uint8_t buf[PPP_MAX_FRAME_SIZE]; // read frame
  static uint8_t *bufp = NULL; // current read position in buf
  static uint16_t size = 0; // size to read

  for(;;) {
    // wait for start bytes
    while( state < 2 ) {
      switch( PPP_UART_F(recv_nowait)() ) {
        case -1:
          return;
        case 0xff:
          state++;
          break;
        default:
          state = 0;
      }
    }

    // wait for frame size
    if( state < 3 ) {
      int ret = PPP_UART_F(recv_nowait)();
      if( ret == -1 ) {
        return;
      }
      buf[0] = ret;
      state++;
    }
    if( state < 4 ) {
      int ret = PPP_UART_F(recv_nowait)();
      if( ret == -1 ) {
        return;
      }
      buf[1] = ret;
      size = *(uint16_t*)buf;
      if( size > sizeof(buf)-3 ) {
        WARNING(PPP_ERROR, "UART frame size is too big (got %u)", size);
        state = 0;
        return;
      }
      size++; // for the checksum
      bufp = buf + 2;
      state++;
    }

    // fill the frame buffer
    while( size != 0 ) {
      int ret = PPP_UART_F(recv_nowait)();
      if( ret == -1 ) {
        return;
      }
      *bufp = ret;
      bufp++; size--;
    }
    state = 0; // reset state now

    // process the frame
    PPPMsgFrame *frame = (PPPMsgFrame *)buf;
    ppp_process_input_frame(frame);
  }
  // never reached
}
#endif


#ifdef PPP_I2C
void ppp_i2c_update(void)
{
  PPPMsgFrame frame;
  uint8_t n;
  i2cx_peek(0, &n);
  if( n == 0 ) {
    return;  // nothing to do
  }
  if( n > sizeof(frame) ) {
    WARNING(PPP_ERROR, "I2C frame size is too big (got %u)", n);
    return;
  }
  i2cx_peek((void *)&frame, 0);
  if( n != frame.plsize+3 ) {
    WARNING(PPP_ERROR, "I2C and PPP frame sizes mismatch (I2C: %u, PPP: %u)", n, frame.plsize+3);
    return;
  }
  ppp_process_input_frame(&frame);
}
#endif


#if defined(PPP_UART) || defined(PPP_I2C)
void ppp_process_input_frame(PPPMsgFrame *frame)
{
  // frame and payload size
  if( frame->plsize < 3 ) {  // src,dst (2) + mid (1)
    WARNING(PPP_ERROR, "payload is too short (expected at least 3 bytes, got %u)", frame->plsize);
    return;
  }

  // checksum
  uint8_t chksum_got = frame->_data[frame->plsize-3];
  uint8_t chksum_exp = ppp_checksum((void *)frame, frame->plsize+2);
  if( chksum_got != chksum_exp ) {
    WARNING(PPP_ERROR, "checksum mismatch (expected 0x%02X, got 0x%02X)", chksum_exp, chksum_got);
    return;
  }

  uint8_t dst = frame->dst;
#ifdef PPP_UART
  if( dst & PPP_UART_ROID ) {
#ifdef PPP_DEBUG_TRACE
    ppp_debug_trace("FRWD", frame);
#endif
    ppp_uart_send_frame(frame);
  } else {
#endif

#ifdef PPP_I2C
#ifdef PPP_UART
    if( dst == 0 ? frame->src == (PPP_DEVICE_ROID | PPP_UART_ROID) : dst != PPP_DEVICE_ROID ) {
#else
    if( dst != 0 && dst != PPP_DEVICE_ROID ) {
#endif
#ifdef PPP_DEBUG_TRACE
      ppp_debug_trace("FRWD", frame);
#endif
      ppp_i2c_send_frame(frame);
    }
#endif
    if( dst == PPP_DEVICE_ROID || dst == 0 ) {
#ifdef PPP_DEBUG_TRACE
      ppp_debug_trace("RECV", frame);
#endif
      _ppp_msg_callback(frame);
    }

#ifdef PPP_UART
  }
#endif
}
#endif


void ppp_send_msg(PPPMsgFrame *frame)
{
#ifdef PPP_DEBUG_TRACE
  ppp_debug_trace("SEND", frame);
#endif

  frame->_data[frame->plsize-3] = ppp_checksum((void *)frame, frame->plsize+2);
  if( frame->dst == (PPP_DEVICE_ROID|PPP_UART_ROID) ) {
#ifdef PPP_UART
    ppp_uart_send_frame(frame);
#endif
  } else {
#ifdef PPP_I2C
    ppp_i2c_send_frame(frame);
#endif
  }
}


#ifdef PPP_I2C
void ppp_i2c_send_frame(const PPPMsgFrame *frame)
{
  uint8_t send_size = frame->plsize+3;
  int ret;
#ifdef PPP_I2C_RETRY_COUNT
  uint16_t n;
  for( n=0; n<PPP_I2C_RETRY_COUNT+1; n++ ) {
#else
  for(;;) {
#endif
    ret = i2cx_send(frame->dst & ~PPP_UART_ROID, (const void *)frame, send_size);
    if( ret > 0 || (ret == 0 && frame->dst == 0) ) {
      break;
    }
    ppp_i2c_update(); // process input frames, avoid dead-lock
#ifdef PPP_I2C_RETRY_DELAY
    _delay_us(PPP_I2C_RETRY_DELAY);
#endif
  }

  if( ret != send_size && (ret != 0 || frame->dst != 0) ) {
    WARNING(PPP_ERROR, "i2cx_send() failure (expected %u, got %d)", send_size, ret);
  }
}
#endif


#ifdef PPP_UART
void ppp_uart_send_frame(const PPPMsgFrame *frame)
{
  PPP_UART_F(send)(0xff);
  PPP_UART_F(send)(0xff);
  const uint8_t *p = (const void *)frame;
  uint16_t size = frame->plsize+3;
  while( size != 0 ) {
    PPP_UART_F(send)(*p);
    p++; size--;
  }
}
#endif

