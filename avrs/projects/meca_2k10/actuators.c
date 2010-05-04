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

/** \file actuators.c
  * \author JD
  */

#include <aversive.h>
#include <aversive/error.h>
#include <ax12.h>

#include "cli.h"
#include "logging.h"
#include "settings.h"

#include "actuators.h"

extern AX12 ax12;

void actuators_init(actuators_t* m)
{
  m->ax12Speed = SETTING_AX12_DEFAULT_SPEED;
  m->ax12Torque = SETTING_AX12_DEFAULT_TORQUE;
  m->ax12Punch = SETTING_AX12_DEFAULT_PUNCH;

  NOTICE(ACTUATORS_ERROR,"Initializing AX12s");
  actuators_ax12_init(m);

  return;
}

void actuators_clamp_close(actuators_t* m, clampPos_t p)
{
  // left clamp
  if( p == CT_LEFT )
    actuators_ax12_setPosition(m, SETTING_AX12_ID_LEFT_CLAMP_A,
                                  SETTING_AX12_POS_LCA_CLOSED);
  // right clamp
  else
     actuators_ax12_setPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_A,
                                  SETTING_AX12_POS_RCA_CLOSED);   

  return;
}

void actuators_clamp_open(actuators_t* m, clampPos_t p)
{

  // left clamp
  if( p == CT_LEFT )
    actuators_ax12_setPosition(m, SETTING_AX12_ID_LEFT_CLAMP_A,
                                  SETTING_AX12_POS_LCA_OPENED);
  // right clamp
  else
     actuators_ax12_setPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_A,
                                  SETTING_AX12_POS_RCA_OPENED);   

  return;
}

uint8_t actuators_clamp_isClosed(actuators_t* m, clampPos_t p)
{
  if( p == CT_LEFT )
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_LEFT_CLAMP_A,
                                        SETTING_AX12_POS_LCA_CLOSED);
  else
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_A,
                                        SETTING_AX12_POS_RCA_CLOSED);
}

uint8_t actuators_clamp_isOpened(actuators_t* m, clampPos_t p)
{
  if( p == CT_LEFT )
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_LEFT_CLAMP_A,
                                        SETTING_AX12_POS_LCA_OPENED);
  else
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_A,
                                        SETTING_AX12_POS_RCA_OPENED);
}

void actuators_clamp_raise(actuators_t* m, clampPos_t p)
{
  if( p == CT_LEFT )
    actuators_ax12_setPosition(m, SETTING_AX12_ID_LEFT_CLAMP_B,
                             SETTING_AX12_POS_LCB_RAISED);
  else
    actuators_ax12_setPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_B,
                             SETTING_AX12_POS_RCB_RAISED);
  return;
}

void actuators_clamp_lower(actuators_t* m, clampPos_t p)
{
  if( p == CT_LEFT )
    actuators_ax12_setPosition(m, SETTING_AX12_ID_LEFT_CLAMP_B,
                             SETTING_AX12_POS_LCB_LOWERED);
  else
    actuators_ax12_setPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_B,
                             SETTING_AX12_POS_RCB_LOWERED);
}

uint8_t actuators_clamp_isRaised(actuators_t* m, clampPos_t p)
{
  if( p == CT_LEFT )
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_LEFT_CLAMP_B,
                                        SETTING_AX12_POS_LCB_RAISED);
  else
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_B,
                                        SETTING_AX12_POS_RCB_RAISED);
}

uint8_t actuators_clamp_isLowered(actuators_t* m, clampPos_t p)
{
  if( p == CT_LEFT )
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_LEFT_CLAMP_B,
                                        SETTING_AX12_POS_LCB_LOWERED);
  else
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_RIGHT_CLAMP_B,
                                        SETTING_AX12_POS_RCB_LOWERED);
}

void actuators_scanner_setAngle(actuators_t* m, int16_t angle)
{
  // move scanner AX12
  actuators_ax12_setPosition(m, SETTING_AX12_ID_SCANNER,
                                SETTING_AX12_SCANNER_CENTER + angle);

  return;
}

