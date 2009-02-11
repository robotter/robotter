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

/** @file adns6010.c
  * @author JD
  *
  * Drive RobOtter ADNS6010 FPGA system.
  */

#include <aversive.h>
#include <aversive/wait.h>
#include <util/delay.h>

#include <stdio.h>
#include <stdlib.h>

#include "adns6010.h"
#include "adns6010_spi.h"
#include "adns6010_spi_registers.h"

#include "adns6010_firmware.h"


void adns6010_init()
{
  // Initialize external memory over FPGA

  // enable ATmega external SRAM operation
  sbi(MCUCR,SRE);

  // set low timings on SRAM
  sbi(MCUCR,SRW10);
  sbi(XMCRA,SRW11);
  sbi(XMCRA,SRW00);
  sbi(XMCRA,SRW01);

  sbi(XMCRA,SRL0);
  sbi(XMCRA,SRL1);
  sbi(XMCRA,SRL2);

  // FPGA need some time to boot
  wait_ms(200);

  // Initialize SPI
  adns6010_spi_init();

  // Default configuration
  ADNS6010_LOCK = 0;
  ADNS6010_ENABLE = 0;

  return;
}  


uint8_t adns6010_boot(adns6010_configuration_t* config)
{
  uint8_t byte,hbyte,lbyte,lpcfg;
  uint8_t it;

  // Wait OP + IN-RST for ADNS GO
  _delay_us(ADNS6010_TIMINGS_OP + ADNS6010_TIMINGS_INRST);

  // perform reset on all adns during pw-reset
  adns6010_setReset(1);
  // TODO Test original timings values TODO
  //_delay_us(adns6010_timings_pwreset);
  wait_ms(5);
  adns6010_setReset(0);

  // t(pu-reset)
  // TODO Test original timings values TODO
  wait_ms(150);

  // For each ADNS
  for(it=1;it<=ADNS6010_NUM;it++)
  {
    //------------------------------------------------
    // Load FIRMWARE on current ADNS
    //------------------------------------------------
    
    adns6010_uploadFirmware(it);

    //------------------------------------------------
    // Check firmware on ADNS
    //------------------------------------------------
    
    // Set CS to current ADNS
    adns6010_spi_cs(it);
    // Wait NCS-SCLK
    _delay_us(1);

    // Read SROMID register
    adns6010_spi_send(ADNS6010_SPIREGISTER_SROMID);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    byte = adns6010_spi_recv();

    // Check if SROMID is the expected value
    if( byte != ADNS6010_FIRMWARE_ID )
    {
      // Set CS inactive
      adns6010_spi_cs(0);
      return ADNS6010_RV_ADNS1_SROMIDFAIL + it - 1;
    }

    //------------------------------------------------
    // Perform ADNS firmware CRC computation
    //------------------------------------------------
    
    // delay read-write
    _delay_us(ADNS6010_TIMINGS_SRWSRR);

    // Start firmware SROM CRC test
    adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_SROMENABLE);
    adns6010_spi_send(ADNS6010_SROMENABLE_CRC);

    // Wait for CRC to be completed
    _delay_us(ADNS6010_TIMINGS_CRC_DELAY);
    
    // Read CRC LO vlaue
    adns6010_spi_send(ADNS6010_SPIREGISTER_DOUTLOW);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    lbyte = adns6010_spi_recv();
    
    // delay read-read
    _delay_us(ADNS6010_TIMINGS_SRWSRR);

    // Read CRC HI value
    adns6010_spi_send(ADNS6010_SPIREGISTER_DOUTHI);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    hbyte = adns6010_spi_recv();

    // Check CRC value
    if( !((lbyte == ADNS6010_FIRMWARE_CRCLO)
       && (hbyte == ADNS6010_FIRMWARE_CRCHI) ))
    {
      // Set CS inactive
      adns6010_spi_cs(0);
      return ADNS6010_RV_ADNS1_SROMCRCFAIL + it - 1;
    }
    
    //------------------------------------------------
    // Load ADNS configuration
    //------------------------------------------------
    
    //-------------------------------
    // Load Configuration register

    // delay read-read
    _delay_us(ADNS6010_TIMINGS_SRWSRR);

    // Read register current value
    adns6010_spi_send(ADNS6010_SPIREGISTER_CONFIGURATION);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    byte = adns6010_spi_recv();

    // Set laser shutter
    if(config->shutter == ADNS6010_SHUTTER_ON)
      sbi(byte,ADNS6010_CONFIGURATION_BIT_SHUTTER);
    else
      cbi(byte,ADNS6010_CONFIGURATION_BIT_SHUTTER);

    // Set resolution
    switch(config->res)
    {
      case ADNS6010_RES_400:
        cbi(byte,ADNS6010_CONFIGURATION_BIT_RES1);
        cbi(byte,ADNS6010_CONFIGURATION_BIT_RES0);
        break;

      case ADNS6010_RES_800:
        sbi(byte,ADNS6010_CONFIGURATION_BIT_RES1);
        cbi(byte,ADNS6010_CONFIGURATION_BIT_RES0);
        break;

      case ADNS6010_RES_1600:
        cbi(byte,ADNS6010_CONFIGURATION_BIT_RES1);
        sbi(byte,ADNS6010_CONFIGURATION_BIT_RES0);
        break;

      case ADNS6010_RES_2000:
        sbi(byte,ADNS6010_CONFIGURATION_BIT_RES1);
        sbi(byte,ADNS6010_CONFIGURATION_BIT_RES0);
        break;

      default:
        adns6010_spi_cs(0);
        return ADNS6010_RV_BAD_CONFIGURATION;
    }
  
    // Constant bits in register
    sbi(byte,ADNS6010_CONFIGURATION2_BIT_ONE);

    // delay read-write
    _delay_us(ADNS6010_TIMINGS_SRWSRR);

    // Write value to register 
    adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_CONFIGURATION);
    adns6010_spi_send(byte);

    //-------------------------------
    // Load ConfigurationII register

    // delay write-read
    _delay_us(ADNS6010_TIMINGS_SWR);

    // Read register current value
    adns6010_spi_send(ADNS6010_SPIREGISTER_CONFIGURATION2);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    byte = adns6010_spi_recv();

    // LASER_NEN functions as normal
    cbi(byte,ADNS6010_CONFIGURATION2_BIT_FORCEDISABLE);
    
    // Constant bits in register
    sbi(byte,ADNS6010_CONFIGURATION2_BIT_ONE);

    // delay read-write
    _delay_us(ADNS6010_TIMINGS_SRWSRR);

    // Write value to register 
    adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_CONFIGURATION2);
    adns6010_spi_send(byte);

    //-------------------------------
    // Set LASER power / load LP_CFG0 register
 
    // bit7/Match shall be set to 0
    lpcfg = (config->power) & 0x7F;
    
    // LP_CFG1 shall be LP_CFG0 complement
    byte = ~lpcfg;

    // delay write-write
    _delay_us(ADNS6010_TIMINGS_SWW);
    // Write value to register 
    adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_LPCFG0);
    adns6010_spi_send(lpcfg);

    //------------------------------
    // Set LASER power / load LP_CFG1 register

    // delay write-write
    _delay_us(ADNS6010_TIMINGS_SWW);
    // Write value to register
    adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_LPCFG1);
    adns6010_spi_send(byte);

    //-------------------------------
    // Good to GO !

    // Set CS inactive
    adns6010_spi_cs(0);

  } /* for(it=1;it<=ADNS6010_NUM;it++) */

  // Wait maximum delay (a frame period) in case we've got
  // a command immediatly after this function.
  _delay_us(ADNS6010_TIMINGS_FRAME_PERIOD);

  return ADNS6010_RV_OK;
}


