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

#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>

#include <spi.h>

#include <cc2420.h>
#include <cc2420_arch.h>
#include <cc2420_config.h>


#define SLAVE_SELECT()		spi_slave_select(g_slave_adr)
#define SLAVE_DESELECT()	spi_slave_deselect(g_slave_adr)

/*
#define SLAVE_SELECT() PORTC &= 0xFE
#define SLAVE_DESELECT() PORTC |= 0x01
*/

volatile static uint8_t g_slave_adr;


/*
 * Read status byte
 */
uint8_t cc2420_get_status(void)
{
	uint8_t tmp;
	SLAVE_SELECT();
	tmp = spi_send_and_receive_byte(SNOP);
	SLAVE_DESELECT();
	return tmp;
}

/*
 * Write to a strobe register
 * Returns Status byte
 */
uint8_t cc2420_strobe_register(uint8_t reg)
{
	uint8_t tmp;
	SLAVE_SELECT();
	tmp = spi_send_and_receive_byte(reg);
	SLAVE_DESELECT();
	return tmp;
}

/*
 * Read a two-bytes register
 */
uint16_t cc2420_read_register(uint8_t reg)
{
	uint16_t value;
	SLAVE_SELECT();
	/* Send address and READ action */
	spi_send_byte(REG_BIT | READ_BIT | (reg & REG_MASK));
	/* Just send nothing (0x00) and read the value back (MSB first) */
	value = spi_receive_byte();
	value = (value<<8) | spi_receive_byte();
	SLAVE_DESELECT();
	return value;
}

/*
 * Write to a two-bytes register
 */
void cc2420_write_register(uint8_t reg, uint16_t value)
{
	SLAVE_SELECT();
	/* Send address and WRITE action */
	spi_send_byte(REG_BIT | WRITE_BIT | (reg & REG_MASK));
	/* Send the value, ignore the status byte in return */
	spi_send_byte((uint8_t)((value & 0xFF00)>>8));
	spi_send_byte((uint8_t)(value & 0x00FF));
	SLAVE_DESELECT();
}

/*
 * Write the contents of a buffer to TXFIFO
 * Returns last read status byte
 */
uint8_t cc2420_write_txfifo(uint8_t *buffer, uint8_t length)
{
	uint8_t status;
	uint8_t i;
	SLAVE_SELECT();
	/* Flush the FIFO - don't need the status byte */
	//spi_send_byte(SFLUSHTX);
	/* TXFIFO Register address */
	NOTICE(E_CC2420, "Writing %d bytes to TXFIFO at address 0x%x", length, REG_BIT | WRITE_BIT | TXFIFO);
	spi_send_byte(REG_BIT | WRITE_BIT | TXFIFO);
	/* Send all bytes */
	for(i = 0; i < length; i++)
	{
		/* We may need the status byte at any time
		 * For instance, to detect TXFIFO underflow */
		status = spi_send_and_receive_byte(buffer[i]);
	}
	SLAVE_DESELECT();
	return status;
}

/*
 * Write the contents of a buffer to RXFIFO
 * Returns last read status byte
 */
uint8_t cc2420_write_rxfifo(uint8_t *buffer, uint8_t length)
{
	uint8_t status;
	uint8_t i;
	SLAVE_SELECT();
	/* Flush the FIFO - don't need the status byte */
	spi_send_byte(SFLUSHRX);
	/* RXFIFO Register address */
	spi_send_byte(REG_BIT | WRITE_BIT | RXFIFO);
	/* Send all bytes */
	for(i = 0; i < length; i++)
	{
		/* We may need the status byte at any time
		 * For instance, to detect TXFIFO underflow */
		status = spi_send_and_receive_byte(buffer[i]);
	}
	SLAVE_DESELECT();
	return status;
}

/*
 * Read the contents of RXFIFO into a buffer
 */
