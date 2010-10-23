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
#include "adns9500_firmware.h"

/// Do a power up reset on an ADNS9500.
static void adns9500_reset(uint8_t adns_i);

/** @brief Upload firmware to an ADNS9500
 * @param adns_i ADNS to load
 */
static void adns9500_uploadFirmware(uint8_t adns_i);

/** @brief Compute atmega FLASH firmware CRC
 * @return computed firmware CRC
 */
static uint8_t adns9500_computeFirmwareCRC(void);


void adns9500_init(void)
{
  // Initialize SPI
  adns9500_spi_init();

  // Default configuration
  ADNS9500_LOCK = 0;
  ADNS9500_ENABLE = 0;
}


void adns9500_boot(void)
{
  uint8_t byte,hbyte,lbyte;
  uint8_t adns_i;

  // Wait OP + IN-RST for ADNS GO
  _delay_us(ADNS9500_TIMINGS_OP + ADNS9500_TIMINGS_INRST);

  // For each ADNS
  for(adns_i=1;adns_i<=ADNS9500_NUM;adns_i++)
  {
    //------------------------------------------------
    // Perform reset on current ADNS
    //------------------------------------------------

    DEBUG(ADNS9500_ERROR,"Performing reset of ADNS");

    adns9500_reset(adns_i);

    // read register from 0x02 to 0x06
    adns9500_spi_cs(adns_i);
    _delay_us(ADNS9500_TIMINGS_NCS_SCLK);
    uint8_t reg_it;
    for(reg_it=0x02; reg_it<=0x06; reg_it++)
    {
      adns9500_spi_send(reg_it);
      adns9500_spi_recv();
      _delay_us(ADNS9500_TIMINGS_SRWSRR);
    }

    //------------------------------------------------
    // Load FIRMWARE on current ADNS
    //------------------------------------------------

    DEBUG(ADNS9500_ERROR,"Uploading firmware on ADNS9500 #%u",adns_i);
    adns9500_uploadFirmware(adns_i);

    //------------------------------------------------
    // Check firmware on ADNS
    //------------------------------------------------

    adns9500_spi_cs(adns_i);
    _delay_us(ADNS9500_TIMINGS_NCS_SCLK);

    // Read SROMID register
    adns9500_spi_send(ADNS9500_SPIREGISTER_SROMID);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    DEBUG(ADNS9500_ERROR, "ADNS9500 #%u SROM register=0x%02X", adns_i, byte);

    // Check if SROMID is the expected value
    if( byte != ADNS9500_FIRMWARE_ID )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR, "ADNS9500 #%u : SROMID doesn't match firmware ID", adns_i);
    }

    //------------------------------------------------
    // Perform ADNS firmware CRC computation
    //------------------------------------------------

    // Start firmware SROM CRC test
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMENABLE);
    adns9500_spi_send(ADNS9500_SROMENABLE_CRC);
    wait_ms(ADNS9500_TIMINGS_CRC_DELAY/1000);

    // Read CRC LO value
    adns9500_spi_send(ADNS9500_SPIREGISTER_DOUTLOW);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    lbyte = adns9500_spi_recv();
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Read CRC HI value
    adns9500_spi_send(ADNS9500_SPIREGISTER_DOUTHI);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    hbyte = adns9500_spi_recv();
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    DEBUG(ADNS9500_ERROR, "ADNS9500 #%u SROM CRC lo=0x%02X hi=0x%02X", adns_i, hbyte, lbyte);

    // Check CRC value
    if( lbyte != ADNS9500_FIRMWARE_CRCLO || hbyte != ADNS9500_FIRMWARE_CRCHI )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
            "ADNS9500 #%u : firmware CRC fail, got lo=0x%02X hi=0x%02X",
            adns_i, lbyte, hbyte);
    }

    //------------------------------------------------
    // Load ADNS configuration
    //------------------------------------------------
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    adns9500_spi_cs(adns_i);
    // Read register current value
    adns9500_spi_send(ADNS9500_SPIREGISTER_LASERCTRL0);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%u laser ctrl 0 register %02X",adns_i,byte);

    // Enable laser, set FORCE_DISABLE bit (bit-0) to 0
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_LASERCTRL0);
    adns9500_spi_send(byte&0xFE);
    _delay_us(ADNS9500_TIMINGS_SRWSRR);

    // Set resolution to the maximum value
    adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_CONFIGURATION1);
    adns9500_spi_send(ADNS9500_CONFIGURATION1_RESMAX);
  }

  // Wait maximum delay (a frame period) in case we've got
  // a command immediatly after this function.
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);
}


