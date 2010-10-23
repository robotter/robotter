/*  
 *  Copyright RobOtter (2009)
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
 */

/** @file adns9500.c
  * @author JD
  *
  * Drive RobOtter ADNS9500 FPGA system.
  */

#include <aversive.h>
#include <aversive/error.h>
#include <aversive/wait.h>
#include <util/delay.h>

#include "adns9500.h"
#include "adns9500_spi.h"
#include "adns9500_spi_registers.h"

#include "adns9500_firmware2.h"

void adns9500_init()
{
  // Initialize SPI
  adns9500_spi_init();

  // Default configuration
  ADNS9500_LOCK = 0;
  ADNS9500_ENABLE = 0;
	
	wait_ms(100); // wait until 3V3 is stable

	for(uint8_t it=1; it<= ADNS9500_NUM;it++)
	{
		DEBUG(ADNS9500_ERROR,"Performing reset of ADNS %u",it);
		
		_delay_us(ADNS9500_TIMINGS_PWRESET);
		// Set CS inactive
		adns9500_spi_cs(0);

		//_delay_us(ADNS9500_TIMINGS_PWRESET);
		wait_ms(1);
		
		// Set CS to current ADNS
		adns9500_spi_cs(it);

		// perform reset on all adns during pw-reset
		_delay_us(ADNS9500_TIMINGS_PWRESET);
		// Set CS inactive
		adns9500_spi_cs(0);
		
		_delay_us(1);
		adns9500_spi_cs(it);
    // Wait NCS-SCLK
    _delay_us(1);

		adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_POWERUPRESET);
    adns9500_spi_send(ADNS9500_POWERUPRESET_RESET);

		// Set CS inactive
		adns9500_spi_cs(0);

		wait_ms(50);//ADNS9500_TIMINGS_SPICMDRESET);

	}
  return;
}  


