-----------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2, or (at your option)
-- any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHout ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
--! @file adns9500.vhd
--! @author lamygale
-----------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY adns9500 IS
  GENERIC (
    id           : natural := 2;
    wb_size_c    : natural := 8;           -- data port size
    adns_size_c  : natural := 16;        -- data sensor port size
    squal_size_c : natural := 8;  -- squal port size
    freq_fpga_c  : natural := 50000
    );

  PORT (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : in  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock
    wbs_adr_i : in std_logic_vector(5 downto 0);    -- address BUS
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);  -- data read from bus
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0); -- data written from bus
    wbs_we_i  : in std_logic;           -- read/write
    wbs_stb_i : in std_logic;           -- validate read/write operation
    wbs_ack_o : out std_logic;           -- operation succesful
    wbs_cyc_i : in std_logic;

    ---------------------------------------------------------------------------
    -- spi
    mosi_o : out std_logic;
    miso_i : in    std_logic;
    sck_o  : out  std_logic;
    cs1_no : out  std_logic;
    cs2_no : out  std_logic;
    cs3_no : out  std_logic;

    ---------------------------------------------------------------------------
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
    
    synchro_i : in std_logic
  );

END adns9500;


ARCHITECTURE adns9500_1 OF adns9500 IS

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  COMPONENT adns9500_spi IS
  GENERIC (
    spi_freq_c : natural :=  1000; -- SPI clock frequency in kHz
    clk_freq_c : natural := 25000  -- FPGA clock frequency in kHz
  );
  PORT (
    clk_i     : in std_logic;
    reset_ni  : in  std_logic;

    --! @name SPI signals
    --!@{
    mosi_o : out std_logic;
    miso_i : in  std_logic;
    sck_o  : out std_logic;
    cs1_no : out std_logic;
    cs2_no : out std_logic;
    cs3_no : out std_logic;
    --!@}

    --! @name Control unit port
    --!@{
    data_in_i   : in  std_logic_vector(7 downto 0); --! sent byte
    data_out_o  : out std_logic_vector(7 downto 0); --! received byte
    send_data_i : in  std_logic; --! transfer data on rising edges
    busy_o      : out  std_logic; --! '1' if SPI is transfering data
    --!@}

    --! Muxed Chip Select
    cs_i        : in std_logic_vector(1 downto 0)
  );
  END COMPONENT adns9500_spi;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  COMPONENT adns9500_wishbone_interface IS
  GENERIC (
    id_c      : natural := 2;
    wb_size_c : natural := 8;           -- data port size
    adns_size_c : natural := 16;        -- data sensor port size
    squal_size_c : natural := 8  -- squal port size
    );

  PORT (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : in  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock
    wbs_adr_i : in std_logic_vector(5 downto 0);    -- address bus
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);  -- data read
                                                             -- from bus
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0); -- data written from bus
    wbs_we_i  : in std_logic;           -- read/write
    wbs_stb_i : in std_logic;           -- validate read/write operation
    wbs_ack_o : out std_logic;           -- operation succesful
    wbs_cyc_i : in std_logic;


    adns1_squal_i   : in std_logic_vector(squal_size_c-1 downto 0);
    adns2_squal_i   : in std_logic_vector(squal_size_c-1 downto 0);
    adns3_squal_i   : in std_logic_vector(squal_size_c-1 downto 0);

    ---------------------------------------------------------------------------
    -- common register to the ControlUnit

    fault_i : in std_logic_vector(7 downto 0);
    auto_enable_o : out std_logic;      --enable the control Unit (active High)

    ---------------------------------------------------------------------------
    -- interface to the spi (controled by the µc when auto_enable_o is low)

    spi_data_i : in std_logic_vector(7 downto 0);  -- data received by the spi
    spi_data_o : out std_logic_vector(7 downto 0);  -- data to be sent by the spi
    spi_send_data_o : out std_logic;    -- send spi_data_o (active high)
    spi_busy_i : in std_logic;          -- spi transmitting (active high)
    
    spi_cs_o     : out std_logic_vector(1 downto 0)  -- selection of the slave
                                                     -- addressed by the spi
    );
  END COMPONENT adns9500_wishbone_interface;


  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  
  COMPONENT adns9500_mode_mux IS
  PORT (
    ---------------------------------------------------------------------------
    -- control unit interface
    cu_data_in_i        : in std_logic_vector(7 downto 0);
    cu_data_out_o       : out std_logic_vector(7 downto 0);
    cu_send_data_i      : in std_logic;
    cu_busy_o           : out std_logic;

    cu_adns_cs_i        : in std_logic_vector(1 downto 0);

    ---------------------------------------------------------------------------
    -- wishbone interface
    wb_data_in_i        : in std_logic_vector(7 downto 0);
    wb_data_out_o       : out std_logic_vector(7 downto 0);
    wb_send_data_i      : in std_logic;
    wb_busy_o           : out std_logic;

    wb_adns_cs_i        : in std_logic_vector(1 downto 0);


    ---------------------------------------------------------------------------
    -- spi interface
    spi_data_in_o       : out std_logic_vector(7 downto 0);
    spi_data_out_i      : in std_logic_vector(7 downto 0);
    spi_send_data_o     : out std_logic;
    spi_busy_i          : in std_logic;

    spi_adns_cs_o       : out std_logic_vector(1 downto 0);

    ---------------------------------------------------------------------------
    -- signal command

    mode_select_i : in std_logic
    
  );

  END COMPONENT adns9500_mode_mux;


  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  COMPONENT adns9500_controlunit IS 
  ---------------------------------------------------------------------------
  GENERIC (
    -- FPGA clock period in ns
    fpga_clock_period_c : natural := 20;
    -- number of ADNS9500 chips
    adns_number_c : natural := 3
  );

  -------------------------------------------------------------------------
  PORT 
  (
    -- FPGA signals
    clk_i : in  std_logic;
    reset_ni : in  std_logic;

    ----------------------------------------------------------
    -- Enable signal activate component on high state
    enable_i : in  std_logic;

    ----------------------------------------------------------
    -- SPI port
    spi_datain_o   : out  std_logic_vector (7 downto 0);
    spi_dataout_i  : in  std_logic_vector (7 downto 0);
    spi_senddata_o : out  std_logic;
    spi_busy_i     : in  std_logic;

    ----------------------------------------------------------
    -- CS ADNS selection
    adns_cs_o : out std_logic_vector (1 downto 0);

    ----------------------------------------------------------
    -- first encoder values
    adns1_deltax_o : out signed (15 downto 0);
    adns1_deltay_o : out signed (15 downto 0);
    adns1_squal_o  : out std_logic_vector (7 downto 0);

    -- second encoder values
    adns2_deltax_o : out signed (15 downto 0);
    adns2_deltay_o : out signed (15 downto 0);
    adns2_squal_o  : out std_logic_vector (7 downto 0);

    -- third encoder values
    adns3_deltax_o : out signed (15 downto 0);
    adns3_deltay_o : out signed (15 downto 0);
    adns3_squal_o  : out std_logic_vector (7 downto 0);
    
    synchro_i: in std_logic;

    -----------------------------------------------------------
    -- fault
    -- 7 :              3 : 
    -- 6 :              2 : ADNS #3 Fault
    -- 5 :              1 : ADNS #2 Fault
    -- 4 :              0 : ADNS #1 Fault
    fault_o : out std_logic_vector (7 downto 0)

  );
  END COMPONENT adns9500_controlunit;


  ----------------------------------------------------------------------
  -- interface to the first sensor

  signal adns1_deltax_s : signed(adns_size_c-1 downto 0);
  signal adns1_deltay_s : signed(adns_size_c-1 downto 0);
  signal adns1_squal_s   : std_logic_vector(squal_size_c-1 downto 0);
  ----------------------------------------------------------------------
  -- interface to the second sensor

  signal adns2_deltax_s : signed(adns_size_c-1 downto 0);
  signal adns2_deltay_s : signed(adns_size_c-1 downto 0);
  signal adns2_squal_s   : std_logic_vector(squal_size_c-1 downto 0);
  ----------------------------------------------------------------------
  -- interface to the third sensor

  signal adns3_deltax_s : signed(adns_size_c-1 downto 0);
  signal adns3_deltay_s : signed(adns_size_c-1 downto 0);
  signal adns3_squal_s   : std_logic_vector(squal_size_c-1 downto 0);

  signal synchro_s : std_logic;
  ----------------------------------------------------------------------
  -- common register to the ControlUnit

  signal fault_s : std_logic_vector(7 downto 0);

  signal auto_enable_s : std_logic;      --enable the control Unit (active High)

  ---------------------------------------------------------------------------
  -- control unit interface
  signal cu_data_in_s        : std_logic_vector(7 downto 0);
  signal cu_data_out_s       : std_logic_vector(7 downto 0);
  signal cu_send_data_s      : std_logic;
  signal cu_busy_s           : std_logic;

  signal cu_adns_cs_s        : std_logic_vector(1 downto 0);

  -- wishbone interface
  signal wb_data_in_s        : std_logic_vector(7 downto 0);
  signal wb_data_out_s       : std_logic_vector(7 downto 0);
  signal wb_send_data_s      : std_logic;
  signal wb_busy_s           : std_logic;

  signal wb_adns_cs_s        : std_logic_vector(1 downto 0);


  ---------------------------------------------------------------------------
  -- spi interface
  signal spi_data_in_s       : std_logic_vector(7 downto 0);
  signal spi_data_out_s      : std_logic_vector(7 downto 0);
  signal spi_send_data_s     : std_logic;
  signal spi_busy_s          : std_logic;

  signal spi_adns_cs_s       : std_logic_vector(1 downto 0);
  
  ---------------------------------------------------------------------------
  -- signal command

  signal mode_select_s : std_logic;


  signal reset_ns : std_logic;
  -------------------------------------------------------------------------
  -------------------------------------------------------------------------

