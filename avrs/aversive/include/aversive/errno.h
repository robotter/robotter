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
 *  Revision : $Id: errno.h,v 1.3 2009-03-15 21:51:14 zer0 Exp $
 *
 */

/* This file contains general errors that can be returned from functions 
 * We have to be carreful and try to return these error as often as possible
 * isntead of a function-specific value 
 */

#ifndef _AVERSIVE_ERRNO_H_
#define _AVERSIVE_ERRNO_H_

#ifndef HOST_VERSION

/* from avr-libc, does not define a lots of errors */
#include <errno.h>

/** No error */
#define ESUCCESS 0
/** Operation not permitted */
#define EPERM    1
/** No such file or directory */
#define ENOENT   2
/** I/O error */
#define EIO      5
/** No such device or address */
#define ENXIO    6
/** Argument list too long */
#define E2BIG    7
/** Try again */
#define EAGAIN   11
/** Out of memory */
#define ENOMEM   12
/** Bad address */
#define EFAULT   14
/** Device or resource busy */
#define EBUSY    16
/** Invalid argument */
#define EINVAL   22
/** Domain error */
/* #define EDOM       33 */ /* in libc */
/** Range error */
/* #define ERANGE     34 */ /* in libc */
/** Not supported */
#define ENOTSUP  126 /* the correct number is 128 */
/** Unkwow error */
#define EUNKNOW  127

/* must not be > 127 because it can be stored on an int8_t */

#else /* HOST_VERSION */
#include <sys/errno.h>

#endif /* HOST_VERSION */

#endif /* AVERSIVE_ERRNO_H_ */
