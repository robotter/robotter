#include <aversive.h>
#include <compat/twi.h>
#include <wait.h>

#include "i2cm.h"


// Initialize
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


// Send a n-byte data frame to an address
void i2cm_send(uint8_t slave_addr, uint8_t n, const uint8_t* data)
{
  int i;

  I2C_START();

  // Slave address + Write bit (0)
  I2C_SEND(slave_addr<<1);

  // Data
  for( i=0; i<n; i++ )
  {
    I2C_SEND(data[i]);
  }

  // Stop and wait
  I2C_STOP();
  wait_4cyc(100);
}


// Receive a frame from an address
// Slave must respect the i2c_ryder protocol : first byte tells if there are
// data to transmit or not
// Return number of read bytes
uint8_t i2cm_rcv(uint8_t slave_addr, uint8_t n, uint8_t* data)
{
  int i;

  I2C_START();

  // Slave address + Read bit (1)
  I2C_SEND((slave_addr<<1)+1);

  // No ACK, no data
  if( TW_STATUS != TW_MR_SLA_ACK )
  {
    I2C_STOP();
    wait_4cyc(100);
    return 0;
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


// Receive one data byte from an address, -1 on error
int i2cm_rcv_single(uint8_t slave_addr)
{
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
  return TWDR;
}


