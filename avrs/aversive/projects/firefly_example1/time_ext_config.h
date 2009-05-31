/*  
 *  Copyright Droids Corporation (2008)
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

/*
 * Author : Julien LE GUEN - jlg@jleguen.info
 */
#ifndef _TIME_EXT_CONFIG_H_
#define _TIME_EXT_CONFIG_H_


/* 
 * Speed of your external Quartz (in Hertz)
 * Typically you want it to be a 32.768kHz watch-like quartz
 */
#define TIME_EXT_QUARTZ_FREQ	32768000UL

/* Quartz period (1/freq) in NANO-SECONDS
 * The rounding error here, for a 32768kHz quartz,
 * is of 36450 ns per 24 hours.
 */
#define TIME_EXT_QUARTZ_PERIOD	30518UL


#endif /* _TIME_EXT_CONFIG_H_ */
