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
 *  Revision : $Id: main.c,v 1.4 2007-05-24 13:08:47 zer0 Exp $
 *
 */

#include <aversive.h>
#include <quadramp.h>

#include <stdio.h>

int main(void)
{
    struct quadramp_filter q;

    int32_t in=0, out=0, prev_out=0;
    int32_t i=0;

    quadramp_init(&q);

    for (i=0 ; i<4000 ; i++) {
        switch(i) {

        case 0:
            quadramp_set_1st_order_vars(&q, 50, 100);
            quadramp_set_2nd_order_vars(&q, 1, 2);
            in = 10000;
            break;

        case 600:
            in = 9000;
            break;

        case 630:
            in = 10000;
            break;

        case 1000:
            in = -5000;
            break;

        case 1500:
            in = -4000;
            break;

        case 2000:
            quadramp_set_1st_order_vars(&q, 10, 10);
            quadramp_set_2nd_order_vars(&q, 2, 2);
            in = 10000;
            break;
            
        case 3000:
            quadramp_set_1st_order_vars(&q, 100, 100);
            break;
            

        default:
            break;
        }

        out = quadramp_do_filter(&q, in);
        printf("%" SCNu32 " %" SCNu32 " %" SCNu32 " %" SCNu32 "\n", i, in, out, out-prev_out);

        prev_out = out;
    }

    return 0;
}
