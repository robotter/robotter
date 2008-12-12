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
 *  Revision : $Id: rdline.c,v 1.3 2008-04-13 16:55:31 zer0 Exp $
 *
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>

#include <aversive/pgmspace.h>

#include <cirbuf.h>
#include "rdline.h"

static void rdline_puts_P(struct rdline * rdl, const prog_char * buf);
static void rdline_miniprintf_P(struct rdline * rdl, 
				const prog_char * buf, uint8_t val);

#ifdef CONFIG_MODULE_RDLINE_HISTORY
static void rdline_remove_old_history_item(struct rdline * rdl);
static void rdline_remove_first_history_item(struct rdline * rdl);
static uint8_t rdline_get_history_size(struct rdline * rdl);
#endif /* CONFIG_MODULE_RDLINE_HISTORY */


void rdline_init(struct rdline * rdl, void (*write_char)(char),
		 void (*validate)(const char *, uint8_t size),
		 int8_t (*complete)(const char *, char * dstbuf,
				    uint8_t dstsize, int16_t * state))
{
	memset(rdl, 0, sizeof(*rdl));
	rdl->validate = validate;
	rdl->complete = complete;
	rdl->write_char = write_char;
	rdl->status = RDLINE_INIT;
#ifdef CONFIG_MODULE_RDLINE_HISTORY
	cirbuf_init(&rdl->history, rdl->history_buf, 0, RDLINE_HISTORY_BUF_SIZE);
#endif /* CONFIG_MODULE_RDLINE_HISTORY */
}

void
rdline_newline(struct rdline * rdl, const char * prompt)
{
	uint8_t i;

	vt100_init(&rdl->vt100);
	cirbuf_init(&rdl->left, rdl->left_buf, 0, RDLINE_BUF_SIZE);
	cirbuf_init(&rdl->right, rdl->right_buf, 0, RDLINE_BUF_SIZE);

	if (prompt != rdl->prompt)
		memcpy(rdl->prompt, prompt, sizeof(rdl->prompt)-1);
	rdl->prompt_size = strlen(prompt);

	for (i=0 ; i<rdl->prompt_size ; i++)
		rdl->write_char(rdl->prompt[i]);
	rdl->status = RDLINE_RUNNING;

#ifdef CONFIG_MODULE_RDLINE_HISTORY 
	rdl->history_cur_line = -1;
#endif /* CONFIG_MODULE_RDLINE_HISTORY */
}

void 
rdline_stop(struct rdline * rdl)
{
	rdl->status = RDLINE_INIT;
}

void
rdline_restart(struct rdline * rdl)
{
	rdl->status = RDLINE_RUNNING;
}

const char *
rdline_get_buffer(struct rdline * rdl)
{
	uint8_t len_l, len_r;
	cirbuf_align_left(&rdl->left);
	cirbuf_align_left(&rdl->right);

	len_l = CIRBUF_GET_LEN(&rdl->left);
	len_r = CIRBUF_GET_LEN(&rdl->right);
	memcpy(rdl->left_buf+len_l, rdl->right_buf, len_r);

	rdl->left_buf[len_l + len_r] = '\n';
	rdl->left_buf[len_l + len_r + 1] = '\0';
	return rdl->left_buf;
}

static void
display_right_buffer(struct rdline * rdl)
{
	uint8_t i;
	char tmp;

	rdline_puts_P(rdl, PSTR(vt100_clear_right));
	if (!CIRBUF_IS_EMPTY(&rdl->right)) {
		CIRBUF_FOREACH(&rdl->right, i, tmp) {
			rdl->write_char(tmp);
		}
		rdline_miniprintf_P(rdl, PSTR(vt100_multi_left), 
				    CIRBUF_GET_LEN(&rdl->right));
	}
}

