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
--! @author lamygale 
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity filter is

  generic (
    taille_filtre_c : natural range 0 to 1000 := 2
  );
  port (
    clk_i   : in  std_logic;
    reset_i : in  std_logic;
    in_i   : in  std_logic;
    
    out_o : out std_logic
  );

end entity filter;


--! Angle is computed by counting clock ticks.
--! First ticks (1ms) are skipped by subtracting 10.0 to the final value.
--!
--! @note Angle value count starts at 1 because it is more effective to
--! to subtract 100 than 99.
architecture filter_1 of filter is

begin

	filter_p: process (clk_i, reset_i)

    variable v_high : std_logic_vector(taille_filtre_c-1 downto 0);
	variable v_low  : std_logic_vector(taille_filtre_c-1 downto 0);
	variable v_sig_mem: std_logic_vector(taille_filtre_c-1 downto 0); -- signal memory
  begin

    if reset_i = '1' then
		v_sig_mem := (OTHERS => '0');
		v_low := (OTHERS => '0');
		v_high := (OTHERS => '1');
		out_o <= '0';
		
    elsif rising_edge(clk_i) then

		v_sig_mem := v_sig_mem(taille_filtre_c-2 downto 0)& in_i;
		if v_sig_mem = v_low THEN
			out_o <= '0';
		elsif v_sig_mem = v_high then
			out_o <= '1';
		end if;
	end if;
  end process filter_p;

end architecture filter_1;

