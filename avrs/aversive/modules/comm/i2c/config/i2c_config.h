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
 *  Revision : $Id: i2c_config.h,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */


#define I2C_BITRATE 1 // divider dor i2c baudrate, see TWBR in doc 
#define I2C_PRESCALER 3 // prescaler config, rate = 2^(n*2)

/* Size of transmission buffer */
#define I2C_SEND_BUFFER_SIZE 16

/* Size of reception buffer */
#define I2C_RECV_BUFFER_SIZE 16
