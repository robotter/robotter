-----------------------------------------------------------------------------
-- Title    : ADNS 6010 Wishbone Interface
-- Project  : UNIOC_NG Optic Encoders
-----------------------------------------------------------------------------
-- File     : adns6010_wishbone_interface.vhd
-- Author   : Lamygale
-- Company  : Rob'Otter
-- 
-- Creation date : 25/01/2009
-- Platform : Altera Cyclone
-----------------------------------------------------------------------------
-- Description : 
-----------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2, or (at your option)
-- any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
ENTITY adns6010_wishbone_interface IS
  
  GENERIC (
    id      : natural := 2;
    wb_size_c : natural := 16;           -- data port size
    wb_adr_size_c : natural :=4;         -- adress port size
    adns_size_c : natural RANGE 8 TO 32:= 32;        -- data sensor port size
    squal_size_c : natural RANGE 8 TO 32:= 8  -- squal port size
    );

  PORT (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : IN  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : IN std_logic;           -- clock
    wbs_adr_i : IN std_logic_vector(wb_adr_size-1 DOWNTO 0);    -- adress BUS
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data readden
                                                             -- from bus
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0); -- data write from BUS
    wbs_we_i  : IN std_logic;           -- read/write
    wbs_stb_i : IN std_logic;           -- validate read/write operation
    wbs_ack_i : IN std_logic;           -- operation succesful
    wbs_cyc_i : IN std_logic;

    ---------------------------------------------------------------------------
    -- interface to the first sensor

    adns1_lock_o : OUT std_logic;
    adns1_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns1_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns1_squal_i   : IN std_logic_vector(7 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- interface to the second sensor

    adns2_lock_o : OUT std_logic;
    adns2_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns2_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns2_squal_i   : IN std_logic_vector(adns_size_c-1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- interface to the third sensor

    adns3_lock_o : OUT std_logic;
    adns3_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns3_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns3_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- common register to the ControlUnit

    fault_i : IN std_logic_vector(7 DOWNTO 0);

    auto_enable_o : OUT std_logic;      --enable the control Unit (active High)

    ---------------------------------------------------------------------------
    -- interface to the spi (controled by the µc when auto_enable_o is low)

    spi_data_i : IN std_logic_vector(7 DOWNTO 0);  -- data received by the spi
    spi_data_o : OUT std_logic_vector(7 DOWNTO 0);  -- data to be sent by the spi
    spi_send_data_o : OUT std_logic;    -- send spi_data_o (active high)
    spi_busy_i : IN std_logic;          -- spi transmitting (active high)
    
    adns_reset_o : OUT std_logic;       -- reset of the 3 sensors
    spi_cs_o     : OUT std_logic_vector(1 DOWNTO 0);  -- selection of the slave
                                                      -- adressed by the spi
    
    )
END adns6010_wishbone_interface;



