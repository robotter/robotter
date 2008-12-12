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
 *  Revision : $Id: main.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <aversive.h>

#include <cirbuf.h>

#include <stdio.h>
#include <string.h>

#ifdef HOST_VERSION
#include <assert.h>
#else
#define assert(cond) do { if (!cond) { printf("%s:%d - %s", __FILE__, __LINE__, #cond); while(1); } } while(0)
#endif

void dump_it(struct cirbuf * cbuf)
{
	int i;
	char e;
	
	printf("sta=%2.2d end=%2.2d len=%2.2d/%2.2d { ", 
	       cbuf->start, cbuf->end,
	       CIRBUF_GET_LEN(cbuf),
	       CIRBUF_GET_MAXLEN(cbuf));

	for (i=0; i<CIRBUF_GET_MAXLEN(cbuf) ; i++) {
		if (cbuf->start <= cbuf->end) {
			if (i >= cbuf->start && 
			    i <= cbuf->end && 
			    CIRBUF_GET_LEN(cbuf) != 0)
				printf("%2.2x, ", cbuf->buf[i]&0xFF);
			else
				printf("XX, ");
		}
		else {
			if (i < cbuf->start && 
			    i > cbuf->end)
				printf("XX, ");
			else
				printf("%2.2x, ", cbuf->buf[i]&0xFF);
		}
	}
	printf("}  -> ");

	printf("[ ");
	CIRBUF_FOREACH(cbuf, i, e) {
		printf("%2.2x, ", e&0xFF);
	}
	printf("]\n");

	if(CIRBUF_GET_LEN(cbuf) == 0) {
		assert(cbuf->start == cbuf->end);
	}
	else {
		assert( ((cbuf->end - cbuf->start + 1) + cbuf->maxlen) % cbuf->maxlen == 
			CIRBUF_GET_LEN(cbuf) % cbuf->maxlen );
	}

}

int main(void)
{
	uint8_t i;
	struct cirbuf my_fifo;
	char fifo_buf[16];
	
	char buf1[] = { 0x10, 0x11, 0x12 };
	char buf2[] = { 0x20, 0x21, 0x22, 0x23 };

	char tmp_buf[16];
	char ref_buf[] = { 0x20, 0x21, 0x22, 0x23, 0x01, 0x10, 0x11, 0x12 };

	/* Test 1 */

	printf("Test 1\n");
	
	cirbuf_init(&my_fifo, fifo_buf, 0, 4);
	assert(CIRBUF_IS_EMPTY(&my_fifo));
	assert(!CIRBUF_IS_FULL(&my_fifo));
	dump_it(&my_fifo);

	cirbuf_add_tail(&my_fifo, 1);
	assert(cirbuf_get_head(&my_fifo) == 1);
	assert(cirbuf_get_tail(&my_fifo) == 1);
	dump_it(&my_fifo);


	cirbuf_add_tail(&my_fifo, 2);
	assert(!CIRBUF_IS_EMPTY(&my_fifo));
	assert(!CIRBUF_IS_FULL(&my_fifo));
	dump_it(&my_fifo);

	cirbuf_add_tail(&my_fifo, 3);
	assert(cirbuf_get_head(&my_fifo) == 1);
	assert(cirbuf_get_tail(&my_fifo) == 3);
	dump_it(&my_fifo);

	cirbuf_add_tail(&my_fifo, 4);
	assert(!CIRBUF_IS_EMPTY(&my_fifo));
	assert(CIRBUF_IS_FULL(&my_fifo));
	dump_it(&my_fifo);

	cirbuf_del_tail(&my_fifo);
	dump_it(&my_fifo);
	assert(cirbuf_get_tail(&my_fifo) == 3);
	assert(cirbuf_get_head(&my_fifo) == 1);

	cirbuf_del_head(&my_fifo);
	assert(cirbuf_get_tail(&my_fifo) == 3);
	assert(cirbuf_get_head(&my_fifo) == 2);
	dump_it(&my_fifo);
	
	cirbuf_del_head(&my_fifo);
	assert(cirbuf_get_tail(&my_fifo) == 3);
	assert(cirbuf_get_head(&my_fifo) == 3);
	dump_it(&my_fifo);
	
	cirbuf_del_head(&my_fifo);
	assert(CIRBUF_IS_EMPTY(&my_fifo));
	dump_it(&my_fifo);
	

	/* Test 2 */
	
	printf("Test 2\n");

	cirbuf_init(&my_fifo, fifo_buf, 2, 4);
	dump_it(&my_fifo);

	cirbuf_add_head(&my_fifo, 4);
	assert(cirbuf_get_head(&my_fifo) == 4);
	assert(cirbuf_get_tail(&my_fifo) == 4);
	dump_it(&my_fifo);


	cirbuf_add_head(&my_fifo, 3);
	assert(!CIRBUF_IS_EMPTY(&my_fifo));
	assert(!CIRBUF_IS_FULL(&my_fifo));
	dump_it(&my_fifo);

	cirbuf_add_head(&my_fifo, 2);
	assert(cirbuf_get_head(&my_fifo) == 2);
	assert(cirbuf_get_tail(&my_fifo) == 4);
	dump_it(&my_fifo);

	cirbuf_add_head(&my_fifo, 1);
	assert(!CIRBUF_IS_EMPTY(&my_fifo));
	assert(CIRBUF_IS_FULL(&my_fifo));
	dump_it(&my_fifo);


	/* Test 3 */
	
	printf("Test 3\n");

	for (i=0 ; i<16; i++) {
		cirbuf_init(&my_fifo, fifo_buf, i, 16);
		dump_it(&my_fifo);
		cirbuf_add_buf_head(&my_fifo, buf1, sizeof(buf1));
		dump_it(&my_fifo);
		cirbuf_add_head(&my_fifo, 1);
		dump_it(&my_fifo);
		cirbuf_add_buf_head(&my_fifo, buf2, sizeof(buf2));
		dump_it(&my_fifo);
		cirbuf_get_buf_head(&my_fifo, tmp_buf, sizeof(tmp_buf));
		assert(memcmp(tmp_buf, ref_buf, sizeof(ref_buf)) == 0);
	}

	/* Test 4 */
	
	printf("Test 4\n");

	for (i=0 ; i<16; i++) {
		cirbuf_init(&my_fifo, fifo_buf, i, 16);
		dump_it(&my_fifo);
		cirbuf_add_buf_tail(&my_fifo, buf2, sizeof(buf2));
		dump_it(&my_fifo);
		cirbuf_add_tail(&my_fifo, 1);
		dump_it(&my_fifo);
		cirbuf_add_buf_tail(&my_fifo, buf1, sizeof(buf1));
		dump_it(&my_fifo);
		cirbuf_get_buf_tail(&my_fifo, tmp_buf, sizeof(tmp_buf));
		assert(memcmp(tmp_buf, ref_buf, sizeof(ref_buf)) == 0);
	}

	/* Test 5 */

	printf("Test 5\n");

	cirbuf_init(&my_fifo, fifo_buf, 10, 16);
	dump_it(&my_fifo);
	i=0;
	while (cirbuf_add_tail_safe(&my_fifo, i) == 0)
		i++;
	dump_it(&my_fifo);
	cirbuf_del_buf_tail(&my_fifo, 10);
	dump_it(&my_fifo);
	assert(CIRBUF_GET_LEN(&my_fifo)==6);
	assert(cirbuf_del_buf_tail(&my_fifo, 10) != 0);
	assert(cirbuf_get_tail(&my_fifo) == 5);
	assert(cirbuf_get_head(&my_fifo) == 0);
	


	return 0;
}
