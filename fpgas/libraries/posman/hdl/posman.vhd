-----------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2, or (at your option)
-- any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHout ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
--! @file posman.vhd
--! @author JD
--! Top level file for Galipeur position manager
-----------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity posman is
  generic (
    id           : natural := 3;
    wb_size_c    : natural := 8;           -- data port size
    adns_size_c  : natural := 16;        -- data sensor port size
    squal_size_c : natural := 8;  -- squal port size
    freq_fpga_c  : natural := 50000
    );

  port (
    ---------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : in  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock
    wbs_adr_i : in std_logic_vector(5 downto 0);    -- address BUS
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);  -- data read from bus
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0); -- data written from bus
    wbs_we_i  : in std_logic;           -- read/write
    wbs_stb_i : in std_logic;           -- validate read/write operation
    wbs_ack_o : out std_logic;           -- operation succesful
    wbs_cyc_i : in std_logic;

    ---------------------------------------------------------------------
    -- ADNS9500 inputs
    adns1_deltax_i : in signed (15 downto 0);
    adns1_deltay_i : in signed (15 downto 0);
    adns2_deltax_i : in signed (15 downto 0);
    adns2_deltay_i : in signed (15 downto 0);
    adns3_deltax_i : in signed (15 downto 0);
    adns3_deltay_i : in signed (15 downto 0);

    -- ADNS9500 data update
    update_i : in std_logic

    -- motors encoders inputs
    motor1_i : in signed (15 downto 0);
    motor2_i : in signed (15 downto 0);
    motor3_i : in signed (15 downto 0);
    
  );

end adns9500;


