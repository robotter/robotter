/*  
 *  Copyright RobOtter (2010) 
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
/** @file stratcomm_send.c
  * @note Generated on Fri Nov 12 21:06:43 2010
  */

#include <i2cm.h>
#include <aversive/error.h>
#include <string.h>
#include "stratcomm_send.h"

#define PAYLOAD_PUSH(buffer, value, sz) memcpy((buffer)+(pos), &(value), (sz))

#define RECV_MAX_TRIES 20
  uint8_t buffer[255];


uint8_t stratcomm_message_none(stratcomm_t *sc)
{
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  buffer[2] = 0x00;
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  i2cm_send(0x42, buffer, 4);

  return 1;
}

uint8_t stratcomm_message_fortytwo(stratcomm_t *sc, uint8_t *r_r)
{
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  buffer[2] = 0x01;
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  i2cm_send(0x42, buffer, 4);

  uint16_t size;
  uint8_t checksum, c_checksum, rv;
  rv = stratcomm_i2cm_recv(0x42, buffer, 4);
  if(rv < 4)
    return 0;
  size = *((uint16_t*)buffer);
  if(size != 1)
  {
    WARNING(STRATCOMM_ERROR,
             "received frame size not valid: got %d expect %d",
             size, 1);
    return 0;
  }
  checksum = (uint8_t)buffer[3];
  c_checksum = stratcomm_computeChecksum(buffer+2,1);
  if( checksum != c_checksum )
  {
    WARNING(STRATCOMM_ERROR,
             "received frame checksum not valid: got 0x%02X expect 0x%02X",
             c_checksum, checksum);
    return 0;
  }
  *r_r = *(uint8_t*)(buffer+3);
  return 1;
}

uint8_t stratcomm_message_goto_a_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a)
{
  buffer[0] = 0x08&0xFF;
  buffer[1] = (0x08>>8)&0xFF;
  buffer[2] = 0x02;
  memset(buffer+3, x, sizeof(int16_t));
  memset(buffer+5, y, sizeof(int16_t));
  memset(buffer+7, a, sizeof(int16_t));
  buffer[9] = stratcomm_computeChecksum(buffer+2, 7);
  i2cm_send(0x42, buffer, 10);

  return 1;
}

uint8_t stratcomm_message_goto_r_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a)
{
  buffer[0] = 0x08&0xFF;
  buffer[1] = (0x08>>8)&0xFF;
  buffer[2] = 0x03;
  memset(buffer+3, x, sizeof(int16_t));
  memset(buffer+5, y, sizeof(int16_t));
  memset(buffer+7, a, sizeof(int16_t));
  buffer[9] = stratcomm_computeChecksum(buffer+2, 7);
  i2cm_send(0x42, buffer, 10);

  return 1;
}

uint8_t stratcomm_message_trajectory_set_checkpoint(stratcomm_t *sc, uint8_t id, int16_t x, int16_t y)
{
  buffer[0] = 0x07&0xFF;
  buffer[1] = (0x07>>8)&0xFF;
  buffer[2] = 0x04;
  memset(buffer+3, id, sizeof(uint8_t));
  memset(buffer+4, x, sizeof(int16_t));
  memset(buffer+6, y, sizeof(int16_t));
  buffer[8] = stratcomm_computeChecksum(buffer+2, 6);
  i2cm_send(0x42, buffer, 9);

  return 1;
}

uint8_t stratcomm_message_trajectory_run(stratcomm_t *sc, uint8_t n)
{
  buffer[0] = 0x03&0xFF;
  buffer[1] = (0x03>>8)&0xFF;
  buffer[2] = 0x05;
  memset(buffer+3, n, sizeof(uint8_t));
  buffer[4] = stratcomm_computeChecksum(buffer+2, 2);
  i2cm_send(0x42, buffer, 5);

  return 1;
}

uint8_t stratcomm_message_trajectory_status(stratcomm_t *sc, uint8_t *r_status)
{
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  buffer[2] = 0x06;
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  i2cm_send(0x42, buffer, 4);

  uint16_t size;
  uint8_t checksum, c_checksum, rv;
  rv = stratcomm_i2cm_recv(0x42, buffer, 4);
  if(rv < 4)
    return 0;
  size = *((uint16_t*)buffer);
  if(size != 1)
  {
    WARNING(STRATCOMM_ERROR,
             "received frame size not valid: got %d expect %d",
             size, 1);
    return 0;
  }
  checksum = (uint8_t)buffer[3];
  c_checksum = stratcomm_computeChecksum(buffer+2,1);
  if( checksum != c_checksum )
  {
    WARNING(STRATCOMM_ERROR,
             "received frame checksum not valid: got 0x%02X expect 0x%02X",
             c_checksum, checksum);
    return 0;
  }
  *r_status = *(uint8_t*)(buffer+3);
  return 1;
}

