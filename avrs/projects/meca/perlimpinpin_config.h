
/** @brief ROID of the device.
 *
 * It is a good practice to use macro defined in perlimpinpin.h instead of
 * hardcoded values which may evolve.
 *
 * @note This value should always be defined.
 */
#define PPP_DEVICE_ROID   ROID_MECA

/// Enable UART transmissions (implied by PPP_UART_NUM).
//#define PPP_UART
/// Use given UART number (defaults to UART_NUM).
//#define PPP_UART_NUM  0

/// Enable I2C transmissions.
#define PPP_I2C

/// Number of tries for sending I2C frames (infinite if undefined).
//#define PPP_I2C_RETRY_COUNT  1000

/// Delay between retries in microseconds (no delay if undefined).
#define PPP_I2C_RETRY_DELAY  100

/// Enable trace logs of sent/received/forwarded messages.
//#define PPP_DEBUG_TRACE

/// Use Aversive's error module for debug and warning messages.
//#define PPP_AVERSIVE_ERROR

