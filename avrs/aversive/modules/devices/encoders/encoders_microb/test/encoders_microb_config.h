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
 *  Revision : $Id: encoders_microb_config.h,v 1.3 2006-07-22 09:27:26 zer0 Exp $
 *
 */
#ifndef _ENCODERS_MICROB_CONFIG_H_
#define _ENCODERS_MICROB_CONFIG_H_

/**   number of the LAST encoders used + 1   */
#define ENCODERS_MICROB_NUMBER 4

#define ENCODERS_MICROB_SEL_PORT PORTE
#define ENCODERS_MICROB_SEL_BIT 6

#define ENCODERS_MICROB0_ENABLED
#define ENCODERS_MICROB0_PIN PINA

#define ENCODERS_MICROB1_ENABLED
#define ENCODERS_MICROB1_PIN PINA

#define ENCODERS_MICROB2_ENABLED
#define ENCODERS_MICROB2_PIN PINC

#define ENCODERS_MICROB3_ENABLED
#define ENCODERS_MICROB3_PIN PINC


// ... until 7

#endif
