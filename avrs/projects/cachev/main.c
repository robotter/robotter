/* 
 * to program:
 sudo avrdude -c avrispv2 -P usb -p m16 -e -B 10 -U flash:w:main.hex
 * to read fuses:
 sudo avrdude -c avrispv2 -P usb -p m16 -U hfuse:r:high.txt:s -U lfuse:r:low.txt:s -B 10
 * */
#include <aversive.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <aversive/wait.h>
#include <aversive/list.h>
#include <uart.h>
#include <adc.h>

#define PB0 (1<<0)
#define PB1 (1<<1)

#define RETCURM1 0
#define RETCURM2 1
#define RETCURM3 2

void init_led(void){
	DDRB |= PB1; // led PB1 out
	DDRB |= PB0; // led PB0 out
}

void enable_led(void){
	/* allumage des leds */
	PORTB |= PB1;
	PORTB |= PB0;
}

void led1(void){
	PORTB |= PB1;
}
void led2(void){
	PORTB |= PB0;
}

void disable_led(void){
	/* allumage des leds */
	PORTB = PORTB&(~PB1);
	PORTB = PORTB&(~PB0);
}

void init_ADC(){
	/* all adc input */
	DDRA = 0x00;
	adc_init();

}

void testADC(int ADC_NUM){
	char ans;
	int adc;
	ans='y';
	while(ans=='y'){
		printf("\npress a key\n");
		uart0_recv();
		adc = adc_get_value(ADC_REF_AVCC |ADC_NUM);
		printf("value read is %d, another value (y/n)?",adc);
		ans = uart0_recv();
	}
}

void motors_init(void){
	/* pwm for motor 1 */
	DDRD |= (1<<5);
	/* direction for motor 1 */
	DDRC |= (1<<6);

	/* pwm for motor 2 */
	DDRB |= (1<<3);
	/* direction for motor 2 */
	DDRC |= (1<<7);

	/* pwm for motor 3 */
	DDRD |= (1<<7);
	/* direction for motor 3 */
	DDRD |= (1<<6);
}


void motor1_speed(int speed){
	printf("MOTOR1 = %d ",speed);
	pwm_set_1A(speed);
	uart0_recv();
	printf("\n");
}

void motor2_speed(int speed){
	printf("MOTOR2 = %d ",speed);
	pwm_set_0(speed);
	uart0_recv();
	printf("\n");
}

void motor3_speed(int speed){
	printf("MOTOR3 = %d ",speed);
	pwm_set_2(speed);
	uart0_recv();
	printf("\n");
}

int main(void)
{
	int i;
	char ans;
	int adc;

	sei();

	init_led();
	enable_led();
	// Initialize UART
	uart_init();
	init_ADC();
	fdevopen(uart0_dev_send, uart0_dev_recv);
	printf("\n");
	printf("**********************************\n");
	printf("Welcome in testbench for Càchev v1\n");
	printf("**********************************\n");

	/* uart test */
	printf("* testing uart receive send:\n push 'a' ");
	ans = uart0_recv();
	if(ans == 'a'){
		printf("- OK\n");
	}

	/* testing the servo */
	OCR1B
	
	while(1){
		nop();
	};

	/* testing motors */
	printf("* testing motors polp\n");
	pwm_init();
	motors_init();
	printf("pwm initialized\n");
	printf("motor 1:\n");

	/* test motor 3 */
	printf("Branch motor on M3\n");
	printf("press key\n");
	ans = uart0_recv();
	motor3_speed(100);
	while(1){
		adc = adc_get_value(ADC_REF_AVCC | RETCURM3);
		printf("%d\n",adc);
	}
	motor3_speed(500);
	motor3_speed(1000);
	motor3_speed(2000);
	motor3_speed(3000);
	motor3_speed(4000);
	motor3_speed(-4000);
	motor3_speed(-1000);
	motor3_speed(-500);
	motor3_speed(-100);

	/* test motor1 */
	printf("Branch motor on M1\n");
	printf("press key\n");
	ans = uart0_recv();

	motor1_speed(100);
/*
	while(1){
		adc = adc_get_value(ADC_REF_AVCC | RETCURM1);
		printf("%d\n",adc);
	}
*/
	motor1_speed(500);
	motor1_speed(1000);
	motor1_speed(2000);
	motor1_speed(3000);
	motor1_speed(4000);
	motor1_speed(-4000);
	motor1_speed(-1000);
	motor1_speed(-500);
	motor1_speed(-100);

	printf("Branch motor on M2\n");
	printf("press key\n");
	ans = uart0_recv();

	/* test motor2 */
	motor2_speed(100);
	motor2_speed(500);
	motor2_speed(1000);
	motor2_speed(2000);
	motor2_speed(3000);
	motor2_speed(4000);
	motor2_speed(-4000);
	motor2_speed(-1000);
	motor2_speed(-500);
	motor2_speed(-100);


	/* potentiometers */
	printf("* testing potentiometers:\n");
	// Initialize ADC
	printf("ADC initialized\n");
	printf("\nBranch the rotationary potentiometer on rot1,");
	testADC(MUX_ADC3);
	printf("\nBranch the rotationary potentiometer on rot2,");
	testADC(MUX_ADC4);
	printf("\nBranch the rotationary potentiometer on lin1,");
	testADC(MUX_ADC5);


	printf("\nEnd of tests\n");
	while(1){
		nop();
	}

	return 0;
}

