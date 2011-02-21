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


--! @brief Remove bounces from an input
--! Only consider changes after a given count of identical input values.
--! New input data is read at each clock tick.
--! Output data is delayed of \e req_size_c clock ticks.
entity encoder_inc_debouncer is

  generic (
    --! Number of required identical values
    reg_size_c   : natural range 2 to natural'high := 10
  );
  port (
    clk_i   : in  std_logic;
    reset_i : in  std_logic;
    data_i  : in  std_logic;
    data_o  : out std_logic
  );

end entity encoder_inc_debouncer;

architecture encoder_inc_debouncer_1 of encoder_inc_debouncer is

  subtype  data_reg is std_logic_vector(reg_size_c-1 downto 0);
  signal   reg_s   : data_reg;
  signal   cur_s   : std_logic;
  constant reg_0_c : data_reg := (others => '0');
  constant reg_1_c : data_reg := (others => '1');

begin

  --! Fill data register
  reg_p : process (clk_i, reset_i)
  begin

    if reset_i = '1' then
      reg_s <= (others => '0');

    elsif rising_edge(clk_i) then
      -- new input data
      reg_s(reg_size_c-1 downto 1) <= reg_s(reg_size_c-2 downto 0);
      reg_s(0) <= data_i;

    end if;

  end process reg_p;

  --! Generate current state value
  process (clk_i, reset_i)
  begin

    if reset_i = '1' then
      cur_s <= '0';

    elsif rising_edge(clk_i) then
      if reg_s = reg_0_c then
        cur_s <= '0';
      elsif reg_s = reg_1_c then
        cur_s <= '1';
      end if;

    end if;
  end process;

  --! Copy current state to output
  data_o <= cur_s;
  
end architecture encoder_inc_debouncer_1;

