/*  
 *  Copyright RobOtter (2009) 
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

/** \file cli.h
  * \author JD
  */

#ifndef _CLI_H_
#define _CLI_H_

#include <aversive.h>
#include <uart.h>

#define CLI_USER_UART 0

static inline int cli_getkey(void)
{
  return (uart_recv(CLI_USER_UART));
}

static inline int cli_getkey_nowait(void)
{
  return (uart_recv_nowait(CLI_USER_UART));
}
#endif/*_CLI_H_*/