uint8_t adns6010_checks()
{
  uint8_t it;
  uint8_t byte;
  
  // For each ADNS
  for(it=1;it<=ADNS6010_NUM;it++)
  {
    // Set current ADNS CS active
    adns6010_spi_cs(it);
    // Wait NCS-SCLK
    _delay_us(1);

    //-------------------------------
    // Read Motion register

    // Read register current value
    adns6010_spi_send(ADNS6010_SPIREGISTER_MOTION);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    byte = adns6010_spi_recv();
   
    // Check if ADNS is Fault, if true, error.
    if( bit_is_set(byte,ADNS6010_MOTION_BIT_FAULT) )
    {
      adns6010_spi_cs(0);
      return ADNS6010_RV_ADNS1_FAULTFAIL + it - 1;
    }

    // Check LP_CFG* consistency, if not, error.
    if( !bit_is_set(byte,ADNS6010_MOTION_BIT_LPVALID) )
    {
      adns6010_spi_cs(0);
      return ADNS6010_RV_ADNS1_LPVALIDFAIL + it - 1;
    }

    //-------------------------------
    // Read Observation register

    // delay read-write
    _delay_us(ADNS6010_TIMINGS_SRWSRR);

    // Clear observation register
    adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_OBSERVATION);
    adns6010_spi_send(0x00);

    // wait one frame
    //(DS don't exactly specify delay here, one frame seems to be max refresh time)
    _delay_us(ADNS6010_TIMINGS_FRAME_PERIOD);

    // Read register current value
    adns6010_spi_send(ADNS6010_SPIREGISTER_OBSERVATION);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    byte = adns6010_spi_recv();

    // Check if ADNS is running on SROM code, if not, error.
    if( !bit_is_set(byte,ADNS6010_OBSERVATION_BIT_OB7) )
    {
      adns6010_spi_cs(0);
      return ADNS6010_RV_ADNS1_SROMCODEFAIL + it - 1;
    }
 
    // Check if NPD pulse was detected, if true, error.
    if( bit_is_set(byte,ADNS6010_OBSERVATION_BIT_OB5) )
    {
      adns6010_spi_cs(0);
      return ADNS6010_RV_ADNS1_NPDPULSEFAIL + it - 1;
    }   

    //------------------------------------------------
    // Good to GO !
    adns6010_spi_cs(0);

  } /* for(it=1;it<=ADNS6010_NUM;it++) */

  return ADNS6010_RV_OK;
}


