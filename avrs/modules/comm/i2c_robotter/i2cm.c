#include <aversive.h>
#include <compat/twi.h>
#include <aversive/wait.h>

#include "i2cm.h"

#define I2C_WAIT()  while( !( TWCR & (1<<TWINT) ) )
#define I2C_ACK()   do{ TWCR=(1<<TWEN)+(1<<TWEA)+(1<<TWINT); I2C_WAIT(); }while(0);
#define I2C_NACK()  do{ TWCR=(1<<TWEN)+(1<<TWINT); I2C_WAIT(); }while(0)
#define I2C_START() do{ TWCR=(1<<TWEN)+(1<<TWSTA)+(1<<TWINT); I2C_WAIT(); }while(0)
#define I2C_SEND(d) do{ TWDR = (d); I2C_ACK(); }while(0)
#define I2C_STOP()  (TWCR=(1<<TWEN)+(1<<TWSTO)+(1<<TWINT))



void i2cm_init(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);

  TWBR = I2C_BITRATE;
  TWCR = (1<<TWEN) | (1<<TWINT);

  if(I2C_PRESCALER & 1)
    sbi(TWSR, TWPS0);
  if(I2C_PRESCALER & 2)
    sbi(TWSR, TWPS1);

  IRQ_UNLOCK(flags);
}


int8_t i2cm_send(uint8_t slave_addr, uint8_t n, const uint8_t* data)
{
  I2C_START();
  if( TW_STATUS != TW_START )
    return -1;

  // Slave address + Write bit (0)
  I2C_SEND(slave_addr<<1);
  if( TW_STATUS == TW_MT_SLA_NACK ) {
    I2C_STOP(); wait_4cyc(100);
    return 0;
  }
  if( TW_STATUS != TW_MT_SLA_ACK )
    return -1;

  uint8_t i;
  for( i=0; i<n; i++ ) {
    I2C_SEND(data[i]);
    if( TW_STATUS != TW_MT_DATA_ACK )
      break;
  }

  if( TW_STATUS == TW_MT_DATA_ACK || TW_STATUS == TW_MT_DATA_NACK ) {
    I2C_STOP(); wait_4cyc(100);
  }

  return i;
}


int8_t i2cm_recv(uint8_t slave_addr, uint8_t n, uint8_t* data)
{
  I2C_START();
  if( TW_STATUS != TW_START )
    return -1;

  // Slave address + Read bit (1)
  I2C_SEND((slave_addr<<1)+1);
  if( TW_STATUS == TW_MR_SLA_NACK ) {
    I2C_STOP(); wait_4cyc(100);
    return 0;
  }
  if( TW_STATUS != TW_MR_SLA_ACK )
    return -1;

  uint8_t i;
  for( i=0; i<n; i++ ) {
    I2C_ACK();
    data[i] = TWDR;
  }

  I2C_NACK();
  I2C_STOP(); wait_4cyc(100);

  return i;
}