uint8_t adns9500_boot(adns9500_configuration_t* config)
{
  uint8_t byte,hbyte,lbyte,lpcfg;
  uint8_t it;

  // Wait OP + IN-RST for ADNS GO
  _delay_us(ADNS9500_TIMINGS_OP + ADNS9500_TIMINGS_INRST);

  // For each ADNS
  for(it=1;it<=ADNS9500_NUM;it++)
  {
	
	  //------------------------------------------------
    // Perform reset on current ADNS
    //------------------------------------------------
    
		DEBUG(ADNS9500_ERROR,"Performing reset of ADNS");
		
		_delay_us(ADNS9500_TIMINGS_PWRESET);
		// Set CS inactive
		adns9500_spi_cs(0);

		_delay_us(ADNS9500_TIMINGS_PWRESET);
		// Set CS to current ADNS
		adns9500_spi_cs(it);

		// perform reset on all adns during pw-reset
		_delay_us(ADNS9500_TIMINGS_PWRESET);
		// Set CS inactive
		adns9500_spi_cs(0);
		
		_delay_us(1);
		adns9500_spi_cs(it);
    // Wait NCS-SCLK
    _delay_us(1);

		adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_POWERUPRESET);
    adns9500_spi_send(ADNS9500_POWERUPRESET_RESET);

		// Set CS inactive
		adns9500_spi_cs(0);

		wait_ms(50);//ADNS9500_TIMINGS_SPICMDRESET);

		// read register from 0x02 to 0x06
		for (uint8_t reg_it = ADNS9500_SPIREGISTER_MOTION; reg_it <= ADNS9500_SPIREGISTER_DELTAYH; reg_it ++)
		{
			adns9500_spi_cs(it);
		  // Wait NCS-SCLK
		  _delay_us(1);
			adns9500_spi_send(reg_it);
			adns9500_spi_recv();
			// Set CS inactive
			adns9500_spi_cs(0);
		
			_delay_us(ADNS9500_TIMINGS_SRWSRR);
		}		

    //------------------------------------------------
    // Load FIRMWARE on current ADNS
    //------------------------------------------------
    
    DEBUG(ADNS9500_ERROR,"Uploading firmware on ADNS9500 #%d",it);
    adns9500_uploadFirmware(it);

    //------------------------------------------------
    // Check firmware on ADNS
    //------------------------------------------------
    
    // Set CS to current ADNS
    adns9500_spi_cs(it);
    // Wait NCS-SCLK
    _delay_us(1);

    // Read SROMID register
    adns9500_spi_send(ADNS9500_SPIREGISTER_SROMID);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d SROM register=0x%02X",it,byte);

    // Check if SROMID is the expected value
    if( byte != ADNS9500_FIRMWARE_ID )
    {
      // Set CS inactive
      adns9500_spi_cs(0);

      // Throw error
      ERROR(ADNS9500_ERROR,"ADNS9500 #%d : SROMID doesn't match firmware ID",it);
    }

    //------------------------------------------------
    // Perform ADNS firmware CRC computation
    //------------------------------------------------
    
    // delay read-write
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Start firmware SROM CRC test
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMENABLE);
    adns9500_spi_send(ADNS9500_SROMENABLE_CRC);

    // Wait for CRC to be completed
    //_delay_us(ADNS9500_TIMINGS_CRC_DELAY);
    wait_ms(10);

    // Read CRC LO vlaue
    adns9500_spi_send(ADNS9500_SPIREGISTER_DOUTLOW);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    lbyte = adns9500_spi_recv();
    
    // delay read-read
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Read CRC HI value
    adns9500_spi_send(ADNS9500_SPIREGISTER_DOUTHI);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    hbyte = adns9500_spi_recv();
    
    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d SROM CRC hbyte=0x%X lbyte=0x%X",it,hbyte,lbyte);

    // Check CRC value
    if( !((lbyte == ADNS9500_FIRMWARE_CRCLO)
       && (hbyte == ADNS9500_FIRMWARE_CRCHI) ))
		{
		  // Set CS inactive
		  adns9500_spi_cs(0);
		  ERROR(ADNS9500_ERROR,
				  "ADNS9500 #%d : firmware CRC fail, lo=0x%X hi=0x%X",
				  it, lbyte, hbyte);
		}

    //------------------------------------------------
    // Load ADNS configuration
    //------------------------------------------------
		_delay_us(ADNS9500_TIMINGS_SRWSRR);

		adns9500_spi_cs(it);
    // Read register current value
    adns9500_spi_send(ADNS9500_SPIREGISTER_LASERCTRL0);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();		
 		adns9500_spi_cs(0);
		_delay_us(ADNS9500_TIMINGS_SRWSRR);

		DEBUG(ADNS9500_ERROR,"ADNS9500 #%d laser ctrl 0 register %02X",it,byte);
	
		adns9500_spi_cs(it);
		_delay_us(1);

    // Write value to register 
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_LASERCTRL0);
    adns9500_spi_send(byte&0xFE);
		
		adns9500_spi_cs(0);

		_delay_us(ADNS9500_TIMINGS_SRWSRR);

		adns9500_spi_cs(it);

    // Read register current value
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_CONFIGURATION1);
    adns9500_spi_send(0x38);	
 		adns9500_spi_cs(0);
		_delay_us(ADNS9500_TIMINGS_SRWSRR);

    //-------------------------------
    // Load Configuration register

    #if 0
	// delay read-read
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Read register current value
    adns9500_spi_send(ADNS9500_SPIREGISTER_CONFIGURATION);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d configuration=0x%X",it,byte);

    // Set laser shutter
    if(config->shutter == ADNS9500_SHUTTER_ON)
      sbi(byte,ADNS9500_CONFIGURATION_BIT_SHUTTER);
    else
      cbi(byte,ADNS9500_CONFIGURATION_BIT_SHUTTER);

    // Set resolution
    switch(config->res)
    {
      case ADNS9500_RES_400:
        cbi(byte,ADNS9500_CONFIGURATION_BIT_RES1);
        cbi(byte,ADNS9500_CONFIGURATION_BIT_RES0);
        break;

      case ADNS9500_RES_800:
        sbi(byte,ADNS9500_CONFIGURATION_BIT_RES1);
        cbi(byte,ADNS9500_CONFIGURATION_BIT_RES0);
        break;

      case ADNS9500_RES_1600:
        cbi(byte,ADNS9500_CONFIGURATION_BIT_RES1);
        sbi(byte,ADNS9500_CONFIGURATION_BIT_RES0);
        break;

      case ADNS9500_RES_2000:
        sbi(byte,ADNS9500_CONFIGURATION_BIT_RES1);
        sbi(byte,ADNS9500_CONFIGURATION_BIT_RES0);
        break;

      default:
        adns9500_spi_cs(0);
        ERROR(ADNS9500_ERROR,"ADNS9500 #%d : bad resolution configuration",it);
    }
  
    // Constant bits in register
    sbi(byte,ADNS9500_CONFIGURATION2_BIT_ONE);

    // delay read-write
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Write value to register 
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_CONFIGURATION);
    adns9500_spi_send(byte);

    //-------------------------------
    // Load ConfigurationII register

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d loading configurationII register",it);

    // delay write-read
    _delay_us(ADNS9500_TIMINGS_SWR);

    // Read register current value
    adns9500_spi_send(ADNS9500_SPIREGISTER_CONFIGURATION2);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();

    // LASER_NEN functions as normal
    cbi(byte,ADNS9500_CONFIGURATION2_BIT_FORCEDISABLE);
    
    // Constant bits in register
    sbi(byte,ADNS9500_CONFIGURATION2_BIT_ONE);

    // delay read-write
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Write value to register 
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_CONFIGURATION2);
    adns9500_spi_send(byte);

    //-------------------------------
    // Set LASER power / load LP_CFG0 register
 
    // bit7/Match shall be set to 0
    lpcfg = (config->power) & 0x7F;
    
    // LP_CFG1 shall be LP_CFG0 complement
    byte = ~lpcfg;

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d setting LPCFG0 register",it);

    // delay write-write
    _delay_us(ADNS9500_TIMINGS_SWW);
    // Write value to register
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_LPCFG0);
    adns9500_spi_send(lpcfg);

    //------------------------------
    // Set LASER power / load LP_CFG1 register

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d setting LPCFG1 register",it);

    // delay write-write
    _delay_us(ADNS9500_TIMINGS_SWW);
    // Write value to register
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_LPCFG1);
    adns9500_spi_send(byte);

    //-------------------------------
    // Good to GO !

    // Set CS inactive
    adns9500_spi_cs(0);
	#endif
  } 

  // Wait maximum delay (a frame period) in case we've got
  // a command immediatly after this function.
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);

  return ADNS9500_RV_OK;
}


