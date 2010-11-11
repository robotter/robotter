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
  * @note Generated on Thu Nov 11 10:56:07 2010
  */

#include <i2cm.h>
#include "stratcomm_send.h"

#define PAYLOAD_PUSH(buffer, value, sz) memcpy((buffer)+(pos), &(value), (sz))

#define RECV_MAX_TRIES 20
  uint8_t buffer[255];


uint8_t stratcomm_message_none(stratcomm_t *sc)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  // push message ID
  buffer[2] = 0x00;
  // push arguments
  // push checksum
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  // send I2C frame
  i2cm_send(0x42, buffer, 4);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_fortytwo(stratcomm_t *sc, uint8_t *r_r)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  // push message ID
  buffer[2] = 0x01;
  // push arguments
  // push checksum
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  // send I2C frame
  i2cm_send(0x42, buffer, 4);

  rv = stratcomm_i2cm_recv(0x42, buffer, 4);
  if(rv < 4)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[3];
  r_r = (uint8_t)(buffer+3)
}

uint8_t stratcomm_message_goto_a_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x08&0xFF;
  buffer[1] = (0x08>>8)&0xFF;
  // push message ID
  buffer[2] = 0x02;
  // push arguments
  memset(buffer+3, x, sizeof(int16_t));
  memset(buffer+5, y, sizeof(int16_t));
  memset(buffer+7, a, sizeof(int16_t));
  // push checksum
  buffer[9] = stratcomm_computeChecksum(buffer+2, 7);
  // send I2C frame
  i2cm_send(0x42, buffer, 10);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_goto_r_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x08&0xFF;
  buffer[1] = (0x08>>8)&0xFF;
  // push message ID
  buffer[2] = 0x03;
  // push arguments
  memset(buffer+3, x, sizeof(int16_t));
  memset(buffer+5, y, sizeof(int16_t));
  memset(buffer+7, a, sizeof(int16_t));
  // push checksum
  buffer[9] = stratcomm_computeChecksum(buffer+2, 7);
  // send I2C frame
  i2cm_send(0x42, buffer, 10);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_trajectory_set_checkpoint(stratcomm_t *sc, uint8_t id, int16_t x, int16_t y)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x07&0xFF;
  buffer[1] = (0x07>>8)&0xFF;
  // push message ID
  buffer[2] = 0x04;
  // push arguments
  memset(buffer+3, id, sizeof(uint8_t));
  memset(buffer+4, x, sizeof(int16_t));
  memset(buffer+6, y, sizeof(int16_t));
  // push checksum
  buffer[8] = stratcomm_computeChecksum(buffer+2, 6);
  // send I2C frame
  i2cm_send(0x42, buffer, 9);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_trajectory_run(stratcomm_t *sc, uint8_t n)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x03&0xFF;
  buffer[1] = (0x03>>8)&0xFF;
  // push message ID
  buffer[2] = 0x05;
  // push arguments
  memset(buffer+3, n, sizeof(uint8_t));
  // push checksum
  buffer[4] = stratcomm_computeChecksum(buffer+2, 2);
  // send I2C frame
  i2cm_send(0x42, buffer, 5);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_trajectory_status(stratcomm_t *sc, uint8_t *r_status)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  // push message ID
  buffer[2] = 0x06;
  // push arguments
  // push checksum
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  // send I2C frame
  i2cm_send(0x42, buffer, 4);

  rv = stratcomm_i2cm_recv(0x42, buffer, 4);
  if(rv < 4)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[3];
  r_status = (uint8_t)(buffer+3)
}

