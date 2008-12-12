/*  
 *  Copyright Droids Corporation (2007)
 *  Olivier MATZ <zer0@droids-corp.org>
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
 *  Revision : $Id: main.c,v 1.2 2008-01-08 20:05:05 zer0 Exp $
 *
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <aversive/wait.h>
#include <scheduler.h>
#include <timer.h>
#include <time.h>
#include <uart.h>

/*
 * The TIMER2 is used to randomly interrupt the running program and
 * display the address of the interrupted function on the serial port.
 *
 * The addresses can be parsed using the python program in the same
 * dir:
 *    ./parse_symbols.py compiler_files/main.sym 
 *
 * The stdin of the python script is the list of addresses. Below is
 * its output:
 *
 * 50.88% (145/285) time_wait_ms[00000b5a]
 * 13.33% (038/285) test2[00000130]
 * 11.23% (032/285) time_get_s[0000069e]
 * 8.07% (023/285) main[00000156]
 * 7.37% (021/285) test1[00000122]
 * 4.56% (013/285) scheduler_interrupt[00000dcc]
 * 4.56% (013/285) time_increment[000007e8]
 */


#define PROFILE_TIME 10
volatile int a = 0;

void __attribute__ ((noinline)) dump_reg(uint16_t pc)
{
	static volatile uint8_t cpt = PROFILE_TIME;

	if (cpt == 1) {
		OCR2 = 0x80 + (rand()&0x7F);

		TCCR2 = 2;
		TCNT2 = 0;
	}
	else if (cpt == 0) {
		OCR2 = 0;
		TCCR2 = 4;
		TCNT2 = 0;
		cpt = PROFILE_TIME;
		printf("%.4x\n", pc);
	}
	cpt--;
}


void SIG_OUTPUT_COMPARE2(void) __attribute__ ((signal , naked, __INTR_ATTRS));

void SIG_OUTPUT_COMPARE2(void)
{
	asm volatile("push r1" "\n\t"
		     "push __tmp_reg__" "\n\t"

		     /* save sreg */
		     "in __tmp_reg__,__SREG__" "\n\t"
		     "push __tmp_reg__" "\n\t"
		     "eor r1, r1" "\n\t"
		     
		     /* save used regs (see avr-gcc doc about used regs) */
		     "push r18" "\n\t"
		     "push r19" "\n\t"
		     "push r20" "\n\t"
		     "push r21" "\n\t"
		     "push r22" "\n\t"
		     "push r23" "\n\t"
		     "push r24" "\n\t"
		     "push r25" "\n\t"
		     "push r26" "\n\t"
		     "push r27" "\n\t"
		     "push r30" "\n\t"
		     "push r31" "\n\t"
		     
		     /* load sp in r30/r31 */
		     "in r30, __SP_L__" "\n\t"
		     "in r31, __SP_H__" "\n\t"

		     /* point to saved PC */
		     "subi r30, lo8(-16)" "\n\t"
		     "sbci r31, hi8(-16)" "\n\t"

		     /* load Program Counter into r24-r25 */
		     "ldd r25, Z+0" "\n\t"
		     "ldd r24, Z+1" "\n\t"
	
		     /* call dump_reg, params are in r24-25 */
		     "call dump_reg" "\n\t"

		     /* restore regs */
		     "pop r31" "\n\t"
		     "pop r30" "\n\t"
		     "pop r27" "\n\t"
		     "pop r26" "\n\t"
		     "pop r25" "\n\t"
		     "pop r24" "\n\t"
		     "pop r23" "\n\t"
		     "pop r22" "\n\t"
		     "pop r21" "\n\t"
		     "pop r20" "\n\t"
		     "pop r19" "\n\t"
		     "pop r18" "\n\t"

		     /* sreg */
		     "pop __tmp_reg__" "\n\t"
		     "out __SREG__, __tmp_reg__" "\n\t"
	
		     /* tmp reg */
		     "pop __tmp_reg__" "\n\t"
		     "pop r1" "\n\t"

		     "reti" "\n\t"
		     :
		     :
		     );
}


void __attribute__((noinline)) test1(void)
{
	a=2;
}

void __attribute__((noinline)) test2(void)
{
	a=1;
	a=2;
	a=3;
}

void test_sched(void * dummy)
{
	time_wait_ms(50);
}


int main(void)
{
	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);
	timer_init();
	scheduler_init();
	time_init(200);

	srand(0x1337);
	sei();
	printf("Start profiling during 10 secs\n");

	scheduler_add_periodical_event(test_sched, NULL, 100000L / SCHEDULER_UNIT);

	OCR2 = 0;
	TCNT2 = 0; 
	TCCR2 = 4;
	sbi(TIMSK, OCIE2);

	while(time_get_s() < 10) {
		test1();
		test2();
	};

	TCCR2=0;
	printf("Finished\n");
	while(1);

	return 0;
}
