
/**@name Slave specific options. */
//@{
#ifdef I2C_SLAVE

/// Receive buffer size.
#define I2CS_RECV_BUF_SIZE    32
/// Send buffer size.
#define I2CS_SEND_BUF_SIZE    32

/// Byte send when there is nothing to send.
#define I2CS_SEND_NONE_BYTE  0x00

#endif
//@}


/** @brief Divider for I2C baudrate
 *
 * Refers to TWBR in specs for details.
 */
#define I2C_BITRATE   1
/** @brief Prescaler configuration
 *
 * Rate is 2^(n*2)
 */
#define I2C_PRESCALER 3

