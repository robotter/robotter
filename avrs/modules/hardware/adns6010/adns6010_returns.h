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

/** @file adns6010_returns.h
  * @author JD
  *
  * ADNS6010 functions return values
  */

#ifndef _ADNS6010_RETURNS_H_
#define _ADNS6010_RETURNS_H_

#define ADNS6010_RV_OK 0x00

#define ADNS6010_RV_ADNS1_SROMIDFAIL 0x10
#define ADNS6010_RV_ADNS2_SROMIDFAIL 0x11
#define ADNS6010_RV_ADNS3_SROMIDFAIL 0x12

#define ADNS6010_RV_ADNS1_SROMCRCFAIL 0x20
#define ADNS6010_RV_ADNS2_SROMCRCFAIL 0x21
#define ADNS6010_RV_ADNS3_SROMCRCFAIL 0x22

#define ADNS6010_RV_ADNS1_FAULTFAIL 0x30
#define ADNS6010_RV_ADNS2_FAULTFAIL 0x31
#define ADNS6010_RV_ADNS3_FAULTFAIL 0x32

#define ADNS6010_RV_ADNS1_LPVALIDFAIL 0x40
#define ADNS6010_RV_ADNS2_LPVALIDFAIL 0x41
#define ADNS6010_RV_ADNS3_LPVALIDFAIL 0x42

#define ADNS6010_RV_ADNS1_SROMCODEFAIL 0x50
#define ADNS6010_RV_ADNS2_SROMCODEFAIL 0x51
#define ADNS6010_RV_ADNS3_SROMCODEFAIL 0x52

#define ADNS6010_RV_ADNS1_NPDPULSEFAIL 0x60
#define ADNS6010_RV_ADNS2_NPDPULSEFAIL 0x61
#define ADNS6010_RV_ADNS3_NPDPULSEFAIL 0x62

#define ADNS6010_RV_BAD_CONFIGURATION 0xA0

#endif/*_ADNS6010_RETURNS_H_*/
