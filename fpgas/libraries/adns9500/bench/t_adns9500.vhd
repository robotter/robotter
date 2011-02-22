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

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

use work.p_wishbone_testbench.all;

entity t_adns9500 is
end entity t_adns9500;

architecture t_adns9500_1 of t_adns9500 is

  constant fpga_period_c : time := 20 ns; -- FPGA period

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

  signal mosi_s : std_logic;
  signal miso_s : std_logic;
  signal sck_s  : std_logic;
  signal cs1_s  : std_logic;
  signal cs2_s  : std_logic;
  signal cs3_s  : std_logic;

  signal out_s : std_logic_vector(7 downto 0);
  signal byte_s : std_logic_vector(7 downto 0);
  signal debug_s : std_logic_vector(7 downto 0);
  
  component adns9500 is 
  generic (
    id         : natural := 2;
    wb_size_c    : natural := 8;           -- data port size
    adns_size_c  : natural := 16;        -- data sensor port size
    squal_size_c : natural := 8;  -- squal port size
    freq_fpga_c  : natural := 50000
    );

  port (
    --! wishbone interface
    wbs_rst_i : in  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock
    wbs_adr_i : in std_logic_vector(5 downto 0);    -- address bus
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);  -- data readden from bus
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0); -- data write from bus
    wbs_we_i  : in std_logic;           -- read/write
    wbs_stb_i : in std_logic;           -- validate read/write operation
    wbs_ack_o : out std_logic;           -- operation succesful
    wbs_cyc_i : in std_logic;


    --! spi
    mosi_o : out std_logic;
    miso_i : in    std_logic;
    sck_o  : out  std_logic;
    cs1_no : out  std_logic;
    cs2_no : out  std_logic;
    cs3_no : out  std_logic;

    -- raw ADNS9500 ouputs
    adns1_deltax_o : out signed (15 downto 0);
    adns1_deltay_o : out signed (15 downto 0);
    adns2_deltax_o : out signed (15 downto 0);
    adns2_deltay_o : out signed (15 downto 0);
    adns3_deltax_o : out signed (15 downto 0);
    adns3_deltay_o : out signed (15 downto 0);

    adns1_squal_o  : out std_logic_vector (7 downto 0);
    adns2_squal_o  : out std_logic_vector (7 downto 0);
    adns3_squal_o  : out std_logic_vector (7 downto 0);
    
    update_o : out std_logic

    );

  end component adns9500;

  for top_adns9500_0 : adns9500 use entity work.adns9500;

  -------------------------------------------------
  -- SPI SLAVE GENERATION PROCEDURES
  procedure spi_prepdata( 
    constant data_miso_ci : in  std_logic_vector(7 downto 0);
    signal data_mosi_o : out  std_logic_vector(7 downto 0);
    signal spi_mosi_i : in std_logic;
    signal spi_miso_o : out std_logic;
    signal spi_clk_i  : in std_logic )
  is
  begin

    for i in 7 downto 0 loop
      
      wait until falling_edge(spi_clk_i);
      spi_miso_o <= data_miso_ci(i);
      
      wait until rising_edge(spi_clk_i);
      data_mosi_o(i) <= spi_mosi_i;

    end loop;

  end spi_prepdata;

