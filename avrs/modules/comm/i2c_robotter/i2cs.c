#include <aversive.h>
#include <compat/twi.h>

#include "i2cs.h"

#if (I2CS_RECV_BUF_SIZE > 255) || (I2CS_RECV_BUF_SIZE < 1)
#error "invalid I2CS_RECV_BUF_SIZE value"
#endif
#if (I2CS_SEND_BUF_SIZE > 255) || (I2CS_SEND_BUF_SIZE < 1)
#error "invalid I2CS_SEND_BUF_SIZE value"
#endif

#define I2C_ACK()   (TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWEA)+(1<<TWINT))
#define I2C_NACK()  (TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWINT))
#define I2C_STOP()  (TWCR=(1<<TWIE)+(1<<TWEN)+(1<<TWSTO)+(1<<TWINT))


volatile uint8_t i2cs_recv_buf[I2CS_RECV_BUF_SIZE];
volatile uint8_t i2cs_recv_size;
volatile uint8_t i2cs_send_buf[I2CS_SEND_BUF_SIZE];
volatile uint8_t i2cs_send_size;


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

  int i;
  for( i=0; i<sizeof(i2cs_recv_buf); i++ )
    i2cs_recv_buf[0];
  i2cs_recv_size = 0;
  for( i=0; i<sizeof(i2cs_send_buf); i++ )
    i2cs_send_buf[0];
  i2cs_send_size = 0;

  I2C_ACK();

  IRQ_UNLOCK(flags);
}


SIGNAL(SIG_2WIRE_SERIAL)
{
  static uint8_t* ptr;

  switch(TW_STATUS)
  {
    case TW_SR_SLA_ACK:
      ptr = i2cs_recv_buf;
      i2cs_recv_size = 0;
      I2C_ACK();
      break;

    case TW_SR_DATA_ACK:
      *(ptr++) = TWDR;
      if( ptr < i2cs_recv_buf+sizeof(i2cs_recv_buf) )
        I2C_ACK();
      else
        I2C_NACK();
      break;

    case TW_SR_STOP:
    case TW_SR_DATA_NACK:
      i2cs_recv_size = ptr-i2cs_recv_buf;
      I2C_ACK();
      break;

    case TW_ST_SLA_ACK:
      if( i2cs_send_size == 0 ) {
        TWDR = I2CS_SEND_NONE_BYTE;
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

