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

entity multiplier93 is 
  generic (
    -- Qn.m integer size (n+m)
    int_size_c : natural := 16;
    -- Qn.m fractionnal size (m)
    frac_size_c : natural := 8;
    -- clock frequency
    clk_freq_c : natural := 50000
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
    input0_i, input1_i, input2_i,
    input3_i, input4_i, input5_i,
    input6_i, input7_i, input8_i : in signed(int_size_c-1 downto 0);

    -- output vector Q format
    output0_o, output1_o, output2_o : out signed(int_size_c-1 downto 0)
    );
end entity multiplier93;

architecture multiplier93_1 of multiplier93 is

  constant q_format_round_c : signed(2*int_size_c-1 downto 0) := to_signed(2**(frac_size_c-1),2*int_size_c);

  type matrix_memory_t is array(0 to 26) of signed(int_size_c-1 downto 0);
  signal matrix_s : matrix_memory_t;

  signal sum0_s : signed(2*int_size_c-1 downto 0);
  signal sum1_s : signed(2*int_size_c-1 downto 0);
  signal sum2_s : signed(2*int_size_c-1 downto 0);

  signal running_s : std_logic;

  signal i0_s, i1_s, i2_s, i3_s, i4_s, i5_s, i6_s, i7_s, i8_s : signed(int_size_c-1 downto 0);

  signal mul0_s, mul1_s, mul2_s : signed(2*int_size_c-1 downto 0);
  signal a_s : signed(int_size_c-1 downto 0);
  signal b0_s, b1_s, b2_s : signed(int_size_c-1 downto 0);

begin

  --
  -- Load matrix elements by shifting them in
  -- 
  latch_p : process(reset_ni, clk_i)
    variable l_valid_v : std_logic;
  begin
    
    if reset_ni = '0' then
      l_valid_v := '0';
      matrix_s <= (others => (others=>'0'));
    elsif rising_edge(clk_i) then
      
      -- on valid_i rising_edge latch input data to matrix
      if l_valid_v = '0' and valid_i = '1' then
        -- shift matrix by integer size
        for it in 25 downto 0 loop
          matrix_s(it+1) <= matrix_s(it);
        end loop;
        matrix_s(0) <= element_value_i;
      end if;

      l_valid_v := valid_i;
    end if;
    
  end process latch_p;

  --
  -- mutlipliers
  --
  mul0_s <= a_s * b0_s;
  mul1_s <= a_s * b1_s;
  mul2_s <= a_s * b2_s;

  -- 
  -- compute matrix multiplication
  --
  compute_p : process(reset_ni, clk_i)
    type MM_STATE_TYPE is (MM_STATE_0, MM_STATE_1, MM_STATE_2,
                           MM_STATE_3, MM_STATE_4, MM_STATE_5,
                           MM_STATE_6, MM_STATE_7, MM_STATE_8,
                           MM_STATE_9, MM_STATE_DONE);
    variable state_v : MM_STATE_TYPE;
    variable l_compute_v : std_logic;
    variable temp_v : signed(2*int_size_c-1 downto 0);
  begin

    if reset_ni = '0' then
      l_compute_v := '0';
      running_s <= '0';
      done_o <= '0';
      a_s <= (others => '0');
      b0_s <= (others => '0');
      b1_s <= (others => '0');
      b2_s <= (others => '0');
    elsif rising_edge(clk_i) then
      
      if running_s = '1' and valid_i = '0' then
        
        case state_v is
          when MM_STATE_0 =>
            -- prepare multiplications
            a_s <= i0_s;
            b0_s <= matrix_s(0);
            b1_s <= matrix_s(1);
            b2_s <= matrix_s(2);

            state_v := MM_STATE_1;

          when MM_STATE_1 =>
            -- sum previously computed signal
            sum0_s <= mul0_s;
            sum1_s <= mul1_s;
            sum2_s <= mul2_s;
            ---
            a_s <= i1_s;
            b0_s <= matrix_s(3);
            b1_s <= matrix_s(4);
            b2_s <= matrix_s(5);
            -- 
            state_v := MM_STATE_2;

          when MM_STATE_2 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
            a_s <= i2_s;
            b0_s <= matrix_s(6);
            b1_s <= matrix_s(7);
            b2_s <= matrix_s(8);
            --
            state_v := MM_STATE_3;

          when MM_STATE_3 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
            a_s <= i3_s;
            b0_s <= matrix_s(9);
            b1_s <= matrix_s(10);
            b2_s <= matrix_s(11);
            --
            state_v := MM_STATE_4;

          when MM_STATE_4 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
            a_s <= i4_s;
            b0_s <= matrix_s(12);
            b1_s <= matrix_s(13);
            b2_s <= matrix_s(14);
            --
            state_v := MM_STATE_5;

          when MM_STATE_5 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
            a_s <= i5_s;
            b0_s <= matrix_s(15);
            b1_s <= matrix_s(16);
            b2_s <= matrix_s(17);
            --
            state_v := MM_STATE_6;

          when MM_STATE_6 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
            a_s <= i6_s;
            b0_s <= matrix_s(18);
            b1_s <= matrix_s(19);
            b2_s <= matrix_s(20);
            --
            state_v := MM_STATE_7;

          when MM_STATE_7 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
            a_s <= i7_s;
            b0_s <= matrix_s(21);
            b1_s <= matrix_s(22);
            b2_s <= matrix_s(23);
            --
            state_v := MM_STATE_8;

          when MM_STATE_8 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
            a_s <= i8_s;
            b0_s <= matrix_s(24);
            b1_s <= matrix_s(25);
            b2_s <= matrix_s(26);
            --
            state_v := MM_STATE_9;


          when MM_STATE_9 =>
            --
            sum0_s <= sum0_s + mul0_s;
            sum1_s <= sum1_s + mul1_s;
            sum2_s <= sum2_s + mul2_s;
            --
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
        i3_s <= input3_i;
        i4_s <= input4_i;
        i5_s <= input5_i;
        i6_s <= input6_i;
        i7_s <= input7_i;
        i8_s <= input8_i;
        -- multiplication will start on next clock
        running_s <= '1';
        done_o <= '0';
        state_v := MM_STATE_0;
      end if;
      l_compute_v := compute_i;

    end if;

  end process compute_p;

end architecture multiplier93_1;