BEGin  -- adns9500_1

reset_ns <= not(wbs_rst_i);
  
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  adns_spi : adns9500_spi 
  GENERIC MAP(
    spi_freq_c =>  1000, -- SPI clock frequency in kHz
    clk_freq_c => freq_fpga_c)  -- FPGA clock frequency in kHz
  PORT MAP(
    clk_i => wbs_clk_i,
    reset_ni  => reset_ns,
    mosi_o => mosi_o,
    miso_i => miso_i,
    sck_o  => sck_o, 
    cs1_no => cs1_no,
    cs2_no => cs2_no,
    cs3_no => cs3_no,
    
    data_in_i   => spi_data_in_s,
    data_out_o  => spi_data_out_s,
    send_data_i => spi_send_data_s,
    busy_o      => spi_busy_s,
    cs_i        => spi_adns_cs_s);
  
  
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  wishbone_interface : adns9500_wishbone_interface
  GENERIC MAP(
    id_c => id,
    wb_size_c => wb_size_c,
    adns_size_c => adns_size_c,
    squal_size_c => squal_size_c )
  PORT MAP(
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i => wbs_rst_i,
    wbs_clk_i => wbs_clk_i,
    wbs_adr_i => wbs_adr_i,
    wbs_dat_o => wbs_dat_o,
    wbs_dat_i => wbs_dat_i,
    wbs_we_i  => wbs_we_i,
    wbs_stb_i => wbs_stb_i,
    wbs_ack_o => wbs_ack_o,
    wbs_cyc_i => wbs_cyc_i,

    ---------------------------------------------------------------------------
    -- ADNS squals
    adns1_squal_i   => adns1_squal_s,
    adns2_squal_i   => adns2_squal_s,
    adns3_squal_i   => adns3_squal_s,

    ---------------------------------------------------------------------------
    -- common register to the ControlUnit

    fault_i => fault_s,
    auto_enable_o => auto_enable_s,

    ---------------------------------------------------------------------------
    -- interface to the spi (controled by the µc when auto_enable_o is low)

    spi_data_i => wb_data_out_s,
    spi_data_o => wb_data_in_s,
    spi_send_data_o => wb_send_data_s,
    spi_busy_i => wb_busy_s,
    
    spi_cs_o     => wb_adns_cs_s);

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  
  mux: adns9500_mode_mux
  PORT MAP(
    -- control unit interface
    cu_data_in_i        => cu_data_in_s,
    cu_data_out_o       => cu_data_out_s,
    cu_send_data_i      => cu_send_data_s,
    cu_busy_o           => cu_busy_s,

    cu_adns_cs_i        => cu_adns_cs_s,
    
    -- wishbone interface
    wb_data_in_i        => wb_data_in_s,
    wb_data_out_o       => wb_data_out_s,
    wb_send_data_i      => wb_send_data_s,
    wb_busy_o           => wb_busy_s,

    wb_adns_cs_i        => wb_adns_cs_s,

    -- spi interface
    spi_data_in_o       => spi_data_in_s,
    spi_data_out_i      => spi_data_out_s,
    spi_send_data_o     => spi_send_data_s,
    spi_busy_i          => spi_busy_s,

    spi_adns_cs_o       => spi_adns_cs_s,

    ---------------------------------------------------------------------------
    -- signal command

    mode_select_i => auto_enable_s
  );
  
  -----------------------------------------------------------------------------


  cu :  adns9500_controlunit 
  GENERIC MAP(
    fpga_clock_period_c  => 1000000/freq_fpga_c,
    adns_number_c => 3)
  PORT MAP(
    clk_i => wbs_clk_i,
    reset_ni => reset_ns,
    enable_i => auto_enable_s,
    
    spi_datain_o   => cu_data_in_s,
    spi_dataout_i  => cu_data_out_s,
    spi_senddata_o => cu_send_data_s, 
    spi_busy_i     => cu_busy_s,
    
    adns_cs_o => cu_adns_cs_s,
    
    -- first encoder values
    adns1_deltax_o => adns1_deltax_s, 
    adns1_deltay_o => adns1_deltay_s,
    adns1_squal_o  => adns1_squal_s,
    
    -- second encoder values
    adns2_deltax_o => adns2_deltax_s,
    adns2_deltay_o => adns2_deltay_s,
    adns2_squal_o  => adns2_squal_s,
    
    -- third encoder values
    adns3_deltax_o => adns3_deltax_s,
    adns3_deltay_o => adns3_deltay_s,
    adns3_squal_o  => adns3_squal_s,
  
    synchro_i => synchro_s,

    fault_o => fault_s
  );

  adns1_deltax_o <= adns1_deltax_s;
  adns1_deltay_o <= adns1_deltay_s;
  adns1_squal_o <= adns1_squal_s;
  adns2_deltax_o <= adns2_deltax_s;
  adns2_deltay_o <= adns2_deltay_s;
  adns2_squal_o <= adns2_squal_s;
  adns3_deltax_o <= adns3_deltax_s;
  adns3_deltay_o <= adns3_deltay_s;
  adns3_squal_o <= adns3_squal_s;

  synchro_s <= synchro_i;

END adns9500_1;
