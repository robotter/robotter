#include <avr/interrupt.h>
#include <util/twi.h>

#include "i2cs.h"

// backward compatibility
#ifndef I2C_SEND_NONE_BYTE
#define I2C_SEND_NONE_BYTE I2CS_SEND_NONE_BYTE
#endif

#if (I2CS_RECV_BUF_SIZE > 127) || (I2CS_RECV_BUF_SIZE < 1)
#error "invalid I2CS_RECV_BUF_SIZE value"
#endif
#if (I2CS_SEND_BUF_SIZE > 127) || (I2CS_SEND_BUF_SIZE < 1)
#error "invalid I2CS_SEND_BUF_SIZE value"
#endif

#define I2C_ACK()   (TWCR=(1<<TWIE)|(1<<TWEN)|(1<<TWINT)|(1<<TWEA))
#define I2C_NACK()  (TWCR=(1<<TWIE)|(1<<TWEN)|(1<<TWINT))
#define I2C_STOP()  (TWCR=(1<<TWIE)|(1<<TWEN)|(1<<TWINT)|(1<<TWSTO))


uint8_t i2cs_recv_buf[I2CS_RECV_BUF_SIZE];
uint8_t i2cs_recv_size;
uint8_t i2cs_send_buf[I2CS_SEND_BUF_SIZE];
uint8_t i2cs_send_size;


void i2cs_init(uint8_t slave_addr)
{
  unsigned int i;
  for( i=0; i<sizeof(i2cs_recv_buf); i++ )
    i2cs_recv_buf[i] = 0;
  i2cs_recv_size = 0;
  for( i=0; i<sizeof(i2cs_send_buf); i++ )
    i2cs_send_buf[i] = 0;
  i2cs_send_size = 0;

  TWAR = slave_addr << 1;
  I2C_ACK();
}


SIGNAL(SIG_2WIRE_SERIAL)
{
  static uint8_t *ptr;

  switch(TW_STATUS)
  {
    case TW_SR_SLA_ACK:
      ptr = i2cs_recv_buf;
      i2cs_recv_size = 0;
      I2C_ACK();
      break;

    case TW_SR_DATA_ACK:
      *(ptr++) = TWDR;
      // size-1, because NACK has to be sent before receiving the last byte
      if( ptr < i2cs_recv_buf+sizeof(i2cs_recv_buf)-1 )
        I2C_ACK();
      else
        I2C_NACK();
      break;

    case TW_SR_DATA_NACK:
      *(ptr++) = TWDR; // last data byte
      // no break;
    case TW_SR_STOP:
      i2cs_recv_size = ptr-i2cs_recv_buf;
      I2C_ACK();
      break;

    case TW_ST_SLA_ACK:
      if( i2cs_send_size == 0 ) {
        TWDR = I2C_SEND_NONE_BYTE;
        I2C_NACK();
        break;
      }
      if( i2cs_send_size > sizeof(i2cs_send_buf) )
        i2cs_send_size = sizeof(i2cs_send_buf);
      ptr = i2cs_send_buf;
      // no break;
    case TW_ST_DATA_ACK:
      TWDR = *(ptr++);
      if( ptr < i2cs_send_buf+i2cs_send_size )
        I2C_ACK();
      else
        I2C_NACK();
      break;

    case TW_ST_DATA_NACK:
    case TW_ST_LAST_DATA:
      i2cs_send_size = 0;
      I2C_ACK();
      break;

    default: // illegal states, errors
      I2C_STOP();
      break;
  }
}

