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
--! @file posman_control.vhd
--! @author JD
--! Position manager control unit, drive calculus
-----------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity posman_control is
  generic (
    freq_fpga_c  : natural;
    ram_data_width_c : natural;
    ram_addr_width_c : natural
    );

  port (
    -- 
    clk_i : std_logic;
    reset_ni : std_logic;

    -- RAM access
    ram_addr_o : out natural range 0 to 2**ram_addr_width_c-1;
    ram_data_i : in std_logic_vector(ram_data_width_c-1 downto 0)
  );

end posman_control;

architecture posman_control_1 of posman_control is

begin
 
end posman_control_1;
