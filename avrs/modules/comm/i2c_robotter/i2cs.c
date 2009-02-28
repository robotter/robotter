#include <aversive.h>
#include <compat/twi.h>

#include "i2cs.h"

uint8_t i2cs_data[I2C_BUF_SIZE];
I2CS_STATE i2cs_state;


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

  i2cs_state = NONE;

  TWCR = (1<<TWEA)+(1<<TWEN)+(1<<TWIE)+(1<<TWINT);

  IRQ_UNLOCK(flags);
}


SIGNAL(SIG_2WIRE_SERIAL)
{
  static uint8_t* ptr;

  switch(TW_STATUS)
  {
    case TW_SR_SLA_ACK:
      ptr = i2cs_data;
      I2C_NEXT();
      break;

    case TW_SR_DATA_ACK:
      *(ptr++) = TWDR;
      I2C_NEXT();
      break;
      
    case TW_ST_SLA_ACK:
      if( i2cs_state == READY )
      {
        ptr = i2cs_data;
        i2cs_state = NONE;
        I2C_SEND(1);
      }
      else
      {
        I2C_SEND(0);
      }
      break;

    case TW_ST_DATA_ACK:
      I2C_SEND(*(ptr++));
      break;

    case TW_ST_DATA_NACK:
      I2C_ACK();
      break;

    case TW_SR_STOP:
      i2cs_state = RECEIVED;
      I2C_NEXT();

    case TW_ST_LAST_DATA:
      I2C_NEXT();
      break;

    default:
      I2C_STOP();
      break;
  }
}