void adns6010_setMode(adns6010_behaviour_t behaviour)
{
  switch(behaviour)
  {
    default:
    case ADNS6010_BHVR_MODE_UC_DRIVEN:
        ADNS6010_ENABLE = 0;
      break;

    case ADNS6010_BHVR_MODE_AUTOMATIC:
        ADNS6010_ENABLE = 1;
      break;
  }

  return;
}


void adns6010_setReset(uint8_t value)
{
  if(value)
    sbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_RESET);
  else
    cbi(ADNS6010_SPI_CTRL,ADNS6010_SPICTRL_BIT_RESET);

  return;
}


void adns6010_uploadFirmware(uint8_t adns_i)
{
  uint16_t nb;
  uint8_t byte;

  // Set CS to current ADNS
  adns6010_spi_cs(adns_i);

  // Wait NCS-SCLK
  _delay_us(1);

  // Write 0x1D to register SROMENABLE
  adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_SROMENABLE);
  adns6010_spi_send(ADNS6010_SROMENABLE_LOAD1);

  // Set CS inactive
  adns6010_spi_cs(0);

  // Wait one frame
  _delay_us(ADNS6010_TIMINGS_FRAME_PERIOD);

  // Set CS to current ADNS
  adns6010_spi_cs(adns_i);
  // Wait NCS-SCLK
  _delay_us(1);

  // Write 0x18 to register SROMENABLE
  adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_SROMENABLE);
  adns6010_spi_send(ADNS6010_SROMENABLE_LOAD2);

  // Set CS inactive
  adns6010_spi_cs(0);

  // Wait SWW
  _delay_us(ADNS6010_TIMINGS_SWW);

  // Set CS to current ADNS
  adns6010_spi_cs(adns_i);
  // Wait NCS-SCLK
  _delay_us(1);


  // Initiate PROM download burst mode
  adns6010_spi_send(ADNS6010_SPI_WRITE|ADNS6010_SPIREGISTER_SROMLOAD);
  // Wait LOAD
  _delay_us(ADNS6010_TIMINGS_LOAD);

  // For each firmware byte 
  for(nb=0;nb<sizeof(adns6010_firmwareArray);nb++)
  {
    // Read firmware from AVR FLASH
    byte = pgm_read_byte(adns6010_firmwareArray + nb);

    // Send firmware byte
    adns6010_spi_send( byte );

    // Wait LOAD
    _delay_us(ADNS6010_TIMINGS_LOAD);
  }

  // Exit burst mode by pulling CS for FIRMWEND
  adns6010_spi_cs(0);
  _delay_us(ADNS6010_TIMINGS_FIRMWEND);

  wait_ms(10);

  return;
}


uint8_t adns6010_computeFirmwareCRC()
{
  uint8_t crc = 0x00;
  uint8_t byte;
  uint16_t it;
  
  for(it=0;it<sizeof(adns6010_firmwareArray);it++)
  {
    byte = pgm_read_byte(adns6010_firmwareArray+it);
    crc = crc ^ byte;
  }
  return crc;
}


uint8_t adns6010_checkFirmware()
{
  uint8_t crc;
  
  // Compute CRC
  crc = adns6010_computeFirmwareCRC();
  
  // Check if CRC value is the correct one
  if( crc == ADNS6010_FIRMWARE_CRC )
    return 1;
  else
    return 0;
}


uint8_t adns6010_checkSPI(void)
{
  uint8_t it;
  uint8_t byte_pid;
  uint8_t byte_ipid;

  for(it=1;it<=ADNS6010_NUM;it++)
  {
    // Activate ADNS SPI
    adns6010_spi_cs(it);

    // Wait NCS-SCLK
    _delay_us(1);
    
    // Read productID
    adns6010_spi_send(ADNS6010_SPIREGISTER_PRODUCTID);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    byte_pid = adns6010_spi_recv();

    // delay read-read
    _delay_us(ADNS6010_TIMINGS_SRWSRR);

    // Read inverse productID
    adns6010_spi_send(ADNS6010_SPIREGISTER_INVPRODUCTID);
    _delay_us(ADNS6010_TIMINGS_SRAD);
    byte_ipid = adns6010_spi_recv();
    
    // Test if productID and inverse productID are consistents
    if( byte_pid != ~byte_ipid )
    {  
      adns6010_spi_cs(0);
      return ADNS6010_RV_ADNS1_SPICOMMFAIL + it - 1;
    }

    adns6010_spi_cs(0);
  }
  
  return ADNS6010_RV_OK;
}
