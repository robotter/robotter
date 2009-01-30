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
--! @brief ADNS 6010 SPI unit testbench
--! @author ~ryder
-----------------------------------------------------------------------------


library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;


entity t_adns6010_spi is
end entity t_adns6010_spi;

architecture t_adns6010_spi_1 of t_adns6010_spi is

  signal endofsimulation_s : boolean := false;

  constant fpga_period_c : time := 20 ns; -- FPGA period
  constant spi_period_c  : time := 1 us; -- SPI period

  signal clk_s       : std_logic;
  signal reset_ns    : std_logic;
  signal mosi_s      : std_logic;
  signal miso_s      : std_logic;
  signal sck_s       : std_logic;
  signal cs1_ns      : std_logic;
  signal cs2_ns      : std_logic;
  signal cs3_ns      : std_logic;
  signal data_in_s   : std_logic_vector(7 downto 0);
  signal data_out_s  : std_logic_vector(7 downto 0);
  signal send_data_s : std_logic;
  signal busy_s      : std_logic;
  signal cs_s        : std_logic_vector(1 downto 0);

  component adns6010_spi is
    generic (
      clk_freq_c : natural := 1 ms / fpga_period_c;
      spi_freq_c : natural := 1 ms / spi_period_c
    );
    port (
      clk_i       : in std_logic;
      reset_ni    : in std_logic;
      mosi_o      : out std_logic;
      miso_i      : in  std_logic;
      sck_o       : out std_logic;
      cs1_no      : out std_logic;
      cs2_no      : out std_logic;
      cs3_no      : out std_logic;
      data_in_i   : in  std_logic_vector(7 downto 0);
      data_out_o  : out std_logic_vector(7 downto 0);
      send_data_i : in  std_logic;
      busy_o      : out std_logic;
      cs_i        : in  std_logic_vector(1 downto 0)
    );
  end component adns6010_spi;
  for adns6010_spi_0 : adns6010_spi use entity work.adns6010_spi;

begin

  adns6010_spi_0 : adns6010_spi
  port map (
    clk_i       => clk_s,
    reset_ni    => reset_ns,
    mosi_o      => mosi_s,
    miso_i      => miso_s,
    sck_o       => sck_s,
    cs1_no      => cs1_ns,
    cs2_no      => cs2_ns,
    cs3_no      => cs3_ns,
    data_in_i   => data_in_s,
    data_out_o  => data_out_s,
    send_data_i => send_data_s,
    busy_o      => busy_s,
    cs_i        => cs_s
  );


  transfers_p : process
    variable angle_ref_v : natural range 0 to 3599;
  begin

    reset_ns    <= '0';
    cs_s        <= "01";
    data_in_s   <= (others => 'Z');
    send_data_s <= '0'; 
    wait for 1 us;
    reset_ns <= '1';
    wait for 1 us;

    data_in_s   <= "00110101";
    send_data_s <= '1'; 
    wait for 20 us;

    report "end of tests" severity note;
    endofsimulation_s <= true;
    wait;

  end process transfers_p;


  miso1_p : process
    constant byte_v : std_logic_vector(7 downto 0) := "01100011";
    variable tmp_v  : std_logic_vector(7 downto 0);
    variable bit_cnt_v  : natural range 0 to 7;
  begin

    wait on sck_s;

    if endofsimulation_s = true then
      wait;

    elsif cs1_ns = '1' or reset_ns = '0' then
      miso_s <= 'Z';
      bit_cnt_v := 0;

    elsif sck_s = '0' and sck_s'last_value = '1' then
      -- MISO outputs on falling edges
      if bit_cnt_v = 0 then
        tmp_v := byte_v;
      end if;
      miso_s <= tmp_v(7);
      tmp_v(7 downto 1) := tmp_v(6 downto 0);

      if bit_cnt_v = 7 then
        bit_cnt_v := 0;
      else
        bit_cnt_v := bit_cnt_v + 1;
      end if;

    end if;

  end process miso1_p;


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

end architecture t_adns6010_spi_1;


