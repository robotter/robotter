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
 *  Revision : $Id: lcd.c,v 1.7 2008-01-08 20:05:03 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Technology 2005 - Zer0
 * Implementation for LCD
 */

/** \file lcd.c
 *  \brief Implementation for the LCD module.
 *
 *  \todo Test the module with other wirings, verify the delay macro, stqtic inlines for the public functions ??
 *
 *  \test works on mega32 with all on the same port and old normal wiring, how about more speific connections ?
 *
 * This module provides functions for using a lcd device
 */



#include <stdio.h>

#include <aversive/pgmspace.h>
#include <aversive.h>
#include <aversive/wait.h>

#include <lcd.h>
#include <lcd_protocol.h>


//#define lcd_e_delay()   asm volatile("nop")  /* delay 500ns with 4Mhz */
#define e_delay() _delay_loop_1(1) // ok ca ?


/**********************************************************/
/*
** port level functions
*/

// DDR en sortie
static inline void port_set_out(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);  // if there is some other stuff on the same port
  DDR(LCD_PORT) |= LCD_DATA_MASK;
  IRQ_UNLOCK(flags);
}

// DDR en entree
static inline void port_set_in(void)
{
  uint8_t flags;

  IRQ_LOCK(flags);
  DDR(LCD_PORT) &= ~(LCD_DATA_MASK);
  IRQ_UNLOCK(flags);
}


/* toggle Enable Pin */
static inline void e_toggle(void)
{
  sbi(LCD_E_PORT, LCD_E_BIT);
  e_delay();
  cbi(LCD_E_PORT, LCD_E_BIT);
}

/**********************************************************/
/*
** byte level functions
*/
static inline void lcd_write(uint8_t data,uint8_t rs) 
{
  register uint8_t port_save;
  uint8_t flags;


  port_set_out();
  

  cbi(LCD_RW_PORT, LCD_RW_BIT);//RW=0

  if (rs) 
    sbi(LCD_RS_PORT, LCD_RS_BIT); //RS=1 
  else
    cbi(LCD_RS_PORT, LCD_RS_BIT); //RS=0 
      

  // port state save
  IRQ_LOCK(flags);
 
 port_save= LCD_DATA_PORT & ~(LCD_DATA_MASK);

  /* output high nibble first */
  LCD_DATA_PORT = ( ( ((data>>4) << LCD_FIRST_DATA_BIT) & LCD_DATA_MASK )
		    |  port_save );

  e_toggle();
  
  /* output low nibble */
  LCD_DATA_PORT = ( ((data<<LCD_FIRST_DATA_BIT) & LCD_DATA_MASK)
		    |  port_save );


  IRQ_UNLOCK(flags);

  e_toggle();
}



static uint8_t lcd_read(uint8_t rs) 
{
  register uint8_t dataH, dataL;
  
  
  if (rs) sbi(LCD_RS_PORT, LCD_RS_BIT);    /* RS=1: read data      */
  else    cbi(LCD_RS_PORT, LCD_RS_BIT);    /* RS=0: read busy flag */
  sbi(LCD_RW_PORT, LCD_RW_BIT);            /* RW=1  read mode      */
  
  /* configure data pins as input */
  port_set_in();
  
  sbi(LCD_E_PORT, LCD_E_BIT);
  e_delay();
  
  
  dataH = PIN(LCD_PORT) >> LCD_FIRST_DATA_BIT ;/* read high nibble first */
  
  cbi(LCD_E_PORT, LCD_E_BIT);   
  e_delay();                           /* Enable 500ns low       */
  

  sbi(LCD_E_PORT, LCD_E_BIT);
  e_delay();
  
  dataL = PIN(LCD_PORT) >> LCD_FIRST_DATA_BIT ;            /* read low nibble        */

  cbi(LCD_E_PORT, LCD_E_BIT);   
    
  return ( (dataH<<4) | (dataL&0x0F) );
}


// use for init, to set lcd mode to 4 bits
void initial_8_bit_write(uint8_t value)
{
  register uint8_t port_save;
  uint8_t flags;


  cbi(LCD_RW_PORT, LCD_RW_BIT);

  cbi(LCD_RS_PORT, LCD_RS_BIT);


  IRQ_LOCK(flags);

  // port save
  port_save = LCD_DATA_PORT & ~(LCD_DATA_MASK);


  LCD_DATA_PORT = ( ((value <<LCD_FIRST_DATA_BIT) & LCD_DATA_MASK)
		    |  port_save );

  IRQ_UNLOCK(flags);

  e_toggle();
  wait_ms(1);           // delay, busy flag can't be checked here 
}

/**********************************************************/
/*
** commands and more
*/

static inline unsigned char lcd_waitbusy(void)
/* loops while lcd is busy, reads address counter */
{
  register unsigned char c;
  
  while ( (c=lcd_read(0)) & (1<<LCD_BUSY)) ;
  
  return (c);  // return address counter
}



