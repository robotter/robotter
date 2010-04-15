#include <aversive.h>

#define I2C_SLAVE
#include "i2c_robotter_config.h"


/** @brief Slave data state
 *
 * After receiving data from master, state is set to \e I2C_RECEIVED.
 */
typedef enum
{
  I2C_NONE,
  I2C_READY,    ///< Data ready to transfer
  I2C_RECEIVED  ///< Data has been received
} I2CS_STATE;

/** @brief Slave data buffer
 *
 * This buffer is used both for reading and writing.
 * When the slave has to send data to the master, it first fill the buffer and
 * then set its state to \e I2C_READY.
 *
 * A NACK is sent after reading the last byte of the buffer (which is full).
 */
extern uint8_t i2cs_data[I2C_BUF_SIZE];

/// Slave I2C state
extern volatile I2CS_STATE i2cs_state;


/// Initialize I2C, slave side
void i2cs_init(uint8_t slave_addr);

