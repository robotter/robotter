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

entity encoder_inc is

  generic (
    --! Debouncer register size
    reg_size_c : natural := 10
  );
  port (
    --! calculus synchronisation, reset speed counter, latch new data on speed output 
    synchro_i : in std_logic;
    --! encoder speed
    speed_o : out signed(15 downto 0);

    --! Encoder device interface
    ch_a_i    : in  std_logic;
    ch_b_i    : in  std_logic
  );

end entity encoder_inc;


architecture encoder_inc_1 of encoder_inc is

  signal speed_s :signed(15 downto 0);
  signal synchro_s : std_logic;
  signal debounced_a_s : std_logic;
  signal debounced_b_s : std_logic;

  component encoder_inc_debouncer
    generic (
      reg_size_c : natural range 2 to natural'high;
      reset_data_c : std_logic
    );
    port (
      clk_i   : in  std_logic;
      reset_i : in  std_logic;
      data_i  : in  std_logic;
      data_o  : out std_logic
    );
  end component encoder_inc_debouncer;
  for encoder_inc_debouncer_a : encoder_inc_debouncer use entity work.encoder_inc_debouncer;
  for encoder_inc_debouncer_b : encoder_inc_debouncer use entity work.encoder_inc_debouncer;

  component encoder_inc_reader is
    port (
      clk_i   : in  std_logic;
      reset_i : in  std_logic;
      ch_a_i  : in  std_logic;
      ch_b_i  : in  std_logic;
      synchro_i : in std_logic;
      speed_o : out integer
    );
  end component encoder_inc_reader;
  for encoder_inc_reader_0 : encoder_inc_reader use entity work.encoder_inc_reader;

begin

  encoder_inc_debouncer_a : encoder_inc_debouncer
  generic map (
    reg_size_c   => reg_size_c
  )
  port map (
    clk_i   => wbs_clk_i,
    reset_i => wbs_rst_i,
    data_i  => ch_a_i,
    data_o  => debounced_a_s
  );

  encoder_inc_debouncer_b : encoder_inc_debouncer
  generic map (
    reg_size_c   => reg_size_c
  )
  port map (
    clk_i   => wbs_clk_i,
    reset_i => wbs_rst_i,
    data_i  => ch_b_i,
    data_o  => debounced_b_s
  );

  encoder_inc_reader_0 : encoder_inc_reader
  port map (
    clk_i   => wbs_clk_i,
    reset_i => wbs_rst_i,
    ch_a_i  => debounced_a_s,
    ch_b_i  => debounced_b_s,
    synchro_i => synchro_s,
    speed_o => speed_s
  );

  synchro_s <= synchro_i;
  speed_o <= speed_s;

end architecture encoder_inc_1;

