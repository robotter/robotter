-----------------------------------------------------------------------------
-- Title    : ADNS 9500 Wishbone Interface
-- Project  : UNIOC_NG Optic Encoders
-----------------------------------------------------------------------------
-- File     : adns9500_wishbone_interface.vhd
-- Author   : Lamygale
-- Company  : Rob'Otter
-- 
-- Creation date : 25/01/2009
-- Platform : Altera Cyclone
-----------------------------------------------------------------------------
-- Description : provide registers acces from wishbone bus to the mouse sensor
-----------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2, or (at your option)
-- any later versio
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

-------------------------------------------------------------------------------
ENTITY adns9500_wishbone_interface IS
  
  GENERIC (
    id_c      : natural := 2;
    wb_size_c : natural := 8;           -- data port size
    adns_size_c : natural RANGE 8 TO 32:= 32;        -- data sensor port size
    squal_size_c : natural RANGE 8 TO 32:= 8  -- squal port size
    );

  PORT (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : IN  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : IN std_logic;           -- clock

    wbs_adr_i : IN std_logic_vector(5 DOWNTO 0);    -- address BUS
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data readden
                                                             -- from bus
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0); -- data write from BUS
    wbs_we_i  : IN std_logic;           -- read/write
    wbs_stb_i : IN std_logic;           -- validate read/write operation
    wbs_ack_o : OUT std_logic;           -- operation succesful
    wbs_cyc_i : IN std_logic;

    ---------------------------------------------------------------------------
    -- interface to the first sensor

    adns1_lock_o : OUT std_logic;
    adns1_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns1_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns1_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- interface to the second sensor

    adns2_lock_o : OUT std_logic;
    adns2_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns2_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns2_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);

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
    spi_cs_o     : OUT std_logic_vector(1 DOWNTO 0)  -- selection of the slave
                                                     -- addressed by the spi
    );
END adns9500_wishbone_interface;

ARCHITECTURE adns9500_wishbone_interface_1 OF adns9500_wishbone_interface IS

  SIGNAL auto_enable_s : std_logic;
  SIGNAL lock_adns_s : std_logic_vector(2 DOWNTO 0);
  SIGNAL adns_reset_s : std_logic;
  SIGNAL spi_send_data_s : std_logic;
  SIGNAL spi_cs_s : std_logic_vector(1 DOWNTO 0);

  SIGNAL ack_read_s : std_logic ;
  SIGNAL ack_write_s: std_logic ;