uint8_t adns9500_checks()
{
  uint8_t it;
  uint8_t byte;
  
  // For each ADNS
  for(it=1;it<=ADNS9500_NUM;it++)
  {
    // Set current ADNS CS active
    adns9500_spi_cs(it);
    // Wait NCS-SCLK
    _delay_us(1);

    //-------------------------------
    // Read Motion register

    // Read register current value
    adns9500_spi_send(ADNS9500_SPIREGISTER_MOTION);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();
   
    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d motion=0x%X",it,byte);

    // Check if ADNS is Fault, if true, error.
    if( bit_is_set(byte,ADNS9500_MOTION_BIT_FAULT) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%d : ADNS is fault, motion=0x%X",
              it,byte);
    }

    // Check LP_CFG* consistency, if not, error.
    if( !bit_is_set(byte,ADNS9500_MOTION_BIT_LPVALID) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%d : LP_CFG* inconsistent, motion=0x%X",
              it,byte);
    }

    //-------------------------------
    // Read Observation register

    // delay read-write
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Clear observation register
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_OBSERVATION);
    adns9500_spi_send(0x00);

    // wait for new frame 
    //(DS don't exactly specify delay here, one frame seems to be max refresh time)
    _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);
    _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);
    
    // Read register current value
    adns9500_spi_send(ADNS9500_SPIREGISTER_OBSERVATION);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d observation=0x%X",it,byte);

    // Check if ADNS is running on SROM code, if not, error.
    if( !bit_is_set(byte,ADNS9500_OBSERVATION_BIT_OB7) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%d : ADNS is not running on SROM code, observation=0x%X",
              it,byte);
    }
 
    // Check if NPD pulse was detected, if true, error.
    if( bit_is_set(byte,ADNS9500_OBSERVATION_BIT_OB5) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%d : NPD pulse detected, observation=0x%X",
              it,byte);
    }   

    //------------------------------------------------
    // Good to GO !
    adns9500_spi_cs(0);

  } /* for(it=1;it<=ADNS9500_NUM;it++) */

  return ADNS9500_RV_OK;
}


