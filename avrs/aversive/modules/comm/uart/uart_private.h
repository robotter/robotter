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
 *  Revision : $Id: uart_private.h,v 1.3 2007-05-24 13:08:46 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2007
 */

#ifndef _UART_PRIVATE_H_
#define _UART_PRIVATE_H_

#include <aversive.h>
#include <aversive/list.h>

#include <uart.h>
#include <uart_defs.h>
#include <uart_config.h>


typedef void (event)(char);
typedef void (event_9bits)(int);


#if (defined UDR0) && (defined UART0_COMPILE)
DECLARE_FCTS(0)
DECLARE_VARS(0)
#endif

#if (defined UDR1) && (defined UART1_COMPILE)
DECLARE_FCTS(1)
DECLARE_VARS(1)
#endif

#if (defined UDR2) && (defined UART2_COMPILE)
DECLARE_FCTS(2)
DECLARE_VARS(2)
#endif

#if (defined UDR3) && (defined UART3_COMPILE)
DECLARE_FCTS(3)
DECLARE_VARS(3)
#endif

#endif /* _UART_PRIVATE_H_ */
