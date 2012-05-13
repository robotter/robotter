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

#include <perlimpinpin.h>

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

  m->arms_pos[ARM_LEFT] = POS_HI;
  m->arms_pos[ARM_RIGHT] = POS_HI;

  NOTICE(ACTUATORS_ERROR,"Initializing AX12s");
  actuators_ax12_init(m);

  return;
}

void actuators_arm_raise(actuators_t* m, armPos_t p)
{
  if( p == ARM_LEFT )
    actuators_ax12_setPositionSpeed(m, SETTING_AX12_ID_LEFT_ARM,
                             SETTING_AX12_POS_LARM_RAISED,
                             SETTING_AX12_ARM_SPEED);
  else
    actuators_ax12_setPositionSpeed(m, SETTING_AX12_ID_RIGHT_ARM,
                             SETTING_AX12_POS_RARM_RAISED,
                             SETTING_AX12_ARM_SPEED);
  return;
}

void actuators_arm_mid(actuators_t* m, armPos_t p)
{
  if( p == ARM_LEFT )
    actuators_ax12_setPositionSpeed(m, SETTING_AX12_ID_LEFT_ARM,
                             SETTING_AX12_POS_LARM_MID,
                             SETTING_AX12_ARM_SPEED);
  else
    actuators_ax12_setPositionSpeed(m, SETTING_AX12_ID_RIGHT_ARM,
                             SETTING_AX12_POS_RARM_MID,
                             SETTING_AX12_ARM_SPEED);
  return;
}

void actuators_arm_lower(actuators_t* m, armPos_t p)
{
  if( p == ARM_LEFT )
    actuators_ax12_setPositionSpeed(m, SETTING_AX12_ID_LEFT_ARM,
                             SETTING_AX12_POS_LARM_LOWERED,
                             SETTING_AX12_ARM_SPEED);
  else
    actuators_ax12_setPositionSpeed(m, SETTING_AX12_ID_RIGHT_ARM,
                             SETTING_AX12_POS_RARM_LOWERED,
                             SETTING_AX12_ARM_SPEED);
}

uint8_t actuators_arm_is_raised(actuators_t* m, armPos_t p)
{
  if( p == ARM_LEFT )
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_LEFT_ARM,
                                        SETTING_AX12_POS_LARM_RAISED);
  else
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_RIGHT_ARM,
                                        SETTING_AX12_POS_RARM_RAISED);
}


uint8_t actuators_arm_is_mided(actuators_t* m, armPos_t p)
{
  if( p == ARM_LEFT )
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_LEFT_ARM,
                                        SETTING_AX12_POS_LARM_MID);
  else
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_RIGHT_ARM,
                                        SETTING_AX12_POS_RARM_MID);
}

uint8_t actuators_arm_is_lowered(actuators_t* m, armPos_t p)
{
  if( p == ARM_LEFT )
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_LEFT_ARM,
                                        SETTING_AX12_POS_LARM_LOWERED);
  else
    return 0 != actuators_ax12_checkPosition(m, SETTING_AX12_ID_RIGHT_ARM,
                                        SETTING_AX12_POS_RARM_LOWERED);
}

void actuators_loadDefaults(actuators_t* m)
{
  // load up default EEPROM configuration in AX12s
  actuators_ax12_loadDefaultEEPROMConfig(m, SETTING_AX12_ID_LEFT_ARM);
  actuators_ax12_loadDefaultEEPROMConfig(m, SETTING_AX12_ID_RIGHT_ARM);
}

void actuators_ax12_init(actuators_t* m)
{
  // Check AX12s
  actuators_ax12_check(m, SETTING_AX12_ID_LEFT_ARM);
  actuators_ax12_check(m, SETTING_AX12_ID_RIGHT_ARM);
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

uint8_t actuators_ax12_setPosition(actuators_t* m, uint8_t id, uint16_t pos)
{
  return actuators_ax12_setPositionSpeed(m, id, pos, m->ax12Speed);
}

uint8_t actuators_ax12_setPositionSpeed(actuators_t* m, uint8_t id, uint16_t pos, uint16_t speed)
{
  ax12_user_write_byte(&ax12, id, AA_TORQUE_ENABLE, 1);
  ax12_user_write_int(&ax12, id, AA_MOVING_SPEED_L, speed);
  // set max torque (alarm value)
  ax12_user_write_int(&ax12, id, AA_TORQUE_LIMIT_L, m->ax12Torque);
  // set punch (applied torque)
  ax12_user_write_int(&ax12, id, AA_PUNCH_L, m->ax12Punch);
  ax12_user_write_int(&ax12, id, AA_GOAL_POSITION_L, pos);

  return 1;
}

int16_t actuators_ax12_getPosition(actuators_t* m, uint8_t id)
{
  uint16_t read_pos,trq;
  ax12_user_read_int(&ax12, id, AA_PRESENT_POSITION_L, &read_pos);
  ax12_user_read_int(&ax12, id, AA_PRESENT_LOAD_L, &trq);
  trq &= 0x3FF; // load value (remove sign)
  if( trq > SETTING_AX12_CLAMPING_TORQUE )
    return -1;
  return read_pos;
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

void actuators_arm_send_status(actuators_t* m, armPos_t arm)
{
  int16_t pos;
  uint16_t lpos=0,mpos=0,hpos=0;
  uint8_t armid=ARM_LEFT;
  pos_t armp = POS_NONE;

  switch(arm)
  {
    case ARM_LEFT: 
      armid = SETTING_AX12_ID_LEFT_ARM;
      lpos = SETTING_AX12_POS_LARM_LOWERED;
      mpos = SETTING_AX12_POS_LARM_MID;
      hpos = SETTING_AX12_POS_LARM_RAISED;
      break;
    case ARM_RIGHT: 
      armid = SETTING_AX12_ID_RIGHT_ARM;
      lpos = SETTING_AX12_POS_RARM_LOWERED;
      mpos = SETTING_AX12_POS_RARM_MID;
      hpos = SETTING_AX12_POS_RARM_RAISED;
      break;
    default:
      ERROR(0,"Wrong ARMID %d",arm);
  }
  
  pos = actuators_ax12_getPosition(m, armid);

  if(pos < 0)
  {
    PPP_SEND_ARM_OVERTORQUE(ROID_SUBSCRIBER, arm);
  }
  else
  {
    if(abs(pos-lpos) < SETTING_AX12_WINDOW)
      armp = POS_LOW;
    else if(abs(pos-mpos) < SETTING_AX12_WINDOW)
      armp = POS_MID;
    else if(abs(pos-hpos) < SETTING_AX12_WINDOW)
      armp = POS_HI;

    if((armp != POS_NONE) && (m->arms_pos[arm] != armp))
      PPP_SEND_ARM_AT_POS(ROID_SUBSCRIBER, arm, armp);

    m->arms_pos[arm] = armp;
  }
}