void adns9500_setMode(adns9500_behaviour_t behaviour)
{
  switch(behaviour)
  {
    default:
    case ADNS9500_BHVR_MODE_UC_DRIVEN:
        ADNS9500_ENABLE = 0;
      break;

    case ADNS9500_BHVR_MODE_AUTOMATIC:
        ADNS9500_ENABLE = 1;
      break;
  }

  DEBUG(ADNS9500_ERROR,"ADNS9500 system behaviour = 0x%X",behaviour);

  return;
}


void adns9500_setReset(uint8_t value)
{
  if(value)
    sbi(ADNS9500_SPI_CTRL,ADNS9500_SPICTRL_BIT_RESET);
  else
    cbi(ADNS9500_SPI_CTRL,ADNS9500_SPICTRL_BIT_RESET);

  return;
}


void adns9500_uploadFirmware(uint8_t adns_i)
{
  uint16_t nb;
  uint8_t byte;

  // Set CS to current ADNS
  adns9500_spi_cs(adns_i);

  // Wait NCS-SCLK
  _delay_us(1);

  // Write bit 1 to register 0x39
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_CONFIGURATION4);
	adns9500_spi_send(ADNS9500_CONFIGURATION4_LOAD1);
  // Set CS inactive
  adns9500_spi_cs(0);

	_delay_us(ADNS9500_TIMINGS_SWW);	

  // Set CS to current ADNS
  adns9500_spi_cs(adns_i);

  // Wait NCS-SCLK
  _delay_us(1);

  // Write 0x1D to register SROMENABLE
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMENABLE);
  adns9500_spi_send(ADNS9500_SROMENABLE_LOAD1);

  // Set CS inactive
  adns9500_spi_cs(0);

  // Wait for new frame
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);

  // Set CS to current ADNS
  adns9500_spi_cs(adns_i);
  // Wait NCS-SCLK
  _delay_us(1);

  // Write 0x18 to register SROMENABLE
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMENABLE);
  adns9500_spi_send(ADNS9500_SROMENABLE_LOAD2);

  // Set CS inactive
  adns9500_spi_cs(0);

  // Wait SWW
  _delay_us(ADNS9500_TIMINGS_SWW);

  // Set CS to current ADNS
  adns9500_spi_cs(adns_i);
  // Wait NCS-SCLK
  _delay_us(1);


  // Initiate PROM download burst mode
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMLOAD);
  // Wait LOAD
  _delay_us(ADNS9500_TIMINGS_LOAD);

  // For each firmware byte 
  for(nb=0;nb<sizeof(adns9500_firmwareArray);nb++)
  {
    // Read firmware from AVR FLASH
    byte = pgm_read_byte(adns9500_firmwareArray + nb);

    // Send firmware byte
    adns9500_spi_send( byte );

    // Wait LOAD
    _delay_us(ADNS9500_TIMINGS_LOAD);
  }

  // Exit burst mode by pulling CS for FIRMWEND
  adns9500_spi_cs(0);
  _delay_us(ADNS9500_TIMINGS_FIRMWEND);

  wait_ms(10);

  return;
}


uint8_t adns9500_computeFirmwareCRC()
{
  uint8_t crc = 0x00;
  uint8_t byte;
  uint16_t it;
  
  for(it=0;it<sizeof(adns9500_firmwareArray);it++)
  {
    byte = pgm_read_byte(adns9500_firmwareArray+it);
    crc = crc ^ byte;
  }
  return crc;
}


