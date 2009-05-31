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
 *  Revision : $Id: parse.h,v 1.3 2009-03-15 21:51:20 zer0 Exp $
 *
 *
 */

#ifndef _PARSE_H_
#define _PARSE_H_

#include <aversive/pgmspace.h>
#include <aversive/types.h>

#ifndef offsetof
#define offsetof(type, field)  ((size_t) &( ((type *)0)->field) )
#endif

#define PARSE_SUCCESS        0
#define PARSE_AMBIGUOUS     -1
#define PARSE_NOMATCH       -2
#define PARSE_BAD_ARGS      -3

/**
 * Stores a pointer to the ops struct, and the offset: the place to
 * write the parsed result in the destination structure.
 */
struct token_hdr {
	struct token_ops *ops;
	uint8_t offset;
};
typedef struct token_hdr parse_token_hdr_t;

struct token_hdr_pgm {
	struct token_ops *ops;
	uint8_t offset;
} PROGMEM;
typedef struct token_hdr_pgm parse_pgm_token_hdr_t;

/**
 * A token is defined by this structure.
 *
 * parse() takes the token as first argument, then the source buffer
 * starting at the token we want to parse. The 3rd arg is a pointer
 * where we store the parsed data (as binary). It returns the number of
 * parsed chars on success and a negative value on error.
 *
 * complete_get_nb() returns the number of possible values for this
 * token if completion is possible. If it is NULL or if it returns 0, 
 * no completion is possible.
 *
 * complete_get_elt() copy in dstbuf (the size is specified in the
 * parameter) the i-th possible completion for this token.  returns 0
 * on success or and a negative value on error.
 *
 * get_help() fills the dstbuf with the help for the token. It returns
 * -1 on error and 0 on success.
 */
struct token_ops {
	/** parse(token ptr, buf, res pts) */
	int8_t (*parse)(parse_pgm_token_hdr_t *, const char *, void *);
	/** return the num of possible choices for this token */
	int8_t (*complete_get_nb)(parse_pgm_token_hdr_t *);
	/** return the elt x for this token (token, idx, dstbuf, size) */
	int8_t (*complete_get_elt)(parse_pgm_token_hdr_t *, int8_t, char *, uint8_t);
	/** get help for this token (token, dstbuf, size) */
	int8_t (*get_help)(parse_pgm_token_hdr_t *, char *, uint8_t);
};	

/**
 * Store a instruction, which is a pointer to a callback function and
 * its parameter that is called when the instruction is parsed, a help
 * string, and a list of token composing this instruction.
 */
struct inst {
	/* f(parsed_struct, data) */
	void (*f)(void *, void *);
	void * data;
	char * help_str;
	prog_void * tokens[];
};
typedef struct inst parse_inst_t;
struct inst_pgm {
	/* f(parsed_struct, data) */
	void (*f)(void *, void *);
	void * data;
	char * help_str;
	prog_void * tokens[];
} PROGMEM;
typedef struct inst_pgm parse_pgm_inst_t;

/**
 * A context is identified by its name, and contains a list of
 * instruction 
 *
 */
typedef parse_pgm_inst_t * parse_ctx_t;
typedef PROGMEM parse_ctx_t parse_pgm_ctx_t;

/**
 * Try to parse a buffer according to the specified context. The
 * argument buf must ends with "\n\0". The function returns
 * PARSE_AMBIGUOUS, PARSE_NOMATCH or PARSE_BAD_ARGS on error. Else it
 * calls the associated function (defined in the context) and returns
 * 0 (PARSE_SUCCESS).
 */
int8_t parse(parse_pgm_ctx_t ctx[], const char * buf);

/**
 * complete() must be called with *state==0.
 * It returns < 0 on error. 
 *
 * Else it returns:
 * 2 on completion (one possible choice). In this case, the chars
 *   are appended in dst buffer.
 * 1 if there is several possible choices. In this case, you must 
 *   call the function again, keeping the value of state intact.
 * 0 when the iteration is finished. The dst is not valid for this 
 *   last call.
 *
 * The returned dst buf ends with \0.
 * 
 */
int8_t complete(parse_pgm_ctx_t ctx[], const char *buf, int16_t *state, 
		char *dst, uint8_t size);


/* true if(!c || iscomment(c) || isblank(c) || isendofline(c)) */
int isendoftoken(char c);

#endif /* _PARSE_H_ */
