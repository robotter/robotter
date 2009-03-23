#include <aversive.h>
#include <aversive/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <uart.h>
#include <math.h>

#include <adns6010.h>

int main(void)
{
  uint8_t rv = 0x00;

	// ADNS configuration
	adns6010_configuration_t adns_config;

	//--------------------------------------------------------------------------
	// Booting

  // Turn interruptions ON
  sei();

  // Initialize UART
  uart_init();
  fdevopen(uart1_dev_send, uart1_dev_recv);

  // Some advertisment :p
  printf("\n\nRobotter 2009 - 102chute - UNIOC ADNS6010 TEST\n");
  printf("Compiled "__DATE__" at "__TIME__"\n\n");

  //--------------------------------------------------------
  // Initialize ADNS6010s
  printf("Initializing ADNS6010s : ");
  adns6010_init();
  printf("OK\n");

  //--------------------------------------------------------

  printf("Checking ADNS6010 firmware on FLASH : ");
  rv = adns6010_checkFirmware();

  if(!rv)
  {
    printf("KO -- Firmware stored on ATMEGA FLASH is not valid\n");

    // It's a trap !
    while(1);
  }
  printf("OK\n");

	// ADNS CONFIGURATION
	adns_config.res = ADNS6010_RES_2000;
	adns_config.shutter = ADNS6010_SHUTTER_ON;
	adns_config.power = 0x11;

  //--------------------------------------------------------

  wait_ms(100);

  printf("Checking SPI communication with ADNS6010s : ");
  rv = adns6010_checkSPI();

  if(rv)
  {
    printf("KO -- adns6010_checkSPI() returned 0x%2.2X",rv);
    
    // It's a trap !
    while(1);
  }
  printf("OK\n");

  //--------------------------------------------------------

  // Launch ADNS6010s boot sequence
  printf("Booting ADNS6010s : ");
  rv = adns6010_boot(&adns_config);

  if(rv)
  {
    printf("KO -- adns6010_boot() returned 0x%X\n",rv);

    // It's a trap !
    while(1);
  }
  printf("OK\n");

  //--------------------------------------------------------

  printf("Checking ADNS6010s : ");
  rv = adns6010_checks();

  if(rv)
  {
    printf("KO -- adns6010_checks() returned 0x%X\n",rv);

    // It's a trap !
    while(1);
  }
  printf("OK\n");

	printf("ADNS6010s are GO\n\n");

  //--------------------------------------------------------

  // Ready up
  printf("All systems GO.\n\n");

  int32_t x2,y2,x3,y3;

  // Set ADNS6010 system to automatic
  adns6010_setMode(ADNS6010_BHVR_MODE_AUTOMATIC);
  
  adns6010_encoders_t adnsenc;

  printf("t | x1 | y1 | s1 | x2 | y2 | s2 | x3 | y3 | s3 | fault\n");

  double Mx[6] = {
    - 0.1597928  ,
    - 0.0375097  ,
    - 0.0871382  ,
    0.0688487  ,
    - 0.0368006  ,
    - 0.0411320 };
  double My[6] = {
    - 0.1723755  ,
    - 0.0298261  ,
    - 0.0677853  ,
    0.0772286  ,
    - 0.0175276  ,
    - 0.0566467};
  double Ma[6] = {
    - 0.1694723  ,
    - 0.0335015  ,
    - 0.0929089  ,
    0.0684750  ,
    - 0.0387185  ,
    - 0.0482066  };

  double lx1 = 0,ly1 = 0,lx2 = 0,ly2 = 0,lx3 = 0,ly3 = 0;
  double vx1,vy1,vx2,vy2,vx3,vy3;
  double dx,dy,da;
  double x = 0, y = 0, a = 0;
  uint32_t t=0;
  while(1)
  {
    t++;

    adns6010_encoders_get_value(&adnsenc);
    
    vx1 = adnsenc.x1 - lx1;
    vy1 = adnsenc.y1 - ly1;
    vx2 = adnsenc.x2 - lx2;
    vy2 = adnsenc.y2 - ly2;
    vx3 = adnsenc.x3 - lx3;
    vy3 = adnsenc.y3 - ly3;

    lx1 = adnsenc.x1;
    ly1 = adnsenc.y1;
    lx2 = adnsenc.x2;
    ly2 = adnsenc.y2;
    lx3 = adnsenc.x3;
    ly3 = adnsenc.y3;
/*
    printf("%6.6ld %6.6ld %6.6ld %6.6ld %6.6ld %6.6ld | ",
              adnsenc.x1, adnsenc.y1,
              adnsenc.x2, adnsenc.y2,
              adnsenc.x3, adnsenc.y3);
    */
    dx = Mx[0] * vx1 
      + Mx[1] * vy1
      + Mx[2] * vx2
      + Mx[3] * vy2
      + Mx[4] * vx3
      + Mx[5] * vy3;

    dy = My[0] * vx1 
      + My[1] * vy1
      + My[2] * vx2
      + My[3] * vy2
      + My[4] * vx3
      + My[5] * vy3;

    da = Ma[0] * vx1 
      + Ma[1] * vy1
      + Ma[2] * vx2
      + Ma[3] * vy2
      + Ma[4] * vx3
      + Ma[5] * vy3;

    x += dx;
    y += dy;
    a += da;
    
    if(!(t%10))
      printf(" %2.2f %2.2f %2.2f\n",x,y,a);
 //     printf(" x = %2.2f y = %2.2f a = %2.2f\n",x,y,a);
  }

  return 0;
}
