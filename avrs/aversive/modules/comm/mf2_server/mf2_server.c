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
 *  Revision : $Id: mf2_server.c,v 1.3 2007-05-24 13:08:46 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2007 */

#include <stdio.h>

#include <aversive.h>
#include <aversive/wait.h>
#include <timer.h>
#include <mf2_server.h>
#include <mf2_server_config.h>


#define data_Z() do { cbi(DDR(MF2_SERVER_DATA_PORT), MF2_SERVER_DATA_BIT); } while(0)
#define data_0() do { sbi(DDR(MF2_SERVER_DATA_PORT), MF2_SERVER_DATA_BIT); } while(0)
#define read_data() (bit_is_set(PIN(MF2_SERVER_DATA_PORT), MF2_SERVER_DATA_BIT))
#define data_is_Z() (!bit_is_set(DDR(MF2_SERVER_DATA_PORT), MF2_SERVER_DATA_BIT))

#define clk_Z() do { cbi(DDR(MF2_SERVER_CLK_PORT), MF2_SERVER_CLK_BIT); } while(0)
#define clk_0() do { sbi(DDR(MF2_SERVER_CLK_PORT), MF2_SERVER_CLK_BIT); } while(0)
#define read_clk() (bit_is_set(PIN(MF2_SERVER_CLK_PORT), MF2_SERVER_CLK_BIT))
#define clk_is_Z() (!bit_is_set(DDR(MF2_SERVER_CLK_PORT), MF2_SERVER_CLK_BIT))

#define MF2_SERVER_STATE_READY 0
#define MF2_SERVER_STATE_SEND  1
#define MF2_SERVER_STATE_RECV  2

static volatile uint8_t mf2_state=0;

typedef void (event)(char);
static event * tx_event = NULL;
static event * rx_event = NULL;
static volatile uint8_t mf2_step=0;
static volatile uint8_t mf2_parity_cpt=0;
static volatile char mf2_data_send=0;
static volatile char mf2_data_recv=0;


#define WAIT_KBD_CYCLE 600
#define WAIT_KBD_CYCLE4 WAIT_KBD_CYCLE/4


void recv(void)
{
	uint8_t i;
	uint16_t c=0;
	uint16_t d=0;
	data_Z();
	clk_Z();
	if (read_data())
		printf("burp\r\n");
/* 	wait_4cyc(WAIT_KBD_CYCLE4); */
/* 	wait_4cyc(WAIT_KBD_CYCLE4); */
/* 	wait_4cyc(WAIT_KBD_CYCLE4); */
	clk_0();
	wait_4cyc(WAIT_KBD_CYCLE4);
	
	
	for (i=0; i<8 ; i++) {
		if (read_data()) 
			c |= 1 << i;
		clk_Z();
		wait_4cyc(WAIT_KBD_CYCLE4);
		if (read_data()) 
			d |= 1 << i;
		clk_0();
		wait_4cyc(WAIT_KBD_CYCLE4);
	}

	// parite
	clk_Z();
	wait_4cyc(WAIT_KBD_CYCLE4);
	clk_0();
	wait_4cyc(WAIT_KBD_CYCLE4);

	// ack
	clk_Z();
	data_0();
	wait_4cyc(WAIT_KBD_CYCLE4);
	clk_0();
	wait_4cyc(WAIT_KBD_CYCLE4);

	// stop
	clk_Z();
	data_Z();
	wait_4cyc(WAIT_KBD_CYCLE4);
	clk_0();
	wait_4cyc(WAIT_KBD_CYCLE4);
	clk_Z();
	
	printf("%x\r\n", c);
	printf("%x\r\n", d);
	wait_4cyc(2*WAIT_KBD_CYCLE4);
	while(1);
}

static inline int8_t mf2_server_bus_free(void)
{
	return read_clk() && read_data();
}


int8_t mf2_server_ready(void)
{
	return (mf2_state==MF2_SERVER_STATE_READY && mf2_server_bus_free());
}

/* a virer XXX */
void disp(char c);

#if 0
static inline void dump(void)
{
	char c=0;
	if(read_data()) 
		c|=1;
	if(read_clk()) 
		c|=0x10;

	if(data_is_Z()) 
		c|=2;
	if(clk_is_Z()) 
		c|=0x20;

	disp((char)(c));
}
#else
#define dump() do {} while(0)
#endif

