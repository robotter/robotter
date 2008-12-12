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
 *  Revision : $Id: uart_errors.h,v 1.5 2006-02-21 23:05:18 zer0 Exp $
 *
 */

/* Droids-corp 2004 - Zer0
 * Errors of the uart module
 */

/** \file uart.c
 *  \brief Errors of the UART module.
 *
 *  \todo None
 *
 *  \test None
 */


/* check if uart configuration is correct at compilation time */
#ifndef UART_IS_USART
#if (UART0_PARITY == UART_PARTITY_ODD) || (UART0_PARITY == UART_PARTITY_EVEN)
#error Currently this module does not support parity if your uC has no USART
#endif

#if (UART0_STOP_BIT == 2)
#error Currently this module does not support another stop bit if your uC has no USART
#endif

#if (UART0_NBITS < 8)
#error Currently this module does not support 5/6/7 bits frames if your uC has no USART
#endif  
#endif // !UART_USART


/* check if uart configuration is correct */
#if !defined(UART_USART) && defined(UART_DOUBLE) // is this possible ??
#if (UART1_PARITY == UART_PARTITY_ODD) || (UART1_PARITY == UART_PARTITY_EVEN)
#error Currently this module does not support parity if your uC has no USART
#endif

#if (UART1_STOP_BIT == 2)
#error Currently this module does not support another stop bit if your uC has no USART
#endif

#if (UART1_NBITS < 8)
#error Currently this module does not support 5/6/7 bits frames if your uC has no USART
#endif  
#endif // !UART_USART && UART_DOUBLE 



