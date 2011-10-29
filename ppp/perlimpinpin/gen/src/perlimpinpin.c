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
#define PPP_MAX_FRAME_SIZE     (PPP_MAX_PAYLOAD_SIZE+5)

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

/// Default destination, used with ROID_SUBSCRIBER
static uint8_t ppp_subscriber = ROID_UART_BROADCAST;


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
  uart_init();
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

  // processing for protocol commands
  if( frame->mid == 0 && frame->_ppp.cmd == PPP_SUBCMD_UART_DISCOVER ) {
    frame->src = PPP_DEVICE_ROID;
    frame->dst = PPP_UART_ROID;
    ppp_send_msg(frame);
    return;
  }

  uint8_t src = frame->src;
  uint8_t dst = frame->dst;
  if( dst == PPP_UART_ROID || (ROID_DEVICE(dst) == 0 && src != PPP_UART_ROID) ) {
    ppp_debug_trace("FWDu", frame);
    ppp_uart_send_frame(frame);
  }
  if( dst == 0 || dst == PPP_DEVICE_ROID ) {
    if( frame->mid == 0 && frame->_ppp.cmd == PPP_SUBCMD_SUBSCRIBE ) {
      ppp_subscriber = frame->_ppp.subscriber;
      return;
    }
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
  frame->_data[frame->plsize-3] = ppp_checksum((void *)frame, frame->plsize+2);
  if( frame->dst == PPP_UART_ROID || frame->dst == ROID_UART_BROADCAST ) {
    ppp_uart_send_frame(frame);
  }
}


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

