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

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;


--! Compass top
entity compass_top is

  generic (
    id_c       : natural := 9;    --! module ID
    clk_freq_c : natural := 50000 --! FPGA clock frequency, in kHz
  );
  port (
    --! Wishbone interface
    wbs_rst_i : in  std_logic;
    wbs_clk_i : in  std_logic;
    wbs_adr_i : in  std_logic_vector(1 downto 0);
    wbs_dat_o : out std_logic_vector(7 downto 0);
    wbs_we_i  : in  std_logic;
    wbs_stb_i : in  std_logic;
    wbs_ack_o : out std_logic;
    wbs_cyc_i : in  std_logic;

    --! Compass device interface
    pwm_i     : in std_logic
  );

end entity compass_top;


architecture compass_top_1 of compass_top is

  signal angle_s : natural range 0 to 3599;

  component compass_reader is
    generic (
      clk_freq_c : natural := clk_freq_c
    );
    port (
      clk_i   : in  std_logic;
      reset_i : in  std_logic;
      pwm_i   : in  std_logic;
      angle_o : out natural range 0 to 3599
    );
  end component compass_reader;
  for compass_reader_0 : compass_reader use entity work.compass_reader;

  component compass_wbs is
    generic (
      id_c : natural := id_c
    );
    port (
      wbs_rst_i : in  std_logic;
      wbs_clk_i : in  std_logic;
      wbs_adr_i : in  std_logic_vector(1 downto 0);
      wbs_dat_o : out std_logic_vector(7 downto 0);
      wbs_we_i  : in  std_logic;
      wbs_stb_i : in  std_logic;
      wbs_ack_o : out std_logic;
      wbs_cyc_i : in  std_logic;

      angle_i   : in  natural range 0 to 3599
    );
  end component compass_wbs;
  for compass_wbs_0 : compass_wbs use entity work.compass_wbs;

begin

  compass_reader_0 : compass_reader
  generic map (
    clk_freq_c => clk_freq_c
  )
  port map (
    clk_i   => wbs_clk_i,
    reset_i => wbs_rst_i,
    pwm_i   => pwm_i,
    angle_o => angle_s
  );

  compass_wbs_0 : compass_wbs
  generic map (
    id_c => id_c
  )
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

end architecture compass_top_1;


