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


entity t_encoder_inc_debouncer is
end entity t_encoder_inc_debouncer;

architecture t_encoder_inc_debouncer_1 of t_encoder_inc_debouncer is

  signal endofsimulation_s : boolean := false;

  constant fpga_period_c : time := 200 ns; -- FPGA period

  signal clk_s   : std_logic;
  signal reset_s : std_logic;
  signal data_is : std_logic;
  signal data_os : std_logic;

  component encoder_inc_debouncer
    generic (
      reg_size_c   : natural range 2 to natural'high;
      reset_data_c : std_logic
    );
    port (
      clk_i   : in  std_logic;
      reset_i : in  std_logic;
      data_i  : in  std_logic;
      data_o  : out std_logic
    );
  end component encoder_inc_debouncer;
  for encoder_inc_debouncer_0 : encoder_inc_debouncer use entity work.encoder_inc_debouncer;

begin

  encoder_inc_debouncer_0 : encoder_inc_debouncer
  generic map (
    reg_size_c   => 3,
    reset_data_c => 'Z'
  )
  port map (
    clk_i   => clk_s,
    reset_i => reset_s,
    data_i  => data_is,
    data_o  => data_os
  );


  stimuli_p : process

    constant data_ic : std_logic_vector := "0010011100001001111100001111";
    constant data_oc : std_logic_vector := "ZZZZZZZ111000000011111000011";

  begin

    data_os <= 'Z';
    reset_s <= '1';
    wait for 5 * fpga_period_c;
    reset_s <= '0';

    for i in data_ic'range loop
      data_is <= data_ic(i);
      wait for fpga_period_c;

      assert data_os = data_oc(i)
        report "value " & natural'image(i)
          &": got "&std_logic'image(data_os)
          &", expected "&std_logic'image(data_oc(i))
          severity error;

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

end architecture t_encoder_inc_debouncer_1;

