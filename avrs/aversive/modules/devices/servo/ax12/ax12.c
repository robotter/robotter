/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2008)
 *  JD Brossillon <jean.damien.brossillon@gmail.com>  (main job)
 *  Olivier Matz <zer0@droids-corp.org>               (clean-up, fixes)
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
 *
 *  Revision : $Id: ax12.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* See some help in ax12.h */

#include <stdio.h>
#include <string.h>
#include <aversive/error.h>
#include "ax12.h"
#ifdef CONFIG_MODULE_SCHEDULER
#include <scheduler.h>
#endif

void AX12_init(AX12 *s)
{
	s->hardware_send = NULL;
	s->hardware_recv = NULL;
	s->hardware_switch = NULL;
}

/*_________________________________________________________*/
/*_________________________________________________________*/

void AX12_set_hardware_send(AX12 *s, int8_t(*pf)(uint8_t))
{
	s->hardware_send = pf; 
}

void AX12_set_hardware_recv(AX12 *s, int16_t(*pf)(void))
{
	s->hardware_recv = pf;
}

void AX12_set_hardware_switch(AX12 *s, void(*pf)(uint8_t))
{
	s->hardware_switch = pf;
}

/*_________________________________________________________*/
/*_________________________________________________________*/

/* process the cksum of a packet */
uint8_t AX12_checksum(AX12_Packet *packet)
{
	uint8_t i;
	uint8_t checksum=0;

	checksum += packet->id;
	checksum += packet->instruction;
  
	/* Packet also contain length = number of params + 2 */
	checksum += packet->nparams + 2;
  
	for (i=0; i<packet->nparams; i++)
		checksum += packet->params[i];
  
	return ~checksum;
}

/* Send a packet to ax12. Return 0 on sucess. */
uint8_t AX12_send(AX12 *s, AX12_Packet *packet)
{
	uint8_t i;
	uint8_t flags;
	uint8_t err;

#ifdef CONFIG_MODULE_SCHEDULER
	uint8_t scheduler_prio;

	scheduler_prio = scheduler_disable_save();
#endif

	if (packet->nparams > AX12_MAX_PARAMS) {
		err = AX12_ERROR_TYPE_INVALID_PACKET;
		goto fail;
	}

	/* Switch line to write */
	s->hardware_switch(AX12_STATE_WRITE);

	/* Header */
	if (s->hardware_send(0xFF)) {
		err = AX12_ERROR_TYPE_XMIT_FAILED;
		goto fail;
	}

	if (s->hardware_send(0xFF)) {
		err = AX12_ERROR_TYPE_XMIT_FAILED;
		goto fail;
	}

	/* AX12 ID */
	if (s->hardware_send(packet->id)) {
		err = AX12_ERROR_TYPE_XMIT_FAILED;
		goto fail;
	}

	/* Packet length */
	if (s->hardware_send(packet->nparams + 2)) {
		err = AX12_ERROR_TYPE_XMIT_FAILED;
		goto fail;
	}

	/* Instruction */
	if (s->hardware_send(packet->instruction)) {
		err = AX12_ERROR_TYPE_XMIT_FAILED;
 		goto fail;
	}
 
	/* Params */
	for (i=0; i<(packet->nparams); i++) {
		if (s->hardware_send(packet->params[i])) {
			err = AX12_ERROR_TYPE_XMIT_FAILED;
			goto fail;
		}
	}

	IRQ_LOCK(flags); /* needed if hardware_switch is
	//		    synchronous  */

	/* Checksum */
	if (s->hardware_send(AX12_checksum(packet))) {
		IRQ_UNLOCK(flags);
		err = AX12_ERROR_TYPE_XMIT_FAILED;
		goto fail;
	}

	/* Switch line back to read */
	s->hardware_switch(AX12_STATE_READ);
 
	IRQ_UNLOCK(flags);	

#ifdef CONFIG_MODULE_SCHEDULER
	scheduler_enable_restore(scheduler_prio);
#endif
	return 0;

 fail:
	/* Switch line back to read */
	s->hardware_switch(AX12_STATE_READ);
#ifdef CONFIG_MODULE_SCHEDULER
	scheduler_enable_restore(scheduler_prio);
#endif
	return err;
}

