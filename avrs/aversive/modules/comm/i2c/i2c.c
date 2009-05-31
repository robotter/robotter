/*  
 *  Copyright Droids Corporation (2007)
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
 *  Revision : $Id: i2c.c,v 1.5 2009-03-15 21:51:17 zer0 Exp $
 *
 */

/*
 * Author : Olivier MATZ zer0@droids-corp.org
 *
 * Thanks to Tof for the old i2c module and to Serpilliere for
 * testing.
 */

#include <stdlib.h>
#include <string.h>
#include <util/twi.h>

#include <autoconf.h>
#include <aversive/errno.h>
#include <i2c.h>

#if I2C_SEND_BUFFER_SIZE < 1
#error "I2C_SEND_BUFFER_SIZE must be at least 1"
#endif

#if I2C_RECV_BUFFER_SIZE < 1
#error "I2C_RECV_BUFFER_SIZE must be at least 1"
#endif

/** recv event, called when we receive a frame
 *  params are : data buffer and size */
static void (*g_recv_event)(uint8_t *, int8_t) = NULL;

/** recv event, called when we receive a byte
 *  params are : hwstatus, index of byte in frame, byte value */
static void (*g_recv_byte_event)(uint8_t, uint8_t, uint8_t) = NULL;

/** send event, called when transmit is complete 
 * param is error code : 0 if success */
static void (*g_send_event)(int8_t) = NULL;

static volatile i2c_mode_t g_mode = I2C_MODE_UNINIT;
static volatile uint8_t g_status = I2C_STATUS_READY;

static volatile uint8_t g_ctrl = 0; /* ctrl flags */
static volatile uint8_t g_sync_res = 0; /* result of sync send */
static uint8_t g_send_buf[I2C_SEND_BUFFER_SIZE];
static uint8_t g_recv_buf[I2C_RECV_BUFFER_SIZE];
static volatile uint8_t g_dest = 0; /* destination slave in master mode */


static volatile uint8_t g_send_nbytes = 0; /* number of transmitted bytes */
static volatile uint8_t g_send_size = 0; /* size of buffer to be transmitted */
static volatile uint8_t g_recv_nbytes = 0; /* number of received bytes */
static volatile uint8_t g_recv_size = 0; /* size of buffer to be received */

#if I2C_DEBUG == 1
#include <stdio.h>
#include <aversive/pgmspace.h>
static volatile uint8_t g_prev_twstatus = 0;
static volatile uint8_t g_intr_cpt = 0;
static volatile uint8_t g_prev_status = 0;
static volatile uint8_t g_command = 0;
#endif

/**
 * mode is I2C_MODE_UNINIT, I2C_MODE_MASTER, I2C_MODE_MULTIMASTER or
 * I2C_MODE_SLAVE. Parameter add is the address in slave mode, it is
 * composed from: 
 *   b7  : true if the uC can be addressed with GENCALL
 *   b0-6: slave address
 */
void 
i2c_init(i2c_mode_t mode, uint8_t add)
{
	uint8_t flags;

	IRQ_LOCK(flags);
  
	if (mode == I2C_MODE_UNINIT) {
		/* disable all */
		TWCR = 0;
		IRQ_UNLOCK(flags);
		return;
	}
#ifdef CONFIG_MODULE_I2C_MASTER
	else if (mode == I2C_MODE_MASTER) {
		/* enable, enable int */
		TWCR = (1<<TWEN) | (1<<TWIE) ;
	}
#endif
	else {
		/* enable, enable int, answer to own adress */
		TWCR = (1<<TWEN) | (1<<TWIE) | (1<<TWEA) ;
	}

	TWBR = I2C_BITRATE;
  
	/* prescaler */
	if(I2C_PRESCALER & 1)
		sbi(TWSR, TWPS0);
	if(I2C_PRESCALER & 2)
		sbi(TWSR, TWPS1);
	
	/* change for TWAR format */
	TWAR = add << 1 ;
	
	/* general call */
	if (add & 0x80)
		sbi(TWAR, TWGCE);
	
	/* init vars */
	g_mode = mode;
	g_status = I2C_STATUS_READY;
	g_dest = 0;
	g_ctrl = 0;
	g_recv_nbytes = 0;
	g_recv_size = 0;
	g_send_nbytes = 0;
	g_send_size = 0;

	IRQ_UNLOCK(flags);
}


