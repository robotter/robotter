/*  
 *  Copyright RobOtter (2008) 
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

/** \file gp2pack.h
  * \author JD
  *
  * Use a long range GP2Y0A and a short range GP2D12 to
  * measure distances.
  *
  */


#ifndef GP2PACK_H
#define GP2PACK_H

#include <aversive.h>

#include "gp2pack_config.h"

typedef struct
{
  /// long range GP2 ADC number
  uint8_t adc_longrange;
  /// short range GP2 ADC number
  uint8_t adc_shortrange;

  /// a parameter short range
  double asr;
  /// b parameter short range
  double bsr;

  /// a parameter long range
  double alr;
  /// b parameter long range
  double blr;

  /// lock freed when more than GP2PACK_MEAN_VALUES have been measured
  uint8_t lock;

  /// array used in mean calculation (short range)
  uint16_t sr_values[GP2PACK_MEAN_VALUES];
  /// array used in mean calculation (long range)
  uint16_t lr_values[GP2PACK_MEAN_VALUES];
  /// array sums (short range)
  uint32_t sr_sum;
  /// array sums (long range)
  uint32_t lr_sum;

  /// iterator used in mean calculation
  uint16_t it;

  /// mean value short range
  double mean_sr;
  /// mean value long range
  double mean_lr;

  /// short range threshold
  double threshold_sr;

  /// long range threshold
  double threshold_lr;

  /// measured distance
  double distance;


}gp2pack;

/** \brief Initialize module
  * \param nsr ADC pin number for short range GP2
  * \param nlr ADC pin number for long range GP2
  */
void gp2pack_init(gp2pack*,uint8_t nsr,uint8_t nlr);

/** \brief Set up AB parameters for short range and long range 
  * \param asr A parameter for short range GP2
  * \param bsr B parameter for short range GP2
  * \param alr A parameter for short range GP2
  * \param blr B parameter for short range GP2
  */
void gp2pack_setAB(gp2pack*, double asr, double bsr, double alr, double blr);

/** \brief Set up threshold values for short range and long range 
  * \param tsr Short range threshold value
  * \param tlr Long range threshold value
  */
void gp2pack_setThreshold(gp2pack*, double tsr, double tlr);

/** \brief Update module */
void gp2pack_update(gp2pack*);

/** \brief Get distance */
double gp2pack_getDistance(gp2pack*);


/** \brief Module calibration 
  * \todo Threshold calibration still not performed by this function
  * \param gp2 pointer to a gp2pack instance
  * \param print_debug pointer to stdlib printf, to display information while calibrating
  * \param recv_debug pointer to aversive/uart uartX_recv, to ask user for input while calibrating
  **/
void gp2pack_calibration( gp2pack* gp2,
                          int(*print_debug)(const char*,...),
                          int(*recv_debug)(void));

#endif/*GP2PACK_H*/
