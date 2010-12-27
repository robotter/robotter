#include "stratcomm.h"
#include "stratcomm_send.h"

#include <aversive.h>
#include <aversive/error.h>
#include <aversive/wait.h>
#include <i2cm.h>

#define RECV_MAX_TRIES 20

void stratcomm_init(stratcomm_t *sc)
{
  i2cm_init();
}

uint8_t stratcomm_computeChecksum(uint8_t* data, uint8_t size)
{
  uint8_t it;
  uint8_t crc = 0x00;

  for(it=0;it<size;it++)
    crc += data[it]; 
  
  return crc;
}

uint8_t stratcomm_i2cm_recv(uint8_t addr, uint8_t *data, uint8_t n)
{
  uint8_t try;
  int8_t rv;

  for(try=0;try<RECV_MAX_TRIES;try++)
  { 
    rv = i2cm_recv(addr, data, n);

    if(rv <= 0)
    {
      DEBUG(STRATCOMM_ERROR, "I2C failure @0x%2.2x:0x%2.2x",addr,rv);
      wait_ms(20);
      continue;
    }

    // slave is not ready
    if(data[0] == 0x00)
    {
      wait_ms(20);
      continue;
    }
    
    // not enough data
    if( rv < n )
    {
      DEBUG(STRATCOMM_ERROR, "I2C slave @0x%2.2x answer sz=%d",
                                                          addr,rv);
      wait_ms(20);
      continue;
    }

    return rv;
  }
  return 0;
}
