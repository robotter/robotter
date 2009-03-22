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

  constant fpga_period_c : time := 200 ns; -- FPGA period

  signal clk_s   : std_logic;
  signal reset_s : std_logic;
  signal ch_a_s  : std_logic;
  signal ch_b_s  : std_logic;
  signal angle_s : integer;

  component encoder_inc_reader
    port (
      clk_i   : in  std_logic;
      reset_i : in  std_logic;
      ch_a_i  : in  std_logic; --! channel A
      ch_b_i  : in  std_logic; --! channel B
      angle_o : out integer
    );
  end component encoder_inc_reader;
  for encoder_inc_reader_0 : encoder_inc_reader use entity work.encoder_inc_reader;

begin

  encoder_inc_reader_0 : encoder_inc_reader
  port map (
    clk_i   => clk_s,
    reset_i => reset_s,
    ch_a_i  => ch_a_s,
    ch_b_i  => ch_b_s,
    angle_o => angle_s
  );


  stimuli_p : process

    constant ch_a_c   : std_logic_vector := "001100110011001100010101010";
    constant ch_b_c   : std_logic_vector := "111001100001100110001110011";
    type i_vector is array (natural range <>) of integer;
    constant iangle_c : i_vector := (0, 1, 2, 1, 0, -1, -2, -1, -2);
    variable iangle_i_v : natural; -- iangle_c index

  begin

    ch_a_s <= ch_a_c(0);
    ch_b_s <= ch_b_c(0);
    iangle_i_v := 0;
    reset_s <= '1';
    wait for 5 * fpga_period_c;
    reset_s <= '0';

    for i in ch_a_c'range loop
      ch_a_s <= ch_a_c(i);
      ch_b_s <= ch_b_c(i);
      wait for fpga_period_c;

      if angle_s /= iangle_c(iangle_i_v) then
        -- angle changed, check value
        iangle_i_v := iangle_i_v + 1;
        assert angle_s = iangle_c(iangle_i_v)
          report "angle value " & natural'image(iangle_i_v)
            &": got "&integer'image(angle_s)
            &", expected "&integer'image(iangle_c(iangle_i_v))
            severity error;
      end if;

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

