#include <aversive.h>
#include <aversive/wait.h>
#include <scheduler.h>
#include <stdio.h>
#include <stdlib.h>
#include <uart.h>
#include <math.h>

#include <adns6010.h>

#include "sendframe.h"

uint32_t t=0;
uint32_t lt;
/*
SIGNAL(SIG_INTERRUPT4)
{
  if(PINE&0x10)
  {
    // INT4 is up
    *(uint16_t*)(&TCNT1L) = 0;
  }
  else
  {
    // INT4 is down
    printf("%u\n",*(uint16_t*)(&TCNT1L));
  }

}
*/
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

  wait_ms(200);

  printf("Checking ADNS6010 component ID = 0x%2.2X\n",ADNS6010_ID);
 
  adns6010_setMode(ADNS6010_BHVR_MODE_UC_DRIVEN);

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

 // printf("t | x1 | y1 | s1 | x2 | y2 | s2 | x3 | y3 | s3 | fault\n");

/*
  // Boussole
  cbi(DDRE,4); DDRE=0x00;

  // Any logical change on INT4 (PORTE 4)
  cbi(EICRB,ISC41);
  sbi(EICRB,ISC40);

  // Enable EINTS on INT4
  sbi(EIMSK,INT4);

  // Counter  1
  TCCR1B = (1<<CS11)+(1<<CS10);
*/
  // Matrice de positionnement
  double Mx[6] = {
    0.0000897,    0.0041783,  - 0.0032225,  - 0.0021137,    0.0034996,  - 0.0021684};
  double My[6] = {
      0.0039630,    0.0002610,  - 0.0019085,    0.0035498,  - 0.0022024,  - 0.0034904};
  double Ma[6] = {
      - 0.0000009,  - 0.0000343,    0.0000008,  - 0.0000338,    0.0000017,  - 0.0000336};


  double lx1 = 0,ly1 = 0,lx2 = 0,ly2 = 0,lx3 = 0,ly3 = 0;
  double vx1,vy1,vx2,vy2,vx3,vy3;
  double dx,dy,da;
  double x = 0, y = 0, a = 0;

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
    if(!(t%10))
      printf("%6.6ld %6.6ld %6.6ld %6.6ld %6.6ld %6.6ld\n",
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
    
    a += da;

    x += dx*cos(a) - dy*sin(a);
    y += dx*sin(a) + dy*cos(a);
    

    if(!(t%20))
      printf(" x = %2.2f y = %2.2f a = %2.2f\n",x,y,a);
  }

  return 0;
}