uint8_t adns9500_checkFirmware()
{
  uint8_t crc;
  
  // Compute CRC
  crc = adns9500_computeFirmwareCRC();
  
  // Check if CRC value is the correct one
  if( crc != ADNS9500_FIRMWARE_CRC )
    ERROR(ADNS9500_ERROR,"ADNS9500 : flash firmware corrupted, CRC=0x%02X",crc);

  return ADNS9500_RV_OK;
}


uint8_t adns9500_checkSPI(void)
{
  uint8_t it;
  uint8_t byte_pid;
  uint8_t byte_ipid;

  for(it=1;it<=ADNS9500_NUM;it++)
  {
    // Activate ADNS SPI
    adns9500_spi_cs(it);

    // Wait NCS-SCLK
    _delay_us(1);
    
    // Read productID
    adns9500_spi_send(ADNS9500_SPIREGISTER_PRODUCTID);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte_pid = adns9500_spi_recv();

    // delay read-read
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Read inverse productID
    adns9500_spi_send(ADNS9500_SPIREGISTER_INVPRODUCTID);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    
    byte_ipid = adns9500_spi_recv();

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%d checking SPI pid=0x%X ipid=0x%X",
                            it, byte_pid, byte_ipid);

    // Test if productID and inverse productID are consistents
    if( byte_pid != (uint8_t)(~byte_ipid) )
    {  
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%d : SPI communication fail, pid=0x%X ipid=0x%X",
              it, byte_pid, byte_ipid);
    }
    
    adns9500_spi_cs(0);
  }
  
  return ADNS9500_RV_OK;
}

void adns9500_encoders_get_value(adns9500_encoders_t* encoders)
{
  // Latch all movement registers
  // (latch is triggered on lock rising edge)
  ADNS9500_LOCK = ADNS9500_LOCK_NONE;
  _delay_us(1);
  ADNS9500_LOCK = ADNS9500_LOCK_ALL;
  _delay_us(1);
  
  // ADNS 1
  encoders->vectors[ADNS9500_VX1] = ADNS9500_1_DELTAX;
  encoders->vectors[ADNS9500_VY1] = ADNS9500_1_DELTAY;
  encoders->squals[0] = ADNS9500_1_SQUAL;
 
  // ADNS 2
  encoders->vectors[ADNS9500_VX2] = ADNS9500_2_DELTAX;
  encoders->vectors[ADNS9500_VY2] = ADNS9500_2_DELTAY;
  encoders->squals[1] = ADNS9500_2_SQUAL; 

  // ADNS 3
  encoders->vectors[ADNS9500_VX3] = ADNS9500_3_DELTAX;
  encoders->vectors[ADNS9500_VY3] = ADNS9500_3_DELTAY;
  encoders->squals[2] = ADNS9500_3_SQUAL;

  // FAULT register
  encoders->fault = ADNS9500_FAULT;

  return;
}


static uint8_t motion_data[14];

void get_motion(void)
{
	adns9500_spi_cs(0);
	_delay_us(100);
  // Set CS to current ADNS
  adns9500_spi_cs(1);

  // Wait NCS-SCLK
  _delay_us(1);
  adns9500_spi_send(0x50);//ADNS9500_SPIREGISTER_MOTION);//ADNS9500_SPIREGISTER_DELTAYL);

  //_delay_us(ADNS9500_TIMINGS_SRAD);
	_delay_us(100);
	
	for(uint8_t it = 0; it <14; it ++)
	{	
		motion_data[it]= adns9500_spi_recv();

	}
}

int16_t adns9500_get_x(uint8_t adns_i)
{
	return (int16_t)(motion_data[3]<<8 | motion_data[2]);
}

int16_t adns9500_get_y(uint8_t adns_i)
{
	return (int16_t)(motion_data[5]<<8 | motion_data[4]);
}

uint8_t get_squal(void)
{
	return motion_data[6];
}

