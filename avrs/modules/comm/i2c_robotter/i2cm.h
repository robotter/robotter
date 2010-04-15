#include <aversive.h>

#define I2C_MASTER
#include "i2c_robotter_config.h"

/// Initialize I2C, master side
void i2cm_init(void);

/** @brief Send data frame to a slave
 *
 * @param  slave_addr  slave address
 * @param  n           size to send
 * @param  data        buffer to send
 *
 * @return -1  error before first byte has been sent
 * @return  0  NACK has been immediately received
 * @return  n  size of sent data (even on error / NACK)
 */
int8_t i2cm_send(uint8_t slave_addr, const uint8_t *data, uint8_t n);

/** @brief Receive data frame from a slave
 *
 * @param  slave_addr  slave address
 * @param  n           size to read
 * @param  data        buffer for read data
 *
 * @return -1  error before first byte has been received
 * @return  0  NACK has been immediately received
 * @return  n  size of sent data
 */
int8_t i2cm_recv(uint8_t slave_addr, uint8_t *data, uint8_t n);

