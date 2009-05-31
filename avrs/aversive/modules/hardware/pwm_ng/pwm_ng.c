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
#include <string.h>

#include <aversive.h>
#include <aversive/parts.h>
#include <aversive/timers.h>

#include "pwm_ng.h"

/* value to be used for limiting inputs */
#define PWM_SIGNIFICANT_BITS 12
#define PWM_MAX ((1<< PWM_SIGNIFICANT_BITS)-1)
#define PWM_MIN (-PWM_MAX)

#define PWM_NG_TYPE_8   0
#define PWM_NG_TYPE_16  1

#define PWM_NG_NBITS_8   0
#define PWM_NG_NBITS_9   1
#define PWM_NG_NBITS_10  2

void pwm_ng_init(struct pwm_ng *pwm, uint8_t timer_nbits, 
		 uint8_t pwm_nbits, uint8_t pwm_mode,
		 volatile void *ocrn, 
		 uint8_t com0, volatile uint8_t *tccrn,
		 volatile uint8_t *pwm_port, uint8_t pwm_bit,
		 volatile uint8_t *sign_port, uint8_t sign_bit)
{
	memset(pwm, 0, sizeof(*pwm));

	if (timer_nbits == 8) {
		pwm->type = PWM_NG_TYPE_8;
		pwm->u.ocr8 = ocrn;
		*pwm->u.ocr8 = 0;
	}
	else {
		pwm->type = PWM_NG_TYPE_16;
		pwm->u.ocr16 = ocrn;
		*pwm->u.ocr16 = 0;
	}
	switch (pwm_nbits) {
	case 9:
		pwm->nbits = PWM_NG_NBITS_9;
		break;
	case 10:
		pwm->nbits = PWM_NG_NBITS_10;
		break;
	case 8:
	default:
		pwm->nbits = PWM_NG_NBITS_8;
		break;
	}
	pwm->mode = pwm_mode;

	*tccrn &= ~(0x03 << com0);
	if (pwm_mode & PWM_NG_MODE_REVERSE)
		*tccrn |= (0x01 << com0);
	else
		*tccrn |= (0x02 << com0);
	
	DDR(*pwm_port) |= (1 << pwm_bit);

	if ((pwm_mode & PWM_NG_MODE_SIGNED) && (sign_port))
		DDR(*sign_port) |= (1 << sign_bit);
	pwm->sign_port = sign_port;
	pwm->sign_bit = sign_bit;
}

static inline void pwm_sign_set(struct pwm_ng *pwm)
{
	if (pwm->mode & PWM_NG_MODE_SIGN_INVERTED)
		*pwm->sign_port &= ~(1 << pwm->sign_bit);
	else
		*pwm->sign_port |= (1 << pwm->sign_bit);
}

static inline void pwm_sign_reset(struct pwm_ng *pwm)
{
	if (pwm->mode &PWM_NG_MODE_SIGN_INVERTED)
		*pwm->sign_port |= (1 << pwm->sign_bit);
	else
		*pwm->sign_port &= ~(1 << pwm->sign_bit);
}

static inline int32_t pwm_invert_value(struct pwm_ng *pwm, int32_t value)
{
	if (pwm->mode & PWM_NG_MODE_SPECIAL_SIGN)
		return value & PWM_MAX;
	else
		return -value;
}

#include <stdio.h>
void pwm_ng_set(void *data, int32_t value)
{
	struct pwm_ng *pwm = data;
	uint8_t nbits = 8 + pwm->nbits;

	MAX(value, PWM_MAX);
	if (pwm->mode & PWM_NG_MODE_SIGNED) {
		MIN(value, PWM_MIN);
		if (value < 0) {
			pwm_sign_set(pwm);
			value = pwm_invert_value(pwm, value);
		}
		else {
			pwm_sign_reset(pwm);
		}
	}
	else {
		MIN(value, 0);
	}
	if (pwm->type == PWM_NG_TYPE_8)
		*pwm->u.ocr8 = (uint8_t) (value >> (PWM_SIGNIFICANT_BITS - 8));
	else
		*pwm->u.ocr16 = (value >> (PWM_SIGNIFICANT_BITS - nbits));
}

