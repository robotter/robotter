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
 *  Revision : $Id: parse.c,v 1.3 2009-03-15 21:51:20 zer0 Exp $
 *
 *
 */

#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include <ctype.h>

#include <aversive/pgmspace.h>

#include "parse.h"

//#define CMDLINE_DEBUG
//#define debug_printf printf
#define debug_printf(args...) do {} while(0)


static int
isendofline(char c)
{
	if (c == '\n' || 
	    c == '\r' )
		return 1;
	return 0;
}

static int
iscomment(char c)
{
	if (c == '#')
		return 1;
	return 0;
}

int
isendoftoken(char c)
{
	if (!c || iscomment(c) || isblank(c) || isendofline(c))
		return 1;
	return 0;
}

static uint8_t
nb_common_chars(const char * s1, const char * s2)
{
	uint8_t i=0;

	while (*s1==*s2 && *s1 && *s2) {
		s1++;
		s2++;
		i++;
	}
	return i;
}

/** 
 * try to match the buffer with an instruction (only the first
 * nb_match_token tokens if != 0). Return 0 if we match all the
 * tokens, else the number of matched tokens, else -1.
 */
static int8_t
match_inst(parse_pgm_inst_t *inst, const char * buf, uint8_t nb_match_token, 
	   void * result_buf)
{
	uint8_t token_num=0;
	parse_pgm_token_hdr_t * token_p;
	uint8_t i=0;
	int8_t n = 0;
	struct token_hdr token_hdr;

	token_p = (parse_pgm_token_hdr_t *)pgm_read_word(&inst->tokens[token_num]);
	if (token_p)
		memcpy_P(&token_hdr, token_p, sizeof(token_hdr));
	
	/* check if we match all tokens of inst */
	while (token_p && (!nb_match_token || i<nb_match_token)) {
		debug_printf("TK\n");
		/* skip spaces */
		while (isblank(*buf)) {
			buf++;
		}
		
		/* end of buf */
		if ( isendofline(*buf) || iscomment(*buf) )
			break;
		
		n = token_hdr.ops->parse(token_p, buf, (result_buf ? result_buf+token_hdr.offset : NULL));
		if ( n < 0 )
			break;
		debug_printf("TK parsed (len=%d)\n", n);
		i++;
		buf += n;
		
		token_num ++;
		token_p = (parse_pgm_token_hdr_t *)pgm_read_word(&inst->tokens[token_num]);
		if (token_p)
			memcpy_P(&token_hdr, token_p, sizeof(token_hdr));
	}
	
	/* does not match */
	if (i==0)
		return -1;
	
	/* in case we want to match a specific num of token */
	if (nb_match_token) {
		if (i == nb_match_token) {
			return 0;
		}
		return i;
	}

	/* we don't match all the tokens */
	if (token_p) {
		return i;
	}

	/* are there are some tokens more */
	while (isblank(*buf)) {
		buf++;
	}
	
	/* end of buf */
	if ( isendofline(*buf) || iscomment(*buf) )
		return 0;

	/* garbage after inst */
	return i;
}