/** 
 * Register a function that is called when a buffer is received. The
 * user application is always notified when data frame is received.
 * Arguments of the callback are:
 *   - (recv_buf, n>0) if transmission succedded. The first parameter 
 *                     contains the address of the reception buffer and
 *                     the second contains the number of received bytes.
 *   - (NULL, err<0)   if the transmission failed (slave not answering
 *                     or arbiteration lost). The first parameter is 
 *                     NULL and the second contains the error code.
 */
void 
i2c_register_recv_event(void (*event)(uint8_t *, int8_t))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_recv_event = event ;
	IRQ_UNLOCK(flags);
}

/** 
 * Register a function that is called when a byte is received.
 * Arguments of the callback are: (hwstatus, numbyte, byte).  The user
 * app can modify the g_recv_size value, which is the number of bytes
 * to be received in the frame: this can be done by calling
 * i2c_set_recv_size().
 */
void 
i2c_register_recv_byte_event(void (*event)(uint8_t, uint8_t, uint8_t))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_recv_byte_event = event ;
	IRQ_UNLOCK(flags);
}

/**
 * register a function that is called when a buffer is sent (or an
 * error occured while sending) on the i2c bus. The event function is
 * always called by software if the i2c_send() function returned 0.
 * The parameter of the event function is the error code:
 *   -  <0 if 0 byte has been transmitted (arbiteration lost)
 *   -  Else, the number of transmitted bytes is given, including the
 *      one that was not acked.
 */
void 
i2c_register_send_event(void (*event)(int8_t))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_send_event = event ;
	IRQ_UNLOCK(flags);
}

/**
 * Send a buffer. Return 0 if xmit starts correctly.
 * On error, return < 0.
 * - If mode is slave, dest_add should be I2C_ADD_MASTER, and transmission 
 *   starts when the master transmits a clk. 
 * - If mode is master and if dest_add != I2C_ADD_MASTER, it will transmit 
 *   a START condition if bus is available (the uc will act as a 
 *   master)
 * - If mode is master and if dest_add == I2C_ADD_MASTER, the uC will
 *   act as a slave, and data will be sent when the uC will be
 *   addressed.
 * The transmission will be processed with these params until a
 * i2c_flush() is called. 
 * The 'ctrl' parameter is composed by the flags I2C_CTRL_SYNC and 
 * I2C_CTRL_DONT_RELEASE_BUS
 */
int8_t 
i2c_send(uint8_t dest_add, uint8_t *buf, uint8_t size, uint8_t ctrl) 
{
	uint8_t flags;

	IRQ_LOCK(flags);
	if (g_mode == I2C_MODE_UNINIT) {
		IRQ_UNLOCK(flags);
		return -ENXIO;
	}
	
	if (g_status & (I2C_STATUS_MASTER_XMIT |
			I2C_STATUS_MASTER_RECV |
			I2C_STATUS_SLAVE_XMIT_WAIT |
			I2C_STATUS_SLAVE_XMIT)) {
		IRQ_UNLOCK(flags);
		return -EBUSY;
	}

	if (size > I2C_SEND_BUFFER_SIZE) { /* XXX is size==0 ok ? */
		IRQ_UNLOCK(flags);
		return -EINVAL;
	}

	/* bad dest_address */
	if (g_mode == I2C_MODE_SLAVE) {
		if (dest_add != I2C_ADD_MASTER) {
			IRQ_UNLOCK(flags);
			return -EINVAL;
		}
	}
	else {
		if (dest_add >= I2C_ADD_MASTER) {
			IRQ_UNLOCK(flags);
			return -EINVAL;
		}
	}

	/* if g_send_buf == buf, it is a resend, so don't update
	 * parameters */
	if ( g_send_buf != buf ) {
		g_dest = dest_add;
		g_send_size = size;
		g_ctrl = ctrl;
		memcpy(g_send_buf, buf, size);
	}

	/* if destination is not the master, IT MEANS THAT WE ARE THE
	 * MASTER, so we should initiate the transmission */
	if (dest_add != I2C_ADD_MASTER) {
		g_status |= I2C_STATUS_MASTER_XMIT;
		TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWIE) | (1<<TWSTA);
	}
	else {
		/* else we are a slave */
		g_status |= I2C_STATUS_SLAVE_XMIT_WAIT;
	}

	IRQ_UNLOCK(flags);

	/* If it is sync mode, wait op_finished. Here we will reset
	 * the status flag to ready */
	if (ctrl & I2C_CTRL_SYNC) {
		while ( 1 ) {
			IRQ_LOCK(flags);
			if (g_status & I2C_STATUS_OP_FINISHED) {
				g_status &= ~(I2C_STATUS_MASTER_XMIT |
					      I2C_STATUS_MASTER_RECV |
					      I2C_STATUS_SLAVE_XMIT |
					      I2C_STATUS_SLAVE_RECV |
					      I2C_STATUS_OP_FINISHED);
				break;
			}
			IRQ_UNLOCK(flags);
		}
		IRQ_UNLOCK(flags);
		if (g_sync_res == size)
			return 0;
		return g_sync_res;
	}
	
	return -ESUCCESS;
}


