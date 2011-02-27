/** @file
 * @brief Perlimpinpin implementation.
 * @date $$ppp:time.strftime('%Y-%m-%d %H:%m:%S')$$
 */

#if defined(PPP_I2C_MASTER) && defined(PPP_I2C_SLAVE)
#error "Cannot act as both master en slave"
#endif

#include <aversive.h>
#include <aversive/error.h>
#include <aversive/wait.h>
#include <string.h>
#include "perlimpinpin.h"

#ifdef PPP_I2C_MASTER
#include <i2cm.h>
#endif
#ifdef PPP_I2C_SLAVE
#include <i2cs.h>
#endif
#ifdef PPP_UART_NUM
#include <uart.h>
#endif

#define PPP_ERROR  0x80   //TODO


#define PPP_MAX_PAYLOAD_SIZE   $$ppp:self.max_payload_size()$$
#define PPP_MAX_FRAME_SIZE     (PPP_MAX_PAYLOAD_SIZE+3)

#ifdef PPP_I2C_MASTER

// for now, i2cm limits recv/send to 127 bytes
#if PPP_MAX_FRAME_SIZE > 127
#error "PPP payloads are too big"
#endif

#endif

#ifdef PPP_I2C_SLAVE

//XXX lazy constraint: checks should separate in and out payloads and consider
// only messages processed by the device
#if PPP_MAX_FRAME_SIZE > I2CS_RECV_BUF_SIZE
#error "I2CS_RECV_BUF_SIZE is too small for PPP payloads"
#endif
#if PPP_MAX_FRAME_SIZE > I2CS_SEND_BUF_SIZE
#error "I2CS_SEND_BUF_SIZE is too small for PPP payloads"
#endif

#endif

#ifdef PPP_UART_NUM

#if !((PPP_UART_NUM == 0 && UART0_ENABLED == 1) || \
      (PPP_UART_NUM == 1 && UART1_ENABLED == 1) || \
      (PPP_UART_NUM == 2 && UART2_ENABLED == 1) || \
      (PPP_UART_NUM == 3 && UART3_ENABLED == 1) )
#error "PPP_UART_NUM is not enabled in UART config."
#endif

#endif



#if defined(PPP_UART_NUM) || defined(PPP_I2C_SLAVE) || defined(PPP_I2C_MASTER)
/// Compute a packet checksum.
static uint8_t ppp_checksum(const uint8_t *data, uint16_t size);
#endif


#ifdef PPP_UART_NUM
/// Handle pending UART events.
static void ppp_uart_update(void);
#endif

#ifdef PPP_I2C_SLAVE
/// Handle pending I2C slave events.
static void ppp_i2cs_update(void);
#endif

/** @brief Internal structure for input message processing.
 *
 * \e recv_buf and \e send_buf include the frame size and checksum.
 */
typedef struct {
  uint8_t *recv_buf;
  uint8_t *send_buf;
  uint16_t recv_size;
  uint16_t send_size;

} PPPMsgFrame;


#if defined(PPP_UART_NUM) || defined(PPP_I2C_SLAVE)
/** @brief Process an input message frame.
 *
 * Used to process a message buffer received either by UART or by an I2C slave.
 * This method checks frame size and checksum.
 *
 * It is OK for \e recv_buf and \e send_buf point to be the same buffer.
 * \e send_size is assumed to be large enough.
 *
 * @return 0 on success, -1 on error.
 */
static int8_t ppp_process_input_frame(PPPMsgFrame *frame);
#endif

#ifdef PPP_I2C_MASTER
/** @brief Send a frame using I2C and receive the reply if needed.
 *
 * If \e recv_size is not null, a reply is received.
 * For both sent and received data this method handles the frame size and
 * checksum. It also checks that reply message ID matches.
 *
 * \e recv_size and \e send_size are assumed to be valid.
 *
 * @return 0 on success, -1 on error.
 */
static int8_t ppp_i2cm_process_output_frame(PPPMsgFrame *frame, uint8_t addr);
#endif


#if defined(PPP_UART_NUM) || defined(PPP_I2C_SLAVE) || defined(PPP_I2C_MASTER)
uint8_t ppp_checksum(const uint8_t *data, uint16_t size)
{
  uint8_t crc = 0x00;
  uint8_t it;
  for(it=0;it<size;it++)
    crc += data[it]; 
  return crc;
}
#endif