int8_t
parse(parse_pgm_ctx_t ctx[], const char * buf)
{
	uint8_t inst_num=0;
	parse_pgm_inst_t * inst;
	const char * curbuf;
	char result_buf[256]; /* XXX align, size zé in broblém */
	void (*f)(void *, void *) = NULL;
	void * data = NULL;
	int comment = 0;
	int linelen = 0;
	int parse_it = 0;
	int8_t err = PARSE_NOMATCH;
	int8_t tok;
#ifdef CMDLINE_DEBUG
	char debug_buf[64];
#endif

	/* 
	 * - look if the buffer contains at least one line
	 * - look if line contains only spaces or comments 
	 * - count line length
	 */
	curbuf = buf;
	while (! isendofline(*curbuf)) {
		if ( *curbuf == '\0' ) {
			debug_printf("Incomplete buf (len=%d)\n", linelen);
			return 0;
		}
		if ( iscomment(*curbuf) ) {
			comment = 1;
		}
		if ( ! isblank(*curbuf) && ! comment) {
			parse_it = 1;
		}
		curbuf++;
		linelen++;
	}

	/* skip all endofline chars */
	while (isendofline(buf[linelen])) {
		linelen++;
	}

	/* empty line */
	if ( parse_it == 0 ) {
		debug_printf("Empty line (len=%d)\n", linelen);
		return linelen;
	}

#ifdef CMDLINE_DEBUG
	snprintf(debug_buf, (linelen>64 ? 64 : linelen), "%s", buf);
	debug_printf("Parse line : len=%d, <%s>\n", linelen, debug_buf);
#endif

	/* parse it !! */
	inst = (parse_pgm_inst_t *)pgm_read_word(ctx+inst_num);
	while (inst) {
		debug_printf("INST\n");

		/* fully parsed */
		tok = match_inst(inst, buf, 0, result_buf);

		if (tok > 0) /* we matched at least one token */
			err = PARSE_BAD_ARGS;

		else if (!tok) {
			debug_printf("INST fully parsed\n");
			/* skip spaces */
			while (isblank(*curbuf)) {
				curbuf++;
			}
			
			/* if end of buf -> there is no garbage after inst */
			if (isendofline(*curbuf) || iscomment(*curbuf)) {
				if (!f) {
					memcpy_P(&f, &inst->f, sizeof(f));
					memcpy_P(&data, &inst->data, sizeof(data));
				}
				else {
					/* more than 1 inst matches */
					err = PARSE_AMBIGUOUS;
					f=NULL;
					debug_printf("Ambiguous cmd\n");
					break;
				}
			}
		}
			
		inst_num ++;
		inst = (parse_pgm_inst_t *)pgm_read_word(ctx+inst_num);
	}
	
	/* call func */
	if (f) {
		f(result_buf, data);
	}

	/* no match */
	else {
		debug_printf("No match err=%d\n", err);
		return err;
	}
	
	return linelen;
}

