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
--! @author ~ryder <benoit@ryder.fr>
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--! @brief Read position from an incremental coder
--! Angle is counted counter-clockwise (channel A leads channel B) and stored
--! in a 32b integer.
entity encoder_inc_reader is

  port (
    clk_i   : in  std_logic;
    reset_i : in  std_logic;
    ch_a_i  : in  std_logic; --! channel A
    ch_b_i  : in  std_logic; --! channel B
    angle_o : out integer
  );

end entity encoder_inc_reader;


architecture encoder_inc_reader_1 of encoder_inc_reader is

  signal angle_s : integer;

begin

  angle_o <= angle_s;

  --! Update angle value
  angle_p : process (clk_i, reset_i)
    variable last_ch_a_v : std_logic;
  begin

    if reset_i = '1' then
      angle_s <= 0;
      last_ch_a_v := '0';

    elsif rising_edge(clk_i) then

      --! Update on channel A falling edge
      if ch_a_i = '0' and last_ch_a_v = '1' then
        if ch_b_i = '0' then
          angle_s <= angle_s + 1;
        elsif ch_b_i = '1' then
          angle_s <= angle_s - 1;
        end if;
      end if;

      last_ch_a_v := ch_a_i;

    end if;

  end process angle_p;

end architecture encoder_inc_reader_1;

