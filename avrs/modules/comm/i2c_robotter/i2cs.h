#include <aversive.h>

#define I2C_SLAVE
#include "i2c_robotter_config.h"

typedef enum
{
  NONE,
  READY,    // Data ready to transfer
  RECEIVED  // Data has been received
} I2CS_STATE;

extern uint8_t i2cs_data[I2C_BUF_SIZE];
extern I2CS_STATE i2cs_state;


#define I2C_ACK()   { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWEA)+(1<<TWINT); }
#define I2C_NACK()  { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWINT); }
#define I2C_NEXT()  { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWEA)+(1<<TWINT); }
#define I2C_STOP()  { TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWSTO)+(1<<TWINT); }
#define I2C_SEND(d) { TWDR = (d); I2C_NEXT(); }

// Initialize slave
void i2cs_init(uint8_t slave_addr);

