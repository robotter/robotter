-----------------------------------------------------------------------------
-- Title    : Communication wishbone interface
-- Project  : 
-----------------------------------------------------------------------------
-- File     : comm_wishbone_interface.vhd
-- Author   : Lamygale
-- Company  : Rob'Otter
-- 
-- Creation date : 06/12/2009
-- Platform : Altera Cyclone II
-----------------------------------------------------------------------------
-- Description : provide registers acces from wishbone bus to the mouse sensor
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
use work.std_logic_1164_ram.all;

-------------------------------------------------------------------------------
ENTITY comm_wishbone_interface IS
  
  GENERIC (
    id_c                        : natural := 2;
    wb_size_c                   : natural := 8;
    adr_size_c                  : natural := 20; -- adr_size_c : equal to
                                                --max(reception_buffer_size_c, emission_buffer_size_c-1)
    reception_buffer_size_c     : natural := 20;
    emission_buffer_size_c      : natural := 20);

  PORT (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : IN  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : IN std_logic;           -- clock

    wbs_adr_i : IN std_logic_vector(adr_size_c DOWNTO 0);    -- address BUS
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data readden
                                                             -- from bus
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0); -- data write from BUS
    wbs_we_i  : IN std_logic;           -- read/write
    wbs_stb_i : IN std_logic;           -- validate read/write operation
    wbs_ack_o : OUT std_logic;           -- operation succesful
    wbs_cyc_i : IN std_logic;

    ---------------------------------------------------------------------------
    -- interface to the first sensor

    -- whishbone interface
    i2c_write_in_progress_i : in std_logic;  -- indicates that reception buffer is
                                             -- curently  modified and should not be readden
    -- data written by master
    reception_buffer_i     : in  std_logic_ram_8(reception_buffer_size_c downto 0);
    i2c_read_in_progress_i  : in std_logic;  -- indicates that emission buffer
                                             -- is used and should not be accessed
    -- data accessble by master in read
    emission_buffer_o       : out std_logic_ram_8(emission_buffer_size_c-1 downto 0)
    
    );
END comm_wishbone_interface;

ARCHITECTURE comm_wishbone_interface_1 OF comm_wishbone_interface IS

  
  SIGNAL ack_read_s : std_logic ;
  SIGNAL ack_write_s: std_logic ;

  signal disable_recopy_emission_buffer_uc_s, disable_recopy_reception_buffer_uc_s : std_logic;

  signal reception_uc_buffer_s : std_logic_ram_8(reception_buffer_size_c downto 0);
  signal emission_uc_buffer_s : std_logic_ram_8(emission_buffer_size_c-1 downto 0);
  

BEGIN  -- adns6010_wishbone_interface_1

  wbs_ack_o <= ack_write_s OR ack_read_s;

  -- manage register
  write_bloc_p : PROCESS(wbs_clk_i, wbs_rst_i)
  BEGIN
    IF wbs_rst_i = '1' THEN
      ack_write_s <= '0';
      
    ELSIF rising_edge(wbs_clk_i) THEN
      IF ((wbs_stb_i AND wbs_we_i AND wbs_cyc_i) = '1' ) THEN
        ack_write_s <= '1';
        if (to_integer(unsigned(wbs_adr_i)) = 1 )then
          disable_recopy_reception_buffer_uc_s <= wbs_dat_i(0);
          disable_recopy_emission_buffer_uc_s <= wbs_dat_i(1);
        else
          emission_uc_buffer_s(to_integer(unsigned(wbs_adr_i))+2) <= wbs_dat_i;
          
        end if;
        
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
        
        if to_integer(unsigned(wbs_adr_i)) = 0 then
          wbs_dat_o <= std_logic_vector(to_unsigned(id_c,wb_size_c));
        elsif to_integer(unsigned(wbs_adr_i)) = 1 then
          wbs_dat_o <= (1=>disable_recopy_emission_buffer_uc_s , 0 => disable_recopy_reception_buffer_uc_s, others => '0');
        else
          wbs_dat_o <= reception_uc_buffer_s(to_integer(unsigned(wbs_adr_i))+2);
        end if; 
        
      ELSE
        wbs_dat_o <= (OTHERS => '0');
        ack_read_s <= '0';
      END IF;
    END IF;
  END PROCESS read_bloc_p;


END ARCHITECTURE comm_wishbone_interface_1;
