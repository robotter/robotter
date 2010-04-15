#include <aversive.h>
#include <compat/twi.h>

#include "i2cs.h"

#if I2C_BUF_SIZE < 2
#error "I2C_BUF_SIZE is too short"
#endif

#define I2C_ACK()   (TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWEA)+(1<<TWINT))
#define I2C_NACK()  (TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWINT))
#define I2C_STOP()  (TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWSTO)+(1<<TWINT))


uint8_t i2cs_data[I2C_BUF_SIZE];
volatile I2CS_STATE i2cs_state;


void i2cs_init(uint8_t slave_addr)
{
  uint8_t flags;

  IRQ_LOCK(flags);

  TWBR = I2C_BITRATE;
  TWAR = slave_addr << 1;

  // prescaler
  if(I2C_PRESCALER & 1)
    sbi(TWSR, TWPS0);
  if(I2C_PRESCALER & 2)
    sbi(TWSR, TWPS1);

  i2cs_state = I2C_NONE;

  I2C_ACK();

  IRQ_UNLOCK(flags);
}


SIGNAL(SIG_2WIRE_SERIAL)
{
  static uint8_t* ptr;

  switch(TW_STATUS)
  {
    case TW_SR_SLA_ACK:
      ptr = i2cs_data;
      I2C_ACK();
      break;

    case TW_SR_DATA_ACK:
      *(ptr++) = TWDR;
      if( ptr < i2cs_data+I2C_BUF_SIZE )
        I2C_ACK();
      else
        I2C_NACK();
      break;

    case TW_SR_STOP:
      i2cs_state = I2C_RECEIVED;
      I2C_ACK();
      break;

    case TW_ST_SLA_ACK:
      ptr = i2cs_data;
      i2cs_state = I2C_NONE;
      // no break;
    case TW_ST_DATA_ACK:
      TWDR = *(ptr++);
      if( ptr < i2cs_data+I2C_BUF_SIZE )
        I2C_ACK();
      else
        I2C_NACK();
      break;

    case TW_SR_DATA_NACK:
      i2cs_state = I2C_RECEIVED;
      // no break;
    case TW_ST_DATA_NACK:
    case TW_ST_LAST_DATA:
      I2C_ACK();
      break;

    default: // illegal states, errors
      I2C_STOP();
      break;
  }
}

