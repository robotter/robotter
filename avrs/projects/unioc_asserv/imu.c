
#include "imu.h"
#include <math.h>
#include <aversive/error.h>

imu_t imu;

void imu_init()
{
  imu.state = IS_START;
}

uint8_t imu_validate_checksum(uint8_t *data, uint8_t cka, uint8_t ckb)
{
  uint8_t a,b; 
  int i;
  a = b = 0;
  for(i=0;i<IMU_MSG_SIZE;i++)
  {
    a += data[i];
    b += a;
  }
  return (a == cka)&&(b == ckb);
}

void imu_receive_event(uint8_t c)
{
  int16_t psi_deg;
  switch(imu.state)
  {
    case IS_START:
      // start byte received
      if(c == 0x99)
      {
        imu.state = IS_DATA;
        imu.it = 0;
        imu.cka = 0;
        imu.ckb = 0;
      }
      break;

    case IS_DATA:
      if(imu.it < IMU_MSG_SIZE)
      {
        imu.data[imu.it] = c;
        imu.it++;
      }

      if(imu.it >= IMU_MSG_SIZE)
        imu.state = IS_CKSM_A;
      break;

    case IS_CKSM_A:
      imu.cka = c;
      imu.state = IS_CKSM_B;
      break;

    case IS_CKSM_B:
      imu.ckb = c;
      imu.state = IS_START;

      if(imu_validate_checksum(imu.data,imu.cka,imu.ckb))
      {
        psi_deg = *(int16_t*)(imu.data +3);
        imu.psi = psi_deg/100.0;
      }

      break;

    default:
      break;
  }

}
