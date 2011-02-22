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
	generic (
		--! clock frequency in kHz
		clk_freq_c : natural
	);
  port (
    clk_i   : in  std_logic;
    reset_ni : in  std_logic;
    ch_a_i  : in  std_logic; --! channel A
    ch_b_i  : in  std_logic; --! channel B
		synchro_i : in std_logic;
    speed_o : out signed(15 downto 0)
  );

end entity encoder_inc_reader;


architecture encoder_inc_reader_1 of encoder_inc_reader is

  signal speed_s : signed(15 downto 0);
begin


  main_p : process (clk_i, reset_ni)
    variable last_ch_a_v : std_logic;
		variable l_synchro_v : std_logic;
  begin

    if reset_ni = '0' then
      speed_s <= (others=>'0');
      last_ch_a_v := '0';
			l_synchro_v := '0';

    elsif rising_edge(clk_i) then

			--! on slow clock rising edege update speed value and clear
			if l_synchro_v = '0' and synchro_i = '1' then
				speed_o <= speed_s;
				speed_s <= (others=>'0');
			end if;
			l_synchro_v := synchro_i;

      --! Update on channel A falling edge
      if ch_a_i = '0' and last_ch_a_v = '1' then
        if ch_b_i = '0' then
          speed_s <= speed_s + 1;
        elsif ch_b_i = '1' then
          speed_s <= speed_s - 1;
        end if;
      end if;

      last_ch_a_v := ch_a_i;

    end if;

  end process main_p;

end architecture encoder_inc_reader_1;