BEGIN  -- adns9500_wishbone_interface_1

  wbs_ack_o <= ack_write_s OR ack_read_s;

  -- manage register
  write_bloc_p : PROCESS(wbs_clk_i, wbs_rst_i)
  BEGIN
    IF wbs_rst_i = '1' THEN 
      lock_adns_s <= (OTHERS => '0');
      auto_enable_s <= '0';
      spi_data_o <= (OTHERS => '0');
      adns_reset_s <= '0';
      spi_send_data_s <= '0';
      spi_cs_s <= (OTHERS => '0');
      ack_write_s <= '0';
      
    ELSIF rising_edge(wbs_clk_i) THEN
      IF ((wbs_stb_i AND wbs_we_i AND wbs_cyc_i) = '1' ) THEN
        ack_write_s <= '1';
        CASE to_integer(unsigned(wbs_adr_i)) IS
          -- lock adns latchs
          WHEN 1 => lock_adns_s <= wbs_dat_i(2 DOWNTO 0);
                    -- auto enable
          WHEN 30 => auto_enable_s <= wbs_dat_i(0);
                     -- data to send
          WHEN 31 => spi_data_o <= wbs_dat_i(7 DOWNTO 0);
                     -- spi control register
          WHEN 32 => adns_reset_s <= wbs_dat_i(7);
                     spi_send_data_s <= wbs_dat_i(2);
                     spi_cs_s <= wbs_dat_i(1 DOWNTO 0);
                                        -- debug, count reset values
          WHEN OTHERS=> NULL;
        END CASE;                        
      ELSE
        ack_write_s <= '0';
      END IF;
    END IF;

  END PROCESS write_bloc_p;


  read_bloc_p : PROCESS(wbs_clk_i, wbs_rst_i)
  BEGIN
    IF wbs_rst_i = '1' THEN
      wbs_dat_o <= (OTHERS => '0');
      ack_read_s <= '0';

    ELSIF rising_edge(wbs_clk_i) THEN
      IF (wbs_stb_i = '1' AND wbs_we_i = '0'  AND wbs_cyc_i = '1' ) THEN
        ack_read_s <= '1';
        CASE to_integer(unsigned(wbs_adr_i)) IS
          WHEN 0 => wbs_dat_o <= std_logic_vector(to_unsigned(id_c,wb_size_c));
                    -- lock adns latchs
          WHEN 1 => wbs_dat_o(2 DOWNTO 0) <= lock_adns_s;
                    --adns 1
          WHEN 2 => wbs_dat_o <= adns1_delta_X_i(7 DOWNTO 0);
          WHEN 3 => wbs_dat_o <= adns1_delta_X_i(15 DOWNTO 8);
          WHEN 4 => wbs_dat_o <= adns1_delta_X_i(23 DOWNTO 16);
          WHEN 5 => wbs_dat_o <= adns1_delta_X_i(31 DOWNTO 24);
          WHEN 6 => wbs_dat_o <= adns1_delta_Y_i(7 DOWNTO 0);
          WHEN 7 => wbs_dat_o <= adns1_delta_Y_i(15 DOWNTO 8);
          WHEN 8 => wbs_dat_o <= adns1_delta_Y_i(23 DOWNTO 16);
          WHEN 9 => wbs_dat_o <= adns1_delta_Y_i(31 DOWNTO 24);
          WHEN 10 => wbs_dat_o <= adns1_squal_i(7 DOWNTO 0);
                     -- adns 2
          WHEN 11 => wbs_dat_o <= adns2_delta_X_i(7 DOWNTO 0);
          WHEN 12 => wbs_dat_o <= adns2_delta_X_i(15 DOWNTO 8);
          WHEN 13 => wbs_dat_o <= adns2_delta_X_i(23 DOWNTO 16);
          WHEN 14 => wbs_dat_o <= adns2_delta_X_i(31 DOWNTO 24);
          WHEN 15 => wbs_dat_o <= adns2_delta_Y_i(7 DOWNTO 0);
          WHEN 16 => wbs_dat_o <= adns2_delta_Y_i(15 DOWNTO 8);
          WHEN 17 => wbs_dat_o <= adns2_delta_Y_i(23 DOWNTO 16);
          WHEN 18 => wbs_dat_o <= adns2_delta_Y_i(31 DOWNTO 24);
          WHEN 19 => wbs_dat_o <= adns2_squal_i(7 DOWNTO 0);
                     -- adns 3
          WHEN 20 => wbs_dat_o <= adns3_delta_X_i(7 DOWNTO 0);
          WHEN 21 => wbs_dat_o <= adns3_delta_X_i(15 DOWNTO 8);
          WHEN 22 => wbs_dat_o <= adns3_delta_X_i(23 DOWNTO 16);
          WHEN 23 => wbs_dat_o <= adns3_delta_X_i(31 DOWNTO 24);
          WHEN 24 => wbs_dat_o <= adns3_delta_Y_i(7 DOWNTO 0);
          WHEN 25 => wbs_dat_o <= adns3_delta_Y_i(15 DOWNTO 8);
          WHEN 26 => wbs_dat_o <= adns3_delta_Y_i(23 DOWNTO 16);
          WHEN 27 => wbs_dat_o <= adns3_delta_Y_i(31 DOWNTO 24);
          WHEN 28 => wbs_dat_o <= adns3_squal_i(7 DOWNTO 0);
                     -- fault
          WHEN 29 => wbs_dat_o <= fault_i;
                     -- auto enable
          WHEN 30 => wbs_dat_o(0) <= auto_enable_s;
                     -- spi interface
          WHEN 31 => wbs_dat_o <= spi_data_i;
          WHEN 32 => wbs_dat_o <= (7=>adns_reset_s,
                                   3=>spi_busy_i,
                                   2=> spi_send_data_s,
                                   1=> spi_cs_s(1),
                                   0=> spi_cs_s(0),
                                   OTHERS => '0');
                     
          WHEN OTHERS => NULL;
        END CASE;

      ELSE
        --if update_cs_done_i = '1' then then
        --  update_cs_o <= '0';
        --end if;
        wbs_dat_o <= (OTHERS => '0');
        ack_read_s <= '0';
      END IF;
    END IF;
  END PROCESS read_bloc_p;

  adns_reset_o <= adns_reset_s;
  spi_send_data_o <= spi_send_data_s;
  adns1_lock_o <= lock_adns_s(0);
  adns2_lock_o <= lock_adns_s(1);
  adns3_lock_o <= lock_adns_s(2);
  auto_enable_o <= auto_enable_s;
  spi_cs_o <= spi_cs_s;

END ARCHITECTURE adns9500_wishbone_interface_1;