uint8_t stratcomm_message_trajectory_autoset(stratcomm_t *sc, uint8_t s)
{
  buffer[0] = 0x03&0xFF;
  buffer[1] = (0x03>>8)&0xFF;
  buffer[2] = 0x07;
  memset(buffer+3, s, sizeof(uint8_t));
  buffer[4] = stratcomm_computeChecksum(buffer+2, 2);
  i2cm_send(0x42, buffer, 5);

  return 1;
}

uint8_t stratcomm_message_set_a_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  buffer[2] = 0x08;
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  i2cm_send(0x42, buffer, 8);

  return 1;
}

uint8_t stratcomm_message_set_xy_cruise_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  buffer[2] = 0x09;
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  i2cm_send(0x42, buffer, 8);

  return 1;
}

uint8_t stratcomm_message_set_xy_steering_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  buffer[2] = 0x0a;
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  i2cm_send(0x42, buffer, 8);

  return 1;
}

uint8_t stratcomm_message_set_xy_stop_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  buffer[2] = 0x0b;
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  i2cm_send(0x42, buffer, 8);

  return 1;
}

uint8_t stratcomm_message_set_steering_win(stratcomm_t *sc, uint16_t r)
{
  buffer[0] = 0x04&0xFF;
  buffer[1] = (0x04>>8)&0xFF;
  buffer[2] = 0x0c;
  memset(buffer+3, r, sizeof(uint16_t));
  buffer[5] = stratcomm_computeChecksum(buffer+2, 3);
  i2cm_send(0x42, buffer, 6);

  return 1;
}

uint8_t stratcomm_message_set_stop_win(stratcomm_t *sc, uint16_t r, uint16_t l)
{
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  buffer[2] = 0x0d;
  memset(buffer+3, r, sizeof(uint16_t));
  memset(buffer+5, l, sizeof(uint16_t));
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  i2cm_send(0x42, buffer, 8);

  return 1;
}

uint8_t stratcomm_message_get_xya(stratcomm_t *sc, int16_t *r_x, int16_t *r_y, int16_t *r_a)
{
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  buffer[2] = 0x0e;
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  i2cm_send(0x42, buffer, 4);

  uint16_t size;
  uint8_t checksum, c_checksum, rv;
  rv = stratcomm_i2cm_recv(0x42, buffer, 9);
  if(rv < 9)
    return 0;
  size = *((uint16_t*)buffer);
  if(size != 6)
  {
    WARNING(STRATCOMM_ERROR,
             "received frame size not valid: got %d expect %d",
             size, 6);
    return 0;
  }
  checksum = (uint8_t)buffer[8];
  c_checksum = stratcomm_computeChecksum(buffer+2,6);
  if( checksum != c_checksum )
  {
    WARNING(STRATCOMM_ERROR,
             "received frame checksum not valid: got 0x%02X expect 0x%02X",
             c_checksum, checksum);
    return 0;
  }
  *r_x = *(int16_t*)(buffer+3);
  *r_y = *(int16_t*)(buffer+5);
  *r_a = *(int16_t*)(buffer+7);
  return 1;
}

uint8_t stratcomm_message_set_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a)
{
  buffer[0] = 0x08&0xFF;
  buffer[1] = (0x08>>8)&0xFF;
  buffer[2] = 0x0f;
  memset(buffer+3, x, sizeof(int16_t));
  memset(buffer+5, y, sizeof(int16_t));
  memset(buffer+7, a, sizeof(int16_t));
  buffer[9] = stratcomm_computeChecksum(buffer+2, 7);
  i2cm_send(0x42, buffer, 10);

  return 1;
}

uint8_t stratcomm_message_brake(stratcomm_t *sc, uint8_t brake)
{
  buffer[0] = 0x03&0xFF;
  buffer[1] = (0x03>>8)&0xFF;
  buffer[2] = 0x10;
  memset(buffer+3, brake, sizeof(uint8_t));
  buffer[4] = stratcomm_computeChecksum(buffer+2, 2);
  i2cm_send(0x42, buffer, 5);

  return 1;
}

