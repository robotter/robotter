#ifndef IMU_H
#define IMU_H

#include <aversive.h>

#define IMU_MSG_SIZE 5

typedef enum {

  IS_START = 0,
  IS_DATA,
  IS_CKSM_A,
  IS_CKSM_B

}imu_state_t;

typedef struct {
 
  imu_state_t state;
  uint8_t data[IMU_MSG_SIZE];
  uint8_t it;
  uint8_t cka,ckb;

  double psi;
}imu_t;

extern imu_t imu;

void imu_init(void);

void imu_receive_event(uint8_t c);

#endif//IMU_H
