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
 *  Revision : $Id: mf2_client_config.h,v 1.2 2007-05-01 15:35:51 zer0 Exp $
 *
 */

#ifndef MF2_CLIENT_CONFIG_H
#define MF2_CLIENT_CONFIG_H

#define MF2_CLIENT_DATA_PORT PORTB
#define MF2_CLIENT_DATA_BIT  0

/* MF2 clk should be an external interrupt pin */
#define MF2_CLIENT_CLK_PORT  PORTE
#define MF2_CLIENT_CLK_BIT   4

#define MF2_CLIENT_INTERRUPT SIG_INTERRUPT4
#define MF2_CLIENT_INT_REG   EICRB
#define MF2_CLIENT_INT_BIT0  ISC40
#define MF2_CLIENT_INT_BIT1  ISC41
#define MF2_CLIENT_IMASK     EIMSK
#define MF2_CLIENT_IFLAG     EIFR
#define MF2_CLIENT_IMASK_BIT 4     

#endif

