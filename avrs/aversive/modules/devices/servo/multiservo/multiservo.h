/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2006)
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
 *  Revision : $Id: multiservo.h,v 1.4 2007-05-24 13:08:48 zer0 Exp $
 *
 */

#ifndef _MULTISERVO__H_
#define _MULTISERVO__H_

#include <aversive.h>
#include <multiservo_config.h>


struct multiservo_element {
	volatile uint8_t * port;
	uint8_t bitnum;
	uint16_t value;
};

struct multiservo {
	uint32_t time_sum;
	uint16_t current_multiservo;
	int8_t id_prev;
	struct multiservo_element elts[MULTISERVO_NB_MAX];
};

extern struct multiservo g_multiservo;



void multiservo_init(void);

int8_t multiservo_add(volatile uint8_t * port, uint8_t bitnum);

void multiservo_del(int8_t id);

void multiservo_set(int8_t id, uint16_t val);


#endif
