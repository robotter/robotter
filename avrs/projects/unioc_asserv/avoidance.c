/*  
 *  Copyright RobOtter (2010)
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

/** \file avoidance.c
  * \author JD
  */

#include <aversive/error.h>

#include <adc.h>
#include "settings.h"

#include "avoidance.h"

/** @brief Initialize avoidance systems */
void avoidance_init(avoidance_t* av)
{
  av->gp2_it = 0;

  av->gp2_muxs[0] = SETTING_AVOIDANCE_GP2ARRAY_60;
  av->gp2_muxs[1] = SETTING_AVOIDANCE_GP2ARRAY_180;
  av->gp2_muxs[2] = SETTING_AVOIDANCE_GP2ARRAY_300;
}

/** @brief Update avoidance system */
void avoidance_update(avoidance_t* av)
{
  uint16_t adcval;
  uint8_t *pv;

  // get new ADC measure (from a previously launched one)
  adcval = 
    adc_get_value( av->gp2_muxs[av->gp2_it] | ADC_REF_AVCC );

  pv = av->gp2_detections + av->gp2_it;

  // if ADC over threshold (something detected)
  if( adcval > SETTING_AVOIDANCE_GP2ARRAY_THRESHOLD )
  {
    if(*pv < 255)
      (*pv)++;
  }
  else
    *pv = 0;

  // increment gp2 sensor muxer
  av->gp2_it++;
  
  if(av->gp2_it >= SETTING_AVOIDANCE_GP2ARRAY_SIZE)
    av->gp2_it = 0;

  // launch new ADC measure
  adc_launch( av->gp2_muxs[av->gp2_it] | ADC_REF_AVCC );

}

/** @brief Check avoidance sensors */
direction_t avoidance_check(avoidance_t* av)
{
  uint16_t rv = DIR_NONE;

  if( av->gp2_detections[0] > SETTING_AVOIDANCE_GP2ARRAY_COUNT )
    rv |= DIR_60;

  if( av->gp2_detections[1] > SETTING_AVOIDANCE_GP2ARRAY_COUNT )
    rv |= DIR_180;

  if( av->gp2_detections[2] > SETTING_AVOIDANCE_GP2ARRAY_COUNT )
    rv |= DIR_300;

  return rv;
}
