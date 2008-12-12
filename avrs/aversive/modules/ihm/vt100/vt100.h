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
 *  Revision : $Id: vt100.h,v 1.2 2008-01-08 20:05:05 zer0 Exp $
 *
 *
 */

#ifndef _VT100_H_

#define vt100_bell         "\007"
#define vt100_bs           "\010"
#define vt100_bs_clear     "\010 \010"
#define vt100_tab          "\011"
#define vt100_crnl         "\012\015"
#define vt100_clear_right  "\033[0K"
#define vt100_clear_left   "\033[1K"
#define vt100_clear_down   "\033[0J"
#define vt100_clear_up     "\033[1J"
#define vt100_clear_line   "\033[2K"
#define vt100_clear_screen "\033[2J"
#define vt100_up_arr       "\033\133\101"
#define vt100_down_arr     "\033\133\102"
#define vt100_right_arr    "\033\133\103"
#define vt100_left_arr     "\033\133\104"
#define vt100_multi_right  "\033\133%uC"
#define vt100_multi_left   "\033\133%uD"
#define vt100_suppr        "\033\133\063\176"
#define vt100_home         "\033M\033E"
#define vt100_word_left    "\033\142"
#define vt100_word_right   "\033\146"


/* Result of parsing : it must be synchronized with vt100_commands[]
 * in vt100.c */
#define KEY_UP_ARR 0
#define KEY_DOWN_ARR 1
#define KEY_RIGHT_ARR 2
#define KEY_LEFT_ARR 3
#define KEY_BKSPACE 4
#define KEY_RETURN 5
#define KEY_CTRL_A 6
#define KEY_CTRL_E 7
#define KEY_CTRL_K 8
#define KEY_CTRL_Y 9
#define KEY_CTRL_C 10
#define KEY_CTRL_F 11
#define KEY_CTRL_B 12
#define KEY_SUPPR 13
#define KEY_TAB 14
#define KEY_CTRL_D 15
#define KEY_CTRL_L 16
#define KEY_RETURN2 17
#define KEY_META_BKSPACE 18
#define KEY_WLEFT 19
#define KEY_WRIGHT 20
#define KEY_HELP 21

extern const prog_char * vt100_commands[] PROGMEM;

enum vt100_parser_state {
	VT100_INIT,
	VT100_ESCAPE,
	VT100_ESCAPE_CSI,
};

#define VT100_BUF_SIZE 8
struct vt100 {
	uint8_t bufpos;
	char buf[VT100_BUF_SIZE];
	enum vt100_parser_state state;
};

/**
 * Init
 */
void vt100_init(struct vt100 * vt);

/**
 * Input a new character. 
 * Return -1 if the character is not part of a control sequence
 * Return -2 if c is not the last char of a control sequence
 * Else return the index in vt100_commands[]
 */
int8_t vt100_parser(struct vt100 *vt, char c);

#endif
