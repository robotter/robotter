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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity t_multipliers is
end entity t_multipliers;

architecture t_multipliers_1 of t_multipliers is

  signal endofsimulation_s : boolean := false;

  constant fpga_period_c : time := 20 ns; -- FPGA period

	constant int_size_c : natural := 16;
	constant frac_size_c : natural := 8;

  signal clk_s   : std_logic;
  signal reset_ns : std_logic;

  component multiplier33 is
    generic (
      clk_freq_c : natural := 50000;
			int_size_c : natural := int_size_c;
			frac_size_c : natural := frac_size_c
    );
    port (
      clk_i   : in  std_logic;
      reset_ni : in  std_logic;

			valid_i : in std_logic;
			element_value_i : in signed(int_size_c-1 downto 0);

			compute_i : in std_logic;
			done_o : out std_logic;

			input0_i, input1_i, input2_i : in signed(int_size_c-1 downto 0);
			output0_o, output1_o, output2_o : out signed(int_size_c-1 downto 0)
    );
  end component multiplier33;
  for multiplier33_0 : multiplier33 use entity work.multiplier33;

	signal input0_s, input1_s, input2_s : signed(int_size_c-1 downto 0);
	signal output0_s, output1_s, output2_s : signed(int_size_c-1 downto 0);
	signal compute_s, done_s, valid_s : std_logic;
	signal element_value_s : signed(int_size_c-1 downto 0);

begin

  multiplier33_0 : multiplier33
  generic map (
    clk_freq_c => 1 ms / fpga_period_c
  )
  port map (
    clk_i   => clk_s,
    reset_ni => reset_ns,

		valid_i => valid_s,

		element_value_i => element_value_s,

		compute_i => compute_s,
		done_o => done_s,

		input0_i => input0_s,
		input1_i => input1_s,
		input2_i => input2_s,
		
		output0_o => output0_s,
		output1_o => output1_s,
		output2_o => output2_s
  );

  stimuli_p : process
  begin

    reset_ns <= '0';
		input0_s <= to_signed(0,16);
		input1_s <= to_signed(0,16);
		input2_s <= to_signed(0,16);
    wait for 100 ns;
    reset_ns <= '1';
		wait for 100 ns;

		-- load matrix
		for it in 8 downto 0 loop
			element_value_s <= to_signed(0,16);
			valid_s <= '0';
			wait until rising_edge(clk_s);
			valid_s <= '1';
			wait until rising_edge(clk_s);
		end loop;

		-- first computation
		compute_s <= '0';
		wait until rising_edge(clk_s);
		input0_s <= to_signed(100,16);
		input1_s <= to_signed(200,16);
		input2_s <= to_signed(300,16);
		compute_s <= '1';
		wait until rising_edge(done_s);	

		wait for 20 ns;
    report "end of tests" severity note;
    endofsimulation_s <= true;
    wait;

  end process stimuli_p;

  clock_p : process
  begin
    if endofsimulation_s = true then
      wait;
    end if;

    clk_s <= '1';
    wait for fpga_period_c/2;
    clk_s <= '0';
    wait for fpga_period_c/2;
  end process clock_p;

end architecture t_multipliers_1;


