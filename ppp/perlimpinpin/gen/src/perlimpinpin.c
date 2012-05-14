/** @file
 * @brief Perlimpinpin implementation.
 * @date $$ppp:time.strftime('%Y-%m-%d %H:%m:%S')$$
 */

#include <aversive.h>
#include <string.h>
#include <util/delay.h>
#include <uart.h>
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

#define PPP_ERROR  0x80   //TODO


#define PPP_MAX_PAYLOAD_SIZE   $$ppp:self.max_payload_size()$$
#define PPP_MAX_FRAME_SIZE     (PPP_MAX_PAYLOAD_SIZE+6)

#ifdef CONFIG_MODULE_UART

#define ppp_uart_recv_nowait() uart_recv_nowait(PPP_UART_NUM)
#define ppp_uart_send(c) uart_send(PPP_UART_NUM, c)

#else

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

#define ppp_uart_recv_nowait() PPP_UART_F(recv_nowait)()
#define ppp_uart_send(c) PPP_UART_F(send)(c)

#endif

/// Default destination, used with ROID_SUBSCRIBER
static uint8_t ppp_subscriber = ROID_BROADCAST;


/// Compute a packet checksum.
static uint8_t ppp_checksum(const uint8_t *data, uint16_t size);

/** @brief Process an input message frame.
 *
 * Used to process a received message buffer.
 * This method checks frame size and checksum.
 */
static void ppp_process_input_frame(PPPMsgFrame *frame);

#ifdef PPP_DEBUG_TRACE
/// Print a trace of a message.
static void ppp_debug_trace(const char *way, const PPPMsgFrame *frame);
#else
#define ppp_debug_trace(w,f)
#endif

/** @brief Send a frame over UART.
 *
 * This method send the UART frame prefix (two 0xff bytes).
 */
static void ppp_uart_send_frame(const PPPMsgFrame *frame);


uint8_t ppp_next_tid(void)
{
  static uint8_t tid = 0xff;
  if( tid == 0xff ) {
    tid = 1; // skip 0
  } else {
    tid++;
  }
  return tid;
}


uint8_t ppp_checksum(const uint8_t *data, uint16_t size)
{
  uint8_t crc = 0x00;
  uint8_t it;
  for(it=0;it<size;it++)
    crc += data[it]; 
  return crc;
}


#ifdef PPP_DEBUG_TRACE
void ppp_debug_trace(const char *way, const PPPMsgFrame *frame)
{
  switch(frame->mid) {
#pragma perlimpinpin_tpl  self.trace_msg_switch()
    default:
      DEBUG(PPP_ERROR, "%s(0x%02X>0x%02X|%02x): unknown message ID: 0x%02X, plsize: %u",
            way, frame->src, frame->dst, frame->tid, frame->mid, frame->plsize);
  }
}
#endif


/// User-defined message callback.
static PPPMsgCallback *_ppp_msg_callback = NULL;


void ppp_init(PPPMsgCallback *cb)
{
  _ppp_msg_callback = cb;
}


void ppp_update(void)
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
      switch( ppp_uart_recv_nowait() ) {
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
      int ret = ppp_uart_recv_nowait();
      if( ret == -1 ) {
        return;
      }
      buf[0] = ret;
      state++;
    }
    if( state < 4 ) {
      int ret = ppp_uart_recv_nowait();
      if( ret == -1 ) {
        return;
      }
      buf[1] = ret;
      size = buf[0] | (buf[1] << 8);
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
      int ret = ppp_uart_recv_nowait();
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


void ppp_process_input_frame(PPPMsgFrame *frame)
{
  // frame and payload size
  if( frame->plsize < 4 ) {  // src,dst,tid (3) + mid (1)
    WARNING(PPP_ERROR, "payload is too short (expected at least 3 bytes, got %u)", frame->plsize);
    return;
  }

  // checksum
  uint8_t chksum_got = frame->_data[frame->plsize-4];
  uint8_t chksum_exp = ppp_checksum((void *)frame, frame->plsize+2);
  if( chksum_got != chksum_exp ) {
    WARNING(PPP_ERROR, "checksum mismatch (expected 0x%02X, got 0x%02X)", chksum_exp, chksum_got);
    return;
  }

  if( frame->dst != PPP_ROID && frame->dst != ROID_BROADCAST ) {
    return;
  }

  // processing for protocol commands
  if( frame->mid == 0 ) {
    if( frame->_ppp.cmd == PPP_SUBCMD_DISCOVER ) {
      frame->dst = frame->src;
      frame->src = PPP_ROID;
      ppp_send_msg(frame);
    } else if( frame->_ppp.cmd == PPP_SUBCMD_SUBSCRIBE ) {
      ppp_subscriber = frame->_ppp.subscriber;
    }
  } else {
    ppp_debug_trace("RECV", frame);
    _ppp_msg_callback(frame);
  }
}


void ppp_send_msg(PPPMsgFrame *frame)
{
  ppp_debug_trace("SEND", frame);

  if( frame->dst == ROID_SUBSCRIBER ) {
    frame->dst = ppp_subscriber;
  }
  frame->_data[frame->plsize-4] = ppp_checksum((void *)frame, frame->plsize+2);
  ppp_uart_send_frame(frame);
}


void ppp_uart_send_frame(const PPPMsgFrame *frame)
{
  ppp_uart_send(0xff);
  ppp_uart_send(0xff);
  const uint8_t *p = (const void *)frame;
  uint16_t size = frame->plsize+3;
  while( size != 0 ) {
    ppp_uart_send(*p);
    p++; size--;
  }
}