void mf2_server_timer_cb(void)
{
/* 	static uint16_t i=0; */
	static uint16_t t;

	/* if it is just polling */
	if (mf2_state == MF2_SERVER_STATE_READY) {
		clk_Z();
		data_Z();

		/* the central server has something to say */
		if (read_clk() && !read_data()) {
			mf2_state = MF2_SERVER_STATE_RECV;
			mf2_step = 1;
			timer1A_register_OC_intr_at_tics(mf2_server_timer_cb, timer1_get()+MF2_SERVER_CLK_HALF_PERIOD);
			//			recv();
			dump();
			return;
		}	
		/* nothing to do if the central server has nothing to say */
		else {
			/* reload timer */
			timer1A_register_OC_intr_at_tics(mf2_server_timer_cb, timer1_get()+MF2_SERVER_READ_POLL_PERIOD);
			return;
		}
	}

	/* an operation is running */

	/* reload timer */
	timer1A_register_OC_intr_at_tics(mf2_server_timer_cb, timer1_get()+MF2_SERVER_CLK_HALF_PERIOD);

	/* XXX we should check if clk is 0 when clk_Z() */
	if (mf2_state == MF2_SERVER_STATE_RECV) {
		switch(mf2_step) {
		case 1:
			mf2_data_recv=0;
			dump();
			clk_0();
			break;
		case 2:
			dump();
			clk_Z();
			break;

		case 3:
		case 5:
		case 7:
		case 9:
		case 11:
		case 13:
		case 15:
		case 17:
			//			t = timer1_get();
			dump();
			clk_0();
			if(read_data())
				mf2_data_recv |= (1 << ( (mf2_step-3)/2 ) );
			break;
		case 4:
		case 6:
		case 8:
		case 10:
		case 12:
		case 14:
		case 16:
		case 18:
/* 			printf("%d\n", 	timer1_get() - t); */
/* 			while(1); */
			dump();
			clk_Z();
			break;

		case 19:
			/* parity */
			dump();
			clk_0();
			break;
		case 20:
			dump();
			clk_Z();
			data_0();
			break;
		case 21:
			dump();
			clk_0();
			break;
		case 22:
			dump();
			clk_Z();
			data_Z();
			break;

		default:
			if (rx_event) {
/* 				c=check_rx_buf(rx_buf); */
				rx_event((char)(mf2_data_recv));
/* 				rx_event((char)(0xED)); */
			}
			mf2_state = MF2_SERVER_STATE_READY; 
			mf2_step = 0;
			timer1A_register_OC_intr_at_tics(mf2_server_timer_cb, timer1_get()+MF2_SERVER_READ_POLL_PERIOD);
			return;
		}
		mf2_step++;
	}
	else {
		switch(mf2_step) {
		case 1:
			data_0();
			break;
		case 2:
			clk_0();
			break;
		case 3:
		case 5:
		case 7:
		case 9:
		case 11:
		case 13:
		case 15:
		case 17:
			if(mf2_data_send & (1<<((mf2_step-3)/2))) {
				data_Z();
				mf2_parity_cpt ++;
			}
			else {
				data_0();
			}
			clk_Z();
			break;
		case 4:
		case 6:
		case 8:
		case 10:
		case 12:
		case 14:
		case 16:
		case 18:
			/* XXX */
			if(!(read_clk())) {
/* 				/\* 			recv(); *\/ */
/* 							printf("Ceci est un test\n"); */
/* 							printf("%d\n", mf2_step); */
/* 							printf("%2.2x\n", mf2_data_send); */
/* 							while(1); */
				mf2_step=0;
				mf2_state = MF2_SERVER_STATE_RECV;
				
			}
			clk_0();
			break;

		case 19:
			if(!(mf2_parity_cpt%2))
				data_Z();
			else
				data_0();
			clk_Z();
			break;
		case 20:
			clk_0();
			break;
		case 21:
			clk_Z();
			data_Z();
			break;
		case 22:
			clk_0();
			break;
		case 23:
			clk_Z();
			break;
		case 24:
		case 25:
			break;
		default:
			mf2_state = MF2_SERVER_STATE_READY;
			mf2_step = 0;
			timer1A_register_OC_intr_at_tics(mf2_server_timer_cb, timer1_get()+MF2_SERVER_READ_POLL_PERIOD);
			return;
		}
		mf2_step++;
	}
}
	


int8_t mf2_server_send(char c)
{
	uint8_t flags;

	IRQ_LOCK(flags);

	if (!mf2_server_ready()) {
		IRQ_UNLOCK(flags);
		//		recv();
		return -1;
	}

	mf2_state = MF2_SERVER_STATE_SEND;
	mf2_step = 1;
	mf2_data_send = c;
	mf2_parity_cpt = 0;
	timer1A_register_OC_intr_at_tics(mf2_server_timer_cb, 
					 timer1_get()+MF2_SERVER_CLK_HALF_PERIOD);
	clk_Z();
	data_Z();
	IRQ_UNLOCK(flags);
	return 0;
}

void mf2_server_init(void)
{
	cbi(MF2_SERVER_DATA_PORT, MF2_SERVER_DATA_BIT);
	cbi(MF2_SERVER_CLK_PORT, MF2_SERVER_CLK_BIT);

	timer1A_register_OC_intr_at_tics(mf2_server_timer_cb, 
					 timer1_get()+MF2_SERVER_READ_POLL_PERIOD);

	/* XXX choose timer */
	clk_Z();
	data_Z();
}

/* This function is used to register another function which will be */
/* executed at each byte transmission. */
void mf2_server_register_tx_event(void (*f)(char))
{
	u08 flags;
	IRQ_LOCK(flags);
	tx_event = f;
	IRQ_UNLOCK(flags);
}

/* This function is used to register another function which will be */
/* executed at each byte reception. */
void mf2_server_register_rx_event(void (*f)(char))
{
	u08 flags;
	IRQ_LOCK(flags);
	rx_event = f;
	IRQ_UNLOCK(flags);
}

