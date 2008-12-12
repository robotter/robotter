/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2005)
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  Revision : $Id: brushless.c,v 1.2 2007-03-04 13:53:45 zer0 Exp $
 *
 */
 
 
/** This module handles a brushless motor with 3 phases, wired in triangle or star.
    3 hall sensors are used wih digital output.
    3 PWM are outputted, these MUST be synchronized !!
    
    The control value is a voltage. This can be assimiled to a torque at low speeds.
    
    There is a possibility of also of limiting the speed. This is accomplished by slowing down the sampling speed of the 
    sensors. Doing this,the motor effective torque is reduced when the speed is such that the sensor actuation
    approaches the sampling frequency.
    use this technique carefully, because the motor has already his full voltage applied, an can dissipate a lot of energy, especially at low speeds.
    
    
    there is no external manage function, as the manage is done at the PWM speed (overflow of one PWM timer is used.)
    This function is speed optimized.
*/


/** ceci est une commande de moteur brushless triphase en etoile,
    utilisant 3 capteurs a effet hall digitaux.
    En sortie on a 3 PWM (il est necessaire de les synchroniser !)
    
    pour le commande en couple, on joue sur les pwm (pseudo-couple)
    et pour la commande en vitesse, on joue sur la frequence de rafraichissement des phases
    par rapport aux capteurs.
    cette astuce simple permet de faire facilement une consigne de vitesse
    (pas besoin d'asservissement)
    mais des vitesses faibles sont saccadees.*/


#include <avr/io.h>
#include <avr/signal.h>


#include <pwm.h>

#include <utils.h>


#include <avr/pgmspace.h>

#include <brushless.h>

#include "brushless_3phase_digital_hall_config.h"

#if (BRUSHLESS_TYPE != BRUSHLESS_DIGITAL)
#error mauvais fichier de config "brushless_config.h"
#endif




/** calculating the event to use, based on PWM definition of the phase 1
    The two motors function on the same timer! */

#if (BRUSHLESS_TIMER == 0)
#define INIT_INT() 	sbi(TIMSK, TOIE0)
#define INT SIG_OVERFLOW0

#elif (BRUSHLESS_TIMER == 1)
#define INIT_INT() 	sbi(TIMSK, TOIE1)
#define INT SIG_OVERFLOW1

#elif (BRUSHLESS_TIMER == 2)
#define INIT_INT() 	sbi(TIMSK, TOIE2)
#define INT SIG_OVERFLOW2

#elif (BRUSHLESS_TIMER == 3)
#define INIT_INT() 	sbi(ETIMSK, TOIE3) /* extended timsk for this one ! */
#define INT SIG_OVERFLOW3

#endif


/** 2 LUT tables:
    sensors > relative electric angle
    sensors > phase information


    decimal value :          0      1      2      3      4      5      6      7
    sensors state :        000    001    010    011    100    101    110    111
    is this a valid state? :         NO    yes    yes    yes    yes    yes    yes     NO     */

// conversion to electrical angle
// modulo 1 electrical turn. 
// in RAM for faster acess
const int8_t g_brushless_angle[]=          {0,     1,     5,     0,     3,     2,     4,     0};

// in progmem for ram optimization
const int8_t PROGMEM g_brushless_phase1[]= {0,     1,    -1,     0,     0,     1,    -1,     0};
const int8_t PROGMEM g_brushless_phase2[]= {0,     0,     1,     1,    -1,    -1,     0,     0};
const int8_t PROGMEM g_brushless_phase3[]= {0,    -1,     0,    -1,     1,     0,     1,     0};

// the zeroes in the phase give a 0 output if there are no sensors connected, or another problem like this.
// it could be a good idea to enable the pull up resistors !


void brushless_speed_update_manage(void * dummy);

// mem of previous position for speed calc.
brushless_position g_brushless_0_position_previous;


// memory for current measurements
brushless   g_brushless_0;


