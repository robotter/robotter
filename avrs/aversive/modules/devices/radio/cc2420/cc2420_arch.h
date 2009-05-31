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

/*
 *	This file defines the memory map of the CC2420
 *	as well as all registers and bit names.
 *	Please refer to the DataSheet of your chip
 *	for more information.
 */


#ifndef _CC2420_ARCH_H_
#define _CC2420_ARCH_H_


/*
 *	Read/write and RAM/register bits
 */
#define WRITE_BIT	(0<<6)
#define READ_BIT	(1<<6)

#define REG_BIT		(0<<7)
#define RAM_BIT		(1<<7)

#define RAM_READ_WRITE	(0<<5)
#define RAM_READ		(1<<5)

#define REG_MASK	0x3F
#define RAM_MASK	0x7F
#define BANK_MASK	0xC0


/*
 *	RAM memory map
 */
#define RAM_NOT_USED	0x16C		/* Not used */
#define RAM_SHORTADR	0x16A		/* 16-bits Short address */
#define RAM_PANID		0x168		/* 16-bits PAN identifier */
#define RAM_IEEEADR		0x160		/* 64-bits IEEE address */
#define RAM_CBCSTATE	0x150		/* Temporary storage for CBC-MAC calculation*/
#define RAM_TXNONCE		0x140		/* TX nonce (in-line auth) */
#define RAM_TXCTR		RAM_TXNONCE	/* TX counter (in-line encrypt) */
#define RAM_KEY1		0x130		/* Encryption key 1 */
#define RAM_SABUF		0x120		/* Stand-alone encryption buffer */
#define RAM_RXNONCE		0x110		/* RX nonce (in-line auth) */
#define RAM_RXCTR		RAM_RXNONCE	/* RX counter (in-line encrypt) */
#define RAM_KEY0		0x100		/* Encryption key 0 */
#define RAM_RXFIFO		0x080		/* 128 bytes RX FIFO */
#define RAM_TXFIFO		0x000		/* 128 bytes TX FIFO */

/*
 *	Configuration Registers
 */
/* STROBE registers */
#define SNOP		0x00	/* No operation */
#define SXOSCON		0x01	/* Turn ON the crystal oscillator */
#define STXCAL		0x02	/* Enable & calibrate frequency synth for TX */
#define SRXON		0x03	/* Enable RX */
#define STXON		0x04	/* Enable TX after calibration */
#define STXONCCA	0x05	/* if CCA clear, then enable calibration and TX */
#define SRFOFF		0x06	/* Disable RX/TX and freq synth */
#define SXOSCOFF	0x07	/* Turn OFF oscillator and RF */
#define SFLUSHRX	0x08	/* Flush RX fifo */
#define SFLUSHTX	0x09	/* Flush TX fifo */
#define SACK		0x0A	/* Send ACK frame */
#define SACKPEND	0x0B	/* Send ACK frame with pending bit  */
#define SRXDEC		0x0C	/* Start RXFIFO decryption */
#define STXENC		0x0D	/* Start TXFIFO encryption */
#define SAES		0x0E	/* AES Stand alone encryption */
/* 0x0F not used */

/* Read / Write registers */
#define MAIN		0x10	/* Main control */
#define MDMCTRL0	0x11	/* Modem control 0 */
#define MDMCTRL1	0x12	/* Modem control 1 */
#define RSSI		0x13	/* RSSI and CCA status and control */
#define SYNCWORD	0x14	/* Synchronization word control */
#define TXCTRL		0x15	/* Transmit control */
#define RXCTRL0		0x16	/* Receive control 0 */
#define RXCTRL1		0x17	/* Receive control 1 */
#define FSCTRL		0x18	/* Frequency control and status */
#define SECCTRL0	0x19	/* Security control 0 */
#define SECCTRL1	0x1A	/* Security control 1 */
#define BATTMON		0x1B	/* Battery monitor control and status */
#define IOCFG0		0x1C	/* IO control 0 */
#define IOCFG1		0x1D	/* IO control 1 */
#define MANFIDL		0x1E	/* Manufacturer ID low 16 bits */
#define MANFIDH		0x1F	/* Manufacturer ID high 16 bits */
#define FSMTC		0x20	/* Finite State Machine Time Constants */
#define MANAND		0x21	/* Manual AND override */
#define MANOR		0x22	/* Manual OR override */
#define AGCCTRL		0x23	/* Automatic Gain Control */
#define AGCTST0		0x24	/* AGC test 0 */
#define AGCTST1		0x25	/* AGC test 1 */
#define AGCTST2		0x26	/* AGC test 2 */
#define FSTST0		0x27	/* Frequency Synthetizer test 0 */
#define FSTST1		0x28	/* FS test 1 */
#define FSTST2		0x29	/* FS test 2 */
#define FSTST3		0x2A	/* FS test 3 */
#define RXBPFTST	0x2B	/* Receiver Bandpass Filter test */
#define FSMSTATE	0x2C	/* FSM status */
#define ADCTST		0x2D	/* ADC test	*/
#define DACTST		0x2E	/* DAC test */
#define TOPTST		0x2F	/* Top Level test */

