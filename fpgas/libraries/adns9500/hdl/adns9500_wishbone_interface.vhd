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
    wbs_rst_i : IN  std_logic;
    wbs_clk_i : IN std_logic;

    wbs_adr_i : IN std_logic_vector(5 DOWNTO 0);
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0);
    wbs_we_i  : IN std_logic;
    wbs_stb_i : IN std_logic;
    wbs_ack_o : OUT std_logic;
    wbs_cyc_i : IN std_logic;

    ---------------------------------------------------------------------------
    -- interface to sensors
    adns1_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);
    adns2_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);
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
    
    spi_cs_o     : OUT std_logic_vector(1 DOWNTO 0)  -- selection of the slave
                                                     -- addressed by the spi
    );
END adns9500_wishbone_interface;

ARCHITECTURE adns9500_wishbone_interface_1 OF adns9500_wishbone_interface IS

  SIGNAL auto_enable_s : std_logic;
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
      auto_enable_s <= '0';
      spi_data_o <= (OTHERS => '0');
      spi_send_data_s <= '0';
      spi_cs_s <= (OTHERS => '0');
      ack_write_s <= '0';
      
    ELSIF rising_edge(wbs_clk_i) THEN
      IF ((wbs_stb_i AND wbs_we_i AND wbs_cyc_i) = '1' ) THEN
        ack_write_s <= '1';
        CASE to_integer(unsigned(wbs_adr_i)) IS
                    -- auto enable
          WHEN 30 => auto_enable_s <= wbs_dat_i(0);
                     -- data to send
          WHEN 31 => spi_data_o <= wbs_dat_i(7 DOWNTO 0);
                     -- spi control register
          WHEN 32 => spi_send_data_s <= wbs_dat_i(2);
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
                    --adns 1

          WHEN 10 => wbs_dat_o <= adns1_squal_i(7 DOWNTO 0);
                     -- adns 2
          WHEN 19 => wbs_dat_o <= adns2_squal_i(7 DOWNTO 0);
                     -- adns 3
          WHEN 28 => wbs_dat_o <= adns3_squal_i(7 DOWNTO 0);
                     -- fault
          WHEN 29 => wbs_dat_o <= fault_i;
                     -- auto enable
          WHEN 30 => wbs_dat_o(0) <= auto_enable_s;
                     -- spi interface
          WHEN 31 => wbs_dat_o <= spi_data_i;
          WHEN 32 => wbs_dat_o <= (3=>spi_busy_i,
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

  spi_send_data_o <= spi_send_data_s;
  auto_enable_o <= auto_enable_s;
  spi_cs_o <= spi_cs_s;

END ARCHITECTURE adns9500_wishbone_interface_1;

