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
 *  Revision : $Id: quadramp_derivate.h,v 1.3 2008-01-08 22:12:04 zer0 Exp $
 *
 */

#ifndef _QUADRAMP_DERIVATE_H_
#define _QUADRAMP_DERIVATE_H_

#include <aversive.h>

struct quadramp_derivate_filter
{
    uint32_t var_2nd_ord_pos;
    uint32_t var_2nd_ord_neg;
    uint32_t var_1st_ord_pos;
    uint32_t var_1st_ord_neg;

    int32_t previous_in_position;
    int32_t previous_out_speed;
    
    int32_t goal_window;
    int32_t gain_anticipation; /* fixed point value, * 1/256 */
    
    int32_t pivot;   /* debug only */
    
    uint8_t divisor;
    uint8_t divisor_counter;
};

/** Initialization of the filter
    as this filter has always an infinite gain, it is initilized with an integrative infinite gain limited by 1 */
extern inline void quadramp_derivate_init(struct quadramp_derivate_filter * r);

/** set the anticipation value. This gain is a fixed point value that will be divided by 256.
    set this gain to have enough anticipation, so the goal is not atteined with too much speed.
    too much, and the goal will be overlooked, and the system will oscillate.
    Too less, and the goal will be atteined with speed, and the goal window will eventually cutoff brutally
    */
extern inline void quadramp_derivate_set_gain_anticipation(struct quadramp_derivate_filter * q, uint16_t gain_anticipation);

/** goal window is a shutdown of the integration when the goal is atteined.
    this aims to get rid of the very little oscillations when immobile */
extern inline void quadramp_derivate_set_goal_window(struct quadramp_derivate_filter * q, uint32_t goal_window);

/** as in the quadramp, we can set here the maximum speed (1st order) and maximum acceleration (2nd order)
    and this in both directions, positive, and negative.  */
extern inline void quadramp_derivate_set_2nd_order_vars(struct quadramp_derivate_filter * q, uint32_t var_2nd_ord_pos, uint32_t var_2nd_ord_neg);
extern inline void quadramp_derivate_set_1st_order_vars(struct quadramp_derivate_filter * q, uint32_t var_1st_ord_pos, uint32_t var_1st_ord_neg);

/** this sets a divisor. (executing only 1 time of n) 
    this permits to make a bigger resolution on the speed and acceleration consign.
    
    default is 1.
    When using n>1, the new acceleration (2nd order) unit is divided by n (increasing precision)
    The speed remains at the same unit.
    
    The drawback is that the speed will have the forma of a stair, so do not abuse of it !
    */
extern inline void quadramp_derivate_set_divisor(struct quadramp_derivate_filter * q, uint8_t divisor);


/**
 * Process the ramp
 * 
 * \param data should be a (struct quadramp_filter *) pointer
 * \param in is the input of the filter
 *
 * the input is a position (relative to goal)
 * The output of the function is a speed, which is typically fed as consign to a speed PID.
 * Beware !! the speed unit at the output must absolutely be the same that the derivate of the input, 
 * which means that the frequency of the quadramp_derivate_do_filter must be the same than that of the speed PID.
 */
extern int32_t quadramp_derivate_do_filter(void * data, int32_t in);

#endif
