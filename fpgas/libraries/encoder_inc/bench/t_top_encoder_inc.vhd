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


entity t_top_encoder_inc is
end entity t_top_encoder_inc;

architecture t_top_encoder_inc_1 of t_top_encoder_inc is

  constant fpga_period_c : time := 200 ns; -- FPGA period

  signal endofsimulation_s : boolean := false;

  signal rst_s      : std_logic;
  signal clk_s      : std_logic;
  signal wbs_adr_s  : std_logic_vector(2 downto 0);
  signal wbs_dat_os : std_logic_vector(7 downto 0);
  signal wbs_we_s   : std_logic;
  signal wbs_stb_s  : std_logic;
  signal wbs_ack_s  : std_logic;
  signal wbs_cyc_s  : std_logic;
  signal ch_a_s     : std_logic;
  signal ch_b_s     : std_logic;

  component top_encoder_inc is
    generic (
      id : natural;
      reg_size_c : natural range 2 to natural'high
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

  end component top_encoder_inc;
  for top_encoder_inc_0 : top_encoder_inc use entity work.top_encoder_inc;

  --! Test returned value for a given angle
  procedure test_move (
    constant in_a_ci  : in  std_logic_vector;
    constant in_b_ci  : in  std_logic_vector;
    constant a_ref_ci : in  integer;
    signal   ch_a_i   : out std_logic;
    signal   ch_b_i   : out std_logic;
    signal   clk_i    : in  std_logic;
    signal   wb_adr_o : out std_logic_vector(2 downto 0);
    signal   wb_dat_i : in  std_logic_vector(7 downto 0);
    signal   wb_we_o  : out std_logic;
    signal   wb_stb_o : out std_logic;
    signal   wb_ack_i : in  std_logic;
    signal   wb_cyc_o : out std_logic
  ) is
    variable a_ref_v : std_logic_vector(31 downto 0);
    variable a_reg_v : std_logic_vector(31 downto 0);
  begin

    a_ref_v := std_logic_vector(to_signed(a_ref_ci, 32));

    -- Generate encoder input
    for i in in_a_ci'range loop
      ch_a_i <= in_a_ci(i);
      ch_b_i <= in_b_ci(i);
      wait for fpga_period_c;
    end loop;

    -- Read computed angle value
    wb_we_o  <= '0';

    wait until rising_edge(clk_i);
    wb_adr_o <= "000";
    wb_cyc_o <= '1';
    wb_stb_o <= '1';
    wait until rising_edge(clk_i) and wb_ack_i = '1';
    a_reg_v(31 downto 24) := wb_dat_i;
    wb_stb_o <= '0';
    wb_cyc_o <= '0';

    wait until rising_edge(clk_i);
    wb_adr_o <= "001";
    wb_cyc_o <= '1';
    wb_stb_o <= '1';
    wait until rising_edge(clk_i) and wb_ack_i = '1';
    a_reg_v(23 downto 16) := wb_dat_i;
    wb_stb_o <= '0';
    wb_cyc_o <= '0';

    wait until rising_edge(clk_i);
    wb_adr_o <= "010";
    wb_cyc_o <= '1';
    wb_stb_o <= '1';
    wait until rising_edge(clk_i) and wb_ack_i = '1';
    a_reg_v(15 downto 8) := wb_dat_i;
    wb_stb_o <= '0';
    wb_cyc_o <= '0';

    wait until rising_edge(clk_i);
    wb_adr_o <= "011";
    wb_cyc_o <= '1';
    wb_stb_o <= '1';
    wait until rising_edge(clk_i) and wb_ack_i = '1';
    a_reg_v(7 downto 0) := wb_dat_i;
    wb_stb_o <= '0';
    wb_cyc_o <= '0';

    wait for 3 * fpga_period_c;

    assert a_reg_v = a_ref_v
      report "angle value: expected "&integer'image(a_ref_ci)
        &", got "&integer'image(to_integer(signed(a_reg_v)))
        severity error;

  end procedure test_move;


begin

  top_encoder_inc_0 : top_encoder_inc
  generic map (
    id         => 5,
    reg_size_c => 3
  )
  port map (
    wbs_rst_i => rst_s,
    wbs_clk_i => clk_s,
    wbs_adr_i => wbs_adr_s,
    wbs_dat_o => wbs_dat_os,
    wbs_we_i  => wbs_we_s,
    wbs_stb_i => wbs_stb_s,
    wbs_ack_o => wbs_ack_s,
    wbs_cyc_i => wbs_cyc_s,

    ch_a_i    => ch_a_s,
    ch_b_i    => ch_b_s
  );


  stimuli_p : process
  begin

    rst_s  <= '1';
    ch_a_s <= 'Z';
    ch_b_s <= 'Z';
    wbs_adr_s <= "ZZZ";
    wbs_we_s  <= 'Z';
    wbs_stb_s <= '0';
    wbs_cyc_s <= '0';
    wait for 5 * fpga_period_c;
    rst_s <= '0';
    wait for 3 * fpga_period_c;

    test_move( -- noisy channel B
      "1111110000001111110000001111110000001111110000",
      "1110001101110110001001110110001101110010000000",
      0+4, ch_a_s, ch_b_s, clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    test_move( -- noisy channel A
      "1110100000011110100001001111010001001001111000",
      "1111111110000001111110000001111110000001111110",
      4-4, ch_a_s, ch_b_s, clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    test_move( -- variable velocity
      "1111000011111111000000111111000001111000011110",
      "1111111000001111111000001100000000011110000111",
      0-3, ch_a_s, ch_b_s, clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

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

end architecture t_top_encoder_inc_1;




