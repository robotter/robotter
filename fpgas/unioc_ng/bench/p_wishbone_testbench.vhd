-----------------------------------------------------------------------------
-- Title    : wishbone testbench package
-- Project  : UNIOC_NG Optic Encoders
-----------------------------------------------------------------------------
-- File     : p_wishbone_testbench.vhd
-- Author   : Lamygale
-- Company  : Rob'Otter
-- 
-- Creation date : 25/01/2009
-- Platform : Altera Cyclone
-----------------------------------------------------------------------------
-- Description : provides read and write operation over wishbone bus.
-- TODO : implement reset over the bus,
-- 					provide selectable wb_adr_so bus width
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE p_wishbone_testbench IS

  PROCEDURE wb_read(
    adress : IN std_logic_vector(5 DOWNTO 0);  -- adress written to wb bus
    SIGNAL wb_clk_si : IN std_ulogic;          -- clock de la spi
    SIGNAL wb_adr_so : OUT  std_logic_vector(5 DOWNTO 0);  -- wb adress BUS
    SIGNAL wb_dat_si : IN std_logic_vector(7 DOWNTO 0);  -- data bus
    SIGNAL wb_we_so : OUT std_logic;    -- read/write
    SIGNAL wb_std_so : OUT std_logic;  -- validate read/write operation
    SIGNAL wb_ack_si : IN std_logic;   -- acknoledge
    SIGNAL wb_cyc_so : OUT std_logic;
    SIGNAL data_read_o : OUT  std_logic_vector(7 DOWNTO 0));  -- data read


  PROCEDURE wb_write(
    adress : IN std_logic_vector(5 DOWNTO 0);
    data_written : IN std_logic_vector(7 DOWNTO 0);
    SIGNAL wb_clk_si : IN std_ulogic;          -- clock de la spi
    SIGNAL wb_adr_so : OUT  std_logic_vector(5 DOWNTO 0);  -- adress BUS
    SIGNAL wb_dat_so : OUT std_logic_vector(7 DOWNTO 0);  -- data bus
    SIGNAL wb_we_so : OUT std_logic;    -- read/write
    SIGNAL wb_std_so : OUT std_logic;  -- validate read/write operation
    SIGNAL wb_ack_si : IN std_logic;   -- acknoledge
    SIGNAL wb_cyc_so : OUT std_logic);


END p_wishbone_testbench;

PACKAGE BODY p_wishbone_testbench IS

  

  PROCEDURE wb_read(
    adress : IN std_logic_vector(5 DOWNTO 0);  -- adress written to wb bus
    SIGNAL wb_clk_si : IN std_ulogic;          -- clock de la spi
    SIGNAL wb_adr_so : OUT  std_logic_vector(5 DOWNTO 0);  -- wb adress BUS
    SIGNAL wb_dat_si : IN std_logic_vector(7 DOWNTO 0);  -- data bus
    SIGNAL wb_we_so : OUT std_logic;    -- read/write
    SIGNAL wb_std_so : OUT std_logic;  -- validate read/write operation
    SIGNAL wb_ack_si : IN std_logic;   -- acknoledge
    SIGNAL wb_cyc_so : OUT std_logic;
    SIGNAL data_read_o : OUT  std_logic_vector(7 DOWNTO 0))  -- data read
  IS
  BEGIN
    WAIT UNTIL rising_edge(wb_clk_si);
    wb_adr_so <= adress;
    wb_we_so <= '0';
    wb_cyc_so <= '1';
    wb_std_so <= '1';
    WAIT UNTIL rising_edge(wb_clk_si);
    data_read_o <= wb_dat_si;
    wb_std_so <= '0';
     
  END wb_read;


  PROCEDURE wb_write(
    adress : IN std_logic_vector(5 DOWNTO 0);
    data_written : IN std_logic_vector(7 DOWNTO 0);
    SIGNAL wb_clk_si : IN std_ulogic;          -- clock de la spi
    SIGNAL wb_adr_so : OUT  std_logic_vector(5 DOWNTO 0);  -- adress BUS
    SIGNAL wb_dat_so : OUT std_logic_vector(7 DOWNTO 0);  -- data bus
    SIGNAL wb_we_so : OUT std_logic;    -- read/write
    SIGNAL wb_std_so : OUT std_logic;  -- validate read/write operation
    SIGNAL wb_ack_si : IN std_logic;   -- acknoledge
    SIGNAL wb_cyc_so : OUT std_logic)
  IS
  BEGIN
    WAIT UNTIL rising_edge(wb_clk_si);
    wb_adr_so <= adress;
    wb_we_so <= '1';
    wb_dat_so <= data_written;
    wb_cyc_so <= '1';
    wb_std_so <= '1';
    WAIT UNTIL rising_edge(wb_clk_si);
    wb_std_so <= '0';
  END wb_write;

END p_wishbone_testbench;




