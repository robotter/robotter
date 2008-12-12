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
 *  Revision : $Id: cirbuf.c,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#include <string.h>

#include <cirbuf.h>


void 
cirbuf_init(struct cirbuf * cbuf, char * buf, cirbuf_uint start, cirbuf_uint maxlen)
{
	cbuf->maxlen = maxlen;
	cbuf->len = 0;
	cbuf->start = start;
	cbuf->end = start;
	cbuf->buf = buf;
}

