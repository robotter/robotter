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
#include <aversive/error.h>
#include <aversive/wait.h>

#include <time_ext.h>
#include <time_ext_config.h>

/* Global time variable */
static volatile time_ext_t g_time;


/* Global counters */
static volatile uint32_t g_timer1_cnt;
static volatile uint16_t g_timer1_val;
static volatile uint32_t g_inst_number;
static volatile uint32_t g_frequency;
static volatile uint16_t g_nano_per_inst;

#if 0
/* Function pointer (points to the current interrupt) */
static volatile void (*g_timer1_ovf_interrupt)(void);
static volatile void (*g_timer2_ovf_interrupt)(void);


/*
 *	Interrupt vector: Timer1 OVerFlow
 */
void SIG_OVERFLOW1(void) __attribute__ ((signal));
void SIG_OVERFLOW1(void)
{
	g_timer1_cnt++;
}
#endif


/*
 *	Interrupt vector: Timer2 OVerFlow
 */
void SIG_OVERFLOW2(void) __attribute__ ((signal));
void SIG_OVERFLOW2(void)
{
#if 0
	TCNT1 = 0;
	g_timer1_cnt = 0;
#endif
	/* 256 times NANO_PER_QUARTZ_TICK / prescaler since last overflow */
	g_time.nano += (NANO_PER_QUARTZ_TICK << 8) / time_ext_get_prescaler();

	if(g_time.nano >= NANO_PER_S)
	{
		g_time.nano -= NANO_PER_S;
		g_time.sec++;
	}
}


#if 0
/*
 *	Timer1 overflow interrupt
 *	Basic one, used in production
 */
void timer1_ovf_basic(void)
{
	g_timer1_cnt++;
}

/*
 *	Timer1 overflow interrupt
 *	Calibration
 */
void timer1_ovf_calib(void)
{
	/* Remember how many times we were here */
	g_timer1_cnt++;
}

/*
 *	Timer2 overflow interrupt
 *	Basic one, used in production
 */
void timer2_ovf_basic(void)
{
	TCNT1 = 0;
	g_timer1_cnt = 0;
	/* 256 times NANO_PER_QUARTZ_TICK / prescaler since last overflow */
	g_time.nano += (NANO_PER_QUARTZ_TICK << 8) / time_ext_get_prescaler();

	if(g_time.nano >= NANO_PER_S)
	{
		g_time.nano -= NANO_PER_S;
		g_time.sec++;
	}
}

/*
 *	Timer2 overflow interrupt
 *	Used for crystal calibration
 */ 
void timer2_ovf_calib(void)
{
	/* XXX nothing for now */

	/*	
	 *	When calibrating the main crystal, this
	 *	interrupt is triggered exactly one second
	 *	after the start of the calibration.
	 *	This then reads the number of instructions
	 *	executed during this second, and deduces the
	 *	main crystal frequency.
	 *	It then configures the module back to its normal
	 *	function (that is, couting time).
	 */
	
	/* STOP timers */
	TCCR1B = 0x00;
	TIFR1 = 0xFF;
	TCCR2B = 0x00;
	TIFR2 = 0xFF;

	/* Fetch the value of TCNT1 */
	g_timer1_val = TCNT1; //(((uint16_t)TCNT1H) << 8) + TCNT1L;

	/* Total number of instructions */
	g_inst_number = (((uint32_t)g_timer1_cnt) << 16) + g_timer1_val;

	/* Print that */
	NOTICE(E_TIME_EXT, "%ld instructions in 8 second !", g_inst_number);
	NOTICE(E_TIME_EXT, "timer_val = %d, timer_cnt = %ld", g_timer1_val, g_timer1_cnt);
	g_frequency = g_inst_number >> 3;
	NOTICE(E_TIME_EXT, "Main crystal frequency = %ld Hz", g_frequency);
	g_nano_per_inst = (1000000000UL / g_frequency);
	NOTICE(E_TIME_EXT, "Instruction every %d nanosecond", g_nano_per_inst);

	/* Come back to normal state */
	g_timer1_ovf_interrupt = timer1_ovf_basic;
	g_timer2_ovf_interrupt = timer2_ovf_basic;

	g_timer1_cnt = 0;
	TCNT2 = 0;

	TCCR1B = 0x01;
	TCCR2B = 0x01;
}
#endif




