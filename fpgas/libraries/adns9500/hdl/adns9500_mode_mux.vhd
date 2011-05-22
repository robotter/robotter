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
--! @file adns9500_mode_mux.vhd
--! @author lamygale
-----------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY adns9500_mode_mux IS
  
  PORT (
    ---------------------------------------------------------------------------
    -- control unit interface
    cu_data_in_i        : IN std_logic_vector(7 DOWNTO 0);
    cu_data_out_o       : OUT std_logic_vector(7 DOWNTO 0);
    cu_send_data_i      : IN std_logic;
    cu_busy_o           : OUT std_logic;

    cu_adns_cs_i        : IN std_logic_vector(1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- wishbone interface
    wb_data_in_i        : IN std_logic_vector(7 DOWNTO 0);
    wb_data_out_o       : OUT std_logic_vector(7 DOWNTO 0);
    wb_send_data_i      : IN std_logic;
    wb_busy_o           : OUT std_logic;

    wb_adns_cs_i        : IN std_logic_vector(1 DOWNTO 0);


    ---------------------------------------------------------------------------
    -- spi interface
    spi_data_in_o       : OUT std_logic_vector(7 DOWNTO 0);
    spi_data_out_i      : IN std_logic_vector(7 DOWNTO 0);
    spi_send_data_o     : OUT std_logic;
    spi_busy_i          : IN std_logic;

    spi_adns_cs_o       : OUT std_logic_vector(1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- signal command

    mode_select_i : IN std_logic
    
    );

END adns9500_mode_mux;

ARCHITECTURE adns9500_mode_mux_1 OF adns9500_mode_mux IS

BEGIN  -- adns9500_mode_mux_1

spi_adns_cs_o <= wb_adns_cs_i WHEN mode_select_i = '0' ELSE
                   cu_adns_cs_i;
  
spi_data_in_o <= wb_data_in_i WHEN mode_select_i = '0' ELSE
                 cu_data_in_i;

spi_send_data_o <= wb_send_data_i WHEN mode_select_i = '0' ELSE
                   cu_send_data_i;

wb_busy_o <= spi_busy_i WHEN mode_select_i = '0' ELSE
             '0';

wb_data_out_o <= spi_data_out_i WHEN mode_select_i = '0' ELSE
                 (OTHERS => '0');

cu_busy_o <= spi_busy_i WHEN mode_select_i = '1' ELSE
             '0';

cu_data_out_o <= spi_data_out_i WHEN mode_select_i = '1' ELSE
                 (OTHERS => '0');

  
END adns9500_mode_mux_1;
