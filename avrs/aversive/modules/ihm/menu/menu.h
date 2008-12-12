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
 *  Revision : $Id: menu.h,v 1.4 2007-05-24 13:08:49 zer0 Exp $
 *
 */

/**
 *
 * This is the documentation of the menu module.
 * 
 * RESUME
 * ======
 * 
 * The aim of this module is to provide some simple functions to use a
 * tree-based menu in a program. The displaying of the menu can be done
 * in several ways: uart, lcd, ... This module tries to be independant of
 * the way it is displayed.
 * 
 * MAIN FUNCTIONS
 * ==============
 * 
 * The main functions that can be used are : menu_left(), menu_right(),
 * menu_up() and menu_down(). they are used to browse the menu. Each of
 * these functions take a pointer to a menu as an argument and return
 * another one. The directions correspond to (one of) the natural
 * representation of a tree.
 * 
 * 
 * root ----- submenu1 ----- leaf1
 *       |              |
 *       |              |--- leaf2
 *       |              |
 *       |              |--- submenu2 ----- leaf3
 *       |                             |
 *       |                             |--- leaf4
 *       |
 *       ---- leaf5
 * 
 * Left goes to the parent.
 * Right goes to the first son
 * Up goes to the menu before, on the same level.
 * Down goes to the menu after, on the same level.
 * 
 * These functions try to be tolerant : for example, doing a menu_left()
 * on the root menu return the root menu. Doing a menu_down() on the last
 * menu of a level returns the first menu on the same level.
 * 
 * The module provide one function for displaying a menu and another to
 * do an action depending on a character. These functions can be
 * reimplemented by the user to be more adapted to his application.
 * 
 * The default display function clear the screen, print the parent of the
 * menu, then all other menus on the same level, highlighting the menu
 * given in parameter. 
 * 
 * The default menu_update() function takes a character as parameter. 
 *   - 'n' (next) is equivalent to menu_right. 
 *   - 'p' (previous) is equivalent to menu_left. 
 *   - 'f' (forward) is equivalent to menu_down.
 *   - 'b' (backward) is equivalent to menu_up.
 *   - '0', '1', ..., '9' selects the menu n on the same level.
 * 
 * 
 * IMPLEMENTATION
 * ==============
 * 
 * A menu is a static table of a menu element. Each menu element is a
 * struct menu : 
 * 
 * struct menu {
 *     uint8_t type;
 *     void * data;
 * }
 * 
 * An element type can be : MENU_TYPE_ROOT if the element is the root of
 * the menu, MENU_TYPE_MENU if it is a submenu under the root,
 * MENU_TYPE_FCT_HDR, MENU_TYPE_FCT_PTR, MENU_TYPE_FCT_DATA, to declare a
 * leaf that executes a function, or MENU_TYPE_END to mark the end of a
 * submenu or the end of the root menu.
 * 
 * For each of these types, the data field points to different things :
 *  MENU_TYPE_ROOT     data -> (char *) title of the menu
 *  MENU_TYPE_MENU     data -> (char *) title of the menu
 *  MENU_TYPE_FCT_HDR  data -> (char *) title of the menu
 *  MENU_TYPE_FCT_PTR  data -> void (*f)(void *) function that will be called
 *  MENU_TYPE_FCT_DATA data -> (void *) parameter of this function
 *  MENU_TYPE_END      data -> NULL
 * 
 * 
 * Here is an exemple :
 * 
 * root ----- submenu1 ----- leaf1
 *       |              |
 *       |              |--- leaf2
 *       |              |
 *       |              |--- submenu2 ----- leaf3
 *       |                             |
 *       |                             |--- leaf4
 *       |
 *       ---- leaf5
 * 
 * will be represented as :
 * 
 *  MENU_TYPE_ROOT, "root"
 *  MENU_TYPE_MENU, "submenu1"
 *  MENU_TYPE_FCT_HDR, "leaf1"
 *  MENU_TYPE_FCT_PTR, fct_leaf1
 *  MENU_TYPE_FCT_DATA, leaf1_data
 *  MENU_TYPE_FCT_HDR, "leaf2"
 *  MENU_TYPE_FCT_PTR, fct_leaf2
 *  MENU_TYPE_FCT_DATA, leaf2_data
 *  MENU_TYPE_MENU, "submenu2"
 *  MENU_TYPE_FCT_HDR, "leaf3"
 *  MENU_TYPE_FCT_PTR, fct_leaf3
 *  MENU_TYPE_FCT_DATA, leaf3_data
 *  MENU_TYPE_FCT_HDR, "leaf4"
 *  MENU_TYPE_FCT_PTR, fct_leaf4
 *  MENU_TYPE_FCT_DATA, leaf4_data
 *  MENU_TYPE_END, NULL
 *  MENU_TYPE_END, NULL
 *  MENU_TYPE_FCT_HDR, "leaf5"
 *  MENU_TYPE_FCT_PTR, fct_leaf5
 *  MENU_TYPE_FCT_DATA, leaf5_data
 *  MENU_TYPE_END, NULL
 * 
 * For AVR version, all is stored in program memory. (TODO : store the
 * menu table in program memory, currently only text is stored there)
 */

