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
USE work.p_wishbone_testbench.ALL;

entity t_top_compass is 
port (
  a_reg    : out std_logic_vector(15 downto 0); -- angle read from compass
  a_ref    : out natural range 0 to 3599);      -- angle set to pwm 
end entity t_top_compass;

architecture t_top_compass_1 of t_top_compass is

  constant fpga_period_c : time := 50 ns; -- FPGA period

  signal endofsimulation_s : boolean := false;

  signal rst_s      : std_logic;
  signal clk_s      : std_logic;
  signal wbs_adr_s  : std_logic_vector(5 downto 0);
  signal wbs_dat_os : std_logic_vector(7 downto 0);
  signal wbs_we_s   : std_logic := 'Z';
  signal wbs_stb_s  : std_logic := '0';
  signal wbs_ack_s  : std_logic;
  signal wbs_cyc_s  : std_logic;
  signal pwm_s      : std_logic;
  signal a_reg_s    : std_logic_vector(15 downto 0);
  signal a_ref_s    : natural range 0 to 3599 := 1;
  signal last_a_ref_s    : natural range 0 to 3599 := 0;
  
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



  --! get returned value for a given angle
  procedure get_angle (
    signal   clk_i    : in  std_logic;
    signal   wb_adr_o : out std_logic_vector(5 downto 0);
    signal   wb_dat_i : in  std_logic_vector(7 downto 0);
    signal   wb_we_o  : out std_logic;
    signal   wb_stb_o : out std_logic;
    signal   wb_ack_i : in  std_logic;
    signal   wb_cyc_o : out std_logic; 
    signal   a_reg_o : out std_logic_vector(15 downto 0)
  ) is
  begin
    wb_read("000000", clk_i, wb_adr_o, wb_dat_i, wb_we_o, wb_stb_o, wb_ack_i, wb_cyc_o, a_reg_o(7 downto 0));
    wb_read("000001", clk_i, wb_adr_o, wb_dat_i, wb_we_o, wb_stb_o, wb_ack_i, wb_cyc_o, a_reg_o(15 downto 8)); 
end procedure get_angle;

  procedure test_angle(
    constant a_ref_ci : in  natural range 0 to 3599;
    signal   a_reg_i : in std_logic_vector(15 downto 0)
  ) is
      variable a_ref_v : std_logic_vector(15 downto 0);
  begin

  a_ref_v := std_logic_vector(to_unsigned(a_ref_ci, 16));
  assert a_ref_v = a_reg_i
    report "angle value: expected "&natural'image(a_ref_ci)
      &", got "&natural'image(to_integer(unsigned(a_reg_i)))
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
    wbs_adr_i => wbs_adr_s(1 downto 0),
    wbs_dat_o => wbs_dat_os,
    wbs_we_i  => wbs_we_s,
    wbs_stb_i => wbs_stb_s,
    wbs_ack_o => wbs_ack_s,
    wbs_cyc_i => wbs_cyc_s,

    pwm_i     => pwm_s
  );

pwm_p : process
  begin
    -- Generate PWM impulse
    pwm_s <= '1';
    wait for (a_ref_s+100)*10 us;
    pwm_s <= '0'; 
    wait for 65 ms;
    a_ref_s <= a_ref_s +1;
  end process pwm_p;

reset_p : process
begin 
  wait for 1003 ns;
  rst_s <= '1';
  wait for 1 ms;
  rst_s <= '0';
  wait for 100000 ms;
end process;


  stimuli_p : process
  variable it: integer;
  begin        
    get_angle( clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s, a_reg_s);
    if a_ref_s = 0  or (a_ref_s = 1 and pwm_s = '1' ) then
      test_angle( a_ref_s, a_reg_s); -- last value of a_ref_s measured
    elsif pwm_s = '1' then
      test_angle( a_ref_s-2, a_reg_s); -- last value of a_ref_s measured
    else
      test_angle( a_ref_s-1, a_reg_s); -- last value of a_ref_s measured
    end if;
    wait for 42.1 us;
  end process stimuli_p;


  clock_p : process
  begin
  wait until rst_s = '0'; -- dephases clk form others signals
  while rst_s = '0' loop 
    clk_s <= '1';
    wait for fpga_period_c/2;
    clk_s <= '0';
    wait for fpga_period_c/2;
  end loop;

  end process clock_p;

  a_ref <= a_ref_s;
  a_reg <= a_reg_s;

end architecture t_top_compass_1;