/**
 * Resend the same buffer. This call is equivalent to i2c_send() with
 * the same parameters as the last call. It safe to call it from the
 * send_event, but else the send buffer may have been overwritten.
 */
int8_t 
i2c_resend(void) 
{
	return i2c_send(g_dest, g_send_buf, g_send_size, g_ctrl);
}

/**
 * same but for recv
 */
int8_t 
i2c_rerecv(void) 
{
	return i2c_recv(g_dest, g_recv_size, g_ctrl);
}

/**
 * release the bus
 */
void
i2c_release_bus(void)
{
	TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWIE) | (1<<TWSTO);
}

/**
 * recover from error state
 */
void
i2c_reset(void)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	TWCR = 0;
	g_status = I2C_STATUS_READY;
#ifdef CONFIG_MODULE_I2C_MASTER
	if (g_mode == I2C_MODE_MASTER) 
		TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWIE);
	else
#endif
		TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWIE) | 
			(1<<TWSTO) | (1<<TWEA);
	IRQ_UNLOCK(flags);
}

/**
 * In slave mode, it returns error and is useless (all data is
 * received trough the callback).  In master mode, if dest_add is
 * between 0 and 127, it will start to read the addressed slave. The
 * size of the buffer to read must be specified. Return 0 on success.
 */
int8_t i2c_recv(uint8_t dest_add, uint8_t size, uint8_t ctrl)
{
#ifndef CONFIG_MODULE_I2C_MASTER
	return -EINVAL;
#else
	uint8_t flags;

	IRQ_LOCK(flags);
	if (g_mode == I2C_MODE_UNINIT) {
		IRQ_UNLOCK(flags);
		return -ENXIO;
	}
	
	if (g_status != I2C_STATUS_READY) {
		IRQ_UNLOCK(flags);
		return -EBUSY;
	}

	if (size > I2C_SEND_BUFFER_SIZE) { /* XXX is size=0 ok ? */
		IRQ_UNLOCK(flags);
		return -EINVAL;
	}

	if (g_mode == I2C_MODE_SLAVE || dest_add >= I2C_ADD_MASTER) {
		IRQ_UNLOCK(flags);
		return -EINVAL;
	}

	g_ctrl = ctrl;
	g_recv_size = size;
	g_status |= I2C_STATUS_MASTER_RECV;
	g_dest = dest_add ; 
	TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWIE) | (1<<TWSTA);

	IRQ_UNLOCK(flags);

	/* If it is sync mode, wait op_finished. Here we will reset
	 * the status flag to ready */
	if (ctrl & I2C_CTRL_SYNC) {
		while ( 1 ) {
			IRQ_LOCK(flags);
			if (g_status & I2C_STATUS_OP_FINISHED) {
				g_status &= ~(I2C_STATUS_MASTER_XMIT |
					      I2C_STATUS_MASTER_RECV |
					      I2C_STATUS_SLAVE_XMIT |
					      I2C_STATUS_SLAVE_RECV |
					      I2C_STATUS_OP_FINISHED);
				break;
			}
			IRQ_UNLOCK(flags);
		}
		IRQ_UNLOCK(flags);
		if (g_sync_res == size)
			return 0;
		return g_sync_res;
	}
	
	return -ESUCCESS;
#endif
}


/**
 * Try to flush the current operation, before it is started. The
 * i2c module is then tagged as ready. If it returns 0, the flush was 
 * a success, and i2c_send() can be called. Else, it means that 
 * a transmission was running. 
 */
int8_t i2c_flush(void)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	if ( ! (g_status & I2C_STATUS_SLAVE_XMIT_WAIT) ) {
		IRQ_UNLOCK(flags);
		return -EBUSY;
	}

	g_status &= ~(I2C_STATUS_SLAVE_XMIT_WAIT);
	IRQ_UNLOCK(flags);
	
	return -ESUCCESS;
}


