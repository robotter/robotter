/*  
 *  Copyright RobOtter (2010)
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
 */

#include <string.h>

#ifndef HOST_VERSION
#include <avr/io.h>
#endif

#include <aversive.h>
#include <aversive/error.h>

struct error_fct g_error_fct;

/** All fcts pointers to NULL */
void error_init(void)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	memset(&g_error_fct, 0, sizeof(g_error_fct));
	IRQ_UNLOCK(flags);
}


struct error error_generate(uint8_t num, uint8_t severity, PGM_P t) {
	struct error e;      

	e.err_num = num;
	e.severity = severity;
#ifdef ERROR_DUMP_TEXTLOG
	e.text = t;
#else
	e.text = PSTR("");
#endif
	return e;
}


/** Register log function for EMERG level */
void error_register_emerg(void (*f)(struct error *, ...))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_error_fct.emerg = f;
	IRQ_UNLOCK(flags);
}

/** Register log function for ERROR level */
void error_register_error(void (*f)(struct error *, ...))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_error_fct.error = f;
	IRQ_UNLOCK(flags);
}

/** Register log function for WARNING level */
void error_register_warning(void (*f)(struct error *, ...))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_error_fct.warning = f;
	IRQ_UNLOCK(flags);
}

/** Register log function for NOTICE level */
void error_register_notice(void (*f)(struct error *, ...))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_error_fct.notice = f;
	IRQ_UNLOCK(flags);
}

/** Register log function for DEBUG level */
void error_register_debug(void (*f)(struct error *, ...))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_error_fct.debug = f;
	IRQ_UNLOCK(flags);
}

