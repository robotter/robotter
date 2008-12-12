/*
 *  Copyright Droids Corporation (2007)
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
 */


#include <stdio.h>
#include <string.h>
#include <math.h>

#include <aversive/pgmspace.h>
#include <aversive/error.h>
#include <aversive/wait.h>

#include <rdline.h>
#include <parse.h>

struct rdline rdl;
char prompt[RDLINE_PROMPT_SIZE];
extern parse_pgm_ctx_t main_ctx[];
extern void cmd_event_parsed(void * parsed_result, void * data);

#include <stdlib.h>
#include <stdarg.h>
#include <inttypes.h>
#include <ctype.h>

#ifdef HOST_VERSION
#include <unistd.h>
#include <termios.h>

/* for rdline */
void
write_char(char c) {
	write(1, &c, 1);
}

#else
#include <uart.h>

void
write_char(char c) {
	uart0_send(c);
}
#endif

void 
valid_buffer(const char * buf, uint8_t size) 
{
	int8_t ret;
	ret = parse(main_ctx, buf);
	if (ret == PARSE_AMBIGUOUS)
		printf_P(PSTR("Ambiguous command\n"));
	else if (ret == PARSE_NOMATCH)
		printf_P(PSTR("Command not found\n"));
	else if (ret == PARSE_BAD_ARGS)
		printf_P(PSTR("Bad arguments\n"));
}

int8_t 
complete_buffer(const char * buf, char * dstbuf, uint8_t dstsize,
		int16_t * state)
{
	return complete(main_ctx, buf, state, dstbuf, dstsize);
}


/*** main */

int main(void) 
{
#ifdef HOST_VERSION
	struct termios oldterm, term;
	int n;
#endif
	int8_t ret;
	char c;

#ifdef HOST_VERSION
	tcgetattr(0, &oldterm);
	memcpy(&term, &oldterm, sizeof(term));
	term.c_lflag &= ~(ICANON | ECHO | ISIG);
	tcsetattr(0, TCSANOW, &term);
	setbuf(stdin, NULL);
#else
	fdevopen(uart0_dev_send, uart0_dev_recv);
	uart_init();
	sei();
#endif

	printf_P(PSTR("Start\n"));
	wait_ms(500);

	rdline_init(&rdl, write_char, valid_buffer, complete_buffer);
	snprintf(prompt, sizeof(prompt), "main > ");	

	rdline_newline(&rdl, prompt);

	c = -1;
	while (1) {
#ifdef HOST_VERSION
		n=read(0, &c, 1);
		if (n<=0)
			break;
#else
		c=uart0_recv();
#endif
		
		ret = rdline_char_in(&rdl, c);
		if (ret == -2) 
			break;

		if (ret != 2 && ret != 0) {
			rdline_add_history(&rdl, rdline_get_buffer(&rdl));
			rdline_newline(&rdl, prompt);
		}
	}

#ifdef HOST_VERSION
	tcsetattr(0, TCSANOW, &oldterm);
#endif
	printf("\n");

	return 0;
}