/**
 * In MASTER RECEIVER mode, it is possible that the user application
 * does not know the size of the buffer. You can adjust this size
 * during transmission (generally the size can be specified at the
 * beginning of received data, so the user app can be notified thanks
 * to recv_byte_event(). Note that i2c_set_recv_size() function has to
 * be used with careful, making sure you understand i2c protocol and
 * this code. Return 0 on success. Note than in SLAVE RECEIVER mode,
 * you don't have to use this function, because the master can end the
 * transmission by sending a stop condition on the bus.
 */
uint8_t i2c_set_recv_size(uint8_t size)
{
	uint8_t flags;

	IRQ_LOCK(flags);

	/* check that we are in reveiver mode */
	if (! (g_status & I2C_STATUS_MASTER_RECV)) {
		IRQ_UNLOCK(flags);
		return -EBUSY;
	}

	/* check that specified size is not greater than
	 * I2C_SEND_BUFFER_SIZE. But it must be greater than current
	 * number of received bytes. */
	/* XXX ? +1 ? */
	if (size > I2C_SEND_BUFFER_SIZE || size <= g_recv_nbytes) {
		IRQ_UNLOCK(flags);
		return -EINVAL;
	}
	
	g_recv_size = size;

	IRQ_UNLOCK(flags);
	return -ESUCCESS;
}


/**
 * return the current mode of the i2c module.
 */
i2c_mode_t i2c_mode(void)
{
	return g_mode;
}

/**
 * return the status of the i2c module.
 */
uint8_t i2c_status(void)
{
	return g_status;
}

/**
 * Copy the received buffer in the buffer given as parameter. Return
 * number of copied bytes or < 0 on error.
 */
uint8_t i2c_get_recv_buffer(uint8_t *buf, uint8_t size)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	/* check that reception is finished */
	if ( g_status & (I2C_STATUS_MASTER_RECV |
			  I2C_STATUS_SLAVE_RECV) ) {
		IRQ_UNLOCK(flags);
		return -EBUSY;
	}

	if (size > g_recv_nbytes) 
		size = g_recv_nbytes;
	memcpy(buf, g_recv_buf, size);

	IRQ_UNLOCK(flags);

	return size;
}

#if I2C_DEBUG == 1
void i2c_debug(void)
{
	printf_P(PSTR("mode=0x%x\r\n"), g_mode);
	printf_P(PSTR("status=0x%x\r\n"), g_status);
	printf_P(PSTR("ctrl=0x%x\r\n"), g_ctrl);
	printf_P(PSTR("dst=%d\r\n"), g_dest);
	printf_P(PSTR("send_nbytes=%d, send_size=%d\r\n"), g_send_nbytes, g_send_size);
	printf_P(PSTR("recv_nbytes=%d, recv_size=%d\r\n"), g_recv_nbytes, g_recv_size);
	printf_P(PSTR("prev_twstatus=0x%x\r\n"), g_prev_twstatus);
	printf_P(PSTR("intr_cpt=%d\r\n"), g_intr_cpt);
	printf_P(PSTR("prev_status=0x%x\r\n"), g_prev_status);
	printf_P(PSTR("prev_command=0x%x\r\n"), g_command);
}
#endif

/** interrupt ********************************************************/

/**
 * Interrupt routing for I2C. Refer to datasheets for more
 * informations.
 */
