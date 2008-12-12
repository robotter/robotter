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
 *  Revision : $Id: main.c,v 1.6 2007-06-11 10:03:26 zer0 Exp $
 *
 */

#include <aversive.h>
#include <aversive/list.h>

#include <uart.h>

#include <stdio.h>
#include <string.h>

LIST_TYPEDEF(my_list_type, u08, 4);
LIST_TYPEDEF(my_another_list_type, u08, 10);

void dumplist(struct generic_list * l)
{
	u08 i;

	for(i=0 ; i < l->hdr.size ; i++)
		printf( (i != l->hdr.size-1 ? 
				    "|-------" : "|-------|"CR) );

	for(i=0 ; i < l->hdr.size ; i++) {
		if (( i < l->hdr.beg_indice ) && (l->hdr.cur_size > 0)) {
			if (i < (l->hdr.beg_indice 
				    + l->hdr.cur_size)
			    % l->hdr.size) {
				printf("   %.3d  ", l->elt[i]);
					  
			}
			else {
				printf("   XXX  ");
			}
		}
		else if (l->hdr.cur_size > 0){
			if (i < l->hdr.beg_indice + l->hdr.cur_size) {
				printf("   %.3d  ", l->elt[i]);
			}
			else {
				printf("   XXX  ");
			}
		}
		else {
			printf("   XXX  ");
		}
	}
	
	printf("     cur_size=%d"CR,l->hdr.cur_size);

	for(i=0 ; i < l->hdr.size ; i++)
		printf( (i != l->hdr.size-1 ? 
				    "|-------" : "|-------|"CR) );

	for(i=0 ; i < l->hdr.size ; i++)
		{
			if((i == l->hdr.beg_indice) && (l->hdr.cur_size <= 1))
				printf(" beg^end");
			else if(i == l->hdr.beg_indice) 
				printf("  beg^  ");
			else if((l->hdr.cur_size > 1) && 
				   (i == ((l->hdr.beg_indice + l->hdr.cur_size -1)
						% l->hdr.size)))
				printf("  end^  ");
			else
				printf("        ");
			printf( (i != l->hdr.size-1 ? 
				    "" : CR) );
		}	 

	for(i=0 ; i < l->hdr.size ; i++)
		{
			if(i == ((l->hdr.beg_indice + l->hdr.read_cursor)
						% l->hdr.size))
				printf("  cur^  ");
			else
				printf("        ");
			printf( (i != l->hdr.size-1 ? 
				    "" : CR) );
		}	 

}

int main(void)
{
	u08 tmp=0;
	u08 tab1[4]= "0123";
	u08 tab2[4];

#ifndef HOST_VERSION 
/* 	uart_init(); */
/* 	fdevopen((int (*)(char))uart0_send,(int (*)(void))uart0_recv,0); */
#endif
	my_list_type my_list ;
	my_another_list_type another_list ;

	LIST_INIT(my_list, 0);
	LIST_INIT(another_list, 8);

	dumplist((struct generic_list *)&my_list);
	printf(CR CR);
	
	LIST_PUSH_END(my_list, 2);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);

	LIST_PUSH_END(my_list, 3);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);

	LIST_PUSH_START(my_list, 1);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);

	LIST_PUSH_END(my_list, 4);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);

	LIST_PUSH_END(my_list, 5);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);


	LIST_PULL_END(my_list, &tmp);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);


	LIST_READ_START(my_list, &tmp);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_END(my_list, &tmp);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);
	
	LIST_READ_GOTO(my_list, &tmp, 0);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_GOTO(my_list, &tmp, 1);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_GOTO(my_list, &tmp, 2);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_GOTO(my_list, &tmp, 3);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 1);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 1);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 1);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 1);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 2);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 3);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 1);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 2);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, 3);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, -1);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, -2);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_READ_MOVE(my_list, &tmp, -3);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);



	LIST_PULL_END(my_list, &tmp);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_PULL_START(my_list, &tmp);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_PULL_START(my_list, &tmp);
	dumplist((struct generic_list *)&my_list);
	printf("tmp = %d"CR CR CR,tmp);

	LIST_PULL_START(my_list, &tmp);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);
	printf(CR CR);
	

	LIST_ARRAY_PUSH_START(another_list, tab1, 4);
	dumplist((struct generic_list *)&another_list);
	printf(CR CR);

	LIST_ARRAY_PUSH_END(another_list, "abcde", 5);
	dumplist((struct generic_list *)&another_list);
	printf(CR CR);

	LIST_ARRAY_PULL_START(another_list, tab2, 4);
	dumplist((struct generic_list *)&another_list);
	printf(CR CR);

	LIST_ARRAY_PULL_END(another_list, tab2, 2);
	dumplist((struct generic_list *)&another_list);
	printf(CR CR);

	LIST_ALIGN_LEFT(another_list);
	dumplist((struct generic_list *)&another_list);
	printf(CR CR);


	LIST_INIT(my_list,0);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);

	LIST_ARRAY_PUSH_START(my_list, tab1, 3);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);
	
	LIST_ALIGN_LEFT(my_list);
	dumplist((struct generic_list *)&my_list);
	printf(CR CR);


	return 0;
}
