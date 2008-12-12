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
 *  Revision : $Id: uart.c,v 1.37 2007-05-24 13:08:46 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2007 */

#include <aversive.h>
#include <aversive/list.h>

#include <uart_defs.h>
#include <uart_private.h>


#if (defined UDR0) && (defined UART0_COMPILE)
DEFINE_VARS(0)

/**
 * This is the interruption function which occurs when the entire
 * frame in the transmit shift register has been shifted out and 
 * there is no new data in the transmit buffer.
 */
SIGNAL(SIG_UART0_DATA);

/**
 * This is the interruption function which occurs when there is
 * a new unread data in the reception buffer.
 */
SIGNAL(SIG_UART0_RECV);

DEFINE_GET_NBITS(0)
DEFINE_8BITS_UDR_FCTS(0)
DEFINE_9BITS_UDR_FCTS(0)
DEFINE_TRANS_INTRPT(0)
DEFINE_RECV_INTRPT(0)
#endif

#if (defined UDR1) && (defined UART1_COMPILE)
DEFINE_VARS(1)
SIGNAL(SIG_UART1_DATA);
SIGNAL(SIG_UART1_RECV);
DEFINE_GET_NBITS(1)
DEFINE_8BITS_UDR_FCTS(1)
DEFINE_9BITS_UDR_FCTS(1)
DEFINE_TRANS_INTRPT(1)
DEFINE_RECV_INTRPT(1)
#endif

#if (defined UDR2) && (defined UART2_COMPILE)
DEFINE_VARS(2)
SIGNAL(SIG_UART2_DATA);
SIGNAL(SIG_UART2_RECV);
DEFINE_GET_NBITS(2)
DEFINE_8BITS_UDR_FCTS(2)
DEFINE_9BITS_UDR_FCTS(2)
DEFINE_TRANS_INTRPT(2)
DEFINE_RECV_INTRPT(2)
#endif

#if (defined UDR3) && (defined UART3_COMPILE)
DEFINE_VARS(3)
SIGNAL(SIG_UART3_DATA);
SIGNAL(SIG_UART3_RECV);
DEFINE_GET_NBITS(3)
DEFINE_8BITS_UDR_FCTS(3)
DEFINE_9BITS_UDR_FCTS(3)
DEFINE_TRANS_INTRPT(3)
DEFINE_RECV_INTRPT(3)
#endif

/* init all uarts */
void uart_init(void)
{
#if (defined UDR0) && (defined UART0_COMPILE)
    uart0_setconf(NULL);
#endif

#if (defined UDR1) && (defined UART1_COMPILE)
    uart1_setconf(NULL);
#endif

#if (defined UDR2) && (defined UART2_COMPILE)
    uart2_setconf(NULL);
#endif

#if (defined UDR3) && (defined UART3_COMPILE)
    uart3_setconf(NULL);
#endif
}