int8_t 
complete(parse_pgm_ctx_t ctx[], const char *buf, int16_t *state, 
	 char *dst, uint8_t size)
{
	const char * incomplete_token = buf;
	uint8_t inst_num = 0;
	parse_pgm_inst_t *inst;
	parse_pgm_token_hdr_t *token_p;
	struct token_hdr token_hdr;
	char tmpbuf[64], completion_buf[64];
	uint8_t incomplete_token_len;
	int8_t completion_len = -1;
	int8_t nb_token = 0;
	uint8_t i, n;
	int8_t l;
	uint8_t nb_completable;
	uint8_t nb_non_completable;
	uint16_t local_state=0;
	prog_char *help_str;

	debug_printf("%s called\n", __FUNCTION__);
	/* count the number of complete token to parse */
	for (i=0 ; buf[i] ; i++) {
		if (!isblank(buf[i]) && isblank(buf[i+1]))
			nb_token++;
		if (isblank(buf[i]) && !isblank(buf[i+1]))
			incomplete_token = buf+i+1;
	}
	incomplete_token_len = strlen(incomplete_token);

	/* first call -> do a first pass */
	if (*state <= 0) {
		debug_printf("try complete <%s>\n", buf);
		debug_printf("there is %d complete tokens, <%s> is incomplete\n", nb_token, incomplete_token);

		nb_completable = 0;
		nb_non_completable = 0;
		
		inst = (parse_pgm_inst_t *)pgm_read_word(ctx+inst_num);
		while (inst) {
			/* parse the first tokens of the inst */
			if (nb_token && match_inst(inst, buf, nb_token, NULL))
				goto next;
			
			debug_printf("instruction match \n");
			token_p = (parse_pgm_token_hdr_t *) pgm_read_word(&inst->tokens[nb_token]);
			if (token_p)
				memcpy_P(&token_hdr, token_p, sizeof(token_hdr));

			/* non completable */
			if (!token_p || 
			    !token_hdr.ops->complete_get_nb || 
			    !token_hdr.ops->complete_get_elt || 
			    (n = token_hdr.ops->complete_get_nb(token_p)) == 0) {
				nb_non_completable++;
				goto next;
			}

			debug_printf("%d choices for this token\n", n);
			for (i=0 ; i<n ; i++) {
				if (token_hdr.ops->complete_get_elt(token_p, i, tmpbuf, sizeof(tmpbuf)) < 0)
					continue;
				strcat_P(tmpbuf, PSTR(" ")); /* we have at least room for one char */
				debug_printf("   choice <%s>\n", tmpbuf);
				/* does the completion match the beginning of the word ? */
				if (!strncmp(incomplete_token, tmpbuf, incomplete_token_len)) {
					if (completion_len == -1) {
						strcpy(completion_buf, tmpbuf+incomplete_token_len);
						completion_len = strlen(tmpbuf+incomplete_token_len);
						
					}
					else {
						completion_len = nb_common_chars(completion_buf, 
										 tmpbuf+incomplete_token_len);
						completion_buf[completion_len] = 0;
					}
					nb_completable++;
				}
			}		
		next:
			inst_num ++;
			inst = (parse_pgm_inst_t *)pgm_read_word(ctx+inst_num);
		}

		debug_printf("total choices %d for this completion\n", nb_completable);

		/* no possible completion */
		if (nb_completable == 0 && nb_non_completable == 0)
			return 0;
		
		/* if multichoice is not required */
		if (*state == 0 && incomplete_token_len > 0) {
			/* one or several choices starting with the
			   same chars */
			if (completion_len > 0) { 
				if (completion_len + 1 > size)
					return 0;
				
				strcpy(dst, completion_buf);
				return 2;
			}
		}
	}

	/* init state correctly */
	if (*state == -1)
		*state = 0;

	debug_printf("Multiple choice STATE=%d\n", *state);

	inst_num = 0;
	inst = (parse_pgm_inst_t *)pgm_read_word(ctx+inst_num);
	while (inst) {
		/* we need to redo it */
		inst = (parse_pgm_inst_t *)pgm_read_word(ctx+inst_num);
		
		if (nb_token && match_inst(inst, buf, nb_token, NULL))
			goto next2;
		
		token_p = (parse_pgm_token_hdr_t *)pgm_read_word(&inst->tokens[nb_token]);
		if (token_p)
			memcpy_P(&token_hdr, token_p, sizeof(token_hdr));

		/* one choice for this token */
		if (!token_p || 
		    !token_hdr.ops->complete_get_nb || 
		    !token_hdr.ops->complete_get_elt || 
		    (n = token_hdr.ops->complete_get_nb(token_p)) == 0) {
			if (local_state < *state) {
				local_state++;
				goto next2;
			}
			(*state)++;
			if (token_p && token_hdr.ops->get_help) {
				token_hdr.ops->get_help(token_p, tmpbuf, sizeof(tmpbuf));
				help_str = (prog_char *) pgm_read_word(&inst->help_str);
				if (help_str)
					snprintf_P(dst, size, PSTR("[%s]: %S"), tmpbuf, help_str);
				else
					snprintf_P(dst, size, PSTR("[%s]: No help"), tmpbuf);
			}
			else {
				snprintf_P(dst, size, PSTR("[RETURN]"));
			}
			return 1;
		}

		/* several choices */
		for (i=0 ; i<n ; i++) {
			if (token_hdr.ops->complete_get_elt(token_p, i, tmpbuf, sizeof(tmpbuf)) < 0)
				continue;
			strcat_P(tmpbuf, PSTR(" ")); /* we have at least room for one char */
			debug_printf("   choice <%s>\n", tmpbuf);
			/* does the completion match the beginning of the word ? */
			if (!strncmp(incomplete_token, tmpbuf, incomplete_token_len)) {
				if (local_state < *state) {
					local_state++;
					continue;
				}
				(*state)++;
				l=snprintf(dst, size, "%s", tmpbuf);
				if (l>=0 && token_hdr.ops->get_help) {
					token_hdr.ops->get_help(token_p, tmpbuf, sizeof(tmpbuf));
					help_str = (prog_char *) pgm_read_word(&inst->help_str);
					if (help_str)
						snprintf_P(dst+l, size-l, PSTR("[%s]: %S"), tmpbuf, help_str);
					else
						snprintf_P(dst+l, size-l, PSTR("[%s]: No help"), tmpbuf);
				}
							      
				return 1;
			}
		}
	next2:
		inst_num ++;
		inst = (parse_pgm_inst_t *)pgm_read_word(ctx+inst_num);
	}
	return 0;
}

