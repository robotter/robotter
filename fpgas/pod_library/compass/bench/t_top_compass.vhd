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
--! @brief Compass top testbench
--! @author ~ryder <benoit@ryder.fr>
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity t_top_compass is
end entity t_top_compass;

architecture t_top_compass_1 of t_top_compass is

  constant fpga_period_c : time := 2 us; -- FPGA period

  signal endofsimulation_s : boolean := false;

  signal rst_s      : std_logic;
  signal clk_s      : std_logic;
  signal wbs_adr_s  : std_logic_vector(1 downto 0);
  signal wbs_dat_os : std_logic_vector(7 downto 0);
  signal wbs_we_s   : std_logic;
  signal wbs_stb_s  : std_logic;
  signal wbs_ack_s  : std_logic;
  signal wbs_cyc_s  : std_logic;
  signal pwm_s      : std_logic;

  component top_compass is
    generic (
      id         : natural := 9;    --! module ID
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

  end component top_compass;
  for top_compass_0 : top_compass use entity work.top_compass;

  --! Test returned value for a given angle
  procedure test_angle (
    constant a_ref_ci : in  natural range 0 to 3599;
    signal   pwm_o    : out std_logic;
    signal   clk_i    : in  std_logic;
    signal   wb_adr_o : out std_logic_vector(1 downto 0);
    signal   wb_dat_i : in  std_logic_vector(7 downto 0);
    signal   wb_we_o  : out std_logic;
    signal   wb_stb_o : out std_logic;
    signal   wb_ack_i : in  std_logic;
    signal   wb_cyc_o : out std_logic
  ) is
    variable a_ref_v : std_logic_vector(15 downto 0);
    variable a_reg_v : std_logic_vector(15 downto 0);
  begin

    a_ref_v := std_logic_vector(to_unsigned(a_ref_ci, 16));

    -- Generate PWM impulse
    pwm_o <= '1';
    wait for (a_ref_ci+100)*10 us;
    pwm_o <= '0';
    wait for 1 ms;

    -- Read computed angle value
    wb_we_o  <= '0';

    wait until rising_edge(clk_i);
    wb_adr_o <= "00";
    wb_cyc_o <= '1';
    wb_stb_o <= '1';
    wait until rising_edge(clk_i) and wb_ack_i = '1';
    a_reg_v(7 downto 0) := wb_dat_i;
    wb_stb_o <= '0';
    wb_cyc_o <= '0';
    wait for 1 ms;

    wait until rising_edge(clk_i);
    wb_adr_o <= "01";
    wb_cyc_o <= '1';
    wb_stb_o <= '1';
    wait until rising_edge(clk_i) and wb_ack_i = '1';
    a_reg_v(15 downto 8) := wb_dat_i;
    wb_stb_o <= '0';
    wb_cyc_o <= '0';
    wait for 1 ms;

    assert a_reg_v = a_ref_v
      report "angle value: expected "&natural'image(a_ref_ci)
        &", got "&natural'image(to_integer(unsigned(a_reg_v)))
        severity error;

  end procedure test_angle;


begin

  top_compass_0 : top_compass
  generic map (
    clk_freq_c => 1 ms / fpga_period_c
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

    pwm_i     => pwm_s
  );


  stimuli_p : process
  begin

    rst_s <= '1';
    pwm_s <= '0';
    wbs_adr_s <= "ZZ";
    wbs_we_s  <= 'Z';
    wbs_stb_s <= '0';
    wbs_cyc_s <= '0';
    wait for 1 ms;
    rst_s <= '0';
    wait for 1 ms;

    test_angle( 420, pwm_s, clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    test_angle(  42, pwm_s, clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    test_angle(   0, pwm_s, clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    test_angle(3599, pwm_s, clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

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

end architecture t_top_compass_1;