// pseudo torque to use
brushless_torque  g_brushless_0_torque;


// given with speed limit
uint16_t g_brushless_0_pwm_divider = 1;



// function pointer definition for event
void (*periodic_event_0)(brushless) = 0; //NULL;



/** This function is made of 5 parts :
    - pwm divsion         : gives a master frequency for the next parts, by dividing the PWM frequency (can also be set to 1)
    - sensors acquisition : done every time
    - angle update        : done when there is a change in sensor state since last angle update
    - PWM update          : done only every x (every g_brushless_recurrence -1) and skipped if there is no change since last pwm update
    - speed update        : done only every y () this updates the speed
    
    
    Typically, PWM update is slower than angle update, in order to not skip angle counting.
    
    
    Typically, speed update is a lot slower than angle update in order to have a speed that is sampled at a correct rate.
    This event can trigger an action, this is especially used if you have a servo control.
    
    
    examples for a pretty fast motor : 
    - PWM at 30 kHz
    - angle update at 10 kHz
    - PWM update at 5 kHz or lower, depending on speed setting
    - speed update at 100 Hz
    
*/
  
  
volatile uint8_t pwm_division_timer asm("pwm_div")  = 1;  
volatile uint8_t interrupt_pwm; 
volatile uint8_t pwm_previous_sensors_0 = 0;     // previous state of sensors for PWM update 



#ifdef ASMHEADER
/** Here the division is done in ASM before saving a lot of registers on the stack.
    This gains a lot of time when using a 8 bit timer without prescale
    (one interrupt every 256 clocks !!)
    */

