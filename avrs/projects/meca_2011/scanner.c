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

#define SIN_60 (0.86602540378443871)
#define COS_60 (0.49999999999999994)

static void _rotate(armPos_t n, double *x, double *y)
{
  double xn,yn;
  *y += SETTING_SCANNER_R0;
  switch(n)
  {
    case ARM_LEFT:
      xn = (*x)*COS_60 - (*y)*SIN_60;
      yn = (*x)*SIN_60 + (*y)*COS_60;
      break;
    case ARM_RIGHT:
      xn = (*x)*COS_60 + (*y)*SIN_60;
      yn = -(*x)*SIN_60 + (*y)*COS_60;
      break;
    default: break;
  }
  *x = xn; *y = yn;
}


int16_t scanner_detect(armPos_t n, double *px, double *py, double *ph)
{
  int16_t yr = 0,yl = 0;
  int16_t xr,xl;
  int32_t bmin, bmax;
  double vx,vy,vnorm,a,k,hl,hr;

  switch(n)
  {
    case ARM_LEFT:
      yr = scanner_do_scan(MUX_ADC2, MUX_ADC3,
                  ARM_LEFT, SETTING_AX12_ID_LEFT_SCANNER,
                  SETTING_SCANNER_START, SETTING_SCANNER_STOP,
                  SETTING_SCANNER_STEP,
                  &bmin, &bmax, &hr);
  
      yl = scanner_do_scan(MUX_ADC3, 0, 
                        ARM_LEFT, SETTING_AX12_ID_LEFT_SCANNER,
                        bmin, bmax,
                        (bmax - bmin)/2,
                        NULL, NULL, &hl);
      xr = SETTING_SCANNER_LEFT_DXR;
      xl = SETTING_SCANNER_LEFT_DXL;
      break;
    case ARM_RIGHT:
      yr = scanner_do_scan(MUX_ADC1, MUX_ADC0,
                  ARM_RIGHT, SETTING_AX12_ID_RIGHT_SCANNER,
                  SETTING_SCANNER_START, SETTING_SCANNER_STOP,
                  SETTING_SCANNER_STEP,
                  &bmin, &bmax, &hr);
  
      yl = scanner_do_scan(MUX_ADC0, 0, 
                        ARM_RIGHT, SETTING_AX12_ID_RIGHT_SCANNER, 
                        bmin, bmax,
                        (bmax - bmin)/2,
                        NULL, NULL, &hl);
      xr = SETTING_SCANNER_RIGHT_DXR;
      xl = SETTING_SCANNER_RIGHT_DXL;
      break;
    default:
      ERROR(0,"Wrong side");
  }

  // both scanners found pawn
  if( (yr > 0) && (yl > 0))
  {
    vx = 0.5*(xr-xl);
    vy = 0.5*(yr-yl);
      
    vnorm = vx*vx + vy*vy;
    a = sqrt(SETTING_PLAYGROUND_PAWN_R*SETTING_PLAYGROUND_PAWN_R-vnorm);
    k = a/sqrt(vnorm);

    *px = xl + vx - k*vy;
    *py = yl + vy + k*vx;
    *ph = 0.5*(hl + hr);
    _rotate(n,px,py);
    DEBUG(0,"PAWN FOUND (CERTAIN) C( %1.1f, %1.1f, %1.1f )",*px,*py,*ph);
    return SCC_GOOD;
  }
  // right scanner got pawn
  else if (yr > 0)
  {
    *px = xr + 0.5*M_SQRT2*SETTING_PLAYGROUND_PAWN_R;
    *py = yr + 0.5*M_SQRT2*SETTING_PLAYGROUND_PAWN_R;
    *ph = hr;
    _rotate(n,px,py);
    DEBUG(0,"PAWN FOUND (UNCERTAIN) C( %1.1f, %1.1f, %1.1f )",*px,*py,*ph);
    return SCC_BAD;
  }
  else if (yl > 0)
  {
    *px = xl - 0.5*M_SQRT2*SETTING_PLAYGROUND_PAWN_R;
    *py = yl + 0.5*M_SQRT2*SETTING_PLAYGROUND_PAWN_R;
    *ph = hl;
    _rotate(n,px,py);
    DEBUG(0,"PAWN FOUND (UNCERTAIN) C( %1.1f, %1.1f, %1.1f )",*px,*py,*ph);
    return SCC_BAD;
  }
  else
  {
    *px = 0.0;
    *py = 0.0;
    *ph = 0.0;
    DEBUG(0,"PAWN NOT FOUND");
    return SCC_NONE;
  }

  wait_ms(2000);

  return 0;
}

