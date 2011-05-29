
/// Byte send when there is nothing to send.
#define I2C_SEND_NONE_BYTE  0x00

/** @name Slave specific options. */
//@{
#ifdef I2C_SLAVE

/// Receive buffer size.
#define I2CS_RECV_BUF_SIZE    16
/// Send buffer size.
#define I2CS_SEND_BUF_SIZE    16

#endif
//@}

/** @name Master specific options.
 *
 * See <em>Overview of the TWI Module / Bit Rate Generator Unit</em> section
 * for details on I2C bus frequency.
 */
//@{
#ifdef I2C_MASTER

/// Divider for I2C baudrate (TWBR).
#define I2C_BITRATE   1
/// Prescaler configuration (TWPS1:0).
#define I2C_PRESCALER 3

#endif
//@}