void cc2420_read_rxfifo(uint8_t *buffer, uint8_t length)
{
	uint8_t i;
	SLAVE_SELECT();
	/* RXFIFO Register address */
	spi_send_byte(REG_BIT | READ_BIT | RXFIFO);
	/* Read all bytes */
	for(i = 0; i < length; i++)
	{
		buffer[i] = spi_receive_byte();
	}
	SLAVE_DESELECT();
}

/* XXX Ca fait de la merde dans le coin la... */

/*
 *	Write to a RAM address one or several byte(s)
 *	/!\ This is NOT foolproof, you have to be sure of the
 *	address you write to, and the length of your buffer
 */
void cc2420_write_ram(uint16_t addr, uint8_t *buffer, uint16_t length)
{
	uint16_t i;
	SLAVE_SELECT();
	/* Forge the address */
	spi_send_byte(RAM_BIT | (addr & RAM_MASK));
	spi_send_byte((((addr>>1) & BANK_MASK) | RAM_READ_WRITE));
	/* Send the data */
	for(i = 0; i < length; i++)
	{
		spi_send_byte((uint8_t)buffer[i]);
	}
	SLAVE_DESELECT();
}

/*
 *	Read from RAM. Same warning.
 */
void cc2420_read_ram(uint16_t addr, uint8_t *buffer, uint16_t length)
{
	uint16_t i;
	SLAVE_SELECT();
	/* Forge the address */
	spi_send_byte((RAM_BIT | (addr & RAM_MASK)));
	spi_send_byte((((addr>>1) & BANK_MASK) | RAM_READ));
	/* Receive the data */
	for(i = 0; i < length; i++)
	{
		buffer[i] = spi_receive_byte();
	}
	SLAVE_DESELECT();
}



/*
 *	Initialize ports and starts-up the chip
 */
void cc2420_init(void)
{
	NOTICE(E_CC2420, "Initialization");
	/* Check and start SPI module */
	if (spi_get_mode() == SPI_MODE_UNINIT)
	{
		g_slave_adr = spi_register_ss_line(&CC2420_SS_PORT, CC2420_SS_PIN);
		spi_init(SPI_MODE_MASTER, SPI_FORMAT_0, SPI_CLK_RATE_2);
	}

	NOTICE(E_CC2420, "Registered slave line: %d", g_slave_adr);

	/* Configure all IO ports in input */
	DDR(CC2420_FIFO_PORT)	&= ~(_BV(CC2420_FIFO_PIN));
	DDR(CC2420_FIFOP_PORT)	&= ~(_BV(CC2420_FIFOP_PIN));
	DDR(CC2420_CCA_PORT)	&= ~(_BV(CC2420_CCA_PIN));
	DDR(CC2420_SFD_PORT)	&= ~(_BV(CC2420_SFD_PIN));

	CC2420_SS_DDR = 0x01;

	/* Enable on-chip voltage regulator */
#ifdef CC2420_VREG_ENABLE
	NOTICE(E_CC2420, "Enable on-chip voltage regulator");
	DDR(CC2420_VREG_EN_PORT) |= _BV(CC2420_VREG_EN_PIN);
	CC2420_VREG_EN_PORT |= _BV(CC2420_VREG_EN_PIN);
	wait_ms(1);
#endif

	/* Reset the chip */
#ifdef CC2420_RESET_ENABLE
	NOTICE(E_CC2420, "Reset radio chip");
	DDR(CC2420_RESET_PORT) |= _BV(CC2420_RESET_PIN);
	CC2420_RESET_PORT &= ~(_BV(CC2420_RESET_PIN));
	wait_ms(1);
	CC2420_RESET_PORT |= _BV(CC2420_RESET_PIN);
	wait_ms(1);
#endif


	/* Start the oscillator */
	NOTICE(E_CC2420, "Start the oscillator");
	
	/* Select the CC2420 SS line */
	SLAVE_SELECT();
	spi_send_byte(SXOSCON);
	/* Release SS line */
	SLAVE_DESELECT();

	/* Wait for stability */
	while(!CC2420_STATUS_CHECK(XOSC16M_STABLE))
		;

	NOTICE(E_CC2420, "Init done");
}