SIGNAL(SIG_2WIRE_SERIAL)
{
	uint8_t hard_status;
	uint8_t command = (1<<TWINT) | (1<<TWEN) | (1<<TWIE);

	hard_status = TW_STATUS;

#if I2C_DEBUG == 1
	g_prev_twstatus = hard_status;
	g_intr_cpt++;
#endif
	switch(hard_status) {

#ifdef CONFIG_MODULE_I2C_MASTER
	case TW_START:      
	case TW_REP_START:
		/* a start has been transmitted, transmit SLA+W which is :
		 * b7-1: slave address 
		 * b0  : 0 (write operation) or 1 (read) */
		if (g_status & I2C_STATUS_MASTER_RECV) {
			TWDR = (g_dest << 1) | (0x01);
			g_recv_nbytes = 0;
		}
		else {
			TWDR = (g_dest << 1);
			g_send_nbytes = 0;
		}
		break;


		/* MASTER TRANSMITTER */

	case TW_MT_SLA_ACK:
		/* the slave is there. start sending data */
		TWDR = g_send_buf[g_send_nbytes++];
		break;

	case TW_MT_SLA_NACK:
		/* the slave does not answer, send a stop condition */
		g_send_nbytes = -ENOENT;
		g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_XMIT_EVT);
		break;

	case TW_MT_DATA_ACK: /* 0x28 */
		/* we transmitted data with success, send next one or
		 * stop condition if there is no more data */
		if (g_send_nbytes >= g_send_size) {
			g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_XMIT_EVT);
		}
		else {
			TWDR = g_send_buf[g_send_nbytes++];
		}
		break;

	case TW_MT_DATA_NACK:
		/* we transmitted data but slave sent us a NACK. 
		 * Notify the number of bytes sent, including the one
		 * that were not acked, and send a stop condition */
		g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_XMIT_EVT);
		break;
      

		/* MASTER RECEIVER */

	case TW_MR_SLA_ACK:
		/* the slave is there, we know that we have enough
		 * room in buffer because it is the 1st byte. If
		 * there's only 1 byte to receive, don't set TWEA */
		if (g_recv_size > 1)
			command |= (1<<TWEA);
		break;
		
	case TW_MR_SLA_NACK:
		/* the slave does not answer, send a stop condition */
		g_recv_nbytes = -ENOENT;
		g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_RECV_EVT);
		break;

	case TW_MR_DATA_ACK:
		/* receive data */
		if (g_recv_nbytes < g_recv_size) {
			g_recv_buf[g_recv_nbytes] = TWDR;

			if(g_recv_byte_event)
				g_recv_byte_event(hard_status, g_recv_nbytes, g_recv_buf[g_recv_nbytes]);

			g_recv_nbytes++;
		}
		/* More than one byte remaining -> set TWEA */
		if (g_recv_nbytes < g_recv_size) {
			command |= (1<<TWEA);
		}
		break;

	case TW_MR_DATA_NACK:
		/* we received the last byte */
		if (g_recv_nbytes < g_recv_size) {
			g_recv_buf[g_recv_nbytes] = TWDR;

			if(g_recv_byte_event)
				g_recv_byte_event(hard_status, g_recv_nbytes, g_recv_buf[g_recv_nbytes]);
			g_recv_nbytes ++;
		}
		g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_RECV_EVT);
		break;


		/* MASTER TRANSMITTER or MASTER RECEIVER */

	case TW_MT_ARB_LOST:
		/* arbitration lost, notify application */
		/* XXX here we may have to change status flags ? */
		if (g_status & I2C_STATUS_MASTER_XMIT) {
			g_recv_nbytes = -EAGAIN;
			g_status |= I2C_STATUS_NEED_RECV_EVT;
		}
		else if (g_status & I2C_STATUS_MASTER_RECV) {
			g_send_nbytes = -EAGAIN;
			g_status |= I2C_STATUS_NEED_XMIT_EVT;		
		}
		/* g_status |= I2C_STATUS_OP_FINISHED; */ /* ?? or not ? */
		break;

