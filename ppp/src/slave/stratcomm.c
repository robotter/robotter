/*  
 *  Copyright RobOtter (2009) 
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/** \file stratcomm.c
  * \author JD
  */

#include <aversive/error.h>
#include <i2cs.h>
#include <string.h>
#include <time.h>

#include "stratcomm.h"
#include "stratcomm_payloads.h"
#include "stratcomm_messages.h"
#include "settings.h"

void stratcomm_init(stratcomm_t* sc)
{
  i2cs_init(STRATCOMM_I2C_ADDRESS);
  
  sc->payloadIt = 0;
  sc->returnPayloadIt = 0;
  return;
}

void stratcomm_update(stratcomm_t* sc)
{
  uint8_t frame_chksum, computed_chksum;
  uint8_t command;
  uint8_t flags;

  uint8_t data_recv[I2CS_RECV_BUF_SIZE];

  // check if mailbox is full
  if(i2cs_recv_size > 0)
  {
    // ------------------------------------------------------------
    // RECEIVE

    uint8_t recv_size;

    IRQ_LOCK(flags);

    // release RX i2c
    recv_size = i2cs_recv_size;
    i2cs_recv_size = 0;
    // block TX i2c
    i2cs_send_size = 0;

    // copy i2c received data to local buffer
    memcpy(data_recv, (uint8_t*)i2cs_recv_buf, I2CS_RECV_BUF_SIZE*sizeof(uint8_t));

    IRQ_UNLOCK(flags);

    // -- PAYLOAD SIZE  --
    // first byte should be payload size
    sc->payloadSize = *(uint16_t*)data_recv;
 
    // if payloadSize will overflow i2c buffer size
    if(sc->payloadSize > STRATCOMM_MAX_PAYLOAD_SIZE)
    {
      WARNING(STRATCOMM_ERROR,
        "i2c message payload size too big (payloadSize=%d, I2CS_SEND_BUF_SIZE=%d)\n",
        sc->payloadSize,I2CS_SEND_BUF_SIZE); 
     
      return;
    }

    // if payloadSize differs from received data
    if(sc->payloadSize + 3 != recv_size)
    {
      WARNING(STRATCOMM_ERROR,
        "i2c message payload size differs from received i2c frame (payload+2=%d, frame=%d)\n",
          sc->payloadSize+3,
          recv_size);
      return;
    }
 
    // if message contain at  checksum
    if(sc->payloadSize < 1)
    {
      WARNING(STRATCOMM_ERROR,
        "i2c message too small (payloadSize=%d)\n",
        sc->payloadSize);
      return;
    }

    // -- COMMAND --
    // following byte should be COMMAND ID
    command = (uint8_t)data_recv[2];
          
    // -- CHECKSUM --
    frame_chksum = (uint8_t)data_recv[sc->payloadSize+2];
    computed_chksum = stratcomm_computeChecksum(data_recv, sc->payloadSize+2);

    if(frame_chksum != computed_chksum)
    {
      DEBUG(0, "i2c message checksum doesn't match (frame=0x%2.2X,comp=0x%2.2X)",
              frame_chksum, computed_chksum);
      return;
    } 

    // --
    stratcomm_resetPayload(sc);
    stratcomm_resetReturnPayload(sc);

    // perform command
    stratcomm_process(sc, command, data_recv+3);

    // ------------------------------------------------------------
    // SEND
    
    // 
    memset((uint8_t*)i2cs_send_buf, 0, I2CS_SEND_BUF_SIZE);

    // size of returned payload
    i2cs_send_buf[0] = (sc->returnPayloadIt+1) & 0x00FF;
    i2cs_send_buf[1] = (sc->returnPayloadIt+1) >> 8;

    // prepare returned payload
    memcpy((uint8_t*)i2cs_send_buf + 2, sc->returnPayload, sc->returnPayloadIt);

    // compute checksum
    i2cs_send_buf[sc->returnPayloadIt + 2] = 
      stratcomm_computeChecksum(i2cs_send_buf, sc->returnPayloadIt+2);

    // set i2c state machine to READY (data OK to be sent)
    i2cs_send_size = sc->returnPayloadIt + 3;
  }

  return;
}

uint8_t stratcomm_computeChecksum(uint8_t* data, uint8_t size)
{
  uint8_t it;
  uint8_t crc = 0x00;

  for(it=0;it<size;it++)
    crc += data[it]; 
  
  return crc;
}

void stratcomm_resetPayload(stratcomm_t *sc)
{
  // reset payload read pointer
  sc->payloadIt = 0;
}

uint8_t* stratcomm_popPayload(stratcomm_t* sc, uint8_t *p, uint8_t psize)
{
  uint8_t *pdata;

  if(sc->payloadIt + psize > sc->payloadSize)
    ERROR(STRATCOMM_ERROR,
      "can't pop value on payload, will overflow. (pit=%d ps=%d)",
      sc->payloadIt, psize);

  pdata = (p + sc->payloadIt);
  sc->payloadIt += psize;

  return pdata;
}

void stratcomm_resetReturnPayload(stratcomm_t *sc)
{
  // reset buffer write pointer
  sc->returnPayloadIt = 0;
}

void stratcomm_pushReturnPayload(stratcomm_t* sc, uint8_t* p, uint8_t psize )
{
  // if push will overflow return payload buffer
  if(sc->returnPayloadIt + psize > STRATCOMM_MAX_RPAYLOAD_SIZE)
    ERROR(STRATCOMM_ERROR,
      "can't push new value on return payload, will overflow. (rpit=%d psz=%d",sc->returnPayloadIt, psize);
 
  // add value to payload
  memcpy( sc->returnPayload + sc->returnPayloadIt, p, psize);

  // update payload iterator
  sc->returnPayloadIt += psize;

  return;
}
