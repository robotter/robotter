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
 *  Revision : $Id: cirbuf_add_buf_head.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <cirbuf.h>


/* multiple add */

cirbuf_int
cirbuf_add_buf_head(struct cirbuf * cbuf, const char * c, cirbuf_uint n)
{
	cirbuf_uint e;

	if (!n || n > CIRBUF_GET_FREELEN(cbuf))
		return -EINVAL;

	e = CIRBUF_IS_EMPTY(cbuf) ? 1 : 0;
	
	if (n < cbuf->start + e) {
		dprintf("s[%d] -> d[%d] (%d)\n", 0, cbuf->start - n + e, n);
		memcpy(cbuf->buf + cbuf->start - n + e, c, n);
	}
	else {
		dprintf("s[%d] -> d[%d] (%d)\n", + n - (cbuf->start + e), 0, cbuf->start + e);
		dprintf("s[%d] -> d[%d] (%d)\n", cbuf->maxlen - n + (cbuf->start + e), 0, n - (cbuf->start + e));
		memcpy(cbuf->buf, c  + n - (cbuf->start + e) , cbuf->start + e);
		memcpy(cbuf->buf + cbuf->maxlen - n + (cbuf->start + e), c, n - (cbuf->start + e));
	}
	cbuf->len += n;
	cbuf->start += (cbuf->maxlen - n + e);
	cbuf->start %= cbuf->maxlen;
	return n;
}