#endif      

	
		/* SLAVE RECEIVER */

	case TW_SR_ARB_LOST_SLA_ACK:
	case TW_SR_ARB_LOST_GCALL_ACK:
	case TW_SR_GCALL_ACK:
	case TW_SR_SLA_ACK:
		/* slave is addressed (in general call or not, and
		 * after arbiteration lost or not) */
		g_recv_nbytes = 0;
		g_recv_size = I2C_RECV_BUFFER_SIZE;
		g_status |= I2C_STATUS_SLAVE_RECV;
		command |= (1<<TWEA);
		break;

	case TW_SR_DATA_ACK:
	case TW_SR_GCALL_DATA_ACK:
		/* receive data, the following test should always be
		 * true */
		if (g_recv_nbytes < g_recv_size) {
			g_recv_buf[g_recv_nbytes] = TWDR;
			if(g_recv_byte_event)
				g_recv_byte_event(hard_status, g_recv_nbytes, g_recv_buf[g_recv_nbytes]);
			g_recv_nbytes++;
		}
		/* if there's more than one byte left in buffer, send
		 * TWEA */
		if (g_recv_nbytes < g_recv_size) {
			command |= (1<<TWEA);
		}
		break;

	case TW_SR_GCALL_DATA_NACK:
	case TW_SR_DATA_NACK:    
		/* receive last data byte (our buffer is full) */
		if (g_recv_nbytes < g_recv_size) {
			g_recv_buf[g_recv_nbytes] = TWDR;

			if(g_recv_byte_event)
				g_recv_byte_event(hard_status, g_recv_nbytes, g_recv_buf[g_recv_nbytes]);
			g_recv_nbytes++;
		}
		break;
    
	case TW_SR_STOP:
		/* the master sent a stop condition, notify app */
		g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_RECV_EVT);
		break;

      
		/* SLAVE TRANSMITTER */

	case TW_ST_ARB_LOST_SLA_ACK:
	case TW_ST_SLA_ACK: 
		/* slave is addressed. If it is not ready, send a 0 as
		 * last byte. */
		g_send_nbytes = 0;
		if (! (g_status & I2C_STATUS_SLAVE_XMIT_WAIT)) {
			TWDR = 0;
			g_send_size=0;
		}
		/* else: 
		 * if there is only 1 byte to transmit, we don't
		 * need to send ack, else set TWEA. */	
		else {
			if (g_send_size > 1) {
				command |= (1<<TWEA);
			}
			TWDR = g_send_buf[g_send_nbytes++];
		}
		g_status &= ~(I2C_STATUS_SLAVE_XMIT_WAIT);
		g_status |= I2C_STATUS_SLAVE_XMIT;
		break;
      
	case TW_ST_DATA_ACK:
		/* transmitting data, if there is more than one byte
		 * to send, send ack */
		if (g_send_size > g_send_nbytes + 1)
			command |= (1<<TWEA);
		TWDR = g_send_buf[g_send_nbytes++];
		break;

	case TW_ST_DATA_NACK:
		/* notify app that we send the frame */
		g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_XMIT_EVT);
		break;


	case TW_ST_LAST_DATA:
		/* last data transmitted, notify app XXX (not very sure) */
		g_status |= (I2C_STATUS_OP_FINISHED | I2C_STATUS_NEED_XMIT_EVT);
		break;

            
		/* COMMON */

	case TW_BUS_ERROR:
		command |= (1<<TWSTO);
		g_status |= I2C_STATUS_OP_FINISHED;
		break;
    
	default :
		/* default ... what can we do ? */
		g_status |= I2C_STATUS_OP_FINISHED;
		break;

	}
	
#if I2C_DEBUG == 1
	g_prev_status = g_status;
#endif

	/* transmission finished */
	if (g_status & I2C_STATUS_OP_FINISHED) {
		/* if it is not a synchronous op, we should be aware
		 * of next SLA+RW if we are a slave or multimaster */
#ifdef CONFIG_MODULE_I2C_MASTER
		if (g_mode != I2C_MODE_MASTER) {
			command |= (1<<TWEA);
		}
		else if ( ! (g_ctrl & I2C_CTRL_DONT_RELEASE_BUS) ) {
			/* do it only if we want to release bus */
			command |= (1<<TWSTO);
		}
#else /* CONFIG_MODULE_I2C_MASTER */
		command |= (1<<TWEA);
#endif
		/* Remove current op if !sync, else it is done in the
		 * i2c_send/recv func */
		if ( ! (g_ctrl & I2C_CTRL_SYNC) ) {
			g_status &= ~(I2C_STATUS_MASTER_XMIT |
				      I2C_STATUS_MASTER_RECV |
				      I2C_STATUS_SLAVE_XMIT |
				      I2C_STATUS_SLAVE_RECV |
				      I2C_STATUS_OP_FINISHED);
		}
	}
		
	/* Callback events if necessary (if not sync) */
	if ( ! (g_ctrl & I2C_CTRL_SYNC) ) {
		if ( (g_status & I2C_STATUS_NEED_XMIT_EVT) && g_send_event) {
			g_send_event(g_send_nbytes);
		}
		if ( (g_status & I2C_STATUS_NEED_RECV_EVT) && g_recv_event) {
			g_recv_event(g_recv_buf, g_recv_nbytes);
		}
	}
	else {
		if ( g_status & (I2C_STATUS_MASTER_XMIT | I2C_STATUS_SLAVE_XMIT) )
			g_sync_res = g_send_nbytes;
		else 
			g_sync_res = g_recv_nbytes;
	}
	g_status &= ~(I2C_STATUS_NEED_XMIT_EVT | I2C_STATUS_NEED_RECV_EVT);
	
#if I2C_DEBUG == 1
	g_command = command;
#endif

	/* if a command (repeated start) has been sent in the callback
	 * (by calling i2c_send() or i2c_recv(), we don't need to
	 * send it (we are back in MASTER_SEND or MASTER_RECV mode) */
	if (TWCR & (1<<TWINT))
		TWCR = command; 
}
