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
 *  Revision : $Id: cirbuf_add_tail.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <cirbuf.h>


/* add at tail */


static inline void 
__cirbuf_add_tail(struct cirbuf * cbuf, char c)
{
	if (!CIRBUF_IS_EMPTY(cbuf)) {
		cbuf->end ++;
		cbuf->end %= cbuf->maxlen;
	}
	cbuf->buf[cbuf->end] = c;
	cbuf->len ++;
}

cirbuf_int 
cirbuf_add_tail_safe(struct cirbuf * cbuf, char c)
{
	if (cbuf && !CIRBUF_IS_FULL(cbuf)) {
		__cirbuf_add_tail(cbuf, c);	
		return 0;
	}
	return -EINVAL;
}

void
cirbuf_add_tail(struct cirbuf * cbuf, char c)
{
	__cirbuf_add_tail(cbuf, c);	
}


