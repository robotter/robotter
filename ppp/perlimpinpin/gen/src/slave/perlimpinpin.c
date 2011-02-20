/** @file
 * @brief Perlimpinpin definitions for slave $$ppp:self.device.name$$.
 * @date $$ppp:time.strftime('%Y-%m-%d %H:%m:%S')$$
 */

#include <string.h>
#include <aversive.h>
#include <aversive/error.h>
#include <i2cs.h>
#include "perlimpinpin.h"


#define PPP_ERROR  0x80   //TODO

#define PPP_MAX_PAYLOAD_RECV_SIZE  $$ppp:self.max_payload_recv_size()$$
#define PPP_MAX_PAYLOAD_SEND_SIZE  $$ppp:self.max_payload_send_size()$$

#if PPP_MAX_PAYLOAD_RECV_SIZE > (I2CS_RECV_BUF_SIZE) - 3
#error "I2CS_RECV_BUF_SIZE is too small for PPP input payloads"
#endif
#if PPP_MAX_PAYLOAD_SEND_SIZE > (I2CS_SEND_BUF_SIZE) - 3
#error "I2CS_SEND_BUF_SIZE is too small for PPP output payloads"
#endif


/// Compute a packet checksum.
static uint8_t ppp_checksum(const uint8_t *data, uint16_t size);


/** @brief Internal structure for command processing.
 *
 * \e recv_buf and \e send_buf contain only the payload, not the size and checksum.
 */
typedef struct {
  PPPCmdData data;
  const uint8_t *recv_buf;
  uint8_t *send_buf;
  uint16_t recv_size;
  uint16_t send_size;

} PPPCmdPayload;


/** @brief Process a PPP command payload.
 *
 * Unpack input parameters, call the user callback and send the reply.
 * \e recv_buf, \e send_buf, \e recv_size and \e send_size fields must be set.
 *
 * Provided \e send_size is the maximum size for \e send_buf. On success, it is
 * set to the send payload size, which may be 0 if the command does not have
 * reply parameters (no reply is send in such a case).
 *
 * \e recv_size and \e send_size are assumed to be at least 1
 *
 * @return 0 on success, -1 on error.
 */
static int8_t ppp_process_cmd_payload(PPPCmdPayload *pl);


void ppp_init(void)
{
  i2cs_init($$ppp:"0x%02X"%self.device.roid$$);
}


void ppp_update(void)
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


  PPPCmdPayload pl;

  // get and check payload size

  if( recv_size < 3 ) {
    WARNING(PPP_ERROR, "I2C frame is too short (expected at least 3, got %u)",
            recv_size);
    return;
  }

  pl.recv_size = *(uint16_t*)data_recv;
  if( pl.recv_size+3 != recv_size ) {
    WARNING(PPP_ERROR, "I2C frame size mismatch with PPP payload size (expected %u, got %u)",
            pl.recv_size+3, recv_size);
    return;
  }

  if( pl.recv_size > PPP_MAX_PAYLOAD_RECV_SIZE ) {
    WARNING(PPP_ERROR, "PPP input payload size is too big (max is %u, got %u)",
            PPP_MAX_PAYLOAD_RECV_SIZE, pl.recv_size);
    return;
  }

  // checksum
  uint8_t chksum_got = data_recv[pl.recv_size+2];
  uint8_t chksum_exp = ppp_checksum(data_recv, pl.recv_size+2);
  if( chksum_got != chksum_exp ) {
    DEBUG(PPP_ERROR, "PPP checksum mismatch (expected 0x%02X, got 0x%02X)",
          chksum_exp, chksum_got);
    return;
  }

  // process payload
  pl.recv_buf = data_recv+2;
  pl.send_buf = i2cs_send_buf+2;
  pl.send_size = PPP_MAX_PAYLOAD_SEND_SIZE+1;
  if( ppp_process_cmd_payload(&pl) != 0 ) {
    return;
  }
  if( pl.send_size > 0 ) {
    // prepare reply frame
    i2cs_send_buf[0] = pl.send_size & 0xFF;
    i2cs_send_buf[1] = (pl.send_size >> 8) & 0xFF;
    i2cs_send_buf[pl.send_size+2] = ppp_checksum(pl.send_buf, pl.send_size+2);
    // set i2c state machine to READY (data OK to be sent)
    i2cs_send_size = pl.send_size + 3;
  }
}


uint8_t ppp_checksum(const uint8_t *data, uint16_t size)
{
  uint8_t crc = 0x00;
  uint8_t it;
  for(it=0;it<size;it++)
    crc += data[it];
  return crc;
}


int8_t ppp_process_cmd_payload(PPPCmdPayload *pl)
{
  uint8_t cmdid = pl->recv_buf[0];
  pl->data.cmdid = cmdid;
  pl->send_buf[0] = cmdid;
  const uint8_t *recv_data  = pl->recv_buf+1;
  const uint8_t *send_data = pl->send_buf+1;

  switch(cmdid) {
#pragma perlimpinpin_tpl  self.slave_process_cmd_payload_switch()
    default:
      WARNING(PPP_ERROR, "unsupported command ID: %u", cmdid);
      return -1;
  }
  return 0;
}


