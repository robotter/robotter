/*  
 *  Copyright RobOtter (2009) 
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
 */

/** \file logging.h
  * \author JD
  */

#ifndef _LOGGING_H_
#define _LOGGING_H_

#include <aversive.h>
#include <aversive/error.h>


#define ERROR_SEVTEXT_EMERG   "EMERGENCY"
#define ERROR_SEVTEXT_ERROR   "ERROR    "
#define ERROR_SEVTEXT_WARNING "WARNING  "
#define ERROR_SEVTEXT_NOTICE  "NOTICE   "
#define ERROR_SEVTEXT_DEBUG   "DEBUG    "

void log_event(struct error * e, ...);

#endif/*_LOGGING_H_*/
