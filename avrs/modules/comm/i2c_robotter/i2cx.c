#include <aversive.h>
#include <avr/interrupt.h>
#include <util/twi.h>
#include "i2cx.h"

#if (I2CS_RECV_BUF_SIZE > 255) || (I2CS_RECV_BUF_SIZE < 1)
#error "invalid I2CS_RECV_BUF_SIZE value"
#endif

static uint8_t i2cx_sr_buf[I2CS_RECV_BUF_SIZE];
static volatile uint8_t i2cx_sr_size;

#define I2C_WAIT()  while( !( TWCR & (1<<TWINT) ) )
#define I2C_CR_SET(v)  (TWCR = (1<<TWEN)|(1<<TWINT)|(v))
#define I2C_IDLE(v) \
    if( i2cx_sr_size == 0 ) { \
      I2C_CR_SET( (v)|(1<<TWIE)|(1<<TWEA) ); \
    } else { \
      I2C_CR_SET( (v) ); \
    }
#define I2C_SEND(d) do{ TWDR = (d); I2C_CR_SET(1<<TWEA); I2C_WAIT(); }while(0)
#define I2C_STOP()  do{ I2C_IDLE(1<<TWSTO); while( TWCR & (1<<TWSTO) ) ; }while(0)



/** @brief Start a frame as master.
 *
 * @retval  0  START condition sent.
 * @retval -1  busy (e.g. currently acting as a slave)
 * @retval -2  bus error or arbitration lost
 */
static int8_t i2cx_start(void)
{
  uint8_t flags;
  IRQ_LOCK(flags);
  if( TW_STATUS != TW_NO_INFO ) {
    IRQ_UNLOCK(flags);
    return -1;
  }
  I2C_CR_SET( (1<<TWSTA) );
  IRQ_UNLOCK(flags);

  I2C_WAIT();
  if( TW_STATUS != TW_START ) {
    I2C_IDLE(0);
    return -2;
  }
  return 0;
}


SIGNAL(SIG_2WIRE_SERIAL)
{
  static uint8_t *ptr;

  switch(TW_STATUS)
  {
    case TW_SR_SLA_ACK:
    case TW_SR_GCALL_ACK:
    case TW_SR_ARB_LOST_SLA_ACK:
    case TW_SR_ARB_LOST_GCALL_ACK:
      ptr = i2cx_sr_buf;
      I2C_CR_SET( (1<<TWIE)|(1<<TWEA) );
      break;

    case TW_SR_DATA_ACK:
    case TW_SR_GCALL_DATA_ACK:
      *(ptr++) = TWDR;
      // size-1, because NACK has to be sent before receiving the last byte
      if( ptr < i2cx_sr_buf+sizeof(i2cx_sr_buf)-1 ) {
        I2C_CR_SET( (1<<TWIE)|(1<<TWEA) );
      } else {
        I2C_CR_SET( (1<<TWIE) );
      }
      break;

    case TW_SR_DATA_NACK:
    case TW_SR_GCALL_DATA_NACK:
      *(ptr++) = TWDR; // last data byte
      I2C_CR_SET( (1<<TWIE) );
      break;

    case TW_SR_STOP:
      i2cx_sr_size = ptr-i2cx_sr_buf;
      I2C_CR_SET( 0 );  // not ready to receive anymore
      break;

    // unexpected states, errors
    default:
      // as a state: recover from an error condition
      // as a master: should end the current frame
      I2C_IDLE(1<<TWSTO);
      break;
  }
}


void i2cx_init(uint8_t addr, uint8_t gcall)
{
  unsigned int i;
  for( i=0; i<sizeof(i2cx_sr_buf); i++ ) {
    i2cx_sr_buf[i] = 0;
  }
  i2cx_sr_size = 0;

  TWBR = I2C_BITRATE;
  if( I2C_PRESCALER & 1 ) {
    TWSR |= (1<<TWPS0);
  }
  if( I2C_PRESCALER & 2 ) {
    TWSR |= (1<<TWPS1);
  }

  TWAR = (addr << 1) | (gcall & 1);
  if( addr == 0 && gcall == 0 ) {
    I2C_CR_SET(0);
  } else {
    I2C_CR_SET( (1<<TWIE)|(1<<TWEA) );
  }
}


int i2cx_send(uint8_t addr, const uint8_t *buf, uint8_t n)
{
  int8_t ret = i2cx_start();
  if( ret != 0 ) {
    return ret;
  }

  // Slave address + Write bit (0)
  uint8_t i = 0;
  I2C_SEND(addr<<1);
  if( TW_STATUS == TW_MT_SLA_NACK ) {
    goto ok;
  }
  if( TW_STATUS != TW_MT_SLA_ACK ) {
    goto error;
  }

  while( i < n ) {
    I2C_SEND(buf[i++]);
    if( TW_STATUS == TW_MT_DATA_NACK ) {
      break;
    }
    if( TW_STATUS != TW_MT_DATA_ACK ) {
      goto error;
    }
  }

ok:
  I2C_STOP();
  return i;

error:
  I2C_IDLE(0);
  return -2;
}


int i2cx_recv(uint8_t addr, uint8_t *buf, uint8_t n)
{
  int8_t ret = i2cx_start();
  if( ret != 0 ) {
    return ret;
  }

  // Slave address + Read bit (1)
  uint8_t i = 0;
  I2C_SEND((addr<<1)+1);
  if( TW_STATUS == TW_MR_SLA_NACK ) {
    goto ok;
  }
  if( TW_STATUS != TW_MR_SLA_ACK ) {
    goto error;
  }

  while( i+1 < n ) {
    I2C_CR_SET(1<<TWEA); I2C_WAIT();
    if( TW_STATUS == TW_MR_DATA_NACK ) {
      goto ok;
    }
    if( TW_STATUS != TW_MR_DATA_ACK ) {
      goto error;
    }
    buf[i++] = TWDR;
  }
  I2C_CR_SET(0); I2C_WAIT();
  buf[i++] = TWDR;

ok:
  I2C_STOP();
  return i;

error:
  I2C_IDLE(0);
  return -2;
}


void i2cx_peek(uint8_t *buf, uint8_t *n)
{
  uint8_t size = i2cx_sr_size; // non-volatile copy
  if( n != 0 ){
    *n = size;
  }
  if( size == 0 ) {
    return;  // common case
  }
  if( buf != 0 ) {
    uint8_t i;
    for( i=0; i<size; i++ ) {
      buf[i] = i2cx_sr_buf[i];
    }
  }
  if( buf != 0 || n == 0 ) {
    i2cx_sr_size = 0;
    I2C_CR_SET( (1<<TWIE)|(1<<TWEA) );
  }
}

