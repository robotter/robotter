#ifndef I2C_ROBOTTER_I2CX_H
#define I2C_ROBOTTER_I2CX_H

#include <stdint.h>

#define I2C_MASTER
#define I2C_SLAVE
#include "i2c_robotter_config.h"

/** @file
 * @brief I2C, for multi-master mode.
 *
 * Frames received as slave (slave receiver mode) are stored in an internal
 * buffer. When this buffer is full the device will stop to listen on the bus
 * and thus will not be addressable by the master (a NACK will be received
 * after SLA+R/W).
 *
 * i2cx_peek() is used to retrieve the data. Only one frame can be stored at a
 * time, meaning i2cx_peek() has to be called to be able to receive further
 * frames.
 *
 * Slave transmitter mode is not handled. When addressed as a slave for a W
 * frame, the device will send a single byte with value \e I2C_SEND_NONE_BYTE.
 *
 * @note To avoid forbidden I2C arbitration, the application must ensure to not
 * send frames which differ only in length.
 */


/** @brief Initialize I2C.
 *
 * Initialize the module. \e addr is the slave address to use.
 * If \e addr is 0 the device will never be addressed (except for general call,
 * if enabled).
 * If \e gcall is not 0, general call address will be recognized.
 */
void i2cx_init(uint8_t addr, uint8_t gcall);

/** @brief Send a frame to a slave.
 *
 * @retval  0  NACK immediately received
 * @retval  n  sent data size
 * @retval -1  busy (e.g. currently acting as a slave)
 * @retval -2  bus error or arbitration lost
 */
int i2cx_send(uint8_t addr, const uint8_t *buf, uint8_t n);

/** @brief Read a frame from a slave.
 *
 * @retval  0  NACK immediately received
 * @retval  n  received data size
 * @retval -1  busy (e.g. currently acting as a slave)
 * @retval -2  bus error or arbitration lost
 */
int i2cx_recv(uint8_t addr, uint8_t *buf, uint8_t n);

/** @brief Handle frames received as a slave.
 *
 * If \e buf is not \e NULL it is filled with received data.
 * If \e \e n is not \e NULL it is set to the size of received data.
 *
 * If \e buf is not \e NULL or both \e buf and \e n are \e NULL, received data
 * is cleared, allowing a new frame to be received.
 */
void i2cx_peek(uint8_t *buf, uint8_t *n);


#endif
