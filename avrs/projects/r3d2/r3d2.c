#include "r3d2.h"
#include "r3d2_config.h"

#define MOTOR_SPEED 2000

#define REFLECTOR_SIZE 2.0

// angle , and distance of the object (measured in timer ticks), period of the motor
volatile uint16_t object_beginnig_detection, object_end_detection, motor_period;
volatile uint8_t position_updated;
uint16_t object_angle, object_duty_cycle;

static double detected_robot_angle, detected_robot_distance;



typedef enum {
	irq_low_level= 0x00, 
	irq_any_change = 0x01, 
	irq_falling_edge = 0x02, 
	irq_rising_edge= 0x03} irq_sense_t;


// int0 initialisation (mirror)
void int0_init(void)
{
    // int0 generates interrupt on falling edge of input signal
    MCUCR |= (irq_falling_edge << ISC00);
    
    // enable interrupt
    sbi(GICR, INT0);
    
    // clear previous interrupt
    sbi(GIFR, INTF0);
}


ISR(INT0_vect)
{
    //uart_send(0, 'm'); 
    motor_period = timer1_get();
    timer1_set(0);

	// initialise data to know when it has been updated
    object_beginnig_detection = 0xFFFF;
    object_end_detection = 0xFFFF;
}

// int1 initialisation (sick sensor)
void int1_init(void)
{
    // int0 generates interrupt on rising edge of input signal
    MCUCR |= (irq_rising_edge << ISC10 );
    
    // enable interrupt
    sbi(GICR, INT1);
    
    // clear previous interrupt
    sbi(GIFR, INTF1);
}


ISR(INT1_vect)
{
    uint16_t timer_value = timer1_get();
    
    if(!bit_is_set(MCUCR, ISC10))
    {
        //MCUCR |= (irq_rising_edge << ISC10 );
        //MCUCR &= ~(irq_rising_edge << ISC10 );
        object_end_detection= timer_value;
        //uart_send(0, 'A');
        sbi(MCUCR, ISC10);
        position_updated ++;
    }
    else
    {
        //MCUCR |= (irq_falling_edge << ISC10 );
        //MCUCR &= ~(irq_falling_edge << ISC10 );
        cbi(MCUCR, ISC10);
        object_beginnig_detection = timer_value;
        //uart_send(0, 'B');
    }
}


void init_mirror(void)
{
    motor_period = 0;
    int0_init();
}

void enable_sensor(void)
{
	sbi(DDRB, 1);
	sbi(PORTB, 1);
}

void disable_sensor(void)
{
	cbi(PORTB,1);
}

void init_sensor(void)
{
    	object_angle = 0xFFFF;
    	object_duty_cycle = 0xFFFF;
    	int1_init();

	enable_sensor();
}

double convert_timer_ticks_to_rpm(uint16_t timer_ticks)
{
	return ((double)((F_CPU*60)/TIMER1_PRESCALER_DIV)/(double)timer_ticks);
}

double convert_timers_ticks_to_angle(uint16_t angle, uint16_t motor_period)
{
	 return (((double)angle *360)/(double)motor_period);
}

void motor_init(void)
{
	// direction	
	sbi(DDRD, 4);
	sbi(DDRD, 4);

	// brake	
	sbi(DDRD, 5);
	sbi(PORTD, 5);
}


double get_angle(void)
{
	
	

	while (1)	
	{		
		// wait until new position
		while(position_updated ==0);// <= 3);
	    	object_duty_cycle = object_end_detection - object_beginnig_detection;
    		object_angle = object_beginnig_detection + object_duty_cycle/2;

		f_an = (((float)object_angle)*360)/motor_period;
		f_dc = (((float)object_duty_cycle)*360)/motor_period;
		f_object_distance = REFLECTOR_SIZE/(2 * tan((f_dc/2)*M_PI/180));

		printf("angle : %4.2f \t| duty cycle %4.2f\t| motor period %3.2f | dist %3.2f\n", f_an,f_dc , convert_timer_ticks_to_rpm( motor_period), f_object_distance);//, motor_period, object_duty_cycle, object_angle);
	
		position_updated = 0;
		
		// led must blink
		PORTA = ~ PORTA;
	}
}
