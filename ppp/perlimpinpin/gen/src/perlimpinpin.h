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

/** @name Device an special ROIDs.
 */
//@{
#pragma perlimpinpin_tpl self.device_roid_macros()

/// Convenient alias.
#define PPP_UART_ROID  ROID_UART(PPP_DEVICE_ROID)

/// Bitmask value for an ROID associated to UART interface.
#define ROID_UART_MASK       0x80
/// Get UART interface ROID from a device ROID.
#define ROID_UART(roid)    ((roid)|ROID_UART_MASK)
/// Get device ROID from UART interface ROID.
#define ROID_DEVICE(roid)  ((roid)&~ROID_UART_MASK)
/// Broadcast ROID.
#define ROID_BROADCAST       0x00
/// UART broadcast ROID.
#define ROID_UART_BROADCAST  0x80
/// Subscriber ROID.
#define ROID_SUBSCRIBER      0x01

//@}


#include <stdint.h>
#include "perlimpinpin_config.h"


/// Message IDs.
typedef enum {
  PPP_MID_PROTOCOL = 0,
#pragma perlimpinpin_tpl self.msgid_enum_fields()

} PPPMsgID;

/// Protocol PPP sub-commands, used with mid 0.
typedef enum {
  PPP_SUBCMD_NONE = 0,
  PPP_SUBCMD_UART_DISCOVER,
  PPP_SUBCMD_SUBSCRIBE,

} PPPProtoCmdID;


/// Type storing message frame.
typedef struct {
  uint16_t plsize;   ///< payload size, with src, dst, mid
  uint8_t src, dst;  ///< Message source and destination addresses
  PPPMsgID mid;
  union {
    uint8_t _data[$$ppp:self.max_payload_size()$$+1]; // +1 for checksum
#pragma perlimpinpin_tpl self.msgdata_union_fields()

    // protocol PPP messages (used with mid 0)
    struct {
      uint8_t cmd;
      uint8_t subscriber;
    } _ppp;
  };
} __attribute__((__packed__)) PPPMsgFrame;

/// Callback for received messages.
typedef void PPPMsgCallback(PPPMsgFrame *);


/// Initialize perlimpinpin communications.
void ppp_init(PPPMsgCallback *cb);

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

#define PPP_SEND_SUBSCRIBE(_d, _subscriber) do { \
    PPPMsgFrame _frame = { \
      .plsize = 5, \
      .src = PPP_DEVICE_ROID, .dst = (_d), \
      .mid = 0 \
    }; \
    (_frame)._ppp.cmd = PPP_SUBCMD_SUBSCRIBE; \
    (_frame)._ppp.subscriber = (_subscriber); \
    ppp_send_msg(&_frame); \
  } while(0);


#pragma perlimpinpin_tpl  self.send_helpers()
//@}


#endif
