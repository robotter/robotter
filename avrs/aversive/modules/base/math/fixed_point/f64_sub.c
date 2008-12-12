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
 *  Revision : $Id: f64_sub.c,v 1.5 2008-05-14 13:27:12 zer0 Exp $
 *
 */

#include <stdio.h>
#include <f64.h>
#include <f64_to_s64.h>
#include <s64_to_f64.h>

f64 f64_sub(f64 a, f64 b)
{
	return s64_to_f64(  f64_to_s64(a) - f64_to_s64(b) );
}