/* Receive a packet from ax12. Return 0 on sucess. */
uint8_t AX12_recv(AX12 *s, AX12_Packet *packet)
{
	int16_t c;
	uint8_t length;
	uint8_t i;

	/* Switch line to read */
	s->hardware_switch(AX12_STATE_READ);
   
	c = s->hardware_recv();
	if (c == -1)
		return AX12_ERROR_TYPE_NO_ANSWER;
	if (c != 0xFF) 
		return AX12_ERROR_TYPE_INVALID_PACKET;

	c = s->hardware_recv();
	if (c == -1)
		return AX12_ERROR_TYPE_TIMEOUT;
	if (c != 0xFF)
		return AX12_ERROR_TYPE_INVALID_PACKET;

	c = s->hardware_recv();
	if (c == -1)
		return AX12_ERROR_TYPE_TIMEOUT;
	packet->id = c; /* we should check id ? */

	c = s->hardware_recv();
	if (c == -1)
		return AX12_ERROR_TYPE_TIMEOUT;
	length = c;
	packet->nparams = length - 2;
	if (packet->nparams > AX12_MAX_PARAMS)
		return AX12_ERROR_TYPE_INVALID_PACKET;

	c = s->hardware_recv();
	if (c == -1)
		return AX12_ERROR_TYPE_TIMEOUT;
	packet->error = c;
	if (packet->error)
		return packet->error;
  
	for (i=0; i<(length-2); i++) {
		c = s->hardware_recv();
		if (c == -1)
			return AX12_ERROR_TYPE_TIMEOUT;
		packet->params[i] = c;
	}
  
	/* Checksum */
	c = s->hardware_recv();
  
	if (c != AX12_checksum(packet))
		return AX12_ERROR_TYPE_BAD_CKSUM;

	return 0;
}

/*_________________________________________________________*/
/*_________________________________________________________*/

/* Write a byte to an adress. Return 0 on success. */ 
uint8_t AX12_write_byte(AX12 *s, uint8_t id, AX12_ADDRESS address, 
			uint8_t data)
{
	AX12_Packet p, rp;
	uint8_t ret;

	memset(&p, 0, sizeof(p));
	memset(&rp, 0, sizeof(rp));
  
	p.id = id;
	p.instruction = AX12_WRITE;
	p.nparams = 2;
   
	/* memory address */
	p.params[0] = (uint8_t)address;
  
	/* value */
	p.params[1] = data;

	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	/* We talk broadcast, no reply */
	if (p.id == AX12_BROADCAST_ID)
		return 0;

	/* recv packet */
	return AX12_recv(s, &rp);
}

/* Write a word to an adress. Return 0 on success. */ 
uint8_t AX12_write_int(AX12 *s, uint8_t id, AX12_ADDRESS address,
		       uint16_t data)
{
	AX12_Packet p, rp;
 	uint8_t ret;
 
	memset(&p, 0, sizeof(p));
	memset(&rp, 0, sizeof(rp));

	p.id = id;
	p.instruction = AX12_WRITE;
	p.nparams = 3;
   
	/* memory address */
	p.params[0] = (uint8_t)address;
  
	/* value (low) */
	p.params[1] = 0xFF & data;

	/* value (high) */
	p.params[2] = data>>8;

	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	/* We talk broadcast, no reply */
	if (p.id == AX12_BROADCAST_ID)
		return 0;
  
	/* recv packet */
	return AX12_recv(s, &rp);
}

/* Read a byte at given adress. On success, fill val and return 0,
 * else return error and keep val unmodified. */ 
uint8_t AX12_read_byte(AX12 *s, uint8_t id, AX12_ADDRESS address,
		       uint8_t *val)
{
	AX12_Packet p, rp;
	uint8_t ret;

	memset(&p, 0, sizeof(p));
	memset(&rp, 0, sizeof(rp));

	p.id = id;
	p.instruction = AX12_READ;
	p.nparams = 2;

	/* memory address */
	p.params[0] = (uint8_t)address;
  
	/* data length */
	p.params[1] = 1;

	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	ret = AX12_recv(s, &rp);
	if (ret)
		return ret;

	*val = rp.params[0];
	return 0;
}

