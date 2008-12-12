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
 *  Revision : $Id: main.c,v 1.2 2008-01-08 20:05:04 zer0 Exp $
 *
 *
 */

/* test program for rdline, works on AVR and HOST... but there are a
 * lot of defines... ;) */

#include <stdio.h>
#include <string.h>

//#define DEBUG_SOCKET


#ifdef HOST_VERSION
#include <unistd.h>
#include <stdlib.h>
#include <stdarg.h>
#include <inttypes.h>
#include <termios.h>
#include <ctype.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/un.h>
#endif

#include <aversive/wait.h>
#include <uart.h>
#include "rdline.h"

/* globals */
struct rdline rdl;
char prompt[RDLINE_PROMPT_SIZE];
int cpt=0;


#ifdef DEBUG_SOCKET /* debug... keep it because it is nice */

int s = -1;

void sock_printf(const char * fmt, ...)
{
	va_list ap;
	char buf[BUFSIZ];
	int n;

	va_start(ap, fmt);
	n=vsnprintf(buf, BUFSIZ, fmt, ap);
	if (s>0) write(s, buf, n);
	va_end(ap);
}

void dump_it(struct cirbuf * cbuf)
{
	int i;
	char e;

	sock_printf("sta=%2.2d end=%2.2d len=%2.2d/%2.2d { ", 
		 cbuf->start, cbuf->end,
		 CIRBUF_GET_LEN(cbuf),
		 CIRBUF_GET_MAXLEN(cbuf));

	sock_printf("[ ");
	CIRBUF_FOREACH(cbuf, i, e) {
		sock_printf("%2.2x, ", e&0xFF);
	}
	sock_printf("]\n");
}

#else

void sock_printf(const char * fmt, ...) {}
void dump_it(struct cirbuf * cbuf) {}

#endif /* DEBUG_SOCKET */


#ifdef HOST_VERSION
void
write_char(char c) {
	write(1, &c, 1);
}
#else
void
write_char(char c) {
	uart0_send(c);
}

static void
rx(char c)
{
	int8_t ret;
	ret = rdline_char_in(&rdl, c);
	if (ret == 1) {
		rdline_add_history(&rdl, rdline_get_buffer(&rdl));
		snprintf(prompt, sizeof(prompt), "toto[%d] > ", cpt++);
		rdline_newline(&rdl, prompt);
	}
	else if (ret == -2) {
		rdline_stop(&rdl);
		printf("END\n");
	}
}

#endif


void display_buffer(const char * buf, uint8_t size) 
{
	printf("**** GOT  (%d) >> %s", size, buf);
}

const char * dummy_complete[] = {
	"toto",
	"titi",
	"pouet",
	"coin",
};

#define TEST_COMPLETION 1
//#define TEST_COMPLETION 2
int8_t complete_buffer(const char * buf, uint8_t size, 
		     char * dstbuf, uint8_t dstsize,
		     int * state)
{
	sock_printf("complete -> %d\n", *state);
#if TEST_COMPLETION == 1
	if (*state < (sizeof(dummy_complete)/sizeof(const char *))) {
		/* pourri mais bon c'est temporaire */
		strcpy(dstbuf, dummy_complete[*state]);
		(*state) ++;
		return 1;
	}
	return 0;
#else
	dstbuf[0] = 'x';
	dstbuf[1] = 'y';
	dstbuf[2] = 'z';
	dstbuf[3] = '\0';
	return 2;
#endif
}



int main(void)
{
#ifdef HOST_VERSION
	struct termios oldterm, term;
	char buf[BUFSIZ];
	int n, i;
	int8_t ret;
#endif
#ifdef DEBUG_SOCKET
	struct sockaddr_in sin_ci;


	s = socket(PF_INET, SOCK_STREAM, 0);
	if (s < 0) {
		printf("socket() failed\n");
	}

	memset(&sin_ci, 0, sizeof(sin_ci));
	sin_ci.sin_family = AF_INET;
	sin_ci.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
	sin_ci.sin_port = htons(31337);
#ifndef __linux__
	sin_ci.sin_len = sizeof(sin_ci);
#endif

	if (s > 0 && connect(s, (struct sockaddr *)&sin_ci, sizeof(sin_ci)) < 0) {
		printf("connect() failed\n");
		s = -1;
	}
#endif /* DEBUG_SOCKET */

#ifdef HOST_VERSION
	tcgetattr(0, &oldterm);
	memcpy(&term, &oldterm, sizeof(term));
	term.c_lflag &= ~(ICANON | ECHO | ISIG);
	tcsetattr(0, TCSANOW, &term);
	setbuf(stdin, NULL);
#else
	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);

	wait_ms(5000);
	printf("Start\n");
	uart0_register_rx_event(rx);
	
	sei();
#endif


	/* common init */
	rdline_init(&rdl, write_char, display_buffer, complete_buffer);
	snprintf(prompt, sizeof(prompt), "toto[%d] > ", cpt++);	
	rdline_newline(&rdl, prompt);


	/* loop to send chars on host */
#ifdef HOST_VERSION
	while ((n=read(0, buf, BUFSIZ-1)) > 0) {
		buf[n] = 0;

		for (i=0 ; i<n ; i++) {
			sock_printf("%o ", buf[i]&0xff);
		}
		sock_printf(" RECV\n");
		for (i=0 ; i<n ; i++) {
			ret = rdline_char_in(&rdl, buf[i]);
			if (ret == 1) {
				rdline_add_history(&rdl, rdline_get_buffer(&rdl));
				snprintf(prompt, sizeof(prompt), "toto[%d] > ", cpt++);
				rdline_newline(&rdl, prompt);
			}
			else if (ret == -2) {
				tcsetattr(0, TCSANOW, &oldterm);
				printf("\n");
				return 0;
			}
		}
	}

	tcsetattr(0, TCSANOW, &oldterm);
	printf("\n");

	/* irq driven on avr, see rx() */
#else
	while(1);
#endif

	return 0;
}