void ppp_init(void)
{
#ifdef PPP_I2C_MASTER
  i2cm_init();
#endif
#ifdef PPP_I2C_SLAVE
  i2cs_init(PPP_DEVICE_ROID);
#endif
#ifdef PPP_UART_NUM
  uart_init();
#endif
}


void ppp_update(void)
{
#ifdef PPP_I2C_SLAVE
  ppp_i2cs_update();
#endif
#ifdef PPP_UART_NUM
  ppp_uart_update();
#endif
}


#ifdef PPP_UART_NUM
void ppp_uart_update(void)
{
  // processing state
  //  0-1 : waiting starting bytes
  //  2-3 : waiting size bytes
  //   4  : reading
  static uint8_t state = 0;
  static uint8_t buf[PPP_MAX_FRAME_SIZE]; // read/wrote frame
  static uint8_t *bufp = NULL; // current read/write position in buf
  static uint16_t size = 0; // size to read

  for(;;) {
    // wait for start bytes
    while( state < 2 ) {
      switch( uart_recv_nowait(PPP_UART_NUM) ) {
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
      int ret = uart_recv_nowait(PPP_UART_NUM);
      if( ret == -1 ) {
        return;
      }
      buf[0] = ret;
    }
    if( state < 4 ) {
      int ret = uart_recv_nowait(PPP_UART_NUM);
      if( ret == -1 ) {
        return;
      }
      buf[1] = ret;
      size = *(uint16_t*)buf;
      if( size > sizeof(buf)-3 ) {
        WARNING(PPP_ERROR, "UART frame size is too big (got %u)", *(uint16_t*)buf);
        state = 0;
        return;
      }
      bufp = buf + 2;
    }

    // fill the frame buffer
    while( size != 0 ) {
      int ret = uart_recv_nowait(PPP_UART_NUM);
      if( ret == -1 ) {
        return;
      }
      *bufp = ret;
      bufp++; size--;
    }

    // process the frame
    PPPMsgFrame frame = {
      buf, buf, *(uint16_t*)buf, I2CS_SEND_BUF_SIZE
    };

    if( ppp_process_input_frame(&frame) != 0 ) {
      state = 0;
      return;
    }

    // send the reponse
    bufp = buf;
    while( frame.send_size != 0 ) {
      uart_send(PPP_UART_NUM, *(bufp++));
      bufp++; frame.send_size--;
    }
    state = 0;
  }
  // never reached
}
#endif


#ifdef PPP_I2C_SLAVE
void ppp_i2cs_update(void)
{
  if( i2cs_recv_size == 0 ) {
    return;  // nothing to do
  }

  // Receive data

  uint8_t data_recv[I2CS_RECV_BUF_SIZE];
  uint8_t flags;
  IRQ_LOCK(flags);
  // release RX i2c
  uint8_t recv_size = i2cs_recv_size;
  i2cs_recv_size = 0;
  // block TX i2c
  i2cs_send_size = 0;
  // copy i2c received data to local buffer
  memcpy(data_recv, (const uint8_t *)i2cs_recv_buf, sizeof(data_recv));
  IRQ_UNLOCK(flags);


  PPPMsgFrame frame = {
    data_recv, i2cs_send_buf,
    recv_size, I2CS_SEND_BUF_SIZE
  };

  if( ppp_process_input_frame(&frame) != 0 ) {
    return;
  }
  // set i2c state machine to READY (data OK to be sent)
  // no-op if there is nothing to send (frame.send_size == 0)
  i2cs_send_size = frame.send_size;
}
#endif


#if defined(PPP_UART_NUM) || defined(PPP_I2C_SLAVE)
int8_t ppp_process_input_frame(PPPMsgFrame *frame)
{
  uint8_t *rbuf = frame->recv_buf;

  // frame and payload size
  if( frame->recv_size < 4 ) {  // size (2) + mid (1) + checksum (1)
    WARNING(PPP_ERROR, "frame is too short (expected at least 4 bytes, got %u)",
            frame->recv_size);
    return -1;
  }
  uint16_t payload_size = *(uint16_t*)rbuf;
  if( payload_size != frame->recv_size-3 ) {
    WARNING(PPP_ERROR, "frame and payload sizes mismatch (expected payload size was %u, got %u)",
            payload_size, frame->recv_size-3);
    return -1;
  }

  // checksum
  uint8_t chksum_got = rbuf[payload_size+2];
  uint8_t chksum_exp = ppp_checksum(rbuf, payload_size+2);
  if( chksum_got != chksum_exp ) {
    WARNING(PPP_ERROR, "checksum mismatch (expected 0x%02X, got 0x%02X)",
          chksum_exp, chksum_got);
    return -1;
  }

  PPPMsgData msgdata;
  uint8_t mid = rbuf[2];
  msgdata.mid = mid;

  // unpack, call message callback, pack response
  // set payload_size to the output payload_size
  switch(mid) {

#pragma perlimpinpin_tpl  self.process_input_frame_switch()
    default:
      WARNING(PPP_ERROR, "unsupported input message ID: %u", mid);
      return -1;
  }

  // set common reply values
  if( payload_size != 0 ) {
    *(uint16_t*)(frame->send_buf) = payload_size; // payload size only
    frame->send_buf[frame->send_size+2] = ppp_checksum(frame->send_buf, payload_size+2);
    frame->send_size = payload_size+3; // + size (2) + checksum (1)
  }

  return 0;
}
#endif


int8_t ppp_send_message(PPPMsgData *msgdata)
{
  uint8_t mid = msgdata->mid;
  uint8_t buf[PPP_MAX_FRAME_SIZE];
  buf[2] = mid;
  PPPMsgFrame frame = { buf, buf, 0, 0 };
  (void)frame; //XXX avoid warning

  // pack, send I2C frame, unpack response
  switch(mid) {

#pragma perlimpinpin_tpl  self.send_message_switch()
    default:
      WARNING(PPP_ERROR, "unsupported output message ID: %u", mid);
      return -1;
  }

  return 0;
}


#ifdef PPP_I2C_MASTER
int8_t ppp_i2cm_process_output_frame(PPPMsgFrame *frame, uint8_t addr)
{
  uint8_t *sbuf = frame->send_buf;
  uint8_t frame_size = frame->send_size;
  // prepare the frame data
  *(uint16_t*)sbuf = frame->send_size-3; // - size (2) - checksum (1)
  sbuf[frame_size] = ppp_checksum(sbuf, frame_size-1);
  // send it
  int8_t ret = i2cm_send(addr, sbuf, frame_size);
  if( ret != frame_size ) {
    DEBUG(PPP_ERROR, "i2cm_send() failure (expected %u, got %d)", frame_size, ret);
    return -1;
  }

  if( frame->recv_size == 0 ) {
    return 0; // no reply, we're done
  }
  frame_size = frame->recv_size;

  uint8_t *rbuf = frame->recv_buf;
  uint8_t tries;
  for( tries=0; tries<PPP_I2CM_RECV_MAX_TRIES; tries++ ) {
    wait_ms(PPP_I2CM_RECV_WAIT_MS);
    ret = i2cm_recv(addr, rbuf, frame_size);
    if( ret <= 0 ) {
      DEBUG(PPP_ERROR, "i2cm_recv() failure (got %d)", ret);
      continue;
    }
    if( rbuf[0] == I2C_SEND_NONE_BYTE ) {
      continue; // not ready
    }
    if( ret != frame_size ) {
      DEBUG(PPP_ERROR, "i2cm_recv() failure (expected %u bytes, got %d)", frame_size, ret);
      continue;
    }

    // data received, check size
    uint16_t payload_recv_size = *(uint16_t*)rbuf;
    if( payload_recv_size+3 != frame_size ) {
      WARNING(PPP_ERROR, "frame and payload sizes mismatch (expected payload size was %u, got %u)",
              frame->recv_size-3, payload_recv_size);
      return -1;
    }

    // checksum
    uint8_t chksum_got = rbuf[payload_recv_size+2];
    uint8_t chksum_exp = ppp_checksum(rbuf, payload_recv_size+2);
    if( chksum_got != chksum_exp ) {
      WARNING(PPP_ERROR, "checksum mismatch (expected 0x%02X, got 0x%02X)",
              chksum_exp, chksum_got);
      return -1;
    }

    // check mid
    if( rbuf[2] != sbuf[2] ) {
      WARNING(PPP_ERROR, "reply message ID mismatch (expected 0x%02X, got 0x%02X)",
              sbuf[2], rbuf[2]);
      return -1;
    }

    return 0; // everything's fine
  }

  WARNING(PPP_ERROR, "failed to receive reply: too much tries");
  return -1;
}
#endif