/** @brief Convert GP2 ADC value to position */
static void _gp2_convert(armPos_t p, uint16_t adcv, int32_t pos, double *y, double *z)
{
  double a,g;
  uint16_t zp;
  switch(p)
  {
    case ARM_LEFT: zp =  SETTING_SCANNER_LEFT_DELTA; break;
    case ARM_RIGHT: zp = SETTING_SCANNER_RIGHT_DELTA; break;
    default: zp=0; break;
  }
  // servo angle
  a = ((512+zp-pos)*300)/1024.0;
  // distance to g
  g = -2.976E-6*pow(adcv,3) + 0.006303*pow(adcv,2) -4.936*adcv + 1664 + 30;
  // x,y
  a = (a*M_PI)/180.0;
  *y = g*cos(a);
  *z = SETTING_SCANNER_HEIGHT-g*sin(a);
}

/** @brief Get scanner position to distance y */
static int32_t _gp2_lookat(armPos_t p, double y, double z)
{
  uint16_t zp;
  switch(p)
  {
    case ARM_LEFT: zp =  SETTING_SCANNER_LEFT_DELTA; break;
    case ARM_RIGHT: zp = SETTING_SCANNER_RIGHT_DELTA; break;
    default: zp = 0; break;
  }
  double a;
  a = atan2(SETTING_SCANNER_HEIGHT-z,y);
  a = (a*180.0)/M_PI;
  a = (a*1024)/300;
  return (512+zp-a);
}

uint16_t scanner_get_z(armPos_t n)
{
  double y,z;
  uint16_t pos;
  uint16_t adcv;

  switch(n)
  {
    case ARM_LEFT:
      pos = actuators_ax12_getPosition(&actuators, SETTING_AX12_ID_LEFT_SCANNER);
      adcv = adc_get_value( MUX_ADC1 | ADC_REF_AVCC );
      _gp2_convert(ARM_LEFT, adcv, pos, &y, &z);
      break;

    case ARM_RIGHT:
      pos = actuators_ax12_getPosition(&actuators, SETTING_AX12_ID_RIGHT_SCANNER);
      _gp2_convert(ARM_RIGHT, adcv, pos, &y, &z);
      break;

    default:break;
  }
  
  return z;
}

int16_t scanner_do_scan(uint8_t muxa, uint8_t muxb,
                        armPos_t arm, uint8_t ax12id,
                        uint16_t start, uint16_t stop, uint16_t step,
                        int32_t *bmin, int32_t *bmax, double *height)
{
  uint16_t adcv = 0,adcvb = 0;
  int32_t pos;
  double y,z,yb,zb;

  *height = -1;

  if(muxb)
  {
    *bmin = start;
    *bmax = stop;
  }

  uint8_t failed;
  while(1)
  {
    failed = 1;
    for(pos=start;pos<=stop;pos+=step)
    {
      // set AX12 to pos
      actuators_ax12_setPosition(&actuators, ax12id, pos);
      while( actuators_ax12_checkPosition(&actuators, ax12id, pos) == 0 )
        wait_ms(1);

      // wait for GP2D* signal stabilisation
      wait_ms(100);
      adcv = adc_get_value( muxa | ADC_REF_AVCC);
      if(muxb)
        adcvb = adc_get_value( muxb | ADC_REF_AVCC);

      // -- compute x,y from adcv,pos
      _gp2_convert(arm,adcv,pos,&y,&z);
      if(muxb)
        _gp2_convert(arm,adcvb,pos,&yb,&zb);

      // pawn saw by A detector
      if(z > SETTING_SCANNER_Z_THRESHOLD)
      {
        start = pos - step;
        stop = pos + step;
        step /= 2;
        if(step < SETTING_SCANNER_MIN_STEP)
        {
          // before returning measure pawn height
          pos = _gp2_lookat(arm,y+30,60);

          actuators_ax12_setPosition(&actuators, ax12id, pos);
          while( actuators_ax12_checkPosition(&actuators, ax12id, pos) == 0 )
            wait_ms(1);         
          wait_ms(100);
          adcv = adc_get_value( muxa | ADC_REF_AVCC);
          _gp2_convert(arm,adcv,pos,&y,height);

          return (int16_t)y;
        }
        failed = 0;
        break;
      }

      // pawn saw by B detector
      if(muxb)
      {
       if(zb > SETTING_SCANNER_Z_THRESHOLD)
       {
         if(*bmax != stop) *bmax = pos;
       }
       else
         *bmin = pos;
      }
    } //for(pos=start;pos<=stop;pos+=step)

    if(failed)
      return -1;
  }
}

void scanner_look_at(armPos_t arm, double y)
{
  uint16_t pos;
  
  pos = _gp2_lookat(arm, y, 0.0);

  switch(arm)
  {
    case ARM_LEFT:
      actuators_ax12_setPosition(&actuators, 
                                  SETTING_AX12_ID_LEFT_SCANNER, pos);
      break;

    case ARM_RIGHT:
      actuators_ax12_setPosition(&actuators,
                                  SETTING_AX12_ID_RIGHT_SCANNER, pos);
      break;

    default: break;
  }
}


