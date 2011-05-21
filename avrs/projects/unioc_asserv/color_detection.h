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

#ifndef COLOR_DETECTION_H
#define COLOR_DETECTION_H

#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/error.h>

#define FPGA_ID(b) _SFR_MEM8((b)+0)
#define FPGA_ENABLE(b) _SFR_MEM8((b)+1)
#define FPGA_COLOR(b) _SFR_MEM8((b)+2)
#define FPGA_RED_THRESHOLD(b) _SFR_MEM16((b)+3)
#define FPGA_BLUE_THRESHOLD(b) _SFR_MEM16((b)+5)

#define FPGA_REGISTER_COLOR_RED 0x01
#define FPGA_REGISTER_COLOR_BLUE 0x02

typedef enum
{
  CO_RED = 0,
  CO_BLUE,
  CO_NONE

} color_t;

typedef struct
{
  uint16_t base_addr;

} color_detector_t;

/** @brief Initialize one color detector 
 *  @param addr Detector FPGA base address
 */
void color_detection_init(color_detector_t*, uint16_t addr);

/** @brief Set detector threshold */
void color_detection_set_threshold(color_detector_t*, color_t color, uint16_t threshold);

/** @brief Get detection result */
color_t color_detection_get_color(color_detector_t*);

#endif/*COLOR_DETECTION_H*/
