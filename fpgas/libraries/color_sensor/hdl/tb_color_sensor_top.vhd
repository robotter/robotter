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
--! @brief ADNS9500 top testbench
--! @author JD <jd@robotter.fr>
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.p_wishbone_testbench.all;

entity tb_color_sensor_top is
end entity tb_color_sensor_top;

architecture tb_color_sensor_top_1 of tb_color_sensor_top is

  constant fpga_period_c : time := 20 ns;  -- FPGA period

  signal endofsimulation_s : boolean := false;

  signal rst_s      : std_logic;
  signal clk_s      : std_logic;
  signal wbs_adr_s  : std_logic_vector(5 downto 0);
  signal wbs_dat_os : std_logic_vector(7 downto 0);
  signal wbs_dat_is : std_logic_vector(7 downto 0);
  signal wbs_we_s   : std_logic;
  signal wbs_stb_s  : std_logic;
  signal wbs_ack_s  : std_logic;
  signal wbs_cyc_s  : std_logic;

  signal s_red_apds9700_enable_no : std_logic;
  signal s_red_apds9700_pwm_o     : std_logic;
  signal s_red_apds9700_dout_i    : std_logic;
  signal s_red_present           : std_logic;

  signal s_blue_apds9700_enable_no : std_logic;
  signal s_blue_apds9700_pwm_o     : std_logic;
  signal s_blue_apds9700_dout_i    : std_logic;
  signal s_blue_present            : std_logic;

  component color_sensor_top is
    generic (
      c_id                             : natural range 1 to 255    := 2;
      c_fpga_frequency_khz             : natural range 1 to 100000 := 50000;
      c_color_measure_interval_us      : natural range 1 to 1000   := 100;
      c_apds_enable_to_ledPwm_delay_us : natural range 1 to 100    := 30;
      c_led_pwm_frequency_khz          : natural range 10 to 1000  := 100;
      c_led_pwm_pulse_width_us         : natural range 1 to 120    := 1);
    port (
      --! Wishbone interface
      -- wishbone interface
      wbs_rst_i : in std_logic;         -- asynchronous reset, active high
      wbs_clk_i : in std_logic;         -- clock

      wbs_adr_i : in  std_logic_vector(5 downto 0);  -- address BUS
      wbs_dat_o : out std_logic_vector(7 downto 0);  -- data readden
                                                     -- from bus
      wbs_dat_i : in  std_logic_vector(7 downto 0);  -- data write from BUS
      wbs_we_i  : in  std_logic;        -- read/write
      wbs_stb_i : in  std_logic;        -- validate read/write operation
      wbs_ack_o : out std_logic;        -- operation succesful
      wbs_cyc_i : in  std_logic;

      red_apds9700_enable_no : out std_logic;
      red_apds9700_pwm_o     : out std_logic;
      red_apds9700_dout_i    : in  std_logic;

      blue_apds9700_enable_no : out std_logic;
      blue_apds9700_pwm_o     : out std_logic;
      blue_apds9700_dout_i    : in  std_logic);
  end component;


  

begin

  color_sensor_top_0 : color_sensor_top
    generic map (
      c_fpga_frequency_khz             => 50000,
      c_id                             => 2,
      c_color_measure_interval_us      => 100,
      c_apds_enable_to_ledPwm_delay_us => 30,
      c_led_pwm_frequency_khz          => 100,
      c_led_pwm_pulse_width_us         => 1
      )
    port map (
      wbs_rst_i => rst_s,
      wbs_clk_i => clk_s,
      wbs_adr_i => wbs_adr_s,
      wbs_dat_o => wbs_dat_os,
      wbs_dat_i => wbs_dat_is,
      wbs_we_i  => wbs_we_s,
      wbs_stb_i => wbs_stb_s,
      wbs_ack_o => wbs_ack_s,
      wbs_cyc_i => wbs_cyc_s,

      red_apds9700_enable_no => s_red_apds9700_enable_no,
      red_apds9700_pwm_o     => s_red_apds9700_pwm_o,
      red_apds9700_dout_i    => s_red_apds9700_dout_i,

      blue_apds9700_enable_no => s_blue_apds9700_enable_no,
      blue_apds9700_pwm_o     => s_blue_apds9700_pwm_o,
      blue_apds9700_dout_i    => s_blue_apds9700_dout_i
      );


  -------------------------------------------------
  -- CLOCK GENERATION PROCESS
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


  ------------------------------------------------
  -- reset
  reset_p : process
  begin
    rst_s <= '0';
    wait for 10 us;
    rst_s <= '1';
    wait for 10 us;
    rst_s <= '0';
    wait for 1000 ms;
  end process;

  -----------------------------------------------------------------------------
  -- wishbone access


  -----------------------------------------------------------------------------
  -- color present
  process
  begin
    s_red_present  <= '0';
    s_blue_present <= '0';
    wait for 10 ms;

    s_red_present  <= '1';
    s_blue_present <= '0';
    wait for 10 ms;

    s_red_present  <= '0';
    s_blue_present <= '1';
    wait for 10 ms;

    s_red_present  <= '1';
    s_blue_present <= '1';
    wait for 10 ms;
  end process;

  -----------------------------------------------------------------------------
  -- red_color_sensor_board

  process
    variable v_it : natural;
  begin
    wait for 100 ns;
    if s_red_apds9700_enable_no = '0' then
      wait until rising_edge(s_red_apds9700_pwm_o);
      v_it := v_it + 1;
      if v_it >= 50 and s_red_present = '1' then
        s_red_apds9700_dout_i <= '0';
      end if;
      
    else
      s_red_apds9700_dout_i <= '1';
      v_it                  := 0;
    end if;
  end process;



  -----------------------------------------------------------------------------
  -- blue_color_sensor_board

  process
    variable v_it : natural;
  begin
    wait for 100 ns;
    if s_blue_apds9700_enable_no = '0' then
      wait until rising_edge(s_blue_apds9700_pwm_o);
      v_it := v_it + 1;
      if v_it >= 50 and s_blue_present = '1' then
        s_blue_apds9700_dout_i <= '0';
      end if;
      
    else
      s_blue_apds9700_dout_i <= '1';
      v_it                   := 0;
    end if;
  end process;

