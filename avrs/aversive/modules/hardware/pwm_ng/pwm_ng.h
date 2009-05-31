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
 *  Copyright Droids-corporation - Olivier MATZ - 2009
 */

#ifndef _PWM_NG_H_
#define _PWM_NG_H_

#include <aversive.h>
#include <aversive/timers.h>
#include <aversive/parts.h>

/*
 * PWM signs & sign ligne inversion.
 * The pwm mode is defined be the following flags:
 *
 * PWM_NG_MODE_NORMAL            : normal pwm, just to put a value if 
 *                                 nothing else is needed.
 * PWM_NG_MODE_REVERSE           : invert pwm output, not sign.
 * PWM_NG_MODE_SIGNED            : activate the sign output on another port
 * PWM_NG_MODE_SIGN_INVERTED     : invert sign output
 * PWM_NG_MODE_SPECIAL_SIGN_MODE : if defined, the pwm is always near 0 for
 *                                 low values, else negative low values are 
 *                                 near 100%
 */
#define PWM_NG_MODE_NORMAL                           0x00 
#define PWM_NG_MODE_REVERSE                          0x01
#define PWM_NG_MODE_SIGN_INVERTED                    0x02
#define PWM_NG_MODE_SIGNED                           0x04
#define PWM_NG_MODE_SPECIAL_SIGN                     0x08

/*
 * Timer modes.
 */
#define PWM_NG_TIMER_0_MODE

struct pwm_ng {
	uint8_t mode:4,
		type:1, /* timer 8 bits or 16 bits */
		nbits:2, /* 8, 9, or 10 bits pwm */
		reserved:1;
	union {
		volatile uint8_t *ocr8;
		volatile uint16_t *ocr16;
	} u;
	volatile uint8_t *sign_port;
	uint8_t sign_bit;
};

 /** 
  * Initialize a 8 bits timer to do a PWM. This macro must
  * be called before pwm_ng_init().
  * \param n is the number of the timer.
  * \param t_mode can be TIMER_8_MODE_PWM_PC, TIMER_8_MODE_CTC, 
  * TIMER_8_MODE_PWM.
  * \param prsc is the value to be loaded in
  * the prescaler register for this timer. For instance,
  * TIMER0_PRESCALER_DIV_256.
  */
