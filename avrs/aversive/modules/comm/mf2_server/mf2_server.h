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
 *  Revision : $Id: mf2_server.h,v 1.2 2007-05-01 15:35:51 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2006 */

void mf2_server_init(void);
int8_t mf2_server_ready(void);
int8_t mf2_server_send(char c);
void mf2_server_register_tx_event(void (*f)(char));
void mf2_server_register_rx_event(void (*f)(char));
