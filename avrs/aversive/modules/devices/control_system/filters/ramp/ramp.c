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
 *
 */


#include <aversive.h>
#include "ramp.h"


/* Initialize the two first fields to the max possible value and previous out to 0*/

void ramp_init(struct ramp_filter * r)
{
  uint8_t flags;
  IRQ_LOCK(flags);
  
  r->var_neg=0xFFFFFFFF;
  r->var_pos=0xFFFFFFFF;
  r->prev_out=0;
  
  IRQ_UNLOCK(flags);
  return;
}

/*Set the field var_neg to neg and var_pos to pos */

void ramp_set_vars(struct ramp_filter * r, uint32_t neg, uint32_t pos)
{
  uint8_t flags;
  IRQ_LOCK(flags);
  
  r->var_neg=neg;
  r->var_pos=pos;
  
  IRQ_UNLOCK(flags);
  return;
}

/*Filter the in value using the ramp_filter r*/
int32_t ramp_do_filter(void * data, int32_t in)
{
  uint32_t variation;
  struct ramp_filter * r = (struct ramp_filter *) data;

  if (in>r->prev_out)                           /*test if the variation is positive or negative */
    {
      variation=in-r->prev_out;                 /* positive variation */
      if (variation<r->var_pos)                 /* test if the variation is too high */
	r->prev_out=in;                         /* variation ok return value will be in */
      else
	r->prev_out=r->prev_out+r->var_pos;     /* variation too high so return value is filtered */
    }
  else
    {
      variation=r->prev_out-in;                 /* negative variation */
      if (variation<r->var_neg)                 /* test if the variation is too high */
	        r->prev_out=in;                 /* variation ok return value will be in */
      else
            r->prev_out=r->prev_out-r->var_neg; /* variation too high so return value is filtered */
    }
  return(r->prev_out);
}