void adns9500_checks(void)
{
  uint8_t it;
  uint8_t byte;

  // For each ADNS
  for(it=1;it<=ADNS9500_NUM;it++)
  {
    // Set current ADNS CS active
    adns9500_spi_cs(it);
    _delay_us(ADNS9500_TIMINGS_NCS_SCLK);

    //-------------------------------
    // Read Motion register

    // Read register current value
    adns9500_spi_send(ADNS9500_SPIREGISTER_MOTION);
    _delay_us(ADNS9500_TIMINGS_SRAD);
    byte = adns9500_spi_recv();

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%u motion=0x%X",it,byte);

    // Check if ADNS is Fault, if true, error.
    if( bit_is_set(byte,ADNS9500_MOTION_BIT_FAULT) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%u : ADNS is fault, motion=0x%X",
              it,byte);
    }

    // Check LP_CFG* consistency, if not, error.
    if( !bit_is_set(byte,ADNS9500_MOTION_BIT_LPVALID) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%u : LP_CFG* inconsistent, motion=0x%X",
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

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%u observation=0x%X",it,byte);

    // Check if ADNS is running on SROM code, if not, error.
    if( !bit_is_set(byte,ADNS9500_OBSERVATION_BIT_OB7) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%u : ADNS is not running on SROM code, observation=0x%X",
              it,byte);
    }

    // Check if NPD pulse was detected, if true, error.
    if( bit_is_set(byte,ADNS9500_OBSERVATION_BIT_OB5) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%u : NPD pulse detected, observation=0x%X",
              it,byte);
    }

    //------------------------------------------------
    // Good to GO !
    adns9500_spi_cs(0);

  } /* for(it=1;it<=ADNS9500_NUM;it++) */
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


void adns9500_reset(uint8_t adns_i)
{
  // drive NCS high, then low to reset the SPI port
  _delay_us(ADNS9500_TIMINGS_PWRESET);
  adns9500_spi_cs(0);
  _delay_us(ADNS9500_TIMINGS_PWRESET);
  adns9500_spi_cs(adns_i);
  _delay_us(ADNS9500_TIMINGS_PWRESET);

  // Write 0x5A to POWERUP register
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_POWERUPRESET);
  adns9500_spi_send(ADNS9500_POWERUPRESET_RESET);
  wait_ms(ADNS9500_TIMINGS_SPICMDRESET/1000);

}


void adns9500_uploadFirmware(uint8_t adns_i)
{
  adns9500_spi_cs(adns_i);
  _delay_us(ADNS9500_TIMINGS_NCS_SCLK);

  // Select the 3K bytes SROM size
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_CONFIGURATION4);
  adns9500_spi_send(ADNS9500_CONFIGURATION4_LOAD1);
  _delay_us(ADNS9500_TIMINGS_SWW);

  // Write 0x1D to register SROMENABLE to initialize
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMENABLE);
  adns9500_spi_send(ADNS9500_SROMENABLE_LOAD1);

  // Wait for one frame
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);
  _delay_us(ADNS9500_TIMINGS_FRAME_PERIOD);

  // Write 0x18 to register SROMENABLE again to start SROM downloading
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMENABLE);
  adns9500_spi_send(ADNS9500_SROMENABLE_LOAD2);
  _delay_us(ADNS9500_TIMINGS_SWW);

  // Initiate PROM download burst mode
  adns9500_spi_send(ADNS9500_SPI_WRITE|ADNS9500_SPIREGISTER_SROMLOAD);
  // Wait LOAD
  _delay_us(ADNS9500_TIMINGS_LOAD);

  // For each firmware byte
  uint16_t data_i;
  for(data_i=0;data_i<sizeof(adns9500_firmwareArray);data_i++)
  {
    // Read firmware from AVR FLASH, then write it
    uint8_t byte = pgm_read_byte(adns9500_firmwareArray + data_i);
    adns9500_spi_send( byte );
    // Wait LOAD
    _delay_us(ADNS9500_TIMINGS_LOAD);
  }

  // Exit burst mode by pulling CS for FIRMWEND
  adns9500_spi_cs(0);
  // note: tFIRMWEND > tBEXIT
  _delay_us(ADNS9500_TIMINGS_FIRMWEND);

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


void adns9500_checkFirmware()
{
  uint8_t crc;

  // Compute CRC
  crc = adns9500_computeFirmwareCRC();

  // Check if CRC value is the correct one
  if( crc != ADNS9500_FIRMWARE_CRC )
    ERROR(ADNS9500_ERROR,"ADNS9500 : flash firmware corrupted, CRC=0x%02X",crc);
}


void adns9500_checkSPI(void)
{
  uint8_t it;
  uint8_t byte_pid;
  uint8_t byte_ipid;

  for(it=1;it<=ADNS9500_NUM;it++)
  {
    // Activate ADNS SPI
    adns9500_spi_cs(it);

    _delay_us(ADNS9500_TIMINGS_NCS_SCLK);

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

    DEBUG(ADNS9500_ERROR,"ADNS9500 #%u checking SPI pid=0x%X ipid=0x%X",
                            it, byte_pid, byte_ipid);

    // Test if productID and inverse productID are consistents
    if( byte_pid != (uint8_t)(~byte_ipid) )
    {
      adns9500_spi_cs(0);
      ERROR(ADNS9500_ERROR,
              "ADNS9500 #%u : SPI communication fail, pid=0x%X ipid=0x%X",
              it, byte_pid, byte_ipid);
    }

    adns9500_spi_cs(0);
  }
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

