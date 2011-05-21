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

#include "color_detection.h"

void color_detection_init(color_detector_t* cd, uint16_t addr)
{
  cd->base_addr = addr;

  // turn on color detector
  FPGA_ENABLE(cd->base_addr) = 0x01;
}

void color_detection_set_threshold(color_detector_t* cd, color_t color, uint16_t threshold)
{
  switch(color)
  {
    case CO_RED:
      FPGA_RED_THRESHOLD(cd->base_addr) = threshold;
      break;

    case CO_BLUE:
      FPGA_BLUE_THRESHOLD(cd->base_addr) = threshold;
      break;

    default:
      ERROR(0,"bad color specified (color=%d)",color);
  }
}

color_t color_detection_get_color(color_detector_t* cd)
{
  uint8_t status = FPGA_COLOR(cd->base_addr);

  if(status & FPGA_REGISTER_COLOR_RED)
    return CO_RED;

  if(status & FPGA_REGISTER_COLOR_BLUE)
    return CO_BLUE;

  return CO_NONE;
}


