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
 *  Revision : $Id: cirbuf_get_buf_tail.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <cirbuf.h>

/* convert to buffer */


cirbuf_int
cirbuf_get_buf_tail(struct cirbuf * cbuf, char * c, cirbuf_uint size)
{
	cirbuf_uint n = (size < CIRBUF_GET_LEN(cbuf)) ? size : CIRBUF_GET_LEN(cbuf);

	if (!n)
		return 0;

	if (cbuf->start <= cbuf->end) {
		dprintf("s[%d] -> d[%d] (%d)\n", cbuf->end - n + 1, 0, n);
		memcpy(c, cbuf->buf + cbuf->end - n + 1, n);
	}
	else {
		dprintf("s[%d] -> d[%d] (%d)\n", 0,  cbuf->maxlen - cbuf->start, cbuf->end + 1);
		dprintf("s[%d] -> d[%d] (%d)\n", cbuf->maxlen - n + cbuf->end + 1, 0, n - cbuf->end - 1);

		memcpy(c + cbuf->maxlen - cbuf->start, cbuf->buf, cbuf->end + 1);
		memcpy(c, cbuf->buf + cbuf->maxlen - n + cbuf->end +1, n - cbuf->end - 1);
	}
	return n;
}