/*
 *	Initialize TIMER2
 */
void time_ext_init(void)
{
	/* 
	 * Asynchronous operation of Timer2
	 * Some considerations must be taken.
	 * See DataSheet for additional information.
	 */
	
	NOTICE(E_TIME_EXT, "Initialization");	

#if 0
	/* Set interrupt */
	g_timer1_ovf_interrupt = timer1_ovf_basic;
	g_timer2_ovf_interrupt = timer2_ovf_basic;

	/* Deactivate TIMER1 */
	TIMSK1 = 0x00;
	TCCR1A = 0x00;
	TCCR1B = 0x00;
	TCNT1 = 0x00;
	g_timer1_val = 0;
	g_timer1_cnt = 0;
#endif

	/* Asynchronous mode:
	 *	EXCLK =	0 (we have an oscillator)
	 *	AS2 = 1
	 *	other bits are read only
	 */
	ASSR = _BV(AS2);
	/* We want a 'normal' operation mode */
	TCCR2A = 0x00;
	/* Clock Select: no prescaling */
	TCCR2B = 0x01;
	/* Reset the counter */
	TCNT2 = 0x00;
	/* We want an interrupt when TCNT2 overflows */
	TIMSK2 = _BV(TOIE2);


	g_time.sec = 0;
	g_time.nano = 0;
}


/*
 *	Change the prescaler
 */
inline void time_ext_set_prescaler(uint8_t p)
{
	/* Prevent fools to pass an incorrect value */
	TCCR2B = p & 0x07;
}

/*
 *	Get the prescaler value
 */
inline uint8_t time_ext_get_prescaler(void)
{
	return TCCR2B & 0x07;
}

#if 0
/*
 *	Calibration of main crystal
 */
void time_ext_calib(void)
{
	/*
	 *	Configure TIMER1 and all the stuff
	 *	No prescaler, normal mode, interrupt on OVF
	 */
	TCCR1A = 0x00;
	TCCR1B = 0x00;
	TIMSK1 = _BV(TOIE1);
	TIFR1 = 0xFF;	/* clear flags */

	/* Configure TIMER2 */
	time_ext_set_prescaler(TIMER2_PRESCALER_OFF);

	/* Change the interrupt handlers */
	g_timer1_ovf_interrupt = timer1_ovf_calib;
	g_timer2_ovf_interrupt = timer2_ovf_calib;

	g_frequency = 0;
	g_nano_per_inst = 0;
	g_inst_number = 0;

	g_timer1_cnt = 0;
	g_timer1_val = 0;
	TCNT1 = 0;
	TCNT2 = 0;
	
	/* Launch the prescalers -> timers ON */
	TCCR2B = TIMER2_PRESCALER_1024;
	TCCR1B = 0x01;
}
#endif


/*
 *	Get time.
 *	Since we only update g_time when TCNT2 overflows,
 *	we add the value of TCNT2 to the nano field.
 */
inline uint32_t time_ext_get_s(void)
{
	return g_time.sec;
}

inline uint32_t time_ext_get_ns(void)
{
	uint32_t tmp, tmp1;
	/* Fetch timer1 value */
	//tmp1 = TCNT1;
	
	tmp = ((uint32_t)TCNT2) * NANO_PER_QUARTZ_TICK / time_ext_get_prescaler();
	//tmp += tmp1 * g_nano_per_inst;

	return g_time.nano + tmp;
}

time_ext_t time_ext_get(void)
{
	time_ext_t t;
	t.nano = time_ext_get_ns();
	t.sec = time_ext_get_s();
	if(t.nano >= NANO_PER_S) {
		t.sec++;
		t.nano -= NANO_PER_S;
	}
	return t;
}


/*
 *	Set the time
 *	Resets TCNT2 as well
 */
inline void time_ext_set(uint32_t sec, uint32_t nano)
{
	TCNT2 = 0;
	g_time.nano = nano;
	g_time.sec = sec;
	NOTICE(E_TIME_EXT, "Time set to %ld %ld", sec, nano);
}