uint8_t AX12_read_int(AX12 *s, uint8_t id, AX12_ADDRESS address,
		      uint16_t *val)
{
	AX12_Packet p, rp;
	uint8_t ret;

	memset(&p, 0, sizeof(p));
	memset(&rp, 0, sizeof(rp));
  
	p.id = id;
	p.instruction = AX12_READ;
	p.nparams = 2;

	/* memory address */
	p.params[0] = (uint8_t)address;
  
	/* data length */
	p.params[1] = 2;

	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	ret = AX12_recv(s, &rp);
	if (ret)
		return ret;

	*val = rp.params[0] + ((rp.params[1])<<8);
	return 0;
}

/*_________________________________________________________*/
/*_________________________________________________________*/

uint8_t AX12_set_position(AX12 *s,uint8_t id, uint16_t position)
{
	return AX12_write_int(s, id, AA_GOAL_POSITION_L, position);
}

uint8_t AX12_set_position2(AX12 *s, uint8_t id, uint16_t position,
			   uint16_t speed)
{
	AX12_Packet p, rp;
	uint8_t ret;
  
	p.id = id;
	p.instruction = AX12_WRITE;
	p.nparams = 5;
   
	/* memory address */
	p.params[0] = AA_GOAL_POSITION_L;
	/* position */
	p.params[1] = 0xFF & position;
	p.params[2] = position>>8;
	/* speed */
	p.params[3] = 0xFF & speed;
	p.params[4] = speed>>8;

	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	/* We talk broadcast, no reply */
	if(p.id == AX12_BROADCAST_ID)
		return 0;
  
	/* recv packet */
	return AX12_recv(s, &rp);
}

uint8_t AX12_set_position3(AX12*s, uint8_t id, uint16_t position,
			   uint16_t speed, uint16_t torque)
{
	AX12_Packet p, rp;
 	uint8_t ret;
 
	p.id = id;
	p.instruction = AX12_WRITE;
	p.nparams = 7;
   
	/* memory address */
	p.params[0] = AA_GOAL_POSITION_L;
	/* position */
	p.params[1] = 0xFF & position;
	p.params[2] = position>>8;
	/* speed */
	p.params[3] = 0xFF & speed;
	p.params[4] = speed>>8;
	/* torque */
	p.params[5] = 0xFF & torque;
	p.params[6] = torque>>8;

	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	/* We talk broadcast, no reply */
	if(p.id == AX12_BROADCAST_ID)
		return 0;
  
	/* recv packet */
	return AX12_recv(s, &rp);
}

uint8_t AX12_get_position(AX12 *s, uint8_t id, uint16_t *pos)
{
	return AX12_read_int(s, id, AA_PRESENT_POSITION_L, pos);
}

uint8_t AX12_get_speed(AX12 *s, uint8_t id, uint16_t *speed)
{
	return AX12_read_int(s, id, AA_PRESENT_SPEED_L, speed);
}

uint8_t AX12_get_load(AX12 *s, uint8_t id, uint16_t *load)
{
	return AX12_read_int(s, id, AA_PRESENT_LOAD_L, load);
}

uint8_t AX12_ping(AX12 *s, uint8_t id)
{
	AX12_Packet p, rp;
 	uint8_t ret;
 
	p.id = id;
	p.instruction = AX12_PING;
	p.nparams = 0;
   
	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	/* We talk broadcast, no reply */
	if(p.id == AX12_BROADCAST_ID)
		return 0;
  
	/* recv packet */
	return AX12_recv(s, &rp);
}

uint8_t AX12_reset(AX12 *s, uint8_t id)
{
	AX12_Packet p, rp;
 	uint8_t ret;
  
	p.id = id;
	p.instruction = AX12_RESET;
	p.nparams = 0;
   
	/* send packet */
	ret = AX12_send(s, &p);
	if (ret)
		return ret;

	/* We talk broadcast, no reply */
	if(p.id == AX12_BROADCAST_ID)
		return 0;
  
	/* recv packet */
	return AX12_recv(s, &rp);
}
