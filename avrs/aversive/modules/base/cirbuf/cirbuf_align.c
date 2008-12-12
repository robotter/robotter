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
 *  Revision : $Id: cirbuf_align.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <cirbuf.h>

static inline void
__cirbuf_shift_left(struct cirbuf * cbuf)
{
	cirbuf_uint i;
	char tmp = cbuf->buf[cbuf->start];

	for (i=0 ; i<cbuf->len ; i++) {
		cbuf->buf[(cbuf->start+i)%cbuf->maxlen] = 
			cbuf->buf[(cbuf->start+i+1)%cbuf->maxlen];
	}
	cbuf->buf[(cbuf->start-1+cbuf->maxlen)%cbuf->maxlen] = tmp;
	cbuf->start += (cbuf->maxlen - 1);
	cbuf->start %= cbuf->maxlen;
	cbuf->end += (cbuf->maxlen - 1);
	cbuf->end %= cbuf->maxlen;
}

static inline void
__cirbuf_shift_right(struct cirbuf * cbuf)
{
	cirbuf_uint i;
	char tmp = cbuf->buf[cbuf->end];

	for (i=0 ; i<cbuf->len ; i++) {
		cbuf->buf[(cbuf->end+cbuf->maxlen-i)%cbuf->maxlen] = 
			cbuf->buf[(cbuf->end+cbuf->maxlen-i-1)%cbuf->maxlen];
	}
	cbuf->buf[(cbuf->end+1)%cbuf->maxlen] = tmp;
	cbuf->start += 1;
	cbuf->start %= cbuf->maxlen;
	cbuf->end += 1;
	cbuf->end %= cbuf->maxlen;
}

/* XXX we could do a better algorithm here... */
void cirbuf_align_left(struct cirbuf * cbuf)
{
	if (cbuf->start < cbuf->maxlen/2) {
		while (cbuf->start != 0) {
			__cirbuf_shift_left(cbuf);
		}
	}
	else {
		while (cbuf->start != 0) {
			__cirbuf_shift_right(cbuf);
		}
	}
}

/* XXX we could do a better algorithm here... */
void cirbuf_align_right(struct cirbuf * cbuf)
{
	if (cbuf->start >= cbuf->maxlen/2) {
		while (cbuf->end != cbuf->maxlen-1) {
			__cirbuf_shift_left(cbuf);
		}
	}
	else {
		while (cbuf->start != cbuf->maxlen-1) {
			__cirbuf_shift_right(cbuf);
		}
	}
}

