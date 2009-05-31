/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2005)
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
 *  Revision : $Id: uart.h,v 1.25 2009-03-15 21:51:17 zer0 Exp $
 *
 */

/* Olivier MATZ, 2004 - 2006
 * Interface of the uart module
 */

/** \file uart.h
 *  \brief Interface of the UART module.
 *
 * This module provides :
 *   - Tx and Rx with fifo
 *   - Speed selection
 *   - Parity selection (if the uC support it)
 *   - 5 to 8 data bits (if the uC support it).
 *   - 1 or 2 stop bits (if the uC support it).
 *   - up to 4 UARTs (if the uC support it).
 * 
 * Number of bits in frame, parity, stop bits are the same for tx and
 * rx. TX fifo is useless if interrupts are disabled because the uart
 * wait that all bytes are transmitted before returning.
 *
 * It doesn't support some USART capabilities :
 *   - Synchronous mode
 *   - Multiprocessor communication
 */

#ifndef _UART_H_
#define _UART_H_

#include <stdio.h>
#include <aversive.h>
#include <uart_config.h>

#include <cirbuf.h>

/** this structure stores the configuration of the uart */
struct uart_config {
      uint8_t enabled          : 1, /**< enable or disable the uart */
      intr_enabled     : 1, /**< use interruptions or not */
      use_double_speed : 1, /**< less acurate, but can reach faster baudrate */
      parity           : 2, /**< none, odd or even */
      stop_bits        : 1, /**< 1 or 2 bits at the end of the frame */
      reserved         : 1; /**< nothing for now */
      uint8_t nbits;                /**< number of bits in frame, 5,6,7,8 or 9 */
      uint32_t baudrate;             /**< speed of uart */
};


/** 
 * Initialisation function. This function puts the registers of the
 * microcontroler in a correct state in order to use the uart.  It
 * uses the configuration file <uart_config.h> ; this function is
 * equivalent to call uartX_setconf(NULL) for each uart.
 */
void uart_init(void);

/** 
 * Configure the uart 'num' with the given configuration. Returns 0 on
 * success.
 */
int8_t uart_setconf(uint8_t num, struct uart_config *u);

/** Get the current configuration of the uart 'num' */
void uart_getconf(uint8_t num, struct uart_config *u);

/** 
 * uart_recv returns the next character, taken from the fifo (if
 * any). If there is nothing to read, the function waits until
 * something come on the uart.
 */
int uart_recv(uint8_t num);

/** 
 * uart_recv returns the next character, taken from the fifo (if
 * any). If there is nothing to read, the function returns -1.
 */
int uart_recv_nowait(uint8_t num);

/**
 * same than uart_recv with 9 bits.
 */
int uart_9bits_recv(uint8_t num);

/** 
 * same than uart_recv_nowait() with 9 bits.
 */
int uart_9bits_recv_nowait(uint8_t num);

/**
 * uart_send_nowait is used to send data to the uart 'num'. The data
 * is first stored in the FIFO before beeing sent. If the FIFO is
 * full, data is dropped and the function returns -1, else it returns
 * the character c.
 */
int uart_send_nowait(uint8_t num, char c);

/**
 * uart_send is used to send data to the uart 'num'. The data is first
 * stored in the FIFO before beeing sent. If the FIFO is full, the
 * function wait until the uart is ready. The function returns c.
 */
int uart_send(uint8_t num, char c);

/**
 * uart_send_9bits is the same that uart_send but arg is 16 bits so
 * data can be 9 bits wide.
 */
int uart_send_9bits_nowait(uint8_t num, int c);

/* uart_send_9bits_wait is the same that uart_send_wait but arg is
 * 16 bits so data can be 9 bits wide.
 */
int uart_send_9bits(uint8_t num, int c);



/**
 * This function is used to register another function which will be
 * executed at each byte transmission (5, 6 ,7 ,8 bits)
 */
void uart_register_tx_event(uint8_t num, void (*f)(char));

/**
 * This function is used to register another function which will be
 * executed at each byte reception (5, 6 ,7 ,8 bits)
 */
void uart_register_rx_event(uint8_t num, void (*f)(char));


/**
 * This function is used to register another function which will be
 * executed at each 9 bits frame transmission. WARNING : it uses the
 * same internal pointer that the 8 bits event, so be carreful to 
 * unregister 8 bits events when doing 9 bits and vice versa.
 */
void uart_register_tx_9bits_event(uint8_t num, void (*f)(int));

/**
 * This function is used to register another function which will be
 * executed at each 9 bits reception. WARNING : it uses the
 * same internal pointer that the 8 bits event, so be carreful to 
 * unregister 8 bits events when doing 9 bits and vice versa.
 */
void uart_register_rx_9bits_event(uint8_t num, void (*f)(int));

/* funcs for use with fdevopen (avrlibc > 1.4.0) */
int uart0_dev_send_nowait(char c, FILE* f);
int uart0_dev_send(char c, FILE* f);
int uart0_dev_recv_nowait(FILE* f);
int uart0_dev_recv(FILE* f);

int uart1_dev_send_nowait(char c, FILE* f);
int uart1_dev_send(char c, FILE* f);
int uart1_dev_recv_nowait(FILE* f);
int uart1_dev_recv(FILE* f);

int uart2_dev_send_nowait(char c, FILE* f);
int uart2_dev_send(char c, FILE* f);
int uart2_dev_recv_nowait(FILE* f);
int uart2_dev_recv(FILE* f);

int uart3_dev_send_nowait(char c, FILE* f);
int uart3_dev_send(char c, FILE* f);
int uart3_dev_recv_nowait(FILE* f);
int uart3_dev_recv(FILE* f);


#endif /* _UART_H_ */

