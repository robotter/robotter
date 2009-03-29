#include <aversive.h>

#define I2C_SLAVE
#include "i2c_robotter_config.h"


/** @brief Slave data state
 *
 * After receiving data from master, state is set to \e I2C_RECEIVED.
 *
 * When master ask slave for data (by reading on it), slaves send back 1 if
 * state is \e I2C_READY and 0 otherwise.
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
 */
extern uint8_t i2cs_data[I2C_BUF_SIZE];

/// Slave I2C state
extern I2CS_STATE i2cs_state;


#define I2C_ACK()   { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWEA)+(1<<TWINT); }
#define I2C_NACK()  { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWINT); }
#define I2C_NEXT()  { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWEA)+(1<<TWINT); }
#define I2C_STOP()  { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWSTO)+(1<<TWINT); }
#define I2C_SEND(d) { TWDR = (d); I2C_NEXT(); }

/// Initialize I2C, slave side
void i2cs_init(uint8_t slave_addr);

