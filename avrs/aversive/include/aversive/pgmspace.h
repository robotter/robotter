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
 *  Revision : $Id: pgmspace.h,v 1.3 2008-01-08 20:05:02 zer0 Exp $
 *
 */

/**
 * This file is used for compatibility between host and avr : with
 * this we can emulate pgmspace on a host.
 */

#ifndef _AVERSIVE_PGMSPACE_H_
#define _AVERSIVE_PGMSPACE_H_

#ifndef HOST_VERSION

#include <avr/pgmspace.h>


#else

#include <stdint.h>

#define printf_P printf
#define memcmp_P memcmp
#define strcat_P strcat
#define strcmp_P strcmp
#define strncmp_P strncmp
#define strlen_P strlen
#define vfprintf_P vfprintf
#define vsprintf_P vsprintf
#define PGM_P const char *
#define PSTR(x) x
#define PROGMEM

/* XXX don't define it, it's dangerous because it can be used to read
 * an address that have not the same size */
/* #define pgm_read_word(x) (*(x)) */
/* #define pgm_read_byte(x) (*(x)) */

typedef void prog_void;
typedef char prog_char;
typedef unsigned char prog_uchar;
typedef int8_t prog_int8_t;
typedef uint8_t prog_uint8_t;
typedef int16_t prog_int16_t;
typedef uint16_t prog_uint16_t;
typedef int32_t prog_int32_t;
typedef uint32_t prog_uint32_t;
typedef int64_t prog_int64_t;

#endif /* HOST_VERSION */
#endif /* _AVERSIVE_PGMSPACE_H_ */


