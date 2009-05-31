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
 *  Revision : $Id: rdline.h,v 1.3 2009-03-15 21:51:20 zer0 Exp $
 *
 *
 */

#ifndef _RDLINE_H_
#define _RDLINE_H_

/**
 * This library is a small equivalent to the GNU readline library, but
 * it is designed for small systems, like Atmel AVR microcontrollers
 * (8 bits). Indeed, we don't use any malloc that is sometimes not
 * implemented on such systems.
 */

#include <cirbuf.h>
#include <vt100.h>

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

/* configuration */
#define RDLINE_BUF_SIZE 64
#define RDLINE_PROMPT_SIZE  16
#define RDLINE_VT100_BUF_SIZE  8
#define RDLINE_HISTORY_BUF_SIZE 128
#define RDLINE_HISTORY_MAX_LINE 64

enum rdline_status {
	RDLINE_INIT,
	RDLINE_RUNNING,
};

struct rdline;

typedef void (rdline_write_char_t)(char);
typedef void (rdline_validate_t)(const char *buf, uint8_t size);
typedef int8_t (rdline_complete_t)(const char *buf, char *dstbuf,
				uint8_t dstsize, int16_t *state);

struct rdline {
	enum rdline_status status;
	/* rdline bufs */
	struct cirbuf left;
	struct cirbuf right;
	char left_buf[RDLINE_BUF_SIZE+2]; /* reserve 2 chars for the \n\0 */
	char right_buf[RDLINE_BUF_SIZE];

	char prompt[RDLINE_PROMPT_SIZE];
	uint8_t prompt_size;

#ifdef CONFIG_MODULE_RDLINE_KILL_BUF
	char kill_buf[RDLINE_BUF_SIZE];
	uint8_t kill_size;
#endif

#ifdef CONFIG_MODULE_RDLINE_HISTORY
	/* history */
	struct cirbuf history;
	char history_buf[RDLINE_HISTORY_BUF_SIZE];
	int8_t history_cur_line;
#endif

	/* callbacks and func pointers */
	rdline_write_char_t *write_char;
	rdline_validate_t *validate;
	rdline_complete_t *complete;

	/* vt100 parser */
	struct vt100 vt100;
};

/**
 * Init fields for a struct rdline. Call this only once at the beginning
 * of your program.
 * \param rdl A pointer to an uninitialized struct rdline
 * \param write_char The function used by the function to write a character
 * \param validate A pointer to the function to execute when the 
 *                 user validates the buffer.
 * \param complete A pointer to the function to execute when the 
 *                 user completes the buffer.
 */
void rdline_init(struct rdline *rdl, 
		 rdline_write_char_t *write_char,
		 rdline_validate_t *validate,
		 rdline_complete_t *complete);


/**
 * Init the current buffer, and display a prompt.
 * \param rdl A pointer to a struct rdline
 * \param prompt A string containing the prompt
 */
void rdline_newline(struct rdline *rdl, const char *prompt);

/**
 * Call it and all received chars will be ignored.
 * \param rdl A pointer to a struct rdline
 */
void rdline_stop(struct rdline *rdl);

/**
 * Restart after a call to rdline_stop()
 * \param rdl A pointer to a struct rdline
 */
void rdline_restart(struct rdline *rdl);

/**
 * Redisplay the current buffer
 * \param rdl A pointer to a struct rdline
 */
void rdline_redisplay(struct rdline *rdl);


/**
 * append a char to the readline buffer. 
 * Return 1 when the line has been validated.
 * Return 2 when the user asked to complete the buffer.
 * Return -1 if it is not running.
 * Return -2 if EOF (ctrl-d on an empty line).
 * Else return 0.
 * XXX error case when the buffer is full ?
 *
 * \param rdl A pointer to a struct rdline
 * \param c The character to append
 */
int8_t rdline_char_in(struct rdline * rdl, char c);

/**
 * Return the current buffer, terminated by '\0'.
 * \param rdl A pointer to a struct rdline
 */
const char *rdline_get_buffer(struct rdline *rdl);


/**
 * Add the buffer to history.
 * return < 0 on error.
 * \param rdl A pointer to a struct rdline
 * \param buf A buffer that is terminated by '\0'
 */
int8_t rdline_add_history(struct rdline *rdl, const char *buf);

/**
 * Clear current history
 * \param rdl A pointer to a struct rdline
 */
void rdline_clear_history(struct rdline *rdl);

/**
 * Get the i-th history item
 */
char *rdline_get_history_item(struct rdline *rdl, uint8_t i);

#endif /* _RDLINE_H_ */
