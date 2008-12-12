#include <aversive.h>

#define I2C_MASTER
#include "i2c_robotter_config.h"

#define I2C_WAIT()  { while( !( TWCR & (1<<TWINT) ) ); }
#define I2C_ACK()   { TWCR=(1<<TWEN)+(1<<TWEA)+(1<<TWINT); I2C_WAIT(); }
#define I2C_NACK()  { TWCR=(1<<TWEN)+(1<<TWINT); I2C_WAIT(); }
#define I2C_NEXT()  { TWCR=(1<<TWEN)+(1<<TWEA)+(1<<TWINT); I2C_WAIT(); }
#define I2C_START() { TWCR=(1<<TWEN)+(1<<TWSTA)+(1<<TWINT); I2C_WAIT() }
#define I2C_STOP()  { TWCR=(1<<TWEN)+(1<<TWSTO)+(1<<TWINT); }
#define I2C_SEND(d) { TWDR = (d); I2C_NEXT(); }


// Initialize
void i2cm_init(void);

// Send a n-byte data frame to an address
void i2cm_send(uint8_t slave_addr, uint8_t n, const uint8_t* data);

// Receive a frame from an address
// Slave must respect the i2c_ryder protocol : first byte tells if there are
// data to transmit or not
// Return number of read bytes
uint8_t i2cm_rcv(uint8_t slave_addr, uint8_t n, uint8_t* data);

// Receive one data byte from an address, -1 on error
int i2cm_rcv_single(uint8_t slave_addr);

