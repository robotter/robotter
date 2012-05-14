
/** @brief ROID of the device.
 *
 * It is a good practice to use macro defined in perlimpinpin.h instead of
 * hardcoded values which may evolve.
 *
 * @note This value should always be defined.
 */
#define PPP_ROID   ROID_MECA

/// Use given UART number (defaults to UART_NUM).
#define PPP_UART_NUM  0

/// Enable trace logs of sent/received/forwarded messages.
//#define PPP_DEBUG_TRACE

/// Use Aversive's error module for debug and warning messages.
//#define PPP_AVERSIVE_ERROR

