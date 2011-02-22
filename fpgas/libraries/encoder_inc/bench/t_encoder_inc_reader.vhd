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


entity t_encoder_inc_reader is
end entity t_encoder_inc_reader;

architecture t_encoder_inc_reader_1 of t_encoder_inc_reader is

  signal endofsimulation_s : boolean := false;

  constant fpga_period_c : time := 20 ns; -- FPGA period

  signal clk_s   : std_logic;
  signal reset_ns : std_logic;
  signal ch_a_s  : std_logic;
  signal ch_b_s  : std_logic;
  signal speed_s : signed(15 downto 0);
  signal synchro_s : std_logic;

  component encoder_inc_reader
    generic (
      clk_freq_c :natural := 50000 --50 MHz
    );
    port (
      clk_i   : in  std_logic;
      reset_ni : in  std_logic;
      ch_a_i  : in  std_logic; --! channel A
      ch_b_i  : in  std_logic; --! channel B
      synchro_i : in std_logic;
      speed_o : out signed(15 downto 0)
    );
  end component encoder_inc_reader;
  for encoder_inc_reader_0 : encoder_inc_reader use entity work.encoder_inc_reader;

begin

  encoder_inc_reader_0 : encoder_inc_reader
  port map (
    clk_i   => clk_s,
    reset_ni => reset_ns,
    ch_a_i  => ch_a_s,
    ch_b_i  => ch_b_s,
    synchro_i => synchro_s,
    speed_o => speed_s
  );


  stimuli_p : process

    constant ch_a_c   : std_logic_vector := "001100110011001100010101010";
    constant ch_b_c   : std_logic_vector := "111001100110011000111001110";

  begin

    ch_a_s <= ch_a_c(0);
    ch_b_s <= ch_b_c(0);
    reset_ns <= '0';
    synchro_s <= '0';
    wait for 5 * fpga_period_c;
    reset_ns <= '1';

    for m in 0 to 10 loop
      synchro_s <= not synchro_s;
      for t in 0 to 1000 loop
        for i in ch_a_c'range loop
          ch_a_s <= ch_a_c(i);
          ch_b_s <= ch_b_c(i);
          wait for fpga_period_c;
        end loop;
      end loop;
    end loop;

    wait for 5 * fpga_period_c;
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

end architecture t_encoder_inc_reader_1;

