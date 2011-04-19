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
 * The user must define the ppp_msg_callback() function in a separate
 * object file.
 */

#ifndef PERLIMPINPIN_H
#define PERLIMPINPIN_H

/** @name Map device names to their ROID.
 */
//@{
#pragma perlimpinpin_tpl self.device_roid_macros()

/// Bitmask value for an ROID associated to UART interface.
#define PPP_UART_ROID  0x80

//@}


#include "perlimpinpin_config.h"


/// Message IDs.
typedef enum {
#pragma perlimpinpin_tpl self.msgid_enum_fields()

} PPPMsgID;

/// Type storing message frame.
typedef struct {
  uint16_t plsize;   ///< payload size, with src, dst, mid
  uint8_t src, dst;  ///< Message source and destination addresses
  PPPMsgID mid;
  union {
    uint8_t _data[$$ppp:self.max_payload_size()$$+1]; // +1 for checksum
#pragma perlimpinpin_tpl self.msgdata_union_fields()

  };
} __attribute__((__packed__)) PPPMsgFrame;

/** @brief Callback for received messages.
 *
 * This function must be defined by the user.
 */
void ppp_msg_callback(PPPMsgFrame *);


/// Initialize perlimpinpin communications.
void ppp_init(void);

/** @brief Handle all pending events.
 *
 * This method does not block except when transferring I2C frames.
 */
void ppp_update(void);

/** @brief Send a message.
 *
 * When sending over I2C, the transfer will be retried on failure, depending on
 * configuration. Broadcasting will not fail if no slave acknowledges.
 *
 * Between each try, pending I2C messages will be processed, as if ppp_update()
 * was called, in order to avoid devices waiting for each other.
 * As a consequence, ppp_msg_callback() and ppp_send_msg() may be called
 * recursively.
 */
void ppp_send_msg(PPPMsgFrame *frame);

/** @name Helper macros to send messages.
 *
 * These macros fill a PPPMsgFrame structure then call ppp_send_msg().
 */
//@{

#pragma perlimpinpin_tpl  self.send_helpers()
//@}


#endif
