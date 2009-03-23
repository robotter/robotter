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


entity top_encoder_inc is

  generic (
    id         : natural := 5;  --! module ID
    --! Debouncer register size
    reg_size_c : natural range 2 to natural'high := 10
  );
  port (
    --! Wishbone interface
    wbs_rst_i : in  std_logic;
    wbs_clk_i : in  std_logic;
    wbs_adr_i : in  std_logic_vector(2 downto 0);
    wbs_dat_o : out std_logic_vector(7 downto 0);
    wbs_we_i  : in  std_logic;
    wbs_stb_i : in  std_logic;
    wbs_ack_o : out std_logic;
    wbs_cyc_i : in  std_logic;

    --! Encoder device interface
    ch_a_i    : in  std_logic;
    ch_b_i    : in  std_logic
  );

end entity top_encoder_inc;


architecture top_encoder_inc_1 of top_encoder_inc is

  alias id_c : natural is id;
  signal angle_s : integer;
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
      angle_o : out integer
    );
  end component encoder_inc_reader;
  for encoder_inc_reader_0 : encoder_inc_reader use entity work.encoder_inc_reader;

  component encoder_inc_wbs is
    generic (
      id_c : natural := id
    );
    port (
      wbs_rst_i : in  std_logic;
      wbs_clk_i : in  std_logic;
      wbs_adr_i : in  std_logic_vector(2 downto 0);
      wbs_dat_o : out std_logic_vector(7 downto 0);
      wbs_we_i  : in  std_logic;
      wbs_stb_i : in  std_logic;
      wbs_ack_o : out std_logic;
      wbs_cyc_i : in  std_logic;

      angle_i   : in  integer
    );
  end component encoder_inc_wbs;
  for encoder_inc_wbs_0 : encoder_inc_wbs use entity work.encoder_inc_wbs;

begin

  encoder_inc_debouncer_a : encoder_inc_debouncer
  generic map (
    reg_size_c   => reg_size_c,
    reset_data_c => '1'
  )
  port map (
    clk_i   => wbs_clk_i,
    reset_i => wbs_rst_i,
    data_i  => ch_a_i,
    data_o  => debounced_a_s
  );

  encoder_inc_debouncer_b : encoder_inc_debouncer
  generic map (
    reg_size_c   => reg_size_c,
    reset_data_c => '0'
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
    angle_o => angle_s
  );

  encoder_inc_wbs_0 : encoder_inc_wbs
  port map (
    wbs_rst_i => wbs_rst_i,
    wbs_clk_i => wbs_clk_i,
    wbs_adr_i => wbs_adr_i,
    wbs_dat_o => wbs_dat_o,
    wbs_we_i  => wbs_we_i,
    wbs_stb_i => wbs_stb_i,
    wbs_ack_o => wbs_ack_o,
    wbs_cyc_i => wbs_cyc_i,

    angle_i   => angle_s
  );

end architecture top_encoder_inc_1;

