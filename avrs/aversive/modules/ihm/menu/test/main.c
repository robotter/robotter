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
 *  Revision : $Id: main.c,v 1.4 2007-05-24 13:08:49 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2006
 * Test program for a menu
 */

#include <stdio.h>
#include <stdlib.h>

#include <aversive/wait.h>
#include <uart.h>
#include <menu.h>

int myparam=0;

void f(void * data)
{
	printf("POUET\n");
}

struct menu my_menu[] = {
    MENU_ROOT("racine"),
      MENU_FCT("a", f, &myparam),
      MENU_START("sub1"),
        MENU_FCT("b", f, &myparam),
        MENU_FCT("c", f, &myparam),
        MENU_FCT("d", f, &myparam),
      MENU_END(),
      MENU_START("sub2"),
        MENU_FCT("e", f, &myparam),
      MENU_END(),
      MENU_FCT("f", f, &myparam),
    MENU_END(),
};



int main(void)
{
    struct menu *m = my_menu;
    char c;

#ifndef HOST_VERSION
    uart_init();  
    fdevopen(uart0_dev_send, uart0_dev_recv);
    sei();
#endif

    /* tests */
    printf("Root is %s\n", menu_get_name(m));
    m = menu_down(m);
    printf("1st son of root is %s\n", menu_get_name(m));
    m = menu_right(m);
    printf("The submenu is %s\n", menu_get_name(m));

    
    m = menu_get_first_son(m);
    printf("1st son is %s\n", menu_get_name(m));
    m = menu_right(m);
    printf("2nd son is %s\n", menu_get_name(m));
    m = menu_right(m);
    printf("3rd son is %s\n", menu_get_name(m));
    m = menu_right(m);
    printf("return to 1st son : %s\n", menu_get_name(m));

    m = menu_left(m);
    printf("3rd son is %s\n", menu_get_name(m));
    m = menu_left(m);
    printf("2nd son is %s\n", menu_get_name(m));
    m = menu_left(m);
    printf("1st son is %s\n", menu_get_name(m));
    m = menu_left(m);
    
    
    wait_ms(1000);

    //    exit(0);


    m = my_menu;
    while (1) {
        menu_default_display(m);
#ifdef HOST_VERSION        
	scanf("%c",&c);
#else
        c=uart0_recv();
#endif
        m=menu_default_update(m, c);
    }

    return 0;
}