void rdline_redisplay(struct rdline * rdl)
{
	uint8_t i;
	char tmp;

	rdline_puts_P(rdl, PSTR(vt100_home));
	for (i=0 ; i<rdl->prompt_size ; i++)
		rdl->write_char(rdl->prompt[i]);
	CIRBUF_FOREACH(&rdl->left, i, tmp) {
		rdl->write_char(tmp);
	}
	display_right_buffer(rdl);
}

int8_t
rdline_char_in(struct rdline * rdl, char c)
{
	uint8_t i;
	int8_t cmd;
	char tmp;
#ifdef CONFIG_MODULE_RDLINE_HISTORY
	char * buf;
#endif
	
	if (rdl->status != RDLINE_RUNNING)
		return -1;

	cmd = vt100_parser(&rdl->vt100, c);
	if (cmd == -2)
		return 0;

	if (cmd >= 0) {
		switch (cmd) {
		case KEY_CTRL_B:
		case KEY_LEFT_ARR:
			if (CIRBUF_IS_EMPTY(&rdl->left))
				break;
			tmp = cirbuf_get_tail(&rdl->left);
			cirbuf_del_tail(&rdl->left);
			cirbuf_add_head(&rdl->right, tmp);
			rdline_puts_P(rdl, PSTR(vt100_left_arr));
			break;

		case KEY_CTRL_F:
		case KEY_RIGHT_ARR:
			if (CIRBUF_IS_EMPTY(&rdl->right))
				break;
			tmp = cirbuf_get_head(&rdl->right);
			cirbuf_del_head(&rdl->right);
			cirbuf_add_tail(&rdl->left, tmp);
			rdline_puts_P(rdl, PSTR(vt100_right_arr));
			break;

		case KEY_WLEFT:
			while (! CIRBUF_IS_EMPTY(&rdl->left) && 
			       (tmp = cirbuf_get_tail(&rdl->left)) && 
			       isblank(tmp)) {
				rdline_puts_P(rdl, PSTR(vt100_left_arr));
				cirbuf_del_tail(&rdl->left);
				cirbuf_add_head(&rdl->right, tmp);
			}
			while (! CIRBUF_IS_EMPTY(&rdl->left) && 
			       (tmp = cirbuf_get_tail(&rdl->left)) && 
			       !isblank(tmp)) {
				rdline_puts_P(rdl, PSTR(vt100_left_arr));
				cirbuf_del_tail(&rdl->left);
				cirbuf_add_head(&rdl->right, tmp);
			}			
			break;

		case KEY_WRIGHT:
			while (! CIRBUF_IS_EMPTY(&rdl->right) && 
			       (tmp = cirbuf_get_head(&rdl->right)) && 
			       isblank(tmp)) {
				rdline_puts_P(rdl, PSTR(vt100_right_arr));
				cirbuf_del_head(&rdl->right);
				cirbuf_add_tail(&rdl->left, tmp);
			}
			while (! CIRBUF_IS_EMPTY(&rdl->right) && 
			       (tmp = cirbuf_get_head(&rdl->right)) && 
			       !isblank(tmp)) {
				rdline_puts_P(rdl, PSTR(vt100_right_arr));
				cirbuf_del_head(&rdl->right);
				cirbuf_add_tail(&rdl->left, tmp);
			}			
			break;

		case KEY_BKSPACE:
			if(!cirbuf_del_tail_safe(&rdl->left)) {
				rdline_puts_P(rdl, PSTR(vt100_bs));
				display_right_buffer(rdl);
			}
			break;

		case KEY_META_BKSPACE:
			while (! CIRBUF_IS_EMPTY(&rdl->left) && isblank(cirbuf_get_tail(&rdl->left))) {
				rdline_puts_P(rdl, PSTR(vt100_bs));
				cirbuf_del_tail(&rdl->left);
			}
			while (! CIRBUF_IS_EMPTY(&rdl->left) && !isblank(cirbuf_get_tail(&rdl->left))) {
				rdline_puts_P(rdl, PSTR(vt100_bs));
				cirbuf_del_tail(&rdl->left);
			}
			display_right_buffer(rdl);
			break;

		case KEY_SUPPR:
		case KEY_CTRL_D:
			if(!cirbuf_del_head_safe(&rdl->right)) {
				display_right_buffer(rdl);
			}
			if (cmd == KEY_CTRL_D && 
			    CIRBUF_IS_EMPTY(&rdl->left) &&
			    CIRBUF_IS_EMPTY(&rdl->right)) {
				return -2;
			}
			break;

		case KEY_CTRL_A:
			if (CIRBUF_IS_EMPTY(&rdl->left))
				break;
			rdline_miniprintf_P(rdl, PSTR(vt100_multi_left), 
					    CIRBUF_GET_LEN(&rdl->left));
			while (! CIRBUF_IS_EMPTY(&rdl->left)) {
				tmp = cirbuf_get_tail(&rdl->left);
				cirbuf_del_tail(&rdl->left);
				cirbuf_add_head(&rdl->right, tmp);
			}
			break;

		case KEY_CTRL_E:
			if (CIRBUF_IS_EMPTY(&rdl->right))
				break;
			rdline_miniprintf_P(rdl, PSTR(vt100_multi_right), 
					    CIRBUF_GET_LEN(&rdl->right));
			while (! CIRBUF_IS_EMPTY(&rdl->right)) {
				tmp = cirbuf_get_head(&rdl->right);
				cirbuf_del_head(&rdl->right);
				cirbuf_add_tail(&rdl->left, tmp);
			}
			break;

#ifdef CONFIG_MODULE_RDLINE_KILL_BUF
		case KEY_CTRL_K:
			cirbuf_get_buf_head(&rdl->right, rdl->kill_buf, RDLINE_BUF_SIZE);
			rdl->kill_size = CIRBUF_GET_LEN(&rdl->right);
			cirbuf_del_buf_head(&rdl->right, rdl->kill_size);
			rdline_puts_P(rdl, PSTR(vt100_clear_right));
			break;

		case KEY_CTRL_Y:
			i=0;
			while(CIRBUF_GET_LEN(&rdl->right) + CIRBUF_GET_LEN(&rdl->left) <
			      RDLINE_BUF_SIZE && 
			      i < rdl->kill_size) {
				cirbuf_add_tail(&rdl->left, rdl->kill_buf[i]);
				rdl->write_char(rdl->kill_buf[i]);
				i++;
			}
			display_right_buffer(rdl);
			break;
#endif /* CONFIG_MODULE_RDLINE_KILL_BUF */

		case KEY_CTRL_C:
			rdline_puts_P(rdl, PSTR("\r\n"));
			rdline_newline(rdl, rdl->prompt);
			break;

		case KEY_CTRL_L:
			rdline_redisplay(rdl);
			break;

		case KEY_TAB:
		case KEY_HELP:
			cirbuf_align_left(&rdl->left);
			rdl->left_buf[CIRBUF_GET_LEN(&rdl->left)] = '\0'; 
			if (rdl->complete) {
				char tmp_buf[127]; /* XXX */
				int16_t complete_state;
				int8_t ret;
				int tmp_size;

				if (cmd == KEY_TAB)
					complete_state = 0;
				else
					complete_state = -1;

				/* complete() retourne < 0 en cas d'erreur
				 * * 2 si ca complete (1 choix possible), dans ce cas les lettres 
				 *   a ajouter sont dans le buffer dst
				 * * 1 si la fonction itere chaque token (complet) a chaque appel 
				 * * 0 lorsque l'iteration est terminee (l'appel retournant 0 ne
				 *   contient pas de buffer valide  				
				 *
				 *  le buffer se termine par 0
				 */
				
				ret = rdl->complete(rdl->left_buf, tmp_buf, sizeof(tmp_buf), 
						    &complete_state);
				/* no completion or error */
				if (ret <= 0) {
					return 2;
				}

				
				tmp_size = strlen(tmp_buf);
				/* add chars */
				if (ret == 2) {
					i=0;
					while(CIRBUF_GET_LEN(&rdl->right) + CIRBUF_GET_LEN(&rdl->left) <
					      RDLINE_BUF_SIZE && 
					      i < tmp_size) {
						cirbuf_add_tail(&rdl->left, tmp_buf[i]);
						rdl->write_char(tmp_buf[i]);
						i++;
					}
					display_right_buffer(rdl);
					return 2; /* ?? */
				}

				/* choice */
				rdline_puts_P(rdl, PSTR("\r\n"));
				while (ret) {
					rdl->write_char(' ');
					for (i=0 ; tmp_buf[i] ; i++)
						rdl->write_char(tmp_buf[i]);
					rdline_puts_P(rdl, PSTR("\r\n"));
					ret = rdl->complete(rdl->left_buf, tmp_buf, 
							    sizeof(tmp_buf), &complete_state);
				}

				rdline_redisplay(rdl);
			}
			return 2;

		case KEY_RETURN:
		case KEY_RETURN2:
			rdline_get_buffer(rdl);
			rdl->status = RDLINE_INIT;
			rdline_puts_P(rdl, PSTR("\r\n"));
#ifdef CONFIG_MODULE_RDLINE_HISTORY
			if (rdl->history_cur_line != -1)
				rdline_remove_first_history_item(rdl);
#endif

			if (rdl->validate)
				rdl->validate(rdl->left_buf, CIRBUF_GET_LEN(&rdl->left)+2);
			return 1;
			
#ifdef CONFIG_MODULE_RDLINE_HISTORY
		case KEY_UP_ARR:
			if (rdl->history_cur_line == 0) {
				rdline_remove_first_history_item(rdl);
			}
			if (rdl->history_cur_line <= 0) {
				rdline_add_history(rdl, rdline_get_buffer(rdl));
				rdl->history_cur_line = 0;
			}
			
			buf = rdline_get_history_item(rdl, rdl->history_cur_line + 1);
			if (!buf)
				break;
			
			rdl->history_cur_line ++;
			vt100_init(&rdl->vt100);
			cirbuf_init(&rdl->left, rdl->left_buf, 0, RDLINE_BUF_SIZE);
			cirbuf_init(&rdl->right, rdl->right_buf, 0, RDLINE_BUF_SIZE);
			cirbuf_add_buf_tail(&rdl->left, buf, strlen(buf));
			rdline_redisplay(rdl);
			break;

		case KEY_DOWN_ARR:
			if (rdl->history_cur_line - 1 < 0)
				break;
			
			rdl->history_cur_line --;
			buf = rdline_get_history_item(rdl, rdl->history_cur_line);
			if (!buf)
				break;
			vt100_init(&rdl->vt100);
			cirbuf_init(&rdl->left, rdl->left_buf, 0, RDLINE_BUF_SIZE);
			cirbuf_init(&rdl->right, rdl->right_buf, 0, RDLINE_BUF_SIZE);
			cirbuf_add_buf_tail(&rdl->left, buf, strlen(buf));
			rdline_redisplay(rdl);

			break;
#endif /* CONFIG_MODULE_RDLINE_HISTORY */


		default:
			break;
		}

		return 0;
	}
	
	if (! isprint(c))
		return 0;

	/* standard chars */
	if (CIRBUF_GET_LEN(&rdl->left) + CIRBUF_GET_LEN(&rdl->right) >= RDLINE_BUF_SIZE)
		return 0;
		
	if (cirbuf_add_tail_safe(&rdl->left, c))
		return 0;

	rdl->write_char(c);
	display_right_buffer(rdl);

	return 0;
}


