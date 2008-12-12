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
 *  Revision : $Id: lcd.h,v 1.5 2008-01-08 20:05:03 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Interface for LCD
 */

/** \file lcd.c
 *  \brief Interface for the LCD module.
 *
 *  \todo implement ANSI commands for cursor positionning ?
 *
 *  \test works on mega32 with all on the same port and old normal wiring, how about more speific connections ?
 *
 * This module provides functions for using a standard lcd device
 * the lcd s intended to be used in 4 bit mode, so don't wire the low nibble, only D4-D7 to 4 CONSECUTIVE port lines
 * we need the RW, RS and E lines too.
 * since the last version, you can scramble the wiring, except for D4-D7 who must remain consecutive (see lcd_config.h)
 * 
 * in this new version you can use lcd_putc('\f'); to clear the screen. This maintains an easy compatibility 
 * when you want to use an uart instad (form feed).
 */

/**********************************************************/

#ifndef _LCD_
#define _LCD_

#include <stdio.h>

#include <aversive.h>
#include "lcd_protocol.h"

/** 
 * Init the LCD module
 */
extern void lcd_init(uint8_t dispAttr);

/**
 * Put a char on screen
 * if c = \n cursor is positioned on the next line
 * if c = \f the screen will be cleared
 */
extern void lcd_putc(char c);

/**
 * same than lcd_putc but with a prototype that is compliant with
 * avrlibc > 1.4.0 fdevopen prototype
 */
extern int lcd_dev_putc(char c, FILE* f);

/**
 * move the cursor in the screen, x= line, y = char
 */
extern void lcd_gotoxy(uint8_t x, uint8_t y);

/** 
 * clear all the screen
 * avoid using this function, escpecially if you use printf
 */
extern void lcd_clrscr(void);

#endif // _LCD_