void actuators_loadDefaults(actuators_t* m)
{
  // load up default EEPROM configuration in AX12s
  actuators_ax12_loadDefaultEEPROMConfig(m, SETTING_AX12_ID_LEFT_CLAMP_A);
  actuators_ax12_loadDefaultEEPROMConfig(m, SETTING_AX12_ID_LEFT_CLAMP_B);
  actuators_ax12_loadDefaultEEPROMConfig(m, SETTING_AX12_ID_RIGHT_CLAMP_A);
  actuators_ax12_loadDefaultEEPROMConfig(m, SETTING_AX12_ID_RIGHT_CLAMP_B);
  //actuators_ax12_loadDefaultEEPROMConfig(m, SETTING_AX12_ID_SCANNER);
}

void actuators_ax12_init(actuators_t* m)
{
  // Check AX12s
  actuators_ax12_check(m, SETTING_AX12_ID_LEFT_CLAMP_A);
  actuators_ax12_check(m, SETTING_AX12_ID_LEFT_CLAMP_B);
  actuators_ax12_check(m, SETTING_AX12_ID_RIGHT_CLAMP_A);
  actuators_ax12_check(m, SETTING_AX12_ID_RIGHT_CLAMP_B);
  actuators_ax12_check(m, SETTING_AX12_ID_SCANNER);

  return;
}

void actuators_ax12_loadDefaultEEPROMConfig(actuators_t* m, uint8_t id)
{
  ax12_user_write_byte(&ax12, id, AA_DELAY_TIME, 0xFA);
  ax12_user_write_int(&ax12, id, AA_CW_ANGLE_LIMIT_L, 0x00);
  ax12_user_write_int(&ax12, id, AA_CCW_ANGLE_LIMIT_L, 0x3FF);
  ax12_user_write_byte(&ax12, id, AA_HIGHEST_LIMIT_TEMP, 0x55);
  ax12_user_write_byte(&ax12, id, AA_LOWEST_LIMIT_VOLTAGE, 0x3C);
  ax12_user_write_byte(&ax12, id, AA_HIGHEST_LIMIT_VOLTAGE, 0xBE);
  ax12_user_write_int(&ax12, id, AA_MAX_TORQUE_L, 0x3FF);
  ax12_user_write_byte(&ax12, id, AA_STATUS_RETURN_LEVEL, 0x02);
  ax12_user_write_byte(&ax12, id, AA_ALARM_LED, 0x04);
  ax12_user_write_byte(&ax12, id, AA_ALARM_SHUTDOWN, 0x04);
}

uint8_t actuators_ax12_check(actuators_t* m, uint8_t id)
{
  uint16_t mn = 0;
  ax12_user_read_int(&ax12, id, AA_MODEL_NUMBER_L, &mn);

  if(mn != SETTING_AX12_MODEL_NUMBER)
  {
    WARNING(ACTUATORS_ERROR, "AX12 ID=0x%02x not responding", id); 
    return 0;
  }

  return 1;
}

uint8_t actuators_ax12_setPosition(actuators_t* m,
                                   uint8_t id, uint16_t pos)
{
  ax12_user_write_byte(&ax12, id, AA_TORQUE_ENABLE, 1);
  ax12_user_write_int(&ax12, id, AA_MOVING_SPEED_L, m->ax12Speed);
  // set max torque (alarm value)
  ax12_user_write_int(&ax12, id, AA_TORQUE_LIMIT_L, m->ax12Torque);
  // set punch (applied torque)
  ax12_user_write_int(&ax12, id, AA_PUNCH_L, m->ax12Punch);
  ax12_user_write_int(&ax12, id, AA_GOAL_POSITION_L, pos);

  return 1;
}


uint8_t actuators_ax12_checkPosition(actuators_t* m, uint8_t id, uint16_t pos)
{
  // in position?
  uint16_t read_pos;
  ax12_user_read_int(&ax12, id, AA_PRESENT_POSITION_L, &read_pos);
  if( abs(pos-read_pos) < SETTING_AX12_WINDOW )
    return 1;

  // overtorque?
  uint16_t trq;
  ax12_user_read_int(&ax12, id, AA_PRESENT_LOAD_L, &trq);
  trq &= 0x3FF; // load value (remove sign)
  if( trq > SETTING_AX12_CLAMPING_TORQUE )
    return 2;

  return 0;
}