#define RESERVED	0x30
/* 0x31 - 0x3D not used */

#define TXFIFO		0x3E	/* TX FIFO byte */
#define RXFIFO		0x3F	/* RX FIFO byte */


/* 
 * Status byte bit names 
 */
#define RESERVED_1		7
#define XOSC16M_STABLE	6
#define TX_UNDERFLOW	5
#define ENC_BUSY		4
#define TX_ACTIVE		3
#define LOCK			2
#define RSSI_VALID		1
#define RESERVED_2		0

/*
 *	MAIN register bits
 */
#define RESETn			15
#define ENC_RESETn		14
#define DEMOD_RESETn	13
#define MOD_RESETn		12
#define FS_RESETn		11
/* 10 - 1 reserved */
#define XOSC16M_BYPASS	0

/*
 *	MDMCTRL0
 */
/* 15 - 14 reserved */
#define RESERVED_FRAME_MODE	13
#define PAN_COORDINATOR		12
#define ADR_DECODE			11
#define CCA_HYST2			10
#define CCA_HYST1			9
#define CCA_HYST0			8
#define CCA_MODE1			7
#define CCA_MODE0			6
#define AUTOCRC				5
#define AUTOACK				4
#define PREAMBLE_LENGTH3	3
#define PREAMBLE_LENGTH2	2
#define PREAMBLE_LENGTH1	1
#define PREAMBLE_LENGTH0	0

/*
 *	MDMCTRL1
 */
/* 15 - 11 reserved */
#define CORR_THR4			10
#define CORR_THR3			9
#define CORR_THR2			8
#define CORR_THR1			7
#define CORR_THR0			6
#define DEMOD_AVG_MODE		5
#define MODULATION_MODE		4
#define TX_MODE1			3
#define TX_MODE0			2
#define RX_MODE1			1
#define RX_MODE0			0

/*
 *	RSSI
 */
#define CCA_THR				15
#define RSSI_VAL			7

/*
 *	TXCTRL
 */
#define TXMIXBUF_CUR1		15
#define TXMIXBUF_CUR0		14
#define TX_TURNAROUND		13
#define TXMIX_CAP_ARRAY1	12
#define TXMIX_CAP_ARRAY0	11
#define TXMIX_CURRENT1		10
#define TXMIX_CURRENT0		9
#define PA_CURRENT			8
#define PA_LEVEL			4

/*
 *	RXCTRL0
 */
#define RXMIXBUF_CUR		13
#define HIGH_LNA_GAIN		11
#define MED_LNA_GAIN		9
#define LOW_LNA_GAIN		7
#define HIGH_LNA_CURRENT	5
#define MED_LNA_CURRENT		3
#define LOW_LNA_CURRENT		1

/*
 *	RXCTRL1
 */
#define RXBPF_LOCUR			13
#define RXBPF_MIDCUR		12
#define LOW_LOWGAIN			11
#define MED_LOWGAIN			10
#define HIGH_HGM			9
#define MED_HGM				8
#define LNA_CAP_ARRAY		7
#define RXMIX_TAIL			5
#define RXMIX_VCM			3
#define RXMIX_CURRENT		1

/*
 *	FSCTRL
 */
#define LOCK_THR			15
#define CAL_DONE			13
#define CAL_RUNNING			12
#define LOCK_LENGTH			11
#define LOCK_STATUS			10
#define FREQ				9

/*
 *	SECCTRL0
 */
#define RXFIFO_PROTECTION	9
#define SEC_CBC_HEAD		8
#define SEC_SAKEYSEL		7
#define SEC_TXKEYSEL		6
#define SEC_RXKEYSEL		5
#define SEC_M				4
#define SEC_MODE			1

