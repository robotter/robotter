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
 *  Revision : $Id: menu.c,v 1.4 2007-05-24 13:08:49 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2006
 * Implementation of a static menu
 */

#include <stdio.h>
#include <stdlib.h>

#include <aversive.h>

#include "menu.h"

/** return name of a menu, if the type is correct */
char * menu_get_name(struct menu * m) {
    if (!m)
        return NULL;

    if ( m->type == MENU_TYPE_MENU || 
         m->type == MENU_TYPE_ROOT ||
         m->type == MENU_TYPE_FCT_HDR )
        return (char *)m->data;

    return NULL;
}

/** return type of a menu */
uint8_t menu_get_type(struct menu * m) {
    if (!m)
        return MENU_TYPE_UNKNOWN;

    return m->type;
}

static uint8_t menu_is_a_submenu(struct menu * m)
{
    if (!m)
        return 0;
    
    return ( m->type == MENU_TYPE_MENU || m->type == MENU_TYPE_ROOT );
}


/** call the function described by the menu, and return 0 on success */
uint8_t menu_call_fct(struct menu * m) {
    void (*f)(void *);

    if (!m)
        return 1;
    
    if ( m->type != MENU_TYPE_FCT_HDR )
        return 1;
    
    f = (void (*)(void *) )(m+1)->data;

    if ( (m+1)->type != MENU_TYPE_FCT_PTR || f == NULL )
        return 1;

    if ( (m+2)->type != MENU_TYPE_FCT_DATA )
        return 1;

    f( (m+2)->data );
    return 0;
}


/** get previous menu on same level, return NULL if no one */
struct menu * menu_get_previous(struct menu * m) {
    int8_t level = 0;

    if (!m)
        return NULL;
    
    if(m->type == MENU_TYPE_ROOT)
        return NULL;

    m --;
    while ( level >= 0 ) {
	    
        if ( m->type == MENU_TYPE_ROOT ) {
            return NULL;
        }
        if ( m->type == MENU_TYPE_END ) {
            level ++;
        }
        if ( m->type == MENU_TYPE_MENU ) {
            level --;
        }
        if ( level == 0 ) {
            if (  m->type == MENU_TYPE_FCT_HDR ||
                  m->type == MENU_TYPE_MENU ) {
                return m;
            }
        }
        m--;
    }
    return NULL;
}

/** get next menu on same level, return NULL if no one */
struct menu * menu_get_next(struct menu * m) {
    int8_t level = 0;

    if (!m)
        return NULL;
    
    if(m->type == MENU_TYPE_ROOT)
        return NULL;

    if ( m->type == MENU_TYPE_MENU ) {
        level ++;
    }

    m ++;
    while ( level >= 0 ) {
	    
        if ( level == 0 ) {
            if (  m->type == MENU_TYPE_FCT_HDR ||
                  m->type == MENU_TYPE_MENU ) {
                return m;
            }
        }
        if ( m->type == MENU_TYPE_END ) {
            level --;
        }
        if ( m->type == MENU_TYPE_MENU ) {
            level ++;
        }
        m++;
    }
    return NULL;
}

/** get the parent of the menu - return NULL if no parent */
struct menu * menu_get_parent(struct menu * m)
{
    struct menu * ret;

    if (!m)
        return NULL;
    
    /* return null if root */
    if(m->type == MENU_TYPE_ROOT)
        return NULL;
	
    do {
        ret = m;
    } while ( (m=menu_get_previous(ret)) ) ;

    /* get the previous one and return it if it is a submenu, else return NULL */
    ret--;
    if ( menu_is_a_submenu(ret) )
        return ret;
    else
        return NULL;
}

/** return first son or NULL if there is no son */
struct menu * menu_get_first_son(struct menu * m)
{
    if (!m)
        return NULL;
    
    if (menu_is_a_submenu(m)) {
        return m+1;
    }
    else return NULL;
}

/** get the submenu 'num' -> can return NULL if does not exist */
struct menu * menu_get_sub(struct menu * m, uint8_t num) {
    if (!m)
        return NULL;
    
    m = menu_get_first_son(m);
    while(m && num) {
        num --;
        m = menu_get_next(m);
    }
    return m;
}

/** return number of submenus in a menu */
uint8_t menu_get_sub_howmany(struct menu * m) {
    uint8_t num=0;
    
    if (!m)
        return 0;
    
    m = menu_get_first_son(m);
    while(m) {
        num ++;
        m = menu_get_next(m);
    }
    return num;
}


/** get the parent of the menu - never return NULL except if m is null */
struct menu * menu_left(struct menu * m)
{
    struct menu * ret;

    if (!m)
        return NULL;
    
    if ( (ret = menu_get_parent(m)) )
        return ret;
    else
        return m;
}

/** get the son number 'num' or self if it does not exist,
    try to call the function if it exists, does not return null
    except if m is null */
struct menu * menu_right(struct menu * m)
{
    struct menu * ret ;
    if (!m)
        return NULL;
    
    if ( (ret=menu_get_first_son(m)) ) 
        return ret;

    menu_call_fct(m);

    return m;
}

/** return the next menu on same level (if it is the last, go back to beginning */
struct menu * menu_up(struct menu * m)
{
    struct menu * ret;
	
    if (!m)
        return NULL;
    
    /* if there is a menu before, return it */
    if ( (ret=menu_get_previous(m)) )
        return ret;

    /* if there is no before and no next, return self */
    if ( ! (ret = menu_get_next(m) ) )
        return m;
	
    /* return the next, next, next, ... until the end of menu */
    do {
        ret = m;
    } while ( (m=menu_get_next(ret)) ) ;
	
    return ret;
}

/** return the next menu on same level (if it is the first, go back to the end */
struct menu * menu_down(struct menu * m)
{
    struct menu * ret;
	
    if (!m)
        return NULL;
    
    /* if there is a menu after, return it */
    if ( (ret=menu_get_next(m)) )
        return ret;

    /* if there is no before and no next, return self */
    if ( ! (ret = menu_get_previous(m) ) )
        return m;
	
    /* return the previous, previous, previous, ... until the end of menu */
    do {
        ret = m;
    } while ( (m=menu_get_previous(ret)) ) ;
	
    return ret;
}


/** move in the menu, depending on the action */
struct menu * menu_default_update(struct menu * m, char c)
{
    struct menu * ret;

    switch(c) {
    case 'b':
        return menu_up(m);
    case 'f':
        return menu_down(m);
    case 'n':
        return menu_right(m);
    case 'p':
        return menu_left(m);
    default:
        if(c >= '0' && c <= '9') {
            if ( m->type == MENU_TYPE_ROOT && c == '0' ) {
                ret = menu_right(m);
                if (ret) return ret;
            }
            else if ( (ret = menu_right(menu_get_sub(menu_get_parent(m), c-'0'))) ) {
                return ret;
            }
        }
        return m;
    }
}


/** default function to display a menu, you can reimplement it */
void menu_default_display(struct menu * m)
{
    struct menu * parent = menu_get_parent(m);
    struct menu * son ;
    uint8_t i ;

    /* clear term */
    printf("[H[J");

    if(parent) {
        printf("%s\r\n", menu_get_name(parent));

        for (i=0 ; i<menu_get_sub_howmany(parent) ; i++) {
            son = menu_get_sub(parent, i);
            if( son == m )
                printf("> %d: %s", i, menu_get_name(son));
            else
                printf("  %d: %s", i, menu_get_name(son));
	    if(menu_is_a_submenu(son))
		    printf(" -->");
	    printf("\r\n");
        }
    }
    else {
        printf("| 0: %s -->", menu_get_name(m));
    }
}

