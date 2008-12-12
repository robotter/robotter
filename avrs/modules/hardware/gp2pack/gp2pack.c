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

/** \file gp2pack.c
  * \author JD
  *
  * Use a long range GP2Y0A and a short range GP2D12 to
  * measure distances.
  */

#include "gp2pack.h"

#include <adc.h>
#include <math.h>

void gp2pack_init(gp2pack* gp2, uint8_t nsr, uint8_t nlr)
{
  uint16_t i;

  // Initialize ADC
  adc_init();
  
  // Store ADC numbers
  gp2->adc_longrange = nlr;
  gp2->adc_shortrange = nsr;

  // Zero variables
  gp2->lock = 1;

  gp2->distance = 0;

  gp2->asr = 0;
  gp2->bsr = 0;

  gp2->alr = 0;
  gp2->blr = 0;

  gp2->it = 0;

  gp2->sr_sum = 0;
  gp2->lr_sum = 0;

  gp2->threshold_sr = 0;
  gp2->threshold_lr = 0;

  for(i=0;i<GP2PACK_MEAN_VALUES;i++)
  {
    gp2->sr_values[i] = 0;
    gp2->lr_values[i] = 0;
  }

  return;
}

void gp2pack_setAB( gp2pack* gp2,
                    double asr, double bsr,
                    double alr, double blr)
{
  gp2->asr = asr;
  gp2->bsr = bsr;

  gp2->alr = alr;
  gp2->blr = blr;

  return;
}

void gp2pack_setThreshold( gp2pack* gp2, double tsr, double tlr )
{
  gp2->threshold_sr = tsr;
  gp2->threshold_lr = tlr;

  return;
}

void gp2pack_update( gp2pack* gp2 )
{
  uint16_t adc_value_sr;
  uint16_t adc_value_lr;

  double d_sr;
  double d_lr;

  // get values from ADCs
  adc_value_sr = adc_get_value( (gp2->adc_shortrange)|ADC_REF_AVCC );
  adc_value_lr = adc_get_value( (gp2->adc_longrange)|ADC_REF_AVCC );

  // increment iterator in array
  gp2->it++;

  // if out of bounds set to zero
  if(gp2->it >= GP2PACK_MEAN_VALUES)
    gp2->it = 0;

  // remove previous values from sums
  gp2->sr_sum -= gp2->sr_values[gp2->it];
  gp2->lr_sum -= gp2->lr_values[gp2->it];

  // write down values in arrays
  gp2->sr_values[gp2->it] = adc_value_sr;
  gp2->lr_values[gp2->it] = adc_value_lr;

  // add new value to sums
  gp2->sr_sum += adc_value_sr;
  gp2->lr_sum += adc_value_lr;

  // for the first GP2PACK_MEAN_VALUES updates
  // the array will not be fully filled with values
  // right after the (GP2PACK_MEAN_VALUES-1)th value the lock is released
  if(gp2->lock)
  {
    if (gp2->it == GP2PACK_MEAN_VALUES - 1)
      gp2->lock = 0;
    else
      return;
  }
  
  // process mean
  gp2->mean_sr = (double)(gp2->sr_sum) / GP2PACK_MEAN_VALUES;
  gp2->mean_lr = (double)(gp2->lr_sum) / GP2PACK_MEAN_VALUES;

  // convert GP2* values to distances
  d_sr = (gp2->asr)*pow(gp2->mean_sr, gp2->bsr);
  d_lr = (gp2->alr)*pow(gp2->mean_lr, gp2->blr);

  // threshold selection
  if( (gp2->mean_sr > gp2->threshold_sr)
      &&(gp2->mean_lr > gp2->threshold_lr))
    gp2->distance = d_sr;
  else
    gp2->distance = d_lr;

  return;
}

double gp2pack_getDistance( gp2pack* gp2 )
{
  return gp2->distance;
}

void gp2pack_calibration( gp2pack* gp2,
                          int(*print_debug)(const char*,...),
                          int(*recv_debug)(void))
{
  uint16_t i=0;
  
  double value_63,value_42,value_30,value_15;

  print_debug("GP2PACK CALIBRATION START\n");

  //-------------------------------------------------------------------------------
  print_debug("[GP2PACK CALIBRATION] Put target at 63 cm, any key to go.\n");
  while(!recv_debug());

  for(i=0;i<GP2PACK_MEAN_VALUES;i++)
    gp2pack_update(gp2);

  value_63 = gp2->mean_lr;

  //-------------------------------------------------------------------------------
  print_debug("[GP2PACK CALIBRATION] Put target at 42 cm, any key to go.\n");
  while(!recv_debug());

  for(i=0;i<GP2PACK_MEAN_VALUES;i++)
    gp2pack_update(gp2);

  value_42 = gp2->mean_lr;

  //-------------------------------------------------------------------------------
  print_debug("[GP2PACK CALIBRATION] Put target at 30 cm, any key to go.\n");
  while(!recv_debug());

  for(i=0;i<GP2PACK_MEAN_VALUES;i++)
    gp2pack_update(gp2);

  value_30 = gp2->mean_sr;

  //-------------------------------------------------------------------------------
  print_debug("[GP2PACK CALIBRATION] Put target at 15 cm, any key to go.\n");
  while(!recv_debug());

   for(i=0;i<GP2PACK_MEAN_VALUES;i++)
    gp2pack_update(gp2);

  value_15 = gp2->mean_sr;
  
  print_debug("[GP2PACK CALIBRATION] Raw values : %2.2f %2.2f %2.2f %2.2f\n",
                 value_63,
                 value_42,
                 value_30,
                 value_15);

  // --------------------------------------------------------------------------
  // --------------------------------------------------------------------------

  gp2->alr = exp( 
                  (log(42)*log(value_63) - log(63)*log(value_42))
                  /log(value_63/value_42)
                );
  gp2->blr = log(42.0/63.0) / log( value_42/value_63 );

  gp2->asr = exp( 
                  (log(15)*log(value_30) - log(30)*log(value_15))
                  /log(value_30/value_15)
                );

  gp2->bsr = log(15.0/30.0) / log( value_15/value_30 );

  print_debug("[GP2PACK CALIBRATION] ALR = %3.3f BLR = %3.3f ASR = %3.3f BSR = %3.3f\n",
                gp2->alr, gp2->blr, gp2->asr, gp2->bsr);

  return;
}