/* HISTORY */

#ifdef CONFIG_MODULE_RDLINE_HISTORY
static void
rdline_remove_old_history_item(struct rdline * rdl)
{
	char tmp;

	while (! CIRBUF_IS_EMPTY(&rdl->history) ) {
		tmp = cirbuf_get_head(&rdl->history);
		cirbuf_del_head(&rdl->history);
		if (!tmp)
			break;
	}
}

static void
rdline_remove_first_history_item(struct rdline * rdl)
{
	char tmp;

	if ( CIRBUF_IS_EMPTY(&rdl->history) ) {
		return;
	}
	else {
		cirbuf_del_tail(&rdl->history);
	}

	while (! CIRBUF_IS_EMPTY(&rdl->history) ) {
		tmp = cirbuf_get_tail(&rdl->history);
		if (!tmp)
			break;
		cirbuf_del_tail(&rdl->history);
	}
}

static uint8_t
rdline_get_history_size(struct rdline * rdl)
{
	uint8_t i, tmp, ret=0;

	CIRBUF_FOREACH(&rdl->history, i, tmp) {
		if (tmp == 0)
			ret ++;
	}

	return ret;
}

char *
rdline_get_history_item(struct rdline * rdl, uint8_t idx)
{
	uint8_t len, i, tmp;

	len = rdline_get_history_size(rdl);
	if ( idx >= len ) {
		return NULL;
	}

	cirbuf_align_left(&rdl->history);

	CIRBUF_FOREACH(&rdl->history, i, tmp) {
		if ( idx == len - 1) {
			return rdl->history_buf + i;
		}
		if (tmp == 0)
			len --;
	}

	return NULL;
}