-------------------------------------------------------------------------------
  -- wishbone interface

  process
  begin
    wait for 100 us;
		-- activate color sensor
    wb_write("000001", x"01", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

		-- set threshold to detect color
    wait for 100 us;
    wb_write("00" & X"4", x"00", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    wb_write("00" & X"3", x"F0", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);


    wait for 100 us;
    wb_write("00" & X"5", x"00", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    wb_write("00" & X"6", x"77", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ms;
    
		-- disable color sensor
		wb_write("000001", x"00", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ms;
				-- disable color sensor
		wb_write("000001", x"01", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

		-- set thershold to non detection 
    wb_write("00" & X"4", x"00", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    wb_write("00" & X"3", x"07", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 us;
    wb_write("00" & X"6", x"00", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    wb_write("00" & X"5", x"09", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ms;
  end process;


  ---------------------------------------------------
  ---- MAIN PROCESS
  --main_p : process

  --  -------------------------------------------------------------------------
  --  -- TEST ARRAY
  --  -------------------------------------------------------------------------

  --  type     result_array is array (natural range <>) of std_logic_vector(7 downto 0);
  --  constant results_c : result_array :=
  --    (x"F0", x"01", x"00", x"00", x"F4", x"01", x"00", x"00", x"AA");
  --  -------------------------------------------------------------------------
  --begin

  --  rst_s <= '1';

  --  wbs_adr_s  <= "ZZZZZZ";
  --  wbs_we_s   <= 'Z';
  --  wbs_stb_s  <= '0';
  --  wbs_cyc_s  <= '0';
  --  wbs_dat_is <= x"00";

  --  miso_s <= '0';

  --  byte_s <= x"00";

  --  wait for 500 ns;
  --  rst_s <= '0';
  --  wait for 100 ns;

  --  ------------------------------------------------------------------------
  --  -- ADNS NCS LINES TESTS
  --  ------------------------------------------------------------------------
  --  debug_s <= x"00";

  --  -- Drive CS to various values

  --  wb_write("100000", x"00", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;
  --  assert cs1_s = '1' report "NCS1 fail" severity warning;
  --  assert cs2_s = '1' report "NCS2 fail" severity warning;
  --  assert cs3_s = '1' report "NCS3 fail" severity warning;

  --  wb_write("100000", x"01", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;
  --  assert cs1_s = '0' report "NCS1 fail" severity warning;
  --  assert cs2_s = '1' report "NCS2 fail" severity warning;
  --  assert cs3_s = '1' report "NCS3 fail" severity warning;

  --  wb_write("100000", x"02", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;
  --  assert cs1_s = '1' report "NCS1 fail" severity warning;
  --  assert cs2_s = '0' report "NCS2 fail" severity warning;
  --  assert cs3_s = '1' report "NCS3 fail" severity warning;

  --  wb_write("100000", x"03", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;
  --  assert cs1_s = '1' report "NCS1 fail" severity warning;
  --  assert cs2_s = '1' report "NCS2 fail" severity warning;
  --  assert cs3_s = '0' report "NCS3 fail" severity warning;

  --  wb_write("100000", x"00", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;
  --  assert cs1_s = '1' report "NCS1 fail" severity warning;
  --  assert cs2_s = '1' report "NCS2 fail" severity warning;
  --  assert cs3_s = '1' report "NCS3 fail" severity warning;

  --  ------------------------------------------------------------------------
  --  -- ADNS DIRECT SPI TEST
  --  ------------------------------------------------------------------------
  --  debug_s <= x"01";

  --  -- put system to NO-auto

  --  wb_write("011110", x"00", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;

  --  debug_s <= x"02";
  --  -- try direct SPI communication

  --  -- send_data <= 0
  --  wb_write("100000", x"00", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  -- data_i <= "<data>"
  --  wb_write("011111", x"EB", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  -- send_data <= 1
  --  wb_write("100000", x"04", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;
  --  -- simulate slave transmission
  --  spi_prepdata(x"70", out_s, mosi_s, miso_s, sck_s);

  --  wait for 100 ns;
  --  assert out_s = x"EB" report "SPI SLAVE received value fail" severity warning;

  --  -- read busy bit
  --  wb_read("100000", clk_s,
  --          wbs_adr_s, wbs_dat_os, wbs_we_s,
  --          wbs_stb_s, wbs_ack_s, wbs_cyc_s,
  --          byte_s);

  --  wait for 10 ns;
  --  assert byte_s(3) = '1' report "SPI BUSY high fail" severity warning;

  --  -- wait for busy to go low (take 1/2 spi clock tick)
  --  wait for 700 ns;

  --  -- read busy bit
  --  wb_read("100000", clk_s,
  --          wbs_adr_s, wbs_dat_os, wbs_we_s,
  --          wbs_stb_s, wbs_ack_s, wbs_cyc_s,
  --          byte_s);

  --  wait for 10 ns;
  --  assert byte_s(3) = '0' report "SPI BUSY low fail" severity warning;

  --  -- read received data
  --  wb_read("011111", clk_s,
  --          wbs_adr_s, wbs_dat_os, wbs_we_s,
  --          wbs_stb_s, wbs_ack_s, wbs_cyc_s,
  --          byte_s);   

  --  wait for 10 ns;
  --  assert byte_s = x"70" report "SPI MASTER received value fail" severity warning;

  --  ------------------------------------------------------------------------
  --  -- ADNS AUTOMATIC MODE TEST
  --  ------------------------------------------------------------------------

  --  ------------------------------------------------------------------------
  --  debug_s <= x"03";
  --  -- perform a latch cycle 

  --  wb_write("000001", x"07", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;

  --  wb_write("000001", x"00", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;

  --  ------------------------------------------------------------------------
  --  -- no SPI communication until now => all movements registers shall be 0s
  --  debug_s <= x"04";

  --  for addr in 2 to 28 loop

  --    wb_read(std_logic_vector(to_unsigned(addr, 6)), clk_s,
  --            wbs_adr_s, wbs_dat_os, wbs_we_s,
  --            wbs_stb_s, wbs_ack_s, wbs_cyc_s,
  --            byte_s);   

  --    wait for 10 ns;

  --    assert byte_s = x"00" report "MOVEMENT REGISTER NULL fail" severity warning;

  --  end loop;

  --  -- put system to AUTO mode

  --  wb_write("011110", x"FF", clk_s,
  --           wbs_adr_s, wbs_dat_is, wbs_we_s,
  --           wbs_stb_s, wbs_ack_s, wbs_cyc_s);

  --  wait for 100 ns;


  --  for step in 0 to 3 loop
  --    -------------------------------------------------------------------------
  --    -- simulate SPI communication 

  --    -- loop on adns
  --    for i in 0 to 2 loop
  --      debug_s <= std_logic_vector(to_unsigned(i+step*3, 8));

  --      -- first CU shall access motion register and perform burst 

  --      -- CU shall drive NCS low
  --      if(i = 0) then
  --        wait until cs1_s = '0';
  --      elsif(i = 1) then
  --        wait until cs2_s = '0';
  --      elsif(i = 2) then
  --        wait until cs3_s = '0';
  --      end if;

  --      -- CU shall read motion register (0x50)
  --      spi_prepdata(x"00", out_s, mosi_s, miso_s, sck_s);

  --      wait for 10 ns;
  --      assert out_s = x"50" report "CU READ MOTION REGISTER fail" severity warning;

  --      -- motion register bit 7 indicate motion occured since last report

  --      spi_prepdata(x"80", out_s, mosi_s, miso_s, sck_s);  -- motion
  --      spi_prepdata(x"00", out_s, mosi_s, miso_s, sck_s);  -- observation
  --      spi_prepdata(x"FF", out_s, mosi_s, miso_s, sck_s);  -- deltax 
  --      spi_prepdata(x"2C", out_s, mosi_s, miso_s, sck_s);  -- deltax 
  --      spi_prepdata(x"FF", out_s, mosi_s, miso_s, sck_s);  -- deltay 
  --      spi_prepdata(x"2D", out_s, mosi_s, miso_s, sck_s);  -- deltay 
  --      spi_prepdata(x"AA", out_s, mosi_s, miso_s, sck_s);  -- squal

  --      -- CU shall stop burst by pulling NCS high
  --      if(i = 0) then
  --        wait until cs1_s = '1';
  --      elsif(i = 1) then
  --        wait until cs2_s = '1';
  --      elsif(i = 2) then
  --        wait until cs3_s = '1';
  --      end if;


  --    end loop;  -- for step

  --  end loop;  -- for i

  --  endofsimulation_s <= true;
  --  wait;
  --end process main_p;
  ---------------------------------------------------


end architecture tb_color_sensor_top_1;



