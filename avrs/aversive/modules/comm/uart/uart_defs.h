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
 *  Revision : $Id: uart_defs.h,v 1.8 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2006
 * Uart specific definitions
 */

#ifndef _UART_DEFS_H_
#define _UART_DEFS_H_

#define UART_PARTITY_NONE 0
#define UART_PARTITY_ODD 1
#define UART_PARTITY_EVEN 2

#define UART_STOP_BITS_1 0
#define UART_STOP_BITS_2 1

#if (defined UDR3)
#define UART_HW_NUM 4
#elif (defined UDR2)
#define UART_HW_NUM 3
#elif (defined UDR1)
#define UART_HW_NUM 2
#else /* assume 1 uart */
#define UART_HW_NUM 1
#endif


/* For arch with only one UART, we consider that UART0 = UART */
#if !defined(SIG_UART0_DATA) && !defined(SIG_USART0_DATA)
#if defined SIG_UART_DATA
#define SIG_UART0_DATA SIG_UART_DATA
#elif defined SIG_USART_DATA
#define SIG_UART0_DATA SIG_USART_DATA
#endif
#endif

#if !defined(SIG_UART0_RECV) && !defined(SIG_USART0_RECV)
#if defined SIG_UART_RECV
#define SIG_UART0_RECV  SIG_UART_RECV
#elif defined SIG_USART_RECV
#define SIG_UART0_RECV  SIG_USART_RECV
#endif
#endif

#ifndef UDR0
#define UDR0 UDR
#endif
#ifndef UCSR0A
#define UCSR0A UCSRA
#endif
#ifndef UCSR0B
#define UCSR0B UCSRB
#endif
#ifndef UCSR0C
#define UCSR0C UCSRC
#endif
#ifndef UBRR0L
#define UBRR0L UBRRL
#endif
#ifndef UBRR0H
#define UBRR0H UBRRH
#endif
#ifndef U2X 
#define U2X U2X0
#endif
#ifndef UCSZ0 
#define UCSZ0 UCSZ00
#endif
#ifndef UCSZ1 
#define UCSZ1 UCSZ01
#endif
#ifndef UCSZ2 
#define UCSZ2 UCSZ02
#endif
#ifndef UPM0 
#define UPM0 UPM00
#endif
#ifndef UPM1 
#define UPM1 UPM01
#endif
#ifndef USBS 
#define USBS USBS0
#endif
#ifndef TXEN 
#define TXEN TXEN0
#endif
#ifndef TXCIE 
#define TXCIE TXCIE0
#endif
#ifndef RXEN 
#define RXEN RXEN0
#endif
#ifndef RXCIE 
#define RXCIE RXCIE0
#endif
#ifndef TXC 
#define TXC TXC0
#endif
#ifndef RXB8
#define RXB8 RXB80
#endif
#ifndef UDRIE
#define UDRIE UDRIE0
#endif
#ifndef UDRE
#define UDRE UDRE0
#endif

/* makes functions more generic, we associate USR and UCR with UCSRA
 * and UCSRB, respectively */
#if ( ! defined UCSRA ) && ( defined USR )
#define UCSRA USR
#endif

#if ( ! defined UCSRB ) && ( defined UCR )
#define UCSRB UCR
#endif

/* UBRR is UBRRL */
#ifndef UBRRL
#define UBRRL UBRR
#endif


/* workaround for libc incomplete headers when using CAN AVR
 * (avr/iocanxx.h): USART is valid.
 * see http://savannah.nongnu.org/bugs/?18964
 */
#if defined (__AVR_AT90CAN128__) || defined (__AVR_AT90CAN64__) || defined (__AVR_AT90CAN32__)

#ifndef SIG_USART0_RECV
#define SIG_USART0_RECV SIG_UART0_RECV
#define SIG_USART1_RECV SIG_UART1_RECV
#define SIG_USART0_DATA SIG_UART0_DATA
#define SIG_USART1_DATA SIG_UART1_DATA
#define SIG_USART0_TRANS SIG_UART0_TRANS
#define SIG_USART1_TRANS SIG_UART1_TRANS
#endif

#endif


/* if the signal USART is defined, the uC has a USART. */
#if ( defined SIG_USART0_RECV ) || ( defined SIG_USART_RECV ) 
#define UART_IS_USART 1
#elif (defined USART_UDRE_vect) || (defined USART_TXC_vect) || (defined USART_RXC_vect)
#define UART_IS_USART 1
#else
#define UART_IS_USART 0
#endif

/* if the U2X macro is defined, the uC has the U2X option. */
#ifdef U2X
#define UART_HAS_U2X 1
#else
#define UART_HAS_U2X 0
#endif

#endif //_UART_DEFS_H_