/*
 *	SECCTRL1
 */
#define SEC_TXL				14
#define SEC_RXL				6

/*
 *	BATTMON
 */
#define BATT_OK				6
#define BATTMON_EN			5
#define BATTMON_VOLTAGE		4

/*
 *	IOCFG0
 */
#define BCN_ACCEPT			11
#define FIFO_POLARITY		10
#define FIFOP_POLARITY		9
#define SFD_POLARITY		8
#define CCA_POLARITY		7
#define FIFOP_THR			6

/*
 *	IOCFG1
 */
#define HSSD_SRC			12
#define SFDMUX				9
#define CCAMUX				4

/*
 *	MANFIDL
 */
#define PARTNUM_L			15
#define MANFID				11

/*
 *	MANFIDH
 */
#define VERSION				15
#define PARTNUM_H			11

/*
 *	FSMTC
 */
#define TC_RXCHAIN2RX		15
#define TC_SWITCH2TX		12
#define TC_PAON2TX			9
#define TC_TXEND2SWITCH		5
#define TC_TXEND2PAOFF		2

/*
 *	MANAND and MANOR
 */
#define VGA_RESET_N			15
#define BIAS_PD				14
#define BALUN_CTRL			13
#define RXTX				12
#define PRE_PD				11
#define PA_N_PD				10
#define PA_P_PD				9
#define DAC_LPF_PD			8
#define XOSC16M_PD			7
#define RXBPF_CAL_PD		6
#define CHP_PD				5
#define FS_PD				4
#define ADC_PD				3
#define VGA_PD				2
#define RXBPF_PD			1
#define LNAMIX_PD			0

/*
 *	AGCCTRL
 */
#define VGA_GAIN_OE			11
#define VGA_GAIN			10
#define LNAMIX_GAINMODE_O	3
#define LNAMIX_GAINMODE		1

/*
 *	AGCTST0
 */
#define LNAMIX_HYST			15
#define LNAMIX_THR_H		11
#define LNAMIX_THR_L		5

/*
 *	AGCTST1
 */
#define AGC_BLANK_MOD		14
#define PEAKDET_CUR_BOOST	13
#define AGC_SETTLE_WAIT		12
#define AGC_PEAK_DET_MODE	10
#define AGC_WIN_SIZE		7
#define AGC_REF				5

/*
 *	AGCTST2
 */
#define MED2HIGHGAIN		9
#define LOW2MEDGAIN			4

/*
 *	FSTST0
 */
#define VCO_ARRAY_SETTLE_LONG	11
#define VCO_ARRAY_OE		10
#define VCO_ARRAY_O			9
#define VCO_ARRAY_RES		4

/*
 *	FSTST1
 */
#define VCO_TX_NOCAL		15
#define VCO_ARRAY_CAL_LONG	14
#define VCO_CURRENT_REF		13
#define VCO_CURRENT_K		9
#define VC_DAC_EN			3
#define VC_DAC_VAL			2

/*
 *	FSTST2
 */
#define VCO_CURCAL_SPEED	14
#define VCO_CURRENT_OE		12
#define VCO_CURRENT_O		11
#define VCO_CURRENT_RES		5

/*
 *	FSTST3
 */
#define CHP_CAL_DISABLE		15
#define CHP_CURRENT_OE		14
#define CHP_TEST_UP			13
#define CHP_TEST_DN			12
#define CHP_DISABLE			11
#define PD_DELAY			10
#define CHP_STEP_PERIOD		9
#define STOP_CHP_CURRENT	7
#define START_CHP_CURRENT	3

/*
 *	RXBPFTST
 */
#define RXBPF_CAP_OE		14
#define RXBPF_CAP_O			13
#define RXBPF_CAP_RES		6

/*
 *	FSMSTATE
 */
#define FSM_CUR_STATE		5

/*
 *	ADCTST
 */
#define ADC_CLOCK_DISABLE	15
#define ADC_I				14
#define ADC_Q				6

/*
 * DACTST
 */
#define DAC_SRC				14
#define DAC_I_O				11
#define DAC_Q_O				5

/*
 *	TOPTST
 */
#define RAM_BIST_RUN		7
#define TEST_BATTMON_EN		6
#define VC_IN_TEST_EN		5
#define ATESTMOD_PD			4
#define ATESTMOD_MODE		3



#endif /* _CC2420_ARCH_H_ */

