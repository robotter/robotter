#include <aversive.h>
#include <aversive/wait.h>
#include <aversive/irq_lock.h>
#include <uart.h>
#include <adc.h>
#include <i2cs.h>

#include <gp2pack.h>

uint8_t i2cs_data[I2C_BUF_SIZE];
I2CS_STATE i2cs_state;

int main(void)
{
  gp2pack gp2p_right;
  gp2pack gp2p_left;

  // Turn interruptions ON
  sei();

  // Initialize UART
  uart_init();
  fdevopen(uart0_dev_send,uart0_dev_recv);
 
  // bla
  printf("\n\nRobotter 2008 - 102chute - MECA GP2*/GP2PACK TEST \n");
  printf("Compiled "__DATE__" at "__TIME__"\n");
  printf("\nBooting...\n");

  // Initialize I2C
  i2cs_init(0x01);

  // Initialize ADC
  adc_init();

  // Initialize GP2PACK module
  gp2pack_init(&gp2p_right,MUX_ADC2,MUX_ADC0);
  gp2pack_setAB(&gp2p_right,
                2549.410,-0.999,
                11088.409,-0.982);
  gp2pack_setThreshold(&gp2p_right, 90.0, 300.0);

  gp2pack_init(&gp2p_left,MUX_ADC4,MUX_ADC5);
  gp2pack_setAB(&gp2p_left,
                2549.410,-0.999,
                11088.409,-0.982);
  gp2pack_setThreshold(&gp2p_left, 90.0, 300.0);


  // Set up led port
  DDRB = 0xFB;
  PORTB = 0x00;

  printf("\ndone.\n\n");
 
  //gp2pack_calibration(&gp2p_right,printf,uart0_recv);
  
  double dr, dl;
  while(1)
  {
    
    gp2pack_update(&gp2p_right);
    gp2pack_update(&gp2p_left);

    dl = gp2pack_getDistance(&gp2p_left);
    dr = gp2pack_getDistance(&gp2p_right);

    printf("%X %2.2f %2.2f\n",i2cs_state,dl,dr);

    i2cs_state = I2C_NONE;
    *((double*)i2cs_data) = dl;
    *(((double*)i2cs_data)+1) = dr;
    i2cs_state = I2C_READY;
  }

  while(1) nop();

  return 0;
}