void INT (void) __attribute__ ((naked)); // no register save, and no exit !!
SIGNAL(INT)
{
asm volatile(

/* division, done very early, for optimization */
"PUSH    R1              \n\t"
"IN      R1,0x3F         \n\t"
"PUSH    R1              \n\t"
"LDS     R1,pwm_div      \n\t"
"DEC     R1              \n\t"
"BREQ    continue        \n\t"
"STS     pwm_div,R1      \n\t" /*we store only if negative. if positive, it will be done in the C code*/


/* early go out of int */
"go_out:                 \n\t"
"POP     R1              \n\t"
"OUT     0x3F,R1         \n\t"
"POP     R1              \n\t"
"RETI                    \n\t"

/* restoring context, double work with the following interrupt function, but no other way */
"continue:               \n\t"
"POP     R1              \n\t"
"OUT     0x3F,R1         \n\t"
"POP     R1              \n\t"

::);

}             // no jump, we pass implicitely.
SIGNAL(DUMMY) // we hope that the two are after each other !! (it is always the case with GCC)
{

#else // the same code in C
SIGNAL(INT)
{
/** PWM division part */
if (--pwm_division_timer != 0)
  return;


#endif //common code


  pwm_division_timer = BRUSHLESS_PWM_TO_SAMPLE_DIVISOR;
  // end of frequency division state machine



  /** various definitions */

  // angle update variables
  static int8_t angle_electrical_previous_0 = 0; // previous electrical angle

  static uint8_t angle_previous_sensors_0 = 0;     // previous state of sensors for angle calc

  int8_t angle_electrical, diff;
  uint8_t sensors_0 = 0;

  
  // pwm update variables
  static uint16_t pwm_update_timer_0 = 1;



    {
    /*********** Motor 0 angle update  **********/


    /** sensors acquisition part
    extraction of the sensor signals, and built up of a 3 bit ordened byte
    this is done every time */
  
    if(bit_is_set(PIN(BRUSHLESS_0_SENSOR_1_PORT),BRUSHLESS_0_SENSOR_1_BIT))
      sensors_0 +=1;
    if(bit_is_set(PIN(BRUSHLESS_0_SENSOR_2_PORT),BRUSHLESS_0_SENSOR_2_BIT))
      sensors_0 +=2;
    if(bit_is_set(PIN(BRUSHLESS_0_SENSOR_3_PORT),BRUSHLESS_0_SENSOR_3_BIT))
      sensors_0 +=4;

    #ifdef BRUSHLESS_0_SENSORS_INVERT
      sensors_0  = (~ sensors_0) & 0x7;  // inversion of the sensors
    #endif


  
    /** the angle update part */
  
    #ifndef LOADTEST
    // skipping if no change
    if(sensors_0 != angle_previous_sensors_0)
    #endif
      {
      angle_previous_sensors_0 = sensors_0;


      angle_electrical = g_brushless_angle[sensors_0];      // calculate electrical angle  

      diff = angle_electrical - angle_electrical_previous_0;  // convert to angle delta
      angle_electrical_previous_0 = angle_electrical;         // store for next time
  
      // clipping
      if (diff > 3)
        diff -=6;
      else if (diff < -3)
        diff +=6;

      #ifndef BRUSHLESS_0_INVERT
        diff *= -1;    // inversion of the angle reading
      #endif

      // update of the absolute angle with the delta
      //IRQ_LOCK(); // not necessary coz we enable ints only after
      g_brushless_0.position -= (brushless_position)diff * BRUSHLESS_POSITION_PRECISION;
      //IRQ_UNLOCK();

      }

    /*********** END Motor 0 angle update  **********/
    }


  if(interrupt_pwm ==0)
    {
    interrupt_pwm =1;

    sei();
    
    /*********** Motor 0 PWM update  **********/

    // frequency division state machine
    if (--pwm_update_timer_0 == 0)
      {
      uint8_t flags;
      IRQ_LOCK(flags);
      pwm_update_timer_0 = g_brushless_0_pwm_divider; // protected against glitches
      IRQ_UNLOCK(flags);
      // end of frequency division state machine
    
      #ifndef LOADTEST
      // skipping if same as last time
      if(sensors_0 != pwm_previous_sensors_0)
      #endif
        {
        brushless_torque torque;
      
        pwm_previous_sensors_0 = sensors_0;
      
      
        IRQ_LOCK(flags);
        torque = g_brushless_0_torque;
        IRQ_UNLOCK(flags);
      
      
      
      
        BRUSHLESS_0_PWM_SET_1( 
                              PWM_MAX/2 +                         // offset 50%
                              ((int8_t)pgm_read_byte(g_brushless_phase1 + sensors_0)) * // conversion from sensors
                              torque /*>> 1*/ );      // torque must be divided by 2. this is now done in the acess function
        BRUSHLESS_0_PWM_SET_2( 
                              PWM_MAX/2 +
                              ((int8_t)pgm_read_byte(g_brushless_phase2 + sensors_0)) * 
                              torque /*>> 1*/ );   
        BRUSHLESS_0_PWM_SET_3(  
                              PWM_MAX/2 +
                              ((int8_t)pgm_read_byte(g_brushless_phase3 + sensors_0)) *
                              torque /*>> 1*/ );
        }
      }
    

    /*********** END Motor 0 PWM update  **********/

    interrupt_pwm =0;
    }

  /** speed update part */

#ifndef BRUSHLESS_MANAGE_EXTERNAL
  // speed update variables
  static uint16_t speed_division_timer = 1; // only one needed
  // frequency division state machine
  if (--speed_division_timer == 0)
    {

    speed_division_timer = BRUSHLESS_SAMPLE_TO_EVENT_DIVISOR;
    // end of frequency division state machine

    brushless_speed_update_manage((void *)0);

    }
#endif

}


void brushless_speed_update_manage(void * dummy)
{
 
  uint8_t flags;
    
  // speed calculation, protected against glitches
  IRQ_LOCK(flags);
  g_brushless_0.speed = g_brushless_0.position - g_brushless_0_position_previous;
  g_brushless_0_position_previous = g_brushless_0.position;
  IRQ_UNLOCK(flags);
  
  
  // event call, with no imbrication autorized !
    {
    void (*f)(brushless);
    static volatile uint8_t in_progress = 0;
    
    if(in_progress ==0)
      {
      in_progress = 1;
      
      IRQ_LOCK(flags);
      f = periodic_event_0;
      IRQ_UNLOCK(flags);
      
      if(f)
        f(g_brushless_0);
        
        
      in_progress = 0;
      }
    }
}


brushless_speed speed_mem_0   = BRUSHLESS_MAX_SPEED;
brushless_torque torque_mem_0 = 0;


/** initialisation, also executes pwm_init */
void brushless_init(void)
{

	pwm_init();
  
	// pull up resistors enable, if feature enabled
#ifdef BRUSHLESS_0_SENSORS_PULL_UP_RESISTORS
	sbi(BRUSHLESS_0_SENSOR_1_PORT,BRUSHLESS_0_SENSOR_1_BIT);
	sbi(BRUSHLESS_0_SENSOR_2_PORT,BRUSHLESS_0_SENSOR_2_BIT);
	sbi(BRUSHLESS_0_SENSOR_3_PORT,BRUSHLESS_0_SENSOR_3_BIT);
#endif


	INIT_INT();

}




/******** set parameters, two times *******************/
void brushless_0_set_parameters(brushless_speed speed, brushless_torque torque)
{
	uint16_t pwm_divider = 0;
	uint8_t flags;
  
  
	// memory of settings
	speed_mem_0 = speed;
	torque_mem_0 = torque;
 
  
	if(speed ==0)
		torque = 0;
	else
		pwm_divider =  BRUSHLESS_MAX_SPEED / speed ;
  
	if (pwm_divider ==0)
		pwm_divider =1;
  
	torque /= 2; // division is made here instead of in int function

	// inversion
#ifdef BRUSHLESS_0_INVERT
	torque *= -1;
#endif
  
	IRQ_LOCK(flags);
	g_brushless_0_pwm_divider  = pwm_divider;
	g_brushless_0_torque = torque;
	IRQ_UNLOCK(flags);
  
	pwm_previous_sensors_0 = 0; // force application of the torque
}



/******** get current speed and position, two times *******************/
brushless brushless_0_get_mesures(void)
{
	brushless ret;
	uint8_t flags;
  
	IRQ_LOCK(flags);
	ret = g_brushless_0;
	IRQ_UNLOCK(flags);
  
	return ret;
}


/******** set the position counter, two times *******************/
void brushless_0_set_position(brushless_position p)
{
	uint8_t flags;
	IRQ_LOCK(flags);
	g_brushless_0_position_previous += (p - g_brushless_0.position); // avoids speed glitches  on pos change
	g_brushless_0.position = p;
	IRQ_UNLOCK(flags);
}



void brushless_0_register_periodic_event(void (*f)(brushless))
{
	uint8_t flags;
	IRQ_LOCK(flags);
	periodic_event_0 = f;
	IRQ_UNLOCK(flags);
}



/** acess functions for the control system interface */


/** get speed function, compatible with control_system. Argument not used. */
int32_t brushless_get_speed(void * motor_num)
{
	brushless retour;
  
	retour = brushless_0_get_mesures();
  
	return (int32_t)(retour.speed);
}

/** get position function, compatible with control_system. Argument not used. */
int32_t brushless_get_pos(void * motor_num)
{
	brushless retour;

	retour = brushless_0_get_mesures();
  
	return (int32_t)(retour.position);
}

/** set torque function, compatible with control_system. first argument not used. */
void brushless_set_torque(void * motor_num, int32_t torque)
{
	brushless_0_set_parameters(speed_mem_0, (brushless_torque) torque);
}

/** set speed function, compatible with control_system. first argument not used. */
void brushless_set_speed(void * motor_num, int32_t speed)
{
	brushless_0_set_parameters((brushless_speed) speed, torque_mem_0);
}
