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

#ifndef _CC2420_CONFIG_H
#define _CC2420_CONFIG_H

/*
 * Configure HERE your hardware connections to the device
 * Here is the list of connections between the CC2420 and the AVR:
 *	- VREG_EN	Enable the onchip voltage regulator
 *	- RESET		Drive the CC2420 reset line
 *	- FIFO		RX FIFO status line
 *	- FIFOP		RX FIFO status line
 *	- CCA		Clear Channel Assessment
 *	- SFD		Timing information
 *	
 *	In addition the chip communicates through a 4-wire SPI connection
 *	Thus you have to enable the SPI module in Aversive. The CC2420 is a slave
 *	on the SPI bus.
 *
 *	For more information please see the CC2420 DataSheet.
 */


/* 
 * VREG_EN - Enable the CC2420  voltage regulator
 */

/* Comment if you don't drive VREG_EN from the microcontroller */
#define CC2420_VREG_ENABLE
#define CC2420_VREG_EN_PORT	PORTA
#define CC2420_VREG_EN_PIN	5

/*
 * RESET - Drive the CC2420 reset line
 */

/* Comment if you don't drive RESET from the microcontroller */
#define CC2420_RESET_ENABLE
#define CC2420_RESET_PORT	PORTA
#define CC2420_RESET_PIN	6

/*
 *	FIFO status lines
 */
#define CC2420_FIFO_PORT	PORTC
#define CC2420_FIFO_PIN		1

#define CC2420_FIFOP_PORT	PORTE
#define	CC2420_FIFOP_PIN	7

/*
 *	CCA status line
 */
#define CC2420_CCA_PORT		PORTD
#define CC2420_CCA_PIN		4

/*
 *	SFD status line
 */
#define CC2420_SFD_PORT		PORTD
#define CC2420_SFD_PIN		6

/*
 *	SPI Slave Select (SS pin) configuration
 */
#define CC2420_SS_DDR		DDRC
#define CC2420_SS_PORT		PORTC
#define CC2420_SS_PIN		0



#endif /* _CC2420_CONFIG_H */
