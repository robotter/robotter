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
--! @brief Compass reader testbench
--! @author ~ryder <benoit@ryder.fr>
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity t_compass_reader is
end entity t_compass_reader;

architecture t_compass_reader_1 of t_compass_reader is

  signal endofsimulation_s : boolean := false;

  constant fpga_period_c : time := 200 ns; -- FPGA period

  signal clk_s   : std_logic;
  signal reset_s : std_logic;
  signal pwm_s   : std_logic;
  signal angle_s : natural range 0 to 3599;

  component compass_reader is
    generic (
      clk_freq_c : natural := 50000
    );
    port (
      clk_i   : in  std_logic;
      reset_i : in  std_logic;
      pwm_i   : in  std_logic;
      angle_o : out natural range 0 to 3599
    );
  end component compass_reader;
  for compass_reader_0 : compass_reader use entity work.compass_reader;

  --! Test returned value for a given angle
  procedure test_angle (
    constant a_ref_c : in  natural range 0 to 3599;
    signal   pwm_o   : out std_logic
  ) is
  begin

    pwm_o <= '1';
    wait for (a_ref_c+100)*10 us;
    pwm_o <= '0';
    wait for 1 ms;
    assert angle_s = a_ref_c
      report "angle value: expected "&natural'image(a_ref_c)
        &", got "&natural'image(angle_s)
        severity error;

  end procedure test_angle;


begin

  compass_reader_0 : compass_reader
  generic map (
    clk_freq_c => 1 ms / fpga_period_c
  )
  port map (
    clk_i   => clk_s,
    reset_i => reset_s,
    pwm_i   => pwm_s,
    angle_o => angle_s
  );


  stimuli_p : process
    variable angle_ref_v : natural range 0 to 3599;
  begin

    reset_s <= '1';
    pwm_s <= '0';
    wait for 1 ms;
    reset_s <= '0';
    wait for 1 ms;

    test_angle( 420, pwm_s);
    test_angle(  42, pwm_s);
    test_angle(   0, pwm_s);
    test_angle(3599, pwm_s);

    wait for 5 ms;
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

end architecture t_compass_reader_1;


