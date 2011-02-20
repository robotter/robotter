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

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

entity multiplier33 is 
  generic (
		-- Qn.m integer size (n+m)
		int_size_c : natural;
		-- Qn.m fractionnal size (m)
		frac_size_c : natural;
		-- clock frequency
    clk_freq_c : natural 
    );
  port (
    clk_i     : in std_logic;
    reset_ni  : in std_logic;
		
		-- on valid_i r_e, current matrix is shift by int_size_c and 
		-- element_value_i is latched at position 0.
		valid_i : in std_logic;
		-- matrix element Q format
		element_value_i : in signed(int_size_c-1 downto 0);

		-- multiplication will start on this signal r_e
		compute_i : in std_logic;
		-- multiplication is done on this signal r_e
		done_o : out std_logic;

		-- input vector Q format
		input0_i, input1_i, input2_i : in signed(int_size_c-1 downto 0);
		-- output vector Q format
		output0_o, output1_o, output2_o : out signed(int_size_c-1 downto 0)
		);
end entity multiplier33;

architecture multiplier33_1 of multiplier33 is

	constant q_format_round_c : signed(2*int_size_c-1 downto 0) := to_signed(2**(frac_size_c-1),2*int_size_c);

	signal matrix_s : signed(int_size_c*9 - 1 downto 0);

	signal sum0_s : signed(2*int_size_c-1 downto 0);
	signal sum1_s : signed(2*int_size_c-1 downto 0);
	signal sum2_s : signed(2*int_size_c-1 downto 0);

	signal running_s : std_logic;

	signal i0_s, i1_s, i2_s : signed(int_size_c-1 downto 0);
begin

	--
	-- Load matrix elements by shifting them in
	-- 
	latch_p : process(reset_ni, clk_i)
		variable l_valid_v : std_logic;
	begin
		
		if reset_ni = '0' then
			l_valid_v := '0';
			matrix_s <= (others => '0');
		elsif rising_edge(clk_i) then
			
			-- on valid_i rising_edge latch input data to matrix
			if l_valid_v = '0' and valid_i = '1' then
				-- shift matrix by integer size
				matrix_s(int_size_c*9-1 downto int_size_c) <= matrix_s(int_size_c*8-1 downto 0);
				matrix_s(int_size_c-1 downto 0) <= element_value_i;
			end if;

			l_valid_v := valid_i;
		end if;
		
	end process latch_p;

	-- 
	-- compute matrix multiplication
	--
	compute_p : process(reset_ni, clk_i)
		type MM_STATE_TYPE is (MM_STATE_0, MM_STATE_1, MM_STATE_2, MM_STATE_DONE);
		variable state_v : MM_STATE_TYPE;
		variable l_compute_v : std_logic;
		variable temp_v : signed(2*int_size_c-1 downto 0);
	begin

		if reset_ni = '0' then
			l_compute_v := '0';
			running_s <= '0';
			done_o <= '0';
		elsif rising_edge(clk_i) then
			
			if running_s = '1' then
				
				case state_v is
					when MM_STATE_0 =>
						sum0_s <= i0_s*matrix_s(int_size_c-1 downto 0);
						sum1_s <= i0_s*matrix_s(2*int_size_c-1 downto int_size_c);
						sum2_s <= i0_s*matrix_s(3*int_size_c-1 downto 2*int_size_c);
						state_v := MM_STATE_1;

					when MM_STATE_1 =>
						sum0_s <= sum0_s + i1_s*matrix_s(4*int_size_c-1 downto 3*int_size_c); 
						sum1_s <= sum1_s + i1_s*matrix_s(5*int_size_c-1 downto 4*int_size_c);
						sum2_s <= sum2_s + i1_s*matrix_s(6*int_size_c-1 downto 5*int_size_c);
						state_v := MM_STATE_2;

					when MM_STATE_2 =>
						sum0_s <= sum0_s + i2_s*matrix_s(7*int_size_c-1 downto 6*int_size_c);
						sum1_s <= sum1_s + i2_s*matrix_s(8*int_size_c-1 downto 7*int_size_c);
						sum2_s <= sum2_s + i2_s*matrix_s(9*int_size_c-1 downto 8*int_size_c);
						state_v := MM_STATE_DONE;

					when MM_STATE_DONE =>
						-- latch output vector
						temp_v := sum0_s + q_format_round_c;
						output0_o <= temp_v(2*int_size_c-frac_size_c-1 downto frac_size_c);

						temp_v := sum1_s + q_format_round_c;
						output1_o <= temp_v(2*int_size_c-frac_size_c-1 downto frac_size_c);

						temp_v := sum2_s + q_format_round_c;
						output2_o <= temp_v(2*int_size_c-frac_size_c-1 downto frac_size_c);

						done_o <= '1';
						running_s <= '0';
				end case;

			end if;

			-- on compute rising edge latch input vector
			if l_compute_v = '0' and compute_i = '1' then
				i0_s <= input0_i;
				i1_s <= input1_i;
				i2_s <= input2_i;
				-- multiplication will start on next clock
				running_s <= '1';
				done_o <= '0';
				state_v := MM_STATE_0;
			end if;
			l_compute_v := compute_i;

		end if;

	end process compute_p;

end architecture multiplier33_1;
