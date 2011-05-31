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
 *  Revision : $Id: error.h,v 1.13 2008-01-08 20:05:02 zer0 Exp $
 *
 */

#ifndef _ERROR_H_
#define _ERROR_H_

#ifndef _AVERSIVE_ERROR_H_
#error "Don't include <error.h>, include <aversive/error.h> instead"
#endif

#include <aversive/pgmspace.h>
#include <aversive.h>
#include <general_errors.h>

#include "error_config.h"

#define ERROR_SEVERITY_EMERG    0
#define ERROR_SEVERITY_ERROR    1
#define ERROR_SEVERITY_WARNING  2
#define ERROR_SEVERITY_NOTICE   3
#define ERROR_SEVERITY_DEBUG    4

/** The error structure, which is given as a parameter in log funcs */ 
struct error {
	uint8_t err_num;
	uint8_t severity;
	PGM_P text;
	PGM_P file;
	uint16_t line;
};


struct error_fct {
	void (*emerg)(struct error *, ...);
	void (*error)(struct error *, ...);
	void (*warning)(struct error *, ...);
	void (*notice)(struct error *, ...);
	void (*debug)(struct error *, ...);
} ;

extern struct error_fct g_error_fct;


struct error error_generate(uint8_t num, uint8_t severity, PGM_P t, PGM_P f, uint16_t l);

/** Register log function for EMERG level */
void error_register_emerg(void (*f)(struct error *, ...));

/** Register log function for ERROR level */
void error_register_error(void (*f)(struct error *, ...));

/** Register log function for WARNING level */
void error_register_warning(void (*f)(struct error *, ...));

/** Register log function for NOTICE level */
void error_register_notice(void (*f)(struct error *, ...));

/** Register log function for DEBUG level */
void error_register_debug(void (*f)(struct error *, ...));


#ifdef ERROR_DUMP_TEXTLOG
#define ERROR_ARG_TEXTLOG(t)  PSTR(t)
#else
#define ERROR_ARG_TEXTLOG(t)  0
#endif

#ifdef ERROR_DUMP_FILE_LINE
#define ERROR_ARG_FILE  PSTR(__FILE__)
#define ERROR_ARG_LINE  __LINE__
#else
#define ERROR_ARG_FILE  0
#define ERROR_ARG_LINE  0
#endif


/** Call this macro to log EMERG events */
#define EMERG(num, text, ...)  do {                                            \
	if(g_error_fct.emerg) {                                                \
		struct error e = error_generate(num, ERROR_SEVERITY_EMERG,     \
								ERROR_ARG_TEXTLOG(text),\
								ERROR_ARG_FILE,         \
								ERROR_ARG_LINE);        \
		g_error_fct.emerg(&e, ##__VA_ARGS__);                          \
	}                                                                      \
} while(0)

/** Call this macro to log ERROR events */
#define ERROR(num, text, ...)  do {                                            \
	if(g_error_fct.error) {                                                \
		struct error e = error_generate(num, ERROR_SEVERITY_ERROR,     \
								ERROR_ARG_TEXTLOG(text),\
								ERROR_ARG_FILE,         \
								ERROR_ARG_LINE);        \
		g_error_fct.error(&e, ##__VA_ARGS__);                          \
	}                                                                      \
} while(0)

/** Call this macro to log WARNING events */
#define WARNING(num, text, ...)  do {                                          \
	if(g_error_fct.warning) {                                              \
		struct error e = error_generate(num, ERROR_SEVERITY_WARNING,   \
								ERROR_ARG_TEXTLOG(text),\
								ERROR_ARG_FILE,         \
								ERROR_ARG_LINE);        \
		g_error_fct.warning(&e, ##__VA_ARGS__);                        \
	}                                                                      \
} while(0)

/** Call this macro to log NOTICE events */
#define NOTICE(num, text, ...)  do {                                           \
	if(g_error_fct.notice) {                                               \
		struct error e = error_generate(num, ERROR_SEVERITY_NOTICE,    \
								ERROR_ARG_TEXTLOG(text),\
								ERROR_ARG_FILE,         \
								ERROR_ARG_LINE);        \
		g_error_fct.notice(&e, ##__VA_ARGS__);                         \
	}                                                                      \
} while(0)

/** Call this macro to log DEBUG events */
#define DEBUG(num, text, ...)  do {                                            \
	if(g_error_fct.debug) {                                                \
		struct error e = error_generate(num, ERROR_SEVERITY_DEBUG,     \
								ERROR_ARG_TEXTLOG(text),\
								ERROR_ARG_FILE,         \
								ERROR_ARG_LINE);        \
		g_error_fct.debug(&e, ##__VA_ARGS__);                          \
	}                                                                      \
} while(0)


#endif /* _ERROR_H_ */
