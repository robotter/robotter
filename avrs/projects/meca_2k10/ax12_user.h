/*  
 *  Copyright Droids Corporation
 *  Olivier Matz <zer0@droids-corp.org>
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
 *  Revision : $Id: ax12_user.h,v 1.3 2009/04/07 20:03:48 zer0 Exp $
 *
 */

/* This is the ax12 user interface. It initializes the aversive AX12
 * module so that it works in background, using interrupt driver uart.
 *
 * Be carreful, a call to AX12 module is synchronous and uses
 * interruptions, so interrupts must be enabled. On the other side, a
 * call _must not_ interrupt another one. That's why all calls to the
 * module are done either in init() functions or in a scheduler event
 * with prio=ARM_PRIO.
 */

/* XXX do a safe_ax12() function that will retry once or twice if we
 * see some problems. */

#define UART_AX12_NUM 1

void ax12_user_init(void);

void ax12_dump_stats(void);

#define ax12_user_write_byte(ax12, id, addr, data)		\
	__ax12_user_write_byte(ax12, id, addr, data, __LINE__)

#define ax12_user_write_int(ax12, id, addr, data)		\
	__ax12_user_write_int(ax12, id, addr, data, __LINE__)

#define ax12_user_read_byte(ax12, id, addr, data)		\
	__ax12_user_read_byte(ax12, id, addr, data, __LINE__)

#define ax12_user_read_int(ax12, id, addr, data)		\
	__ax12_user_read_int(ax12, id, addr, data, __LINE__)

/** @brief Write byte in AX-12 memory 
 * @return Error code from AX-12 (0 means okay) */
uint8_t __ax12_user_write_byte(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			       uint8_t data, uint16_t line);

/** @brief Write integer (2 bytes) in AX-12 memory 
 * @return Error code from AX-12 (0 means okay)
 *
 * address   : data low
 * address+1 : data high
 */
uint8_t __ax12_user_write_int(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			      uint16_t data, uint16_t line);

/** @brief Read byte from AX-12 memory 
 * @return Error code from AX-12 (0 means okay) */
uint8_t __ax12_user_read_byte(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			      uint8_t *val, uint16_t line);

/** @brief Write integer (2 bytes) from AX-12 memory
 * @return Error code from AX-12 (0 means okay) */
uint8_t __ax12_user_read_int(AX12 *ax12, uint8_t id, AX12_ADDRESS address,
			     uint16_t *val, uint16_t line);
