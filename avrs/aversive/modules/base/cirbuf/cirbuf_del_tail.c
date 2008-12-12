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
 *  Revision : $Id: cirbuf_del_tail.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <cirbuf.h>


/* del at tail */

static inline void
__cirbuf_del_tail(struct cirbuf * cbuf)
{
	cbuf->len --;
	if (!CIRBUF_IS_EMPTY(cbuf)) {
		cbuf->end  += (cbuf->maxlen - 1);
		cbuf->end %= cbuf->maxlen;
	}
}

cirbuf_int
cirbuf_del_tail_safe(struct cirbuf * cbuf)
{
	if (cbuf && !CIRBUF_IS_EMPTY(cbuf)) {
		__cirbuf_del_tail(cbuf);
		return 0;
	}
	return -EINVAL;
}

void
cirbuf_del_tail(struct cirbuf * cbuf)
{
	__cirbuf_del_tail(cbuf);
}


