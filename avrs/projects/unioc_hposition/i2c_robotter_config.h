
// For slaves only
#ifdef I2C_SLAVE
/** @brief Size of slave data buffer
 * @sa i2cs_data
 */
#define I2C_BUF_SIZE    8
#endif

/** @brief Divider for I2C baudrate
 * Refers to TWBR in specs for details.
 */
#define I2C_BITRATE   1
/** @brief Prescaler configuration
 * Rate is 2^(n*2)
 */
#define I2C_PRESCALER 3

