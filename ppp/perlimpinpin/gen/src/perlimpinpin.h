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
 * @brief Perlimpinpin symbols.
 * @date $$ppp:time.strftime('%Y-%m-%d %H:%m:%S')$$
 *
 * The user must define the ppp_command_callback() function in a separate
 * object file.
 */

#ifndef PERLIMPINPIN_H
#define PERLIMPINPIN_H


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


/// Initialize perlimpinpin communications.
void ppp_init(void);

/** @brief Handle all pending events.
 *
 * This method does not block except when transferring an UART command to an
 * I2C slave when it will block to complete a frame send or receive.
 */
void ppp_update(void);

/** @brief Send a message and wait for the reply (if any).
 * @return 0 on success, -1 on error.
 */
int8_t ppp_send_message(PPPMsgData *msgdata);

/** @name Helper macros to send messages.
 *
 * These macros fill a PPPMsgData structure then call ppp_send_command().
 */
//@{

#pragma perlimpinpin_tpl  self.send_helpers()
//@}


#endif
