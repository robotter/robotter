#include <aversive.h>
#include <compat/twi.h>
#include <aversive/wait.h>

#include "i2cm.h"


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


void i2cm_send(uint8_t slave_addr, uint8_t n, const uint8_t* data)
{
  uint8_t i;

  I2C_START();

  // Slave address + Write bit (0)
  I2C_SEND(slave_addr<<1);

  // Send ata
  for( i=0; i<n; i++ )
  {
    I2C_SEND(data[i]);
  }

  // Stop and wait
  I2C_STOP();
  wait_4cyc(100);
}


int8_t i2cm_recv(uint8_t slave_addr, uint8_t n, uint8_t* data)
{
  uint8_t i;

  I2C_START();

  // Slave address + Read bit (1)
  I2C_SEND((slave_addr<<1)+1);

  // No ACK, no data
  if( TW_STATUS != TW_MR_SLA_ACK )
  {
    I2C_STOP();
    wait_4cyc(100);
    return -1;
  }

  // Read all data
  for( i=0; i<n; i++ )
  {
    I2C_ACK();
    data[i] = TWDR;
  }

  I2C_NACK();
  I2C_STOP();
  wait_4cyc(100);

  return 0;
}


int8_t i2cm_ask_and_recv(uint8_t slave_addr, uint8_t n, uint8_t* data)
{
  uint8_t i;

  I2C_START();

  // Slave address + Read bit (1)
  I2C_SEND((slave_addr<<1)+1);

  // No ACK, no data
  if( TW_STATUS != TW_MR_SLA_ACK )
  {
    I2C_STOP();
    wait_4cyc(100);
    return -1;
  }

  // First byte: is there something to transmit?
  I2C_ACK();
  if( TWDR == 0 )
  {
    I2C_NACK();
    I2C_STOP();
    wait_4cyc(100);
    return 0;
  }

  // Read all data
  for( i=0; i<n; i++ )
  {
    I2C_ACK();
    data[i] = TWDR;
  }

  I2C_NACK();
  I2C_STOP();
  wait_4cyc(100);

  return 1;
}


