#ifndef FIREFLY2_2_H
#define FIREFLY2_2_H


/* Firefly2_2 hardware */
#define INPUT_PIN	0
#define OUTPUT_PIN	1

/* SPI */
#define SPI_SS		0	// PB.0 - Output: SPI Slave Select
#define SCK			1	// PB.1	- Output: SPI Serial Clock
#define MOSI		2	// PB.2
#define CSN			0	// PC.0 - Output: SPI Chip Select (CS_N)


/* User interface */
#define LED_DDR		DDRE
#define LED_PORT	PORTE
#define	LED_ORANGE	2	// PE.2
#define	LED_BLUE	3	// PE.3
#define LED_GREEN	4	// PE.4
#define	LED_RED		5	// PE.5

#define BUTTON_DDR	DDRA
#define BUTTON_PORT	PINA
#define BUTTON_PIN	7	// PA.7

/* Debug interface */
#define DEBUG_0		3	// PA.3
#define DEBUG_1		4	// PA.4
#define DEBUG_2		0	// PD.0
#define DEBUG_3		1	// PD.1



/* Useful routines */

/* use sbi() and cbi() instead */
#define SET(port, pin)	port |= (1<<(pin))
#define CLR(port, pin)	port &= ~(1<<(pin))

/* test of bit (pin) of (port) 
 * Substitutes as 1 if pin is set, or 0 if not */
#define TST(port, pin)	((port & (1<<(pin)))>>(pin))

/* To set leds you have to clear the bit (yeah, I know...) */
#define LED_SET(led)	cbi(LED_PORT, (led))
#define LED_CLR(led)	sbi(LED_PORT, (led))


#endif