void lcd_command(uint8_t cmd)
     /* send commando <cmd> to LCD */
{
  lcd_waitbusy();
  lcd_write(cmd,0);
}



static inline void lcd_newline(uint8_t pos)
     /* goto start of next line */
{
  register uint8_t addressCounter;
  
  
#if LCD_LINES==1
  addressCounter = 0;
#endif
#if LCD_LINES==2
  if ( pos < (LCD_START_LINE2) )
    addressCounter = LCD_START_LINE2;
  else
    addressCounter = LCD_START_LINE1;
#endif
#if LCD_LINES==4
  if ( pos < LCD_START_LINE3 )
    addressCounter = LCD_START_LINE2;
  else if ( (pos >= LCD_START_LINE2) && (pos < LCD_START_LINE4) )
    addressCounter = LCD_START_LINE3;
  else if ( (pos >= LCD_START_LINE3) && (pos < LCD_START_LINE2) )
    addressCounter = LCD_START_LINE4;
  else 
    addressCounter = LCD_START_LINE1;
#endif


  lcd_command((1<<LCD_DDRAM)+addressCounter);
  
}/* lcd_newline */






/**********************************************************/

/*
** PUBLIC FUNCTIONS 
*/



void lcd_gotoxy(uint8_t x, uint8_t y)
     /* goto position (x,y) */
{
#if (LCD_LINES==1)
  lcd_command((1<<LCD_DDRAM)+LCD_START_LINE1+x);
#endif
#if (LCD_LINES==2)
  if ( y==0 ) 
    lcd_command((1<<LCD_DDRAM)+LCD_START_LINE1+x);
  else
    lcd_command((1<<LCD_DDRAM)+LCD_START_LINE2+x);
#endif
#if LCD_LINES==4
  if ( y==0 )
    lcd_command((1<<LCD_DDRAM)+LCD_START_LINE1+x);
  else if ( y==1)
    lcd_command((1<<LCD_DDRAM)+LCD_START_LINE2+x);
  else if ( y==2)
    lcd_command((1<<LCD_DDRAM)+LCD_START_LINE3+x);
  else /* y==3 */
    lcd_command((1<<LCD_DDRAM)+LCD_START_LINE4+x);
#endif
  
}/* lcd_gotoxy */




void lcd_clrscr(void)
     /* clear lcd and set cursor to home position */
{
  lcd_command(1<<LCD_CLR);
}



void lcd_home(void)
     /* set cursor to home position */
{
  lcd_command(1<<LCD_HOME);
}



void lcd_putc(char c)
     /* print character at current cursor position */
{
  register unsigned char pos;
  
  pos = lcd_waitbusy();   // read busy-flag and address counter
  
#if LCD_DOUBLE_ADDRESSING == 1
  if(pos==8)
    {
      lcd_gotoxy(0,1);
      lcd_waitbusy();
    }
#endif

  if (c=='\n')        // new line
    lcd_newline(pos);
  else if (c== '\f') // form feed = clear screen
    lcd_clrscr();
	else                // normal car
    lcd_write(c, 1);
}

/* for use with fdevopen */
int lcd_dev_putc(char c, FILE* f)
{
	lcd_putc(c);
	return c;
}

void lcd_init(uint8_t dispAttr)
     /* initialize display and select type of cursor */
     /* dispAttr: LCD_DISP_OFF, LCD_DISP_ON, LCD_DISP_ON_CURSOR, LCD_DISP_CURSOR_BLINK */
{


  // DDRs
  port_set_out();

  sbi(DDR(LCD_RW_PORT), LCD_RW_BIT);
  sbi(DDR(LCD_RS_PORT), LCD_RS_BIT);
  sbi(DDR(LCD_E_PORT), LCD_E_BIT);


  wait_ms(16);        /* wait 16ms or more after power-on       */
  
  /*------ Initialize lcd to 4 bit i/o mode -------*/ 
  /* initial write to lcd is 8bit */
  initial_8_bit_write(LCD_FUNCTION_8BIT_1LINE>>4);
  initial_8_bit_write(LCD_FUNCTION_8BIT_1LINE>>4);
  initial_8_bit_write(LCD_FUNCTION_8BIT_1LINE>>4);
  initial_8_bit_write(LCD_FUNCTION_4BIT_1LINE>>4);


  
  lcd_command(LCD_FUNCTION_DEFAULT);      /* function set: display lines  */
  lcd_command(LCD_DISP_OFF);              /* display off                  */
  lcd_clrscr();                           /* display clear                */ 
  lcd_command(LCD_MODE_DEFAULT);          /* set entry mode               */
  lcd_command(dispAttr);                  /* display/cursor control       */




}/* lcd_init */
