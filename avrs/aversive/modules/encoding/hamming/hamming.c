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
 *  Revision : $Id: hamming.c,v 1.5 2008-05-14 13:27:13 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Implementation for HAMMING
 *
 * Thanks and hello to Serpilliere
 */

/** \file hamming.c
 *  \brief Implementation for the Hamiing module.
 *
 *  \todo use progmem to store tables !
 *
 *  \test Seems to work
 *
 * This module provides functions for error detection/correction
 */

/**********************************************************/

#include <aversive.h>

#define P_MASK  0x0000808B

#define P0_MASK 0x15555554
#define P1_MASK 0x06666664
#define P2_MASK 0x18787870
#define P3_MASK 0x1F807F00
#define P4_MASK 0x1FFF0000

#define P0_EMPL 0
#define P1_EMPL 1
#define P2_EMPL 3
#define P3_EMPL 7
#define P4_EMPL 15

uint8_t tab_abcd[16]=
  {
    0,
    4,
    16,
    20,
    32,
    36,
    48,
    52,
    64,
    68,
    80,
    84,
    96,
    100,
    112,
    116
  };

uint8_t tab_dcba[32]=
  {
    0,
    1,
    0,
    1,
    2,
    3,
    2,
    3,
    4,
    5,
    4,
    5,
    6,
    7,
    6,
    7,
    8,
    9,
    8,
    9,
    10,
    11,
    10,
    11,
    12,
    13,
    12,
    13,
    14,
    15,
    14,
    15
  };

uint8_t tab_parity[256] =
  {
  0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0 
  };

/*******************************************************/

uint32_t hamming_expand(uint32_t frame)
{
  uint32_t tmp;

  uint16_t frame_middle; // octet 2 & 3
  uint8_t frame_last; // octet 3

  tmp = tab_abcd[(uint8_t)frame&0x0F];
  
  tmp |= (frame & 0x7F0) << 4;
  
  frame_middle =  extr32_16_mid(frame);
  tmp |= (uint32_t)(frame_middle & 0x7F8) << 13;

  
  frame_last = extr32_08_2(frame);
  tmp |= (uint32_t)(frame_last >> 3) << 24 ;

  return tmp;
}

/*******************************************************/

uint32_t hamming_shrink(uint32_t frame)
{
  uint32_t ret;
  uint8_t tmp;

  ret = tab_dcba[ (((uint8_t)frame) >> 2) & 0x1F ];
  
  tmp = * ((uint8_t *)(&frame) + 1);
  ret += (uint16_t)(tmp&0x7F) << 4;

  tmp = * ((uint8_t *)(&frame) + 2);
  ret += (uint32_t)tmp << 11;

  tmp = * ((uint8_t *)(&frame) + 3);
  ret += (uint32_t)(tmp&0x1F) << 19;
  
  return ret;
}

/*******************************************************/

uint32_t hamming_process(uint32_t frame)
{
  uint32_t tmp;
  uint8_t xor;

  tmp = frame&P0_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if(tab_parity[xor])
    frame |= (1l<<P0_EMPL);
	  
  tmp = frame&P1_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if(tab_parity[xor])
    frame |= (1l<<P1_EMPL);

  tmp = frame&P2_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if(tab_parity[xor])
    frame |= (1l<<P2_EMPL);

  tmp = frame&P3_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if(tab_parity[xor])
    frame |= (1l<<P3_EMPL);

  tmp = frame&P4_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if(tab_parity[xor])
    frame |= (1l<<P4_EMPL);

  return frame;
}

/*******************************************************/

uint8_t hamming_unprocess(uint32_t frame)
{
  uint32_t tmp;
  uint8_t xor;
  uint8_t indice=0;

  tmp = frame&P0_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if((1l<<P0_EMPL)&frame)
    xor ^= 1;

  if(tab_parity[xor])
    indice |= 1;
    
	  
  tmp = frame&P1_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if((1l<<P1_EMPL)&frame)
    xor ^= 1;

  if(tab_parity[xor])
    indice |= 2;

  tmp = frame&P2_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if((1l<<P2_EMPL)&frame)
    xor ^= 1;

  if(tab_parity[xor])
    indice |=4;

  tmp = frame&P3_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );

  if((1l<<P3_EMPL)&frame)
    xor ^= 1;

  if(tab_parity[xor])
    indice |=8;

  tmp = frame&P4_MASK;
  xor = ( (* (((uint8_t *)&tmp) + 0) ) ^
	  (* (((uint8_t *)&tmp) + 1) ) ^
	  (* (((uint8_t *)&tmp) + 2) ) ^
	  (* (((uint8_t *)&tmp) + 3) ) );
  
  if((1l<<P4_EMPL)&frame)
    xor ^= 1;

  if(tab_parity[xor])
    indice |=16;

  return indice;
}


/*****************************/

uint32_t hamming_correct(uint32_t frame, uint8_t i)
{
  return frame ^ (1l<<(i-1));
}

/*****************************/


void hamming_do(uint32_t *frame)
{
  *frame= hamming_process(hamming_expand(*frame));
}

/*******************************************************/

uint8_t hamming_undo(uint32_t *frame)
{
  uint8_t tmp;

  tmp=hamming_unprocess(*frame);

  if(tmp)
    *frame= hamming_shrink(hamming_correct(*frame,tmp));
  else
    *frame= hamming_shrink(*frame);


  return tmp;
}



