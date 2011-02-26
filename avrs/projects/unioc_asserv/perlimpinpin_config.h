#ifndef PERLIMPINPIN_CONFIG_H
#define PERLIMPINPIN_CONFIG_H


/** @brief ROID of the device.
 *
 * It is a good practice to use macro defined in perlimpinpin.h instead of
 * hardcoded values which may evolve.
 *
 * @note This value should always be defined.
 */
#define PPP_DEVICE_ROID   ROID_PROP

/// Enable UART transmissions using given UART number.
#define PPP_UART_NUM  1

/// Enable I2C master mode.
//#define PPP_I2C_MASTER

/// Enable I2C slave mode.
#define PPP_I2C_SLAVE

/// Number I2C master attempts to receive reply.
#define PPP_I2CM_RECV_MAX_TRIES  10
/// Delay between each I2C master receive attempt.
#define PPP_I2CM_RECV_WAIT_MS    20

#endif