uint8_t stratcomm_message_get_adnsfault(stratcomm_t *sc, uint8_t *r_fault)
{
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  buffer[2] = 0x11;
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  i2cm_send(0x42, buffer, 4);

  uint16_t size;
  uint8_t checksum, c_checksum, rv;
  rv = stratcomm_i2cm_recv(0x42, buffer, 4);
  if(rv < 4)
    return 0;
  size = *((uint16_t*)buffer);
  if(size != 1)
  {
    WARNING(STRATCOMM_ERROR,
             "received frame size not valid: got %d expect %d",
             size, 1);
    return 0;
  }
  checksum = (uint8_t)buffer[3];
  c_checksum = stratcomm_computeChecksum(buffer+2,1);
  if( checksum != c_checksum )
  {
    WARNING(STRATCOMM_ERROR,
             "received frame checksum not valid: got 0x%02X expect 0x%02X",
             c_checksum, checksum);
    return 0;
  }
  *r_fault = *(uint8_t*)(buffer+3);
  return 1;
}

uint8_t stratcomm_message_get_adnssquals(stratcomm_t *sc, uint8_t *r_sq1, uint8_t *r_sq2, uint8_t *r_sq3)
{
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  buffer[2] = 0x12;
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  i2cm_send(0x42, buffer, 4);

  uint16_t size;
  uint8_t checksum, c_checksum, rv;
  rv = stratcomm_i2cm_recv(0x42, buffer, 6);
  if(rv < 6)
    return 0;
  size = *((uint16_t*)buffer);
  if(size != 3)
  {
    WARNING(STRATCOMM_ERROR,
             "received frame size not valid: got %d expect %d",
             size, 3);
    return 0;
  }
  checksum = (uint8_t)buffer[5];
  c_checksum = stratcomm_computeChecksum(buffer+2,3);
  if( checksum != c_checksum )
  {
    WARNING(STRATCOMM_ERROR,
             "received frame checksum not valid: got 0x%02X expect 0x%02X",
             c_checksum, checksum);
    return 0;
  }
  *r_sq1 = *(uint8_t*)(buffer+3);
  *r_sq2 = *(uint8_t*)(buffer+4);
  *r_sq3 = *(uint8_t*)(buffer+5);
  return 1;
}

uint8_t stratcomm_message_get_time(stratcomm_t *sc, uint16_t *r_sec, uint16_t *r_usec)
{
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  buffer[2] = 0x13;
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  i2cm_send(0x42, buffer, 4);

  uint16_t size;
  uint8_t checksum, c_checksum, rv;
  rv = stratcomm_i2cm_recv(0x42, buffer, 7);
  if(rv < 7)
    return 0;
  size = *((uint16_t*)buffer);
  if(size != 4)
  {
    WARNING(STRATCOMM_ERROR,
             "received frame size not valid: got %d expect %d",
             size, 4);
    return 0;
  }
  checksum = (uint8_t)buffer[6];
  c_checksum = stratcomm_computeChecksum(buffer+2,4);
  if( checksum != c_checksum )
  {
    WARNING(STRATCOMM_ERROR,
             "received frame checksum not valid: got 0x%02X expect 0x%02X",
             c_checksum, checksum);
    return 0;
  }
  *r_sec = *(uint16_t*)(buffer+3);
  *r_usec = *(uint16_t*)(buffer+5);
  return 1;
}

uint8_t stratcomm_message_test(stratcomm_t *sc, uint16_t in, int16_t *r_out)
{
  buffer[0] = 0x04&0xFF;
  buffer[1] = (0x04>>8)&0xFF;
  buffer[2] = 0x14;
  memset(buffer+3, in, sizeof(uint16_t));
  buffer[5] = stratcomm_computeChecksum(buffer+2, 3);
  i2cm_send(0x42, buffer, 6);

  uint16_t size;
  uint8_t checksum, c_checksum, rv;
  rv = stratcomm_i2cm_recv(0x42, buffer, 5);
  if(rv < 5)
    return 0;
  size = *((uint16_t*)buffer);
  if(size != 2)
  {
    WARNING(STRATCOMM_ERROR,
             "received frame size not valid: got %d expect %d",
             size, 2);
    return 0;
  }
  checksum = (uint8_t)buffer[4];
  c_checksum = stratcomm_computeChecksum(buffer+2,2);
  if( checksum != c_checksum )
  {
    WARNING(STRATCOMM_ERROR,
             "received frame checksum not valid: got 0x%02X expect 0x%02X",
             c_checksum, checksum);
    return 0;
  }
  *r_out = *(int16_t*)(buffer+5);
  return 1;
}
