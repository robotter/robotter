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

/** \file scanner.c
  * \author JD
  */

#include <aversive.h>
#include <aversive/error.h>
#include <aversive/wait.h>
#include <math.h>
#include <adc.h>

#include "scanner.h"

#include "actuators.h"
#include "settings.h"

extern actuators_t actuators;

int16_t scanner_get_distance(scanner_t n)
{
  uint16_t adcv;
  int32_t pos;
  double a,g,x,y;

  uint16_t start = SETTING_SCANNER_START;
  uint16_t stop = SETTING_SCANNER_STOP;
  uint8_t step = SETTING_SCANNER_STEP;

  uint8_t failed = 1;
  while(1)
  {
    for(pos=start;pos<=stop;pos+=step)
    {
      // set AX12 to pos
      actuators_ax12_setPosition(&actuators, 4, pos);
      while( actuators_ax12_checkPosition(&actuators, 4, pos) == 0 )
        wait_ms(1);

      // wait for GP2D* signal stabilisation
      wait_ms(100);
      adcv = adc_get_value( MUX_ADC2 | ADC_REF_AVCC);

      // -- compute x,y from adcv,pos
      // servo angle
      a = ((512-pos)*300)/1024.0;
      // distance to g
      g = -2.976E-6*pow(adcv,3) + 0.006303*pow(adcv,2) -4.936*adcv + 1664 + 30;
      // x,y
      a = (a*M_PI)/180.0;
      x = g*cos(a);
      y = 205-g*sin(a);

      // pion vu
      if(y > SETTING_SCANNER_Y_THRESHOLD)
      {
        start = pos - step;
        stop = pos + step;
        step /= 2;
        if(step < SETTING_SCANNER_MIN_STEP)
        {
          DEBUG(0,"PALET FOUND @ x=%f",x);
          return (int16_t)x;
        }
        failed = 0;
        break;
      }
    } //for(pos=start;pos<=stop;pos+=step)

    if(failed)
    {
      DEBUG(0,"PALET NOT FOUND");
      return -1;
    }
  }
}