begin

  top_adns9500_0 : adns9500
  generic map (
    freq_fpga_c => 50000
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

    mosi_o => mosi_s,
    miso_i => miso_s,
    sck_o => sck_s,
    cs1_no => cs1_s,
    cs2_no => cs2_s,
    cs3_no => cs3_s
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
  -------------------------------------------------

  -------------------------------------------------
  -- MAIN PROCESS
  main_p : process

    -------------------------------------------------------------------------
    -- TEST ARRAY
    -------------------------------------------------------------------------

    type result_array is array (natural range <>) of std_logic_vector(7 downto 0);
    constant results_c : result_array :=
    (x"F0",x"01",x"00",x"00", x"F4",x"01",x"00",x"00", x"AA");
    -------------------------------------------------------------------------
  begin

    rst_s <= '1';

    wbs_adr_s <= "ZZZZZZ";
    wbs_we_s <= 'Z';
    wbs_stb_s <= '0';
    wbs_cyc_s <= '0';
    wbs_dat_is <= x"00";

    miso_s <= '0';

    byte_s <= x"00";

    wait for 500 ns;
    rst_s <= '0';
    wait for 100 ns;
    
    ------------------------------------------------------------------------
    -- ADNS NCS LINES TESTS
    ------------------------------------------------------------------------
    debug_s <= x"00";

    -- Drive CS to various values

    wb_write("100000", x"00", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;
    assert cs1_s = '1' report "NCS1 fail" severity warning;
    assert cs2_s = '1' report "NCS2 fail" severity warning;
    assert cs3_s = '1' report "NCS3 fail" severity warning;

    wb_write("100000", x"01", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;
    assert cs1_s = '0' report "NCS1 fail" severity warning;
    assert cs2_s = '1' report "NCS2 fail" severity warning;
    assert cs3_s = '1' report "NCS3 fail" severity warning;
    
    wb_write("100000", x"02", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;
    assert cs1_s = '1' report "NCS1 fail" severity warning;
    assert cs2_s = '0' report "NCS2 fail" severity warning;
    assert cs3_s = '1' report "NCS3 fail" severity warning;
 
     wb_write("100000", x"03", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;
    assert cs1_s = '1' report "NCS1 fail" severity warning;
    assert cs2_s = '1' report "NCS2 fail" severity warning;
    assert cs3_s = '0' report "NCS3 fail" severity warning;

    wb_write("100000", x"00", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;
    assert cs1_s = '1' report "NCS1 fail" severity warning;
    assert cs2_s = '1' report "NCS2 fail" severity warning;
    assert cs3_s = '1' report "NCS3 fail" severity warning;

    ------------------------------------------------------------------------
    -- ADNS DIRECT SPI TEST
    ------------------------------------------------------------------------
    debug_s <= x"01";

    -- put system to NO-auto

    wb_write("011110", x"00", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;

    debug_s <= x"02";
    -- try direct SPI communication

    -- send_data <= 0
    wb_write("100000", x"00", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    -- data_i <= "<data>"
    wb_write("011111", x"EB", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    -- send_data <= 1
    wb_write("100000", x"04", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    
    wait for 100 ns;
    -- simulate slave transmission
    spi_prepdata(x"70", out_s, mosi_s, miso_s, sck_s);
    
    wait for 100 ns;
    assert out_s = x"EB" report "SPI SLAVE received value fail" severity warning;
    
    -- read busy bit
    wb_read("100000", clk_s,
            wbs_adr_s, wbs_dat_os, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s,
             byte_s);

    wait for 10 ns;
    assert byte_s(3) = '1' report "SPI BUSY high fail" severity warning;

    -- wait for busy to go low (take 1/2 spi clock tick)
    wait for 700 ns;

    -- read busy bit
    wb_read("100000", clk_s,
             wbs_adr_s, wbs_dat_os, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s,
             byte_s);

    wait for 10 ns;
    assert byte_s(3) = '0' report "SPI BUSY low fail" severity warning;

    -- read received data
    wb_read("011111", clk_s,
             wbs_adr_s, wbs_dat_os, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s,
             byte_s);   
    
    wait for 10 ns;
    assert byte_s = x"70" report "SPI MASTER received value fail" severity warning;

    ------------------------------------------------------------------------
    -- ADNS AUTOMATIC MODE TEST
    ------------------------------------------------------------------------
 
    ------------------------------------------------------------------------
    debug_s <= x"03";
    -- perform a latch cycle 

    wb_write("000001", x"07", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;

    wb_write("000001", x"00", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;
  
    ------------------------------------------------------------------------
    -- no SPI communication until now => all movements registers shall be 0s
    debug_s <= x"04";

    for addr in 2 to 28 loop

      wb_read(std_logic_vector(to_unsigned(addr,6)), clk_s,
               wbs_adr_s, wbs_dat_os, wbs_we_s, 
               wbs_stb_s, wbs_ack_s, wbs_cyc_s,
               byte_s);   

      wait for 10 ns;

      assert byte_s = x"00" report "MOVEMENT REGISTER NULL fail" severity warning;

    end loop;

    -- put system to AUTO mode

    wb_write("011110", x"FF", clk_s,
             wbs_adr_s, wbs_dat_is, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s);

    wait for 100 ns;

    
    debug_s <= x"05";
    for step in 0 to 3 loop
      -------------------------------------------------------------------------
      -- simulate SPI communication 

        -- loop on adns
        for i in 0 to 2 loop
        
        -- first CU shall access motion register and perform burst 

        -- CU shall drive NCS low
        if(i=0) then
          wait until cs1_s = '0';
        elsif(i=1) then
          wait until cs2_s = '0';
        elsif(i=2) then
          wait until cs3_s = '0';
        end if;
        
        -- CU shall read motion register (0x50)
        spi_prepdata(x"00", out_s, mosi_s, miso_s, sck_s);
        
        wait for 10 ns;
        assert out_s = x"50" report "CU READ MOTION REGISTER fail" severity warning;
        
        -- motion register bit 7 indicate motion occured since last report
        debug_s<=x"06";

        spi_prepdata(x"80", out_s, mosi_s, miso_s, sck_s); -- motion
        spi_prepdata(x"00", out_s, mosi_s, miso_s, sck_s); -- observation
        spi_prepdata(x"FF", out_s, mosi_s, miso_s, sck_s); -- deltax 
        spi_prepdata(x"2C", out_s, mosi_s, miso_s, sck_s); -- deltax 
        spi_prepdata(x"FF", out_s, mosi_s, miso_s, sck_s); -- deltay 
        spi_prepdata(x"2D", out_s, mosi_s, miso_s, sck_s); -- deltay 
        spi_prepdata(x"AA", out_s, mosi_s, miso_s, sck_s); -- squal
        
        -- CU shall stop burst by pulling NCS high
        if(i=0) then
          wait until cs1_s = '1';
        elsif(i=1) then
          wait until cs2_s = '1';
        elsif(i=2) then
          wait until cs3_s = '1';
        end if;

  
      end loop; -- for step

    end loop; -- for i

    endofsimulation_s <= true;
    wait;
  end process main_p;
  -------------------------------------------------


end architecture t_adns9500_1;