#define PWM_NG_TIMER_8BITS_INIT(n, t_mode, prsc)			\
	do {								\
		TCCR##n =  ( ((t_mode & 0x01) ? (1 << WGM##n##0):0)  |	\
			     ((t_mode & 0x02) ? (1 << WGM##n##1):0)  |	\
			     ((prsc << CS##n##0)) );			\
	} while(0)

/** 
 * same, but with timer8 with several OCx (like on atm2560)
 */
#define PWM_NG_TIMER_8BITS_INIT_B(n, t_mode, prsc)			\
	do {								\
		TCCR##n##A =  ( ((t_mode & 0x01) ? (1 << WGM##n##0):0)  | \
				((t_mode & 0x02) ? (1 << WGM##n##1):0)  | \
				((prsc << CS##n##0)) );			\
		TCCR##n##B = (prsc << CS##n##0);			\
	} while(0)

 /** 
  * Initialize a 16 bits timer to do a PWM. This macro must
  * be called before pwm_ng_init().
  * \param n is the number of the timer.
  * \param timer_mode can be TIMER_16_MODE_PWM_PC, TIMER_16_MODE_CTC,
  * TIMER_16_MODE_PWM...
  * \param prsc is the value to be loaded in
  * the prescaler register for this timer. For instance,
  * TIMER1_PRESCALER_DIV_256.
  */
#define PWM_NG_TIMER_16BITS_INIT(n, t_mode, prsc) do {			\
		TCCR##n##A &= ~((1 << WGM##n##0) | (1 << WGM##n##1));	\
		TCCR##n##A |= ((t_mode & 0x01) ? (1 << WGM##n##0):0) |	\
			((t_mode & 0x02) ? (1 << WGM##n##1):0);		\
		TCCR##n##B = ((t_mode & 0x04) ? (1 << WGM##n##2):0) |	\
			((t_mode & 0x08 ) ? (1 << WGM##n##3):0) |	\
			(prsc << CS##n##0);				\
	} while(0)


/**
 * Inititialize a PWM: set its mode, output pin DDR, DDR for sign
 * bit if any. Example for 8 bits (for atmega128):
 * pwm_ng_init(&pwm, 8, 8, PWM_NG_MODE_SIGNED|PWM_NG_MODE_SIGN_INVERTED, 
 *            &OCR0, COM00, &TCCR0, &PORTB, 4, &PORTE, 3);
 * Example for 16 bits (for atmega32):
 * pwm_ng_init(&pwm, 16, 9, PWM_NG_MODE_NORMAL,
 *            &OCR1B, COM1B0, &TCCR1A, &PORTD, 5, NULL, 0);
 * Note that you can use the helper macros PWM_NG_INIT8() or 
 * PWM_NG_INIT16() instead.
 * \param pwm is the pointer to the pwm structure that will be
 * filled.
 * \param nbits is the number of bits for the timer (8 or 16).
 * \param pwm_mode is the mode of the PWM. See the PWM_NG_MODE_xxx
 * flags above.
 * \param ocrn is a pointer to the OCRn register for this PWM.
 * \param com0 is the COMn0 for this PWM.
 * \param pwm_port is the pointer to the PORT of the pwm corresponding
 * to the configured PWM. For instance &PORTB. This is specified in
 * the datasheets, and depends on the AVR part.
 * \param pwm_bit is the bitnum of the configured pwm output. This 
 * is specified in the datasheets, and depends on the AVR part.
 * \param sign_port is a poinrter to the PORT for the sign bit if
 * any, else, it can be set to NULL.
 * \param sign_bit is the bitnum of the configured sign output.
 */
void pwm_ng_init(struct pwm_ng *pwm, uint8_t timer_nbits, 
		 uint8_t pwm_nbits, uint8_t pwm_mode, 
		 volatile void *ocrn, 
		 uint8_t com0, volatile uint8_t *tccrn,
		 volatile uint8_t *pwm_port, uint8_t pwm_bit,
		 volatile uint8_t *sign_port, uint8_t sign_bit);

#define PWM_NG_INIT8(pwm, n, pwm_nbits, pwm_mode, sign_port, sign_bit)	\
	do {								\
		pwm_ng_init(pwm, 8, pwm_nbits, pwm_mode, &OCR##n,	\
			    COM##n##0, &TCCR##n, &OC##n##_PORT,		\
			    OC##n##_BIT, sign_port, sign_bit);		\
	} while(0)

#define PWM_NG_INIT8_B(pwm, n, m, pwm_nbits, pwm_mode, sign_port, sign_bit) \
	do {								\
		pwm_ng_init(pwm, 8, pwm_nbits, pwm_mode, &OCR##n##m,	\
			    COM##n##m##0, &TCCR##n##A, &OC##n##m##_PORT, \
			    OC##n##m##_BIT, sign_port, sign_bit);	\
	} while(0)

#define PWM_NG_INIT16(pwm, n, m, pwm_nbits, pwm_mode, sign_port, sign_bit) \
	do {								\
		pwm_ng_init(pwm, 16, pwm_nbits, pwm_mode, &OCR##n##m,	\
			    COM##n##m##0, &TCCR##n##A,			\
			    &OC##n##m##_PORT, OC##n##m##_BIT,		\
			    sign_port, sign_bit);			\
	} while(0)

/** apply a PWM.
 * \param pwm is a pointer to the struct pwm.
 * \param value is the value of the pwm. The value is between 0 and 
 * 4095 for a non-signed pwm or -4096 and 4095 for a signed one.
 */
void pwm_ng_set(void *pwm, int32_t value); 

#endif // _PWM_H_
