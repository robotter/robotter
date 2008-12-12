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
 *  Revision : $Id: diagnostic_config.h,v 1.2 2007-03-04 13:53:45 zer0 Exp $
 *
 */

#ifndef _DEBUG_CONFIG_
#define _DEBUG_CONFIG_ 1.0 // version


/** port line definition for the show_int_loop() function */
#define INTERRUPT_SHOW_PORT PORTF
#define INTERRUPT_SHOW_BIT  0



/** memory mark for the min_stack_space_available() function
    the ram is filled with this value after a reset ! */
#define MARK 0x55

/** the mark is inserted in whole RAM if this is enabled 
    (could lead to problems if you need to hold values through a reset...)
    so it's better to disable it.
    stack counting is not affected */
//#ifdef DIAG_FILL_ENTIRE_RAM


#endif //_DEBUG_CONFIG_