uint8_t stratcomm_message_trajectory_autoset(stratcomm_t *sc, uint8_t s)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x03&0xFF;
  buffer[1] = (0x03>>8)&0xFF;
  // push message ID
  buffer[2] = 0x07;
  // push arguments
  memset(buffer+3, s, sizeof(uint8_t));
  // push checksum
  buffer[4] = stratcomm_computeChecksum(buffer+2, 2);
  // send I2C frame
  i2cm_send(0x42, buffer, 5);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_set_a_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  // push message ID
  buffer[2] = 0x08;
  // push arguments
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  // push checksum
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  // send I2C frame
  i2cm_send(0x42, buffer, 8);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_set_xy_cruise_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  // push message ID
  buffer[2] = 0x09;
  // push arguments
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  // push checksum
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  // send I2C frame
  i2cm_send(0x42, buffer, 8);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_set_xy_steering_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  // push message ID
  buffer[2] = 0x0a;
  // push arguments
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  // push checksum
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  // send I2C frame
  i2cm_send(0x42, buffer, 8);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_set_xy_stop_speed(stratcomm_t *sc, uint16_t v, uint16_t a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  // push message ID
  buffer[2] = 0x0b;
  // push arguments
  memset(buffer+3, v, sizeof(uint16_t));
  memset(buffer+5, a, sizeof(uint16_t));
  // push checksum
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  // send I2C frame
  i2cm_send(0x42, buffer, 8);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_set_steering_win(stratcomm_t *sc, uint16_t r)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x04&0xFF;
  buffer[1] = (0x04>>8)&0xFF;
  // push message ID
  buffer[2] = 0x0c;
  // push arguments
  memset(buffer+3, r, sizeof(uint16_t));
  // push checksum
  buffer[5] = stratcomm_computeChecksum(buffer+2, 3);
  // send I2C frame
  i2cm_send(0x42, buffer, 6);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_set_stop_win(stratcomm_t *sc, uint16_t r, uint16_t l)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x06&0xFF;
  buffer[1] = (0x06>>8)&0xFF;
  // push message ID
  buffer[2] = 0x0d;
  // push arguments
  memset(buffer+3, r, sizeof(uint16_t));
  memset(buffer+5, l, sizeof(uint16_t));
  // push checksum
  buffer[7] = stratcomm_computeChecksum(buffer+2, 5);
  // send I2C frame
  i2cm_send(0x42, buffer, 8);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_get_xya(stratcomm_t *sc, int16_t *r_x, int16_t *r_y, int16_t *r_a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  // push message ID
  buffer[2] = 0x0e;
  // push arguments
  // push checksum
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  // send I2C frame
  i2cm_send(0x42, buffer, 4);

  rv = stratcomm_i2cm_recv(0x42, buffer, 9);
  if(rv < 9)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[8];
  r_x = (int16_t)(buffer+3)
  r_y = (int16_t)(buffer+3)
  r_a = (int16_t)(buffer+3)
}

uint8_t stratcomm_message_set_xya(stratcomm_t *sc, int16_t x, int16_t y, int16_t a)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x08&0xFF;
  buffer[1] = (0x08>>8)&0xFF;
  // push message ID
  buffer[2] = 0x0f;
  // push arguments
  memset(buffer+3, x, sizeof(int16_t));
  memset(buffer+5, y, sizeof(int16_t));
  memset(buffer+7, a, sizeof(int16_t));
  // push checksum
  buffer[9] = stratcomm_computeChecksum(buffer+2, 7);
  // send I2C frame
  i2cm_send(0x42, buffer, 10);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_brake(stratcomm_t *sc, uint8_t brake)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x03&0xFF;
  buffer[1] = (0x03>>8)&0xFF;
  // push message ID
  buffer[2] = 0x10;
  // push arguments
  memset(buffer+3, brake, sizeof(uint8_t));
  // push checksum
  buffer[4] = stratcomm_computeChecksum(buffer+2, 2);
  // send I2C frame
  i2cm_send(0x42, buffer, 5);

  rv = stratcomm_i2cm_recv(0x42, buffer, 3);
  if(rv < 3)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[2];
}

uint8_t stratcomm_message_get_adnsfault(stratcomm_t *sc, uint8_t *r_fault)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  // push message ID
  buffer[2] = 0x11;
  // push arguments
  // push checksum
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  // send I2C frame
  i2cm_send(0x42, buffer, 4);

  rv = stratcomm_i2cm_recv(0x42, buffer, 4);
  if(rv < 4)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[3];
  r_fault = (uint8_t)(buffer+3)
}

uint8_t stratcomm_message_get_adnssquals(stratcomm_t *sc, uint8_t *r_sq1, uint8_t *r_sq2, uint8_t *r_sq3)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  // push message ID
  buffer[2] = 0x12;
  // push arguments
  // push checksum
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  // send I2C frame
  i2cm_send(0x42, buffer, 4);

  rv = stratcomm_i2cm_recv(0x42, buffer, 6);
  if(rv < 6)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[5];
  r_sq1 = (uint8_t)(buffer+3)
  r_sq2 = (uint8_t)(buffer+3)
  r_sq3 = (uint8_t)(buffer+3)
}

uint8_t stratcomm_message_get_time(stratcomm_t *sc, uint16_t *r_sec, uint16_t *r_usec)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x02&0xFF;
  buffer[1] = (0x02>>8)&0xFF;
  // push message ID
  buffer[2] = 0x13;
  // push arguments
  // push checksum
  buffer[3] = stratcomm_computeChecksum(buffer+2, 1);
  // send I2C frame
  i2cm_send(0x42, buffer, 4);

  rv = stratcomm_i2cm_recv(0x42, buffer, 7);
  if(rv < 7)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[6];
  r_sec = (uint16_t)(buffer+3)
  r_usec = (uint16_t)(buffer+3)
}

uint8_t stratcomm_message_test(stratcomm_t *sc, uint16_t in, int16_t *r_out)
{
  uint8_t rv, try;
  uint16_t size;
  // push length
  buffer[0] = 0x04&0xFF;
  buffer[1] = (0x04>>8)&0xFF;
  // push message ID
  buffer[2] = 0x14;
  // push arguments
  memset(buffer+3, in, sizeof(uint16_t));
  // push checksum
  buffer[5] = stratcomm_computeChecksum(buffer+2, 3);
  // send I2C frame
  i2cm_send(0x42, buffer, 6);

  rv = stratcomm_i2cm_recv(0x42, buffer, 5);
  if(rv < 5)
    return 0;
  // read size
  size = *((uint16_t*)buffer);
  // read checksum
  checksum = (uint8_t)buffer[4];
  r_out = (int16_t)(buffer+5)
}
