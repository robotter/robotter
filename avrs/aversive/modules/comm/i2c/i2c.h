/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2007)
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
 *  Revision : $Id: i2c.h,v 1.5 2008-04-13 16:55:30 zer0 Exp $
 *
 */

/* Author Zer0, based on Tof old i2c module */

/** please read carefully !
 *
 *
 * this implementation of the i2c interface is very specific this is a
 * multi bus implementation. The multi bus operation is done by
 * implementing software i2c modules (slave only)
 *
 * HARDWARE I2C :
 * --------------
 *
 * This module implements i2c using the hardware twi interface of AVR
 * devices. It can operates in slave and/or master mode, depending on
 * the initialisation parameter. This module is interrupt driven only.
 *
 * In master mode, buffer can be transmitted/received on demand (with
 * start and stop conditions). In slave mode, operations are done
 * asynchronously. Like some other modules in aversive, callback
 * functions can be registered and are called on transmission or
 * reception events.
 *
 * This module should support multimaster mode, send() or recv() depends
 * on the address parameter.
 */
#ifndef _I2C_H_
#define _I2C_H_

#include <aversive.h>
#include <i2c_config.h>

#define I2C_DEBUG 1

#define I2C_ADD_GENCALL 0x00

/* this is not a valid address regarding the I2C protocol, but is used
 * as a magic for addressing the master from the slave */
#define I2C_ADD_MASTER  0x80




/* I2C modes */
typedef enum { I2C_MODE_UNINIT,      /**< not initialized */
	       I2C_MODE_SLAVE,       /**< Slave */
#ifdef CONFIG_MODULE_I2C_MASTER
	       I2C_MODE_MASTER,      /**< Master */
#endif
#ifdef CONFIG_MODULE_I2C_MULTIMASTER
	       I2C_MODE_MULTIMASTER, /**< Master, but allow multimaster mode */
#endif
} i2c_mode_t ;

/* control flags */
#define I2C_CTRL_GENERIC            0x00
/** Error code is returned instead of beeing sent as a callback. Note
 *  that the send_event callback is _not_ called if it is
 *  registered. This functions waits and only returns when the
 *  transmission is finished or if it failed. Note that there is no
 *  timeout, so it can loop forever... WARNING : irq MUST be
 *  allowed */
#define I2C_CTRL_SYNC               0x01
/** when the operation is finished as a master, don't release the bus
 *  (don't send any stop condition). You can send several commands
 *  without beeing interrupted by another master. To release it, send
 *  another command without this flag or just call
 *  i2c_release_bus(). This has no effect on a slave. */
#define I2C_CTRL_DONT_RELEASE_BUS   0x02


/* status flags */
#define I2C_STATUS_READY            0x00
#define I2C_STATUS_MASTER_XMIT      0x01
#define I2C_STATUS_MASTER_RECV      0x02
#define I2C_STATUS_SLAVE_XMIT_WAIT  0x04
#define I2C_STATUS_SLAVE_XMIT       0x08
#define I2C_STATUS_SLAVE_RECV       0x10
#define I2C_STATUS_OP_FINISHED      0x20
#define I2C_STATUS_NEED_XMIT_EVT    0x40
#define I2C_STATUS_NEED_RECV_EVT    0x80


/**
 * mode is I2C_MODE_UNINIT, I2C_MODE_MASTER, I2C_MODE_MULTIMASTER or
 * I2C_MODE_SLAVE. Parameter add is the address in slave mode, it is
 * composed from: 
 *   b7  : true if the uC can be addressed with GENCALL
 *   b0-6: slave address
 */
void i2c_init(i2c_mode_t mode, uint8_t add);


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
void i2c_register_recv_event(void (*event)(uint8_t *, int8_t));

/** 
 * Register a function that is called when a byte is received.
 * Arguments of the callback are: (hwstatus, numbyte, byte).  The user
 * app can modify the g_size value, which is the number of bytes to be
 * received in the frame: this can be done by calling
 * i2c_set_recv_size().
 */
void i2c_register_recv_byte_event(void (*event)(uint8_t, uint8_t, uint8_t));


/**
 * register a function that is called when a buffer is sent (or an
 * error occured while sending) on the i2c bus. The event function is
 * always called by software if the i2c_send() function returned 0.
 * The parameter of the event function is the error code:
 *   -  0 if the number of transmitted bytes is equal to the size 
 *      of the original send buffer, without NACK. 
 *   -  <0 if 0 byte has been transmitted (slave not answering or
 *      arbiteration lost)
 *   -  Else, the number of transmitted bytes is given, including the
 *      one that was not acked.
 */
void i2c_register_send_event(void (*event)(int8_t));


/**
 * Send a buffer. Return 0 if xmit starts correctly.
 * On error, return != 0.
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
int8_t i2c_send(uint8_t dest_add, uint8_t *buf, uint8_t size, uint8_t ctrl);

/**
 * Resend the same buffer. This call is equivalent to i2c_send() with
 * the same parameters as the last call. It safe to call it from the
 * send_event, but else the send buffer may have been overwritten.
 */
int8_t i2c_resend(void);

/**
 * same but for recv
 */
int8_t i2c_rerecv(void);

/**
 * release the bus
 */
void i2c_release_bus(void);

/**
 * Same than send, but error code is returned instead of beeing sent
 * as a callback. Note that the send_event callback is _not_ called
 * if it is registered. This functions waits and only returns when the
 * transmission is finished or if it failed. Note that there is no
 * timeout, so it can loop forever...
 * WARNING : irq MUST be enabled !
 */
int8_t i2c_send_sync(uint8_t dest_add, uint8_t *buf, uint8_t size);

/**
 * In slave mode, it returns error and is useless (all data is
 * received trough the callback). In master mode, if dest_add is
 * between 0 and 127, it will start to read the addressed slave. The
 * size of the buffer to read must be specified. Return 0 on success.
 * The 'ctrl' parameter is composed by the flags I2C_CTRL_SYNC and
 * I2C_CTRL_DONT_RELEASE_BUS
 */
int8_t i2c_recv(uint8_t dest_add, uint8_t size, uint8_t ctrl);


/**
 * Try to flush the current operation, before it is started. The
 * i2c module is then tagged as ready. If it returns 0, the flush was 
 * a success, and i2c_send() can be called. Else, it means that 
 * a transmission was running. 
 */
int8_t i2c_flush(void);

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
uint8_t i2c_set_recv_size(uint8_t size);

/**
 * return the current mode of the i2c module.
 */
i2c_mode_t i2c_mode(void);

/**
 * return the status of the i2c module.
 */
uint8_t i2c_status(void);

/**
 * Copy the received buffer in the buffer given as parameter. Return
 * number of copied bytes or -1 on error.
 */
uint8_t i2c_get_recv_buffer(uint8_t *buf, uint8_t size);

/**
 * recover from error states
 */
void i2c_reset(void);

#if I2C_DEBUG == 1
/**
 * display debug infos
 */
void i2c_debug(void);
#endif


#endif
