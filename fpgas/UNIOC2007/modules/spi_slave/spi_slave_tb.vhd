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

-----------------------------------------------------------------------------
--! @file
--! @brief spi_slave testbench
--! @author Lamygale
-----------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


PACKAGE fction_spi IS

  PROCEDURE send_spi (
    CONSTANT clk_period_c   : IN time;
    CONSTANT data_to_send_c : IN std_logic_vector(7 DOWNTO 0);
    SIGNAL sck_s  : OUT std_logic;
    SIGNAL mosi_s : OUT std_logic
  );

  PROCEDURE send_1_bit (
    CONSTANT clk_period_c  : IN time;
    CONSTANT bit_to_send_c : IN std_logic;
    SIGNAL sck_s  : OUT std_logic;
    SIGNAL mosi_s : OUT std_logic
  );

END PACKAGE fction_spi;

PACKAGE BODY fction_spi IS

  PROCEDURE send_spi (
    CONSTANT clk_period_c   : IN time;
    CONSTANT data_to_send_c : IN std_logic_vector(7 DOWNTO 0);
    SIGNAL sck_s  : OUT std_logic;
    SIGNAL mosi_s : OUT std_logic
  ) IS
    VARIABLE cpt_envoi_v : natural RANGE 7 DOWNTO 0;

  BEGIN

    send_byte : FOR cpt_envoi_v IN 7 DOWNTO 0 LOOP
      send_1_bit(clk_period_c, data_to_send_c(cpt_envoi_v), sck_s, mosi_s);
    END LOOP send_byte;

  END PROCEDURE send_spi;


  PROCEDURE send_1_bit (
    CONSTANT clk_period_c  : IN time;
    CONSTANT bit_to_send_c : IN std_logic;
    SIGNAL sck_s  : OUT std_logic;
    SIGNAL mosi_s : OUT std_logic
  ) IS

  BEGIN

    mosi_s <= bit_to_send_c;
    sck_s <= '0';
    WAIT FOR clk_period_c/2;
    sck_s <= '1';
    WAIT FOR clk_period_c/2;

  END PROCEDURE send_1_bit;

END PACKAGE BODY fction_spi;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.fction_spi.ALL;


ENTITY spi_slave_tb IS
  GENERIC (
    CONSTANT clk_spi_period_c : IN time := 1 us;
    CONSTANT clk_period_c     : IN time := 37 ns
  );
  PORT (
    --! data received by the peripheric
    data_out : OUT  std_logic_vector(7 DOWNTO 0)
  );
END spi_slave_tb;

ARCHITECTURE robotter OF spi_slave_tb IS

  COMPONENT spi_slave IS

    PORT (
      reset_ni        : IN  std_logic;
      clk_i           : IN  std_logic;
      --! register for data received by SPI
      data_out_o      : OUT std_logic_vector(7 DOWNTO 0);
      --! a new data has been received and is available on data_out_o
      transfer_done_o : OUT std_logic;
      transfer_ack_i  : IN  std_logic;

      --! SPI pins
      mosi_i          : IN std_logic; --! Master Out Slave In (SPI)
      cs_i            : IN std_logic; --! Chip Select (SPI)
      sck_i           : IN std_logic  --! SPI clock
    );

  END COMPONENT;


  SIGNAL clk_s           : std_logic := '0';
  SIGNAL reset_ns        : std_logic;
  SIGNAL data_out_s      : std_logic_vector(7 DOWNTO 0);
  SIGNAL transfer_done_s : std_logic;
  SIGNAL transfer_ack_s  : std_logic;
  SIGNAL mosi_s          : std_logic;
  SIGNAL cs_s            : std_logic;
  SIGNAL sck_s           : std_logic;

BEGIN  -- robotter

  tested_entity : spi_slave
    PORT MAP (
      reset_ni        => reset_ns,
      clk_i           => clk_s,
      data_out_o      => data_out_s,
      transfer_done_o => transfer_done_s,
      transfer_ack_i  => transfer_ack_s,
      mosi_i          => mosi_s,
      cs_i            => cs_s,
      sck_i           => sck_s
    );


  clock_p : PROCESS
  BEGIN
    clk_s <= not(clk_s);
    WAIT FOR clk_period_c/2;
  END PROCESS clock_p;

  reset_p : PROCESS
  BEGIN
    reset_ns <= '1';
    WAIT FOR 6 us;
    reset_ns <= '0';
    WAIT FOR 1 us;
    reset_ns <= '1';
    WAIT FOR 1 ms;
    reset_ns <= '0';
    WAIT FOR 1 us;
    reset_ns <= '1';
  END PROCESS reset_p;


  --! data_out and ack processing
  transfer_p : PROCESS
  BEGIN  -- PROCESS
    WAIT UNTIL rising_edge(clk_s);
    IF transfer_done_s = '1' THEN
      data_out_s <= data_out_s;
      transfer_ack_s <= '1';
    ELSE    
      transfer_ack_s <= '0';
    END IF;

  END PROCESS transfer_p;


  --! Send data on SPI bus
  send_data_p : PROCESS 
  BEGIN  -- PROCESS send_data_p
    cs_s <= '1';
    WAIT FOR 10 us;
    cs_s <= '0';
    send_spi(clk_spi_period_c, X"A5", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"55", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"19", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"EF", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"00", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"FF", sck_s, mosi_s);
    cs_s <= '1';
    WAIT FOR 10 us;
    send_spi(clk_spi_period_c, X"99", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"43", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"55", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"11", sck_s, mosi_s);
    send_spi(clk_spi_period_c, X"AA", sck_s, mosi_s);
    cs_s <= '1';
  END PROCESS send_data_p;

END ARCHITECTURE robotter;

