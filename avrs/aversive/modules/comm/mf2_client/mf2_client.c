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
 *  Revision : $Id: mf2_client.c,v 1.3 2007-05-24 13:08:46 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2006 */

#include <stdio.h>

#include <aversive.h>
#include <mf2_client.h>
#include <mf2_client_config.h>

#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
#include <scheduler.h>
#else
#include <aversive/wait.h>
#endif

#define WATCHDOG_TIMEOUT 10000

#define MF2_CLIENT_STATE_IDLE 0
#define MF2_CLIENT_STATE_RECV 1
#define MF2_CLIENT_STATE_XMIT 2
#define MF2_CLIENT_STATE_ACK  3

#define data_Z() cbi(DDR(MF2_CLIENT_DATA_PORT), MF2_CLIENT_DATA_BIT)
#define data_0() sbi(DDR(MF2_CLIENT_DATA_PORT), MF2_CLIENT_DATA_BIT)
#define clk_Z()  cbi(DDR(MF2_CLIENT_CLK_PORT), MF2_CLIENT_CLK_BIT)
#define clk_0()  sbi(DDR(MF2_CLIENT_CLK_PORT), MF2_CLIENT_CLK_BIT)

/* XXX s08 -> int8_t */

static volatile u08 state=MF2_CLIENT_STATE_IDLE;
static volatile u08 current_bitnum;
static volatile u16 rx_buf;
static volatile u16 tx_buf;
static volatile u08 tx_c;
#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
static volatile s08 sched_event = -1;
#endif

typedef void (event)(char);

static event * tx_event = NULL;
static event * rx_event = NULL;

static s16 check_rx_buf(u16 buf);

#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
static void watchdog_timeout(void * dummy);
#endif

static void disable_intr(void);
static void set_falling_edge(void);

#define START_BIT  0x0001
#define PARITY_BIT 0x0200
#define STOP_BIT   0x0400

SIGNAL(MF2_CLIENT_INTERRUPT)
{
	s16 c;


	switch(state) {
	case MF2_CLIENT_STATE_IDLE:
		rx_buf=0;
		state=MF2_CLIENT_STATE_RECV;
		current_bitnum=1;
#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
		sched_event = scheduler_add_single_event(watchdog_timeout,
                       NULL, WATCHDOG_TIMEOUT/SCHEDULER_UNIT);
#endif
		break;
		
	case MF2_CLIENT_STATE_RECV:
		if(PIN(MF2_CLIENT_DATA_PORT) & (1<<MF2_CLIENT_DATA_BIT))
			rx_buf |= (1 << current_bitnum);
		
		if (current_bitnum==10) {
			disable_intr();
			clk_0();
			if (rx_event) {
				c=check_rx_buf(rx_buf);
				if( c >= 0 ) {
					rx_event((char)(c));
				}
			}
			current_bitnum=0;	
#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
			if (sched_event != -1) {
				scheduler_del_event(sched_event);
				sched_event = -1;
			}
#endif
			data_Z();
			clk_Z();
			set_falling_edge();
			state=MF2_CLIENT_STATE_IDLE;
		}
		else {
			current_bitnum++;
		}
		break;
		
	case MF2_CLIENT_STATE_XMIT:
		if (current_bitnum < 10) {
			if (tx_buf & (1<<current_bitnum))
				data_Z();
			else
				data_0();
			current_bitnum ++;
		}
		else {
			data_Z();
			current_bitnum=0;
			state=MF2_CLIENT_STATE_ACK;
		}
		break;
		
	case MF2_CLIENT_STATE_ACK:
		/* 		if(PIN(MF2_CLIENT_DATA_PORT) & (1<<MF2_CLIENT_DATA_BIT)) */
		/* 			XXX error; */
		/* 		else */
		if (tx_event) {
			tx_event((char)(tx_c));
		}
		state=MF2_CLIENT_STATE_IDLE;
#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
		if (sched_event != -1) {
			scheduler_del_event(sched_event);
			sched_event = -1;
		}
#endif
		break;
		
	default:
		break;
	}
}

