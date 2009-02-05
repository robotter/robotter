
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

  --! Tested MISO data, set to other than 'Z' to start transfer test
  signal miso_data_s : std_logic_vector(7 downto 0) := (others => 'Z');
  --! Tested MOSI data, set to 'Z' to start transfer test
  signal mosi_data_s : std_logic_vector(7 downto 0) := (others => 'Z');

  --! Process a test transfer
  procedure test_transfer(
    constant miso_val_i  : in  std_logic_vector(7 downto 0);
    constant mosi_val_i  : in  std_logic_vector(7 downto 0);
    signal   send_data_o : out std_logic;
    signal   mosi_data_o : out std_logic_vector(7 downto 0);
    signal   miso_data_o : out std_logic_vector(7 downto 0);
    signal   busy_i      : in  std_logic
  ) is
  begin
    mosi_data_o <= mosi_val_i;
    miso_data_o <= miso_val_i;
    send_data_o <= '1'; 
    wait until busy_i = '0';
    send_data_o <= '0';
  end procedure test_transfer;

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
  begin

    reset_ns    <= '0';
    cs_s        <= "01";
    send_data_s <= '0';

    wait for 2 us;

    reset_ns <= '1';
    
    wait for 1 us;
    test_transfer(x"42",x"00", send_data_s,mosi_data_s,miso_data_s,busy_s);

    wait for 3 us;
    test_transfer(x"00",x"FF", send_data_s,mosi_data_s,miso_data_s,busy_s);

    wait for 500 ns;
    test_transfer(x"FF",x"42", send_data_s,mosi_data_s,miso_data_s,busy_s);

    wait for 1 us;

    report "end of tests" severity note;
    endofsimulation_s <= true;
    wait;

  end process transfers_p;


  test_miso_p : process
    variable tmp_v  : std_logic_vector(7 downto 0);
  begin

    miso_s <= 'Z';
    wait until rising_edge(send_data_s) or endofsimulation_s = true;
    if endofsimulation_s = true then
      wait;
    end if;

    tmp_v := miso_data_s;
    for i in 0 to 7 loop
      wait until falling_edge(sck_s);
      miso_s <= tmp_v(7);
      tmp_v(7 downto 1) := tmp_v(6 downto 0);
    end loop;
    wait until busy_s = '0';

    -- Compare with received value
    assert data_out_s = miso_data_s
      report "MISO transfer failed: received value mismatch" severity error;

  end process test_miso_p;


  test_mosi_p : process
    variable tmp_v  : std_logic_vector(7 downto 0);
  begin

    data_in_s <= (others => 'Z');
    wait until rising_edge(send_data_s) or endofsimulation_s = true;
    if endofsimulation_s = true then
      wait;
    end if;

    data_in_s <= mosi_data_s;
    for i in 0 to 7 loop
      wait until rising_edge(sck_s);
      tmp_v(7 downto 1) := tmp_v(6 downto 0);
      tmp_v(0) := mosi_s;
    end loop;
    wait until busy_s = '0';

    -- Compare with sent value
    assert tmp_v = mosi_data_s
      report "MOSI transfer failed: sent value mismatch" severity error;

  end process test_mosi_p;


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


