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
 *  Revision : $Id: cirbuf_add_buf_tail.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <cirbuf.h>


/* multiple add */

cirbuf_int
cirbuf_add_buf_tail(struct cirbuf * cbuf, const char * c, cirbuf_uint n)
{
	cirbuf_uint e;

	if (!n || n > CIRBUF_GET_FREELEN(cbuf))
		return -EINVAL;

	e = CIRBUF_IS_EMPTY(cbuf) ? 1 : 0;
	
	if (n < cbuf->maxlen - cbuf->end - 1 + e) {
		dprintf("s[%d] -> d[%d] (%d)\n", 0, cbuf->end + !e, n);
		memcpy(cbuf->buf + cbuf->end + !e, c, n);
	}
	else {
		dprintf("s[%d] -> d[%d] (%d)\n", cbuf->end + !e, 0, cbuf->maxlen - cbuf->end - 1 + e);
		dprintf("s[%d] -> d[%d] (%d)\n", cbuf->maxlen - cbuf->end - 1 + e, 0, n - cbuf->maxlen + cbuf->end + 1 - e);
		memcpy(cbuf->buf + cbuf->end + !e, c, cbuf->maxlen - cbuf->end - 1 + e);
		memcpy(cbuf->buf, c + cbuf->maxlen - cbuf->end - 1 + e, n - cbuf->maxlen + cbuf->end + 1 - e);
	}
	cbuf->len += n;
	cbuf->end += n - e;
	cbuf->end %= cbuf->maxlen;
	return n;
}

