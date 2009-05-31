/*  
 *  Copyright Droids Corporation (2008)
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
 */

/*
 * Author : Julien LE GUEN - jlg@jleguen.info
 */

#ifndef _CC2420_H_
#define _CC2420_H_


/* Convenient macro to ckeck status bits */
#define CC2420_STATUS_CHECK(bit)	((cc2420_get_status() & _BV(bit)) >> (bit))



/*
 *	Initialize the CC2420
 */
void cc2420_init(void);

/*
 *	Get CC2420's status byte
 */
uint8_t cc2420_get_status(void);

/*
 * Write to a strobe register
 * Returns Status byte
 */
inline uint8_t cc2420_strobe_register(uint8_t reg);

/* Read and Write from/to a register */
inline uint16_t cc2420_read_register(uint8_t reg);
inline void cc2420_write_register(uint8_t reg, uint16_t value);

/*
 * Write the contents of a buffer to TXFIFO
 * Returns last read status byte
 */
uint8_t cc2420_write_txfifo(uint8_t *buffer, uint8_t length);

/*
 * Write the contents of a buffer to RXFIFO
 * Returns last read status byte
 */
uint8_t cc2420_write_rxfifo(uint8_t *buffer, uint8_t length);

/*
 * Read the contents of RXFIFO into a buffer
 */
void cc2420_read_rxfifo(uint8_t *buffer, uint8_t length);

/*
 *	Write to a RAM address one or several byte(s)
 *	/!\ This is NOT foolproof, you have to be sure of the
 *	address you write to, and the length of your buffer
 */
void cc2420_write_ram(uint16_t addr, uint8_t *buffer, uint16_t length);

/*
 *	Read from RAM. Same warning.
 */
void cc2420_read_ram(uint16_t addr, uint8_t *buffer, uint16_t length);


#endif /* _CC2420_H_ */