/* Olivier MATZ, Droids-corp 2004 - 2006
 * Implementation of a static menu
 */

#include <aversive.h>

/**
 * The structure that defines a menu element. 
 * A menu is composed of several struct a this type, see the
 * documentation for more informations 
 */
struct menu {
    uint8_t type;
    void * data;
};

/* ************************************************************* */

/* Functions that you should use to move in a menu, they try
   to never return NULL, except if param is NULL */

/** get the parent of the menu - never return NULL except if param is null */
struct menu * menu_left(struct menu * m);

/** get the first son number self if it does not exist, try to call
   the fonction if it exists, never return NULL except if param is
   null */
struct menu * menu_right(struct menu * m);

/** return the next menu on same level (if it is the last, go back to
    beginning,  never return NULL except if param is null */
struct menu * menu_down(struct menu * m);

/** return the next menu on same level (if it is the first, go back to
    the end, never return NULL except if param is null */
struct menu * menu_up(struct menu * m);


/* ************************************************************* */

/* Functions used to interact with the user (in and out : keyboard 
 * and display)
 * These functions can be reimplemented by the user to change the
 * manner that the menu is displayed or the manner that the user
 * moves in the menu.
 */


/** move in the menu, depending on the action (the character c) */
struct menu * menu_default_update(struct menu * m, char c);

/** default function to display a menu, you can reimplement it */
void menu_default_display(struct menu * m);
     

/* ************************************************************* */

/* Functions that can be usefull, but warning : some of these return
 * a NULL pointer, that need to be handled */

/** return name of a menu, if the type is correct */
char * menu_get_name(struct menu * m);

/** return type of a menu */
uint8_t menu_get_type(struct menu * m);

/** call the function described by the menu, and return 0 on
    success */
uint8_t menu_call_fct(struct menu * m);

/** get previous menu on same level, return NULL if no one */
struct menu * menu_get_previous(struct menu * m);

/** get next menu on same level, return NULL if no one */
struct menu * menu_get_next(struct menu * m);

/** get the parent of the menu - return NULL if no parent */
struct menu * menu_get_parent(struct menu * m);

/** return first son or NULL if there is no son */
struct menu * menu_get_first_son(struct menu * m);

/** get the submenu 'num' -> can return NULL if does not exist */
struct menu * menu_get_sub(struct menu * m, uint8_t num);

/** return number of submenus in a menu */
uint8_t menu_get_sub_howmany(struct menu * m);


/* ************************************************************* */

/* macros used to declare a menu */

#define MENU_TYPE_ROOT      0
#define MENU_TYPE_MENU      1
#define MENU_TYPE_FCT_HDR   2
#define MENU_TYPE_FCT_PTR   3
#define MENU_TYPE_FCT_DATA  4
#define MENU_TYPE_END       5
#define MENU_TYPE_UNKNOWN 255 

#define MENU_ROOT(text) { MENU_TYPE_ROOT, (void *)text }

#define MENU_START(text) { MENU_TYPE_MENU, (void *)text }

#define MENU_END() { MENU_TYPE_END, NULL }

#define MENU_FCT(text, f, data)       \
 { MENU_TYPE_FCT_HDR, (void *)text }, \
 { MENU_TYPE_FCT_PTR, (void *)f },    \
 { MENU_TYPE_FCT_DATA, (void *)data }