int8_t 
rdline_add_history(struct rdline * rdl, const char * buf)
{
	cirbuf_uint len, i;

	len = strlen(buf);
	for (i=0; i<len ; i++) {
		if (buf[i] == '\n') {
			len = i;
			break;
		}
	}

	if ( len >= RDLINE_HISTORY_BUF_SIZE )
		return -1;

	while ( len >= CIRBUF_GET_FREELEN(&rdl->history) ) {
		rdline_remove_old_history_item(rdl);
	}

	cirbuf_add_buf_tail(&rdl->history, buf, len);
	cirbuf_add_tail(&rdl->history, 0);
	
	return 0;
}

void
rdline_clear_history(struct rdline * rdl)
{
	cirbuf_init(&rdl->history, rdl->history_buf, 0, RDLINE_HISTORY_BUF_SIZE);
}

#else /* CONFIG_MODULE_RDLINE_HISTORY */

int8_t rdline_add_history(struct rdline * rdl, const char * buf) {return -1;}
void rdline_clear_history(struct rdline * rdl) {}
char * rdline_get_history_item(struct rdline * rdl, uint8_t i) {return NULL;}


#endif /* CONFIG_MODULE_RDLINE_HISTORY */


/* STATIC USEFUL FUNCS */

static void 
rdline_puts_P(struct rdline * rdl, const prog_char * buf)
{
	char c;
#ifdef HOST_VERSION
	while ( (c = *(buf++)) != '\0' ) {
		rdl->write_char(c);
	}
#else
	while ( (c=pgm_read_byte(buf++)) != '\0' ) {
		rdl->write_char(c);
	}
#endif
}

/* a very very basic printf with one arg and one format 'u' */
static void 
rdline_miniprintf_P(struct rdline * rdl, const prog_char * buf, uint8_t val)
{
	char c, started=0, div=100;

#ifdef HOST_VERSION
	while ( (c=*(buf++)) ) {
#else
	while ( (c=pgm_read_byte(buf++)) ) {
#endif
		if (c=='%') {
#ifdef HOST_VERSION
			c = *(buf++);
#else
			c = pgm_read_byte(buf++);
#endif
			if (c=='u') { /* val is never more than 255 */
				while (div) {
					c = val / div;
					if (c || started) {
						rdl->write_char(c+'0');
						started = 1;
					}
					val %= div;
					div /= 10;
				}
			}
			else {
				rdl->write_char('%');
				rdl->write_char(c);
			}
		}
		else {
			rdl->write_char(c);
		}
	}
}

