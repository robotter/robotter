/*
 * Copyright RobOtter (2011)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/** @file
 * @brief Perlimpinpin symbols for slave $$ppp:self.device.name$$.
 * @date $$ppp:time.strftime('%Y-%m-%d %H:%m:%S')$$
 *
 * The user must define the ppp_command_callback() function in a separate
 * object file.
 */

#ifndef PERLIMPINPIN_H
#define PERLIMPINPIN_H

/// Initialize perlimpinpin communications.
void ppp_init(void);

/// Handle I2C pending events, for slaves.
void ppp_i2cs_update(void);


typedef enum {
#pragma perlimpinpin_tpl self.msgid_enum_fields()

} PPPMsgID;

/// Type storing message data, both in and out.
typedef union {
  PPPMsgID mid;
#pragma perlimpinpin_tpl self.msgdata_union_fields()

} PPPMsgData;

/** @brief Callback for received commands.
 *
 * This function must be defined by the user.
 *
 * @return 0 on success, -1 on error.
 */
int8_t ppp_command_callback(PPPMsgData *);

#endif
