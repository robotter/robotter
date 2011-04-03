#include <stdint.h>

#define I2C_MASTER
#include "i2c_robotter_config.h"

/// Initialize I2C, master side
void i2cm_init(void);

/** @brief Send data frame to a slave
 *
 * @param  slave_addr  slave address
 * @param  n           size to send (max: 127)
 * @param  data        buffer to send
 *
 * @retval -1  error before first byte has been sent
 * @retval  0  NACK has been immediately received
 * @retval  n  size of sent data (even on error / NACK)
 */
int8_t i2cm_send(uint8_t slave_addr, const uint8_t *data, uint8_t n);

/** @brief Receive data frame from a slave
 *
 * @param  slave_addr  slave address
 * @param  n           size to read (max: 127)
 * @param  data        buffer for read data
 *
 * @retval -1  error before first byte has been received
 * @retval  0  NACK has been immediately received
 * @retval  n  size of sent data
 */
int8_t i2cm_recv(uint8_t slave_addr, uint8_t *data, uint8_t n);

