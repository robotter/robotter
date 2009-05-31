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
 *  Revision : $Id: uart_dev_io.c,v 1.2 2009-03-15 21:51:18 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2009 */

#include <uart.h>
#include <uart_defs.h>
#include <uart_private.h>

#ifdef UART0_COMPILE
int uart0_dev_send_nowait(char c, FILE *f)
{
	return uart_send_nowait(0, c);
}

int uart0_dev_send(char c, FILE *f)
{
	return uart_send(0, c);
}

int uart0_dev_recv_nowait(FILE *f)
{
	return uart_recv_nowait(0);
}

int uart0_dev_recv(FILE *f)
{
	return uart_recv(0);
}                                                                            
#endif

#ifdef UART1_COMPILE
int uart1_dev_send_nowait(char c, FILE *f)
{
	return uart_send_nowait(1, c);
}

int uart1_dev_send(char c, FILE *f)
{
	return uart_send(1, c);
}

int uart1_dev_recv_nowait(FILE *f)
{
	return uart_recv_nowait(1);
}

int uart1_dev_recv(FILE *f)
{
	return uart_recv(1);
}                                                                            
#endif

#ifdef UART2_COMPILE
int uart2_dev_send_nowait(char c, FILE *f)
{
	return uart_send_nowait(2, c);
}

int uart2_dev_send(char c, FILE *f)
{
	return uart_send(2, c);
}

int uart2_dev_recv_nowait(FILE *f)
{
	return uart_recv_nowait(2);
}

int uart2_dev_recv(FILE *f)
{
	return uart_recv(2);
}                                                                            
#endif

#ifdef UART3_COMPILE
int uart3_dev_send_nowait(char c, FILE *f)
{
	return uart_send_nowait(3, c);
}

int uart3_dev_send(char c, FILE *f)
{
	return uart_send(3, c);
}

int uart3_dev_recv_nowait(FILE *f)
{
	return uart_recv_nowait(3);
}

int uart3_dev_recv(FILE *f)
{
	return uart_recv(3);
}                                                                            
#endif