static void set_falling_edge(void)
{
	/* disable intr */
	cbi(MF2_CLIENT_IMASK, MF2_CLIENT_IMASK_BIT);

	/* intr on falling edge */
	cbi(MF2_CLIENT_INT_REG, MF2_CLIENT_INT_BIT0);
	sbi(MF2_CLIENT_INT_REG, MF2_CLIENT_INT_BIT1);

	/* reset flag */
	sbi(MF2_CLIENT_IFLAG, MF2_CLIENT_IMASK_BIT);

	/* enable intr */
	sbi(MF2_CLIENT_IMASK, MF2_CLIENT_IMASK_BIT);

}

static void disable_intr(void)
{
	/* disable intr */
	cbi(MF2_CLIENT_IMASK, MF2_CLIENT_IMASK_BIT);
}


void mf2_client_init(void)
{
	u08 flags;

	IRQ_LOCK(flags);
	/* 	ports are inputs, and values are 0 */
	data_Z();
	clk_Z();
	cbi(MF2_CLIENT_DATA_PORT, MF2_CLIENT_DATA_BIT);
	cbi(MF2_CLIENT_CLK_PORT, MF2_CLIENT_CLK_BIT);
	
	set_falling_edge();

	state = MF2_CLIENT_STATE_IDLE;
	current_bitnum = 0;
	IRQ_UNLOCK(flags);
}

static s16 check_rx_buf(u16 buf)
{
	u16 mask, cpt=0;

	/* start bit should be 0 */
	if(buf & START_BIT)
		return -1;

	/* stop bit should be 1 */
	if(! (buf & STOP_BIT))
		return -2;

	for (mask = START_BIT ; mask != STOP_BIT; mask<<=1 ) {
		if (buf & mask)
			cpt++;
	}
	
	/* bad parity */
	if (!(cpt % 2))
		return -3;
	
	return (buf>>1) & 0xFF;
}


s08 mf2_client_ready(void)
{
	return state==MF2_CLIENT_STATE_IDLE;
}

#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
static void watchdog_timeout(void * dummy)
{
	printf("TIMEOUT\n");
	current_bitnum=0;	
	state=MF2_CLIENT_STATE_IDLE;
	data_Z();
	clk_Z();
	set_falling_edge();
}
#endif

static void start_sending(void * dummy)
{
	/* set clk to Z and data to 0 */
	clk_Z();
	data_0();
	set_falling_edge();
#ifdef CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
	sched_event = scheduler_add_single_event(watchdog_timeout, 
							   NULL, WATCHDOG_TIMEOUT/SCHEDULER_UNIT);
#endif
}

s08 mf2_client_send(char c)
{
	u16 mask, cpt=0;
	u08 flags;
	
	IRQ_LOCK(flags);

	/* we don't preempt the remote device, even if the
	   protocol allow it */
	if (!mf2_client_ready()) {
		IRQ_UNLOCK(flags);
		return -1;
	}

	state=MF2_CLIENT_STATE_XMIT;
	current_bitnum = 1;
	
	disable_intr();

	/* set clk to 0 */
	clk_0();

	IRQ_UNLOCK(flags);

	tx_buf = c;
	tx_c = c;
	tx_buf <<= 1;
	tx_buf |= STOP_BIT;

	for (mask = START_BIT ; mask != STOP_BIT; mask<<=1 ) {
		if (tx_buf & mask)
			cpt++;
	}

	if (!(cpt % 2))
		tx_buf |= PARITY_BIT;

#if CONFIG_MODULE_MF2_CLIENT_USE_SCHEDULER
	scheduler_add_single_event(start_sending, NULL, 1000L/SCHEDULER_UNIT);
#else
	wait_ms(1);
	start_sending(NULL);
#endif

	return 0;
}

/* This function is used to register another function which will be */
/* executed at each byte transmission. */
void mf2_client_register_tx_event(void (*f)(char))
{
	u08 flags;
	IRQ_LOCK(flags);
	tx_event = f;
	IRQ_UNLOCK(flags);
}

/* This function is used to register another function which will be */
/* executed at each byte reception. */
void mf2_client_register_rx_event(void (*f)(char))
{
	u08 flags;
	IRQ_LOCK(flags);
	rx_event = f;
	IRQ_UNLOCK(flags);
}

