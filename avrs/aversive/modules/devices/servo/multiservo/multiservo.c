/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2006)
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
 *  Revision : $Id: multiservo.c,v 1.8 2008-04-13 16:55:31 zer0 Exp $
 *
 */

#include <string.h>

#include <aversive.h>
#include <aversive/error.h>
#include <multiservo.h>
#include <multiservo_archs.h>

struct multiservo g_multiservo;

//#define MULTISERVO_ENABLE_DEBUG

#ifdef MULTISERVO_ENABLE_DEBUG
#define MULTISERVO_DEBUG(args...) DEBUG(args)
#else
#define MULTISERVO_DEBUG(args...) do { } while(0)
#endif

/* value of timer for 1 ms */
#define TIME_1MS (CONFIG_QUARTZ/((1000UL)*MULTISERVO_TIMER_PRESCALER))
#define TIME_1_5MS ((TIME_1MS*3)/2)

/* for timers 8 bits, check that 2ms value (max) is < 256 */
#if (MULTISERVO_TIMER == 0 || MULTISERVO_TIMER == 2) && ((TIME_1MS*2) >= 256L)
#error "Bad PRESCALER, you should increase it in multiservo_config.h"
#endif

/* for timers 16 bits, check that 2ms value (max) is < 65536 */
#if (MULTISERVO_TIMER == 1 || MULTISERVO_TIMER == 3) && ((TIME_1MS*2) >= 65536L)
#error "Bad PRESCALER, you should increase it in multiservo_config.h"
#endif



SIGNAL(MULTISERVO_SIG_OUTPUT_COMPARE) /* other ints NOT allowed */
{
	volatile uint8_t * port ;

	if (g_multiservo.time_sum > TIME_1MS * 20) {
		MULTISERVO_DEBUG(E_MULTISERVO, "end, restart");
		g_multiservo.time_sum = 0;
		g_multiservo.current_multiservo = 0;
	}

	/* reset pin */
	if (g_multiservo.id_prev != -1) {
		port = g_multiservo.elts[g_multiservo.id_prev].port;
		if(port) {
			MULTISERVO_DEBUG(E_MULTISERVO, "reset %d",g_multiservo.id_prev);
			cbi(*port, g_multiservo.elts[g_multiservo.id_prev].bitnum);
		}
	}

	/* set pin */
	while (g_multiservo.current_multiservo < MULTISERVO_NB_MAX) {
		port = g_multiservo.elts[g_multiservo.current_multiservo].port;
		if(port) {
			MULTISERVO_DEBUG(E_MULTISERVO, "set %d %d", 
					 g_multiservo.current_multiservo, 
					 g_multiservo.elts[g_multiservo.current_multiservo].value);
			sbi(*port, g_multiservo.elts[g_multiservo.current_multiservo].bitnum);
			g_multiservo.id_prev = g_multiservo.current_multiservo;
			MULTISERVO_OCR = g_multiservo.elts[g_multiservo.current_multiservo].value;
			g_multiservo.time_sum += g_multiservo.elts[g_multiservo.current_multiservo].value;
			break;
		}
		g_multiservo.current_multiservo ++;
	}

	/* wait until 20ms is reached */
	if (g_multiservo.current_multiservo >= MULTISERVO_NB_MAX) {
		g_multiservo.id_prev = -1;
		MULTISERVO_DEBUG(E_MULTISERVO, "wait 1ms %d (%ld)", g_multiservo.current_multiservo, TIME_1MS);
		MULTISERVO_OCR = TIME_1MS;
		g_multiservo.time_sum += TIME_1MS;
	}
	else {
		g_multiservo.current_multiservo ++;
	}
}



void multiservo_init(void)
{
	uint8_t flags;

	IRQ_LOCK(flags);

	cbi(MULTISERVO_TIMSK, MULTISERVO_OCIE);
	
	memset(&g_multiservo, 0, sizeof(g_multiservo));
	g_multiservo.id_prev = -1;

	/* Timer config (see in multiservo_archs.h) */
	MULTISERVO_TCCRnA = MULTISERVO_TCCRnA_VALUE;
#ifdef MULTISERVO_TCCRnB
	MULTISERVO_TCCRnB = MULTISERVO_TCCRnB_VALUE;
#endif

	MULTISERVO_OCR = TIME_1MS;
	sbi(MULTISERVO_TIMSK, MULTISERVO_OCIE);
	IRQ_UNLOCK(flags);
}


int8_t multiservo_add(volatile uint8_t * port, uint8_t bitnum)
{
	uint8_t i;
	uint8_t flags;

	IRQ_LOCK(flags);
	/* find a place and add it */
	for ( i=0 ; i< MULTISERVO_NB_MAX ; i++ ) {
		if(! g_multiservo.elts[i].port) {
			g_multiservo.elts[i].port = port;
			g_multiservo.elts[i].bitnum = bitnum;
			g_multiservo.elts[i].value = TIME_1_5MS; /* dummy (center multiservo) */
			sbi(DDR(*port), bitnum); /* DDR */
			break;
		}
	}
	IRQ_UNLOCK(flags);

	/* if found, return id, else -1 */
	if(i == MULTISERVO_NB_MAX)
		return -1;

	return i;
}




void multiservo_del(int8_t id)
{
	uint8_t flags;

	IRQ_LOCK(flags);
	cbi(DDR(*g_multiservo.elts[id].port), g_multiservo.elts[id].bitnum); /* DDR */
	memset(&g_multiservo.elts[id], 0, sizeof(struct multiservo_element));
	IRQ_UNLOCK(flags);
}


/**
 * Set multiservo angle. Specify value in us.
 * WARNING : should be (much) bigger than 0 
 */
void multiservo_set(int8_t id, uint16_t val_us)
{
	uint16_t val_timer;
	uint8_t flags;

	val_timer = (((uint32_t)val_us)*TIME_1MS)/1000;
	IRQ_LOCK(flags);
	/* XXX convert us to counter unit */
	g_multiservo.elts[id].value = val_timer;
	IRQ_UNLOCK(flags);
}

