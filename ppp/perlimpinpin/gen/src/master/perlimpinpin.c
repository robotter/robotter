/** @file
 * @brief Perlimpinpin definitions master $$ppp:self.device.name$$.
 * @date $$ppp:time.strftime('%Y-%m-%d %H:%m:%S')$$
 */

#include <aversive.h>
#include <aversive/error.h>
#include <aversive/wait.h>
#include <i2cm.h>
#include "perlimpinpin.h"

#define PPP_ERROR  0x80   //TODO

#define PPP_MAX_PAYLOAD_RECV_SIZE  $$ppp:self.max_payload_recv_size()$$
#define PPP_MAX_PAYLOAD_SEND_SIZE  $$ppp:self.max_payload_send_size()$$

#if PPP_MAX_PAYLOAD_RECV_SIZE > PPP_MAX_PAYLOAD_SEND_SIZE
#define PPP_MAX_FRAME_SIZE (PPP_MAX_PAYLOAD_RECV_SIZE+3)
#else
#define PPP_MAX_FRAME_SIZE (PPP_MAX_PAYLOAD_SEND_SIZE+3)
#endif

// for now, i2cm limits recv/send to 127 bytes
#if PPP_MAX_FRAME_SIZE > 127
#error "PPP payloads are too big"
#endif


/// Compute a packet checksum.
static uint8_t ppp_checksum(const uint8_t *data, uint16_t size);


/** @brief Internal structure for command processing.
 *
 * \e recv_buf and \e send_buf include the frame size checksum.
 * However, \e send_size and \e recv_size includes only the payload.
 * This may seem a bit hacky but is used to avoid useless buffer copying.
 */
typedef struct {
  uint8_t addr;
  uint8_t buf[PPP_MAX_FRAME_SIZE];
  uint16_t send_size;
  uint16_t recv_size;

} PPPCmdFrame;


/** @brief Send a frame using I2C and receive the reply if needed.
 *
 * The same buffer is used for sent and received data. \e addr must be set to
 * the target slave address.
 * If \e recv_size is not null, a reply is received.
 *
 * For both sent and received data this method handles the frame size and
 * checksum. It also checks that reply command ID matches.
 *
 * @return 0 on success, -1 on error.
 */
static int8_t ppp_process_frame(PPPCmdFrame *frame);


void ppp_init(void)
{
  i2cm_init();
}


uint8_t ppp_checksum(const uint8_t *data, uint16_t size)
{
  uint8_t crc = 0x00;
  uint8_t it;
  for(it=0;it<size;it++)
    crc += data[it]; 
  return crc;
}

int8_t ppp_process_frame(PPPCmdFrame *frame)
{
  uint8_t *buf = frame->buf;
  // prepare the frame data
  buf[0] = frame->send_size & 0xFF;
  buf[1] = (frame->send_size >> 8) & 0xFF;
  buf[frame->send_size+3] = ppp_checksum(buf, frame->send_size+2);
  // send it
  uint8_t frame_tot_size = frame->send_size+3;
  int8_t ret = i2cm_send(frame->addr, buf, frame_tot_size);
  if( ret != frame_tot_size ) {
    DEBUG(PPP_ERROR, "i2cm_send() failure (expected %u, got %d)", frame_tot_size, ret);
    return -1;
  }

  if( frame->recv_size == 0 ) {
    return 0; // no reply, we're done
  }

  frame_tot_size = frame->recv_size+3;
  uint8_t cmdid = buf[2];
  uint8_t tries;
  for( tries=0; tries<PPP_RECV_MAX_TRIES; tries++ ) {
    wait_ms(PPP_RECV_WAIT_MS);
    ret = i2cm_recv(frame->addr, buf, frame_tot_size);
    if( ret <= 0 ) {
      DEBUG(PPP_ERROR, "i2cm_recv() failure (got %d)", ret);
      continue;
    }
    if( buf[0] == I2C_SEND_NONE_BYTE ) {
      continue; // not ready
    }
    if( ret != frame_tot_size ) {
      DEBUG(PPP_ERROR, "i2cm_recv() failure (expected %u bytes, got %d)", frame_tot_size, ret);
      continue;
    }

    // data received, check size
    uint16_t payload_recv_size = *(uint16_t*)buf;
    if( payload_recv_size != frame->recv_size ) {
      WARNING(PPP_ERROR, "I2C frame size mismatch with PPP payload size (expected %u, got %u)",
              frame->recv_size, payload_recv_size);
      return -1;
    }

    // checksum
    uint8_t chksum_got = buf[payload_recv_size+2];
    uint8_t chksum_exp = ppp_checksum(buf, payload_recv_size+2);
    if( chksum_got != chksum_exp ) {
      WARNING(PPP_ERROR, "PPP checksum mismatch (expected 0x%02X, got 0x%02X)",
            chksum_exp, chksum_got);
      return -1;
    }

    // check cmdid
    if( buf[2] != cmdid ) {
      WARNING(PPP_ERROR, "reply command ID mismatch (expected 0x%02X, got 0x%02X)",
            cmdid, buf[2]);
      return -1;
    }

    return 0; // everything's fine
  }

  DEBUG(PPP_ERROR, "failed to receive reply: too much tries");
  return -1;
}


int8_t ppp_send_command(PPPCmdData *cmddata)
{
  PPPCmdFrame frame;
  uint8_t cmdid = cmddata->cmdid;
  frame.buf[2] = cmdid;

  switch(cmdid) {
#pragma perlimpinpin_tpl  self.master_send_command()
    default:
      WARNING(PPP_ERROR, "unsupported command ID: %u", cmdid);
      return -1;
  }
  return 0;
}


