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
    adns_size_c  : natural RANGE 8 TO 32:= 32;        -- data sensor port size
    squal_size_c : natural RANGE 8 TO 32:= 8;  -- squal port size
    freq_fpga_c  : natural := 25000
    );

  PORT (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : IN  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : IN std_logic;           -- clock
    wbs_adr_i : IN std_logic_vector(5 DOWNTO 0);    -- address BUS
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data read from bus
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0); -- data written from bus
    wbs_we_i  : IN std_logic;           -- read/write
    wbs_stb_i : IN std_logic;           -- validate read/write operation
    wbs_ack_o : OUT std_logic;           -- operation succesful
    wbs_cyc_i : IN std_logic;


    ---------------------------------------------------------------------------
    -- spi
    mosi_o : OUT std_logic;
    miso_i : IN    std_logic;
    sck_o  : OUT  std_logic;
    cs1_no : OUT  std_logic;
    cs2_no : OUT  std_logic;
    cs3_no : OUT  std_logic;

    adns_reset_o : OUT std_logic
    );

END adns9500;


ARCHITECTURE adns9500_1 OF adns9500 IS

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  COMPONENT adns9500_spi IS
  GENERIC (
    spi_freq_c : natural :=  100; -- SPI clock frequency in kHz
    clk_freq_c : natural := 25000  -- FPGA clock frequency in kHz
  );
  PORT (
    clk_i     : IN std_logic;
    reset_ni  : IN  std_logic;

    --! @name SPI signals
    --!@{
    mosi_o : OUT std_logic;
    miso_i : IN  std_logic;
    sck_o  : OUT std_logic;
    cs1_no : OUT std_logic;
    cs2_no : OUT std_logic;
    cs3_no : OUT std_logic;
    --!@}

    --! @name Control unit port
    --!@{
    data_in_i   : IN  std_logic_vector(7 DOWNTO 0); --! sent byte
    data_out_o  : OUT std_logic_vector(7 DOWNTO 0); --! received byte
    send_data_i : IN  std_logic; --! transfer data on rising edges
    busy_o      : OUT  std_logic; --! '1' if SPI is transfering data
    --!@}

    --! Muxed Chip Select
    cs_i        : IN std_logic_vector(1 DOWNTO 0)
  );
  END COMPONENT adns9500_spi;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  COMPONENT adns9500_latch_nbits IS  
  GENERIC (
    CONSTANT data_width_c : natural RANGE 0 TO 127 := 32;  -- width of the data bus latched
    CONSTANT squal_width_c : natural := 8 -- width of the squal bus latched
    ); 
  PORT (
    clk_i            : IN  std_logic;
    reset_ni         : IN  std_logic;
    deltax_i         : IN  std_logic_vector(data_width_c-1 DOWNTO 0);  -- data to be latched
    deltay_i         : IN  std_logic_vector(data_width_c-1 DOWNTO 0);  -- data to be latched
    squal_i          : IN  std_logic_vector(squal_width_c-1 DOWNTO 0);  -- data to be latched
    deltax_latched_o : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data latched
    deltay_latched_o : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data latched
    squal_latched_o  : OUT std_logic_vector(squal_width_c-1 DOWNTO 0);  -- data latched
    latch_data_i     : IN  std_logic);  -- latches data_i while it is active (i.e. '1')
  END COMPONENT adns9500_latch_nbits;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  COMPONENT adns9500_wishbone_interface IS
  GENERIC (
    id_c      : natural := 2;
    wb_size_c : natural := 8;           -- data port size
    adns_size_c : natural RANGE 8 TO 32:= 32;        -- data sensor port size
    squal_size_c : natural RANGE 8 TO 32:= 8  -- squal port size
    );

  PORT (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : IN  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : IN std_logic;           -- clock
    wbs_adr_i : IN std_logic_vector(5 DOWNTO 0);    -- address bus
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data read
                                                             -- from bus
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0); -- data written from bus
    wbs_we_i  : IN std_logic;           -- read/write
    wbs_stb_i : IN std_logic;           -- validate read/write operation
    wbs_ack_o : OUT std_logic;           -- operation succesful
    wbs_cyc_i : IN std_logic;

    ---------------------------------------------------------------------------
    -- interface to the first sensor

    adns1_lock_o : OUT std_logic;
    adns1_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns1_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns1_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- interface to the second sensor

    adns2_lock_o : OUT std_logic;
    adns2_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns2_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns2_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- interface to the third sensor

    adns3_lock_o : OUT std_logic;
    adns3_delta_X_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns3_delta_Y_i : IN std_logic_vector(adns_size_c-1 DOWNTO 0);
    adns3_squal_i   : IN std_logic_vector(squal_size_c-1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- common register to the ControlUnit

    fault_i : IN std_logic_vector(7 DOWNTO 0);

    auto_enable_o : OUT std_logic;      --enable the control Unit (active High)

    
    -- debug
    cs_number_i : in std_logic_vector(7 downto 0);

    ---------------------------------------------------------------------------
    -- interface to the spi (controled by the µc when auto_enable_o is low)

    spi_data_i : IN std_logic_vector(7 DOWNTO 0);  -- data received by the spi
    spi_data_o : OUT std_logic_vector(7 DOWNTO 0);  -- data to be sent by the spi
    spi_send_data_o : OUT std_logic;    -- send spi_data_o (active high)
    spi_busy_i : IN std_logic;          -- spi transmitting (active high)
    
    adns_reset_o : OUT std_logic;       -- reset of the 3 sensors
    spi_cs_o     : OUT std_logic_vector(1 DOWNTO 0)  -- selection of the slave
                                                     -- addressed by the spi
    );
  END COMPONENT adns9500_wishbone_interface;


  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  
  COMPONENT adns9500_mode_mux IS
  PORT (
    ---------------------------------------------------------------------------
    -- control unit interface
    cu_data_in_i        : IN std_logic_vector(7 DOWNTO 0);
    cu_data_out_o       : OUT std_logic_vector(7 DOWNTO 0);
    cu_send_data_i      : IN std_logic;
    cu_busy_o           : OUT std_logic;

    cu_adns_cs_i        : IN std_logic_vector(1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- wishbone interface
    wb_data_in_i        : IN std_logic_vector(7 DOWNTO 0);
    wb_data_out_o       : OUT std_logic_vector(7 DOWNTO 0);
    wb_send_data_i      : IN std_logic;
    wb_busy_o           : OUT std_logic;

    wb_adns_cs_i        : IN std_logic_vector(1 DOWNTO 0);


    ---------------------------------------------------------------------------
    -- spi interface
    spi_data_in_o       : OUT std_logic_vector(7 DOWNTO 0);
    spi_data_out_i      : IN std_logic_vector(7 DOWNTO 0);
    spi_send_data_o     : OUT std_logic;
    spi_busy_i          : IN std_logic;

    spi_adns_cs_o       : OUT std_logic_vector(1 DOWNTO 0);

    ---------------------------------------------------------------------------
    -- signal command

    mode_select_i : IN std_logic
    
  );

  END COMPONENT adns9500_mode_mux;


  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  COMPONENT adns9500_controlunit IS 
  ---------------------------------------------------------------------------
  GENERIC (
    ---------- FPGA ---------------------------------------------------------
    -- FPGA clock period in ns
    fpga_clock_period_c : natural := 20;

    ---------- REGISTERS ----------------------------------------------------
    -- register Motion_Burst address
    addr_register_motion_burst_c : std_logic_vector(7 DOWNTO 0) := x"50";

    -- motion bit in motion register
    bit_motion_register_motion_c : natural := 7;
    
    -- fault bit in motion register
    bit_fault_register_motion_c : natural := 1;

    --
    -- Motion register / fault offset in fault output
    fault_offset_c : natural := 0;

    ---------- TIMINGS in ns ------------------------------------------------
    -- timing ratio
    timing_ratio_c : natural := 1;

    -- timing between NCS falling edge to first SCK rising edge
    timing_ncs_sck_c : natural := 120;

    -- timing between SCK falling edge to next SCK rising edge
    -- after a read address and motion data
    timing_srad_mot_c : natural := 75000;

    ---------- PHYSICAL PARAMETERS ------------------------------------------
    -- number of ADNS9500 chips
    adns_number_c : natural := 3
  );

  -------------------------------------------------------------------------
  PORT 
  (
    -- FPGA signals
    clk_i : IN  std_logic;
    reset_ni : IN  std_logic;

    ----------------------------------------------------------
    -- Enable signal activate component on high state
    enable_i : IN  std_logic;

    ----------------------------------------------------------
    -- SPI port
    spi_datain_o   : OUT  std_logic_vector (7 DOWNTO 0);
    spi_dataout_i  : IN  std_logic_vector (7 DOWNTO 0);
    spi_senddata_o : OUT  std_logic;
    spi_busy_i     : IN  std_logic;

    ----------------------------------------------------------
    -- CS ADNS selection
    adns_cs_o : OUT std_logic_vector (1 DOWNTO 0);

    ----------------------------------------------------------
    -- first encoder values
    adns1_deltax_o : OUT std_logic_vector (31 DOWNTO 0);
    adns1_deltay_o : OUT std_logic_vector (31 DOWNTO 0);
    adns1_squal_o  : OUT std_logic_vector (7 DOWNTO 0);

    -- second encoder values
    adns2_deltax_o : OUT std_logic_vector (31 DOWNTO 0);
    adns2_deltay_o : OUT std_logic_vector (31 downto 0);
    adns2_squal_o  : OUT std_logic_vector (7 downto 0);

    -- third encoder values
    adns3_deltax_o : OUT std_logic_vector (31 DOWNTO 0);
    adns3_deltay_o : OUT std_logic_vector (31 DOWNTO 0);
    adns3_squal_o  : OUT std_logic_vector (7 DOWNTO 0);

    -----------------------------------------------------------
    -- fault
    -- 7 :              3 : 
    -- 6 :              2 : ADNS #3 Fault
    -- 5 :              1 : ADNS #2 Fault
    -- 4 :              0 : ADNS #1 Fault
    fault_o : OUT std_logic_vector (7 DOWNTO 0)

  );
  END COMPONENT adns9500_controlunit;


  -------------------------------------------------------------------------
  -- interface to the first sensor

  SIGNAL adns1_lock_s : std_logic;

  SIGNAL adns1_delta_X_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns1_delta_Y_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns1_squal_s   : std_logic_vector(squal_size_c-1 DOWNTO 0);

  SIGNAL adns1_delta_X_latched_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns1_delta_Y_latched_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns1_squal_latched_s   : std_logic_vector(squal_size_c-1 DOWNTO 0);
  ---------------------------------------------------------------------------
  -- interface to the second sensor

  SIGNAL adns2_lock_s : std_logic;
  SIGNAL adns2_delta_X_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns2_delta_Y_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns2_squal_s   : std_logic_vector(squal_size_c-1 DOWNTO 0);

  SIGNAL adns2_delta_X_latched_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns2_delta_Y_latched_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns2_squal_latched_s   : std_logic_vector(squal_size_c-1 DOWNTO 0);
  ---------------------------------------------------------------------------
  -- interface to the third sensor

  SIGNAL adns3_lock_s : std_logic;
  SIGNAL adns3_delta_X_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns3_delta_Y_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns3_squal_s   : std_logic_vector(squal_size_c-1 DOWNTO 0);

  SIGNAL adns3_delta_X_latched_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns3_delta_Y_latched_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns3_squal_latched_s   : std_logic_vector(squal_size_c-1 DOWNTO 0);
  ---------------------------------------------------------------------------
  -- common register to the ControlUnit

  SIGNAL fault_s : std_logic_vector(7 DOWNTO 0);

  SIGNAL auto_enable_s : std_logic;      --enable the control Unit (active High)

  ---------------------------------------------------------------------------
  -- control unit interface
  SIGNAL cu_data_in_s        : std_logic_vector(7 DOWNTO 0);
  SIGNAL cu_data_out_s       : std_logic_vector(7 DOWNTO 0);
  SIGNAL cu_send_data_s      : std_logic;
  SIGNAL cu_busy_s           : std_logic;

  SIGNAL cu_adns_cs_s        : std_logic_vector(1 DOWNTO 0);

  -- wishbone interface
  SIGNAL wb_data_in_s        : std_logic_vector(7 DOWNTO 0);
  SIGNAL wb_data_out_s       : std_logic_vector(7 DOWNTO 0);
  SIGNAL wb_send_data_s      : std_logic;
  SIGNAL wb_busy_s           : std_logic;

  SIGNAL wb_adns_cs_s        : std_logic_vector(1 DOWNTO 0);


  ---------------------------------------------------------------------------
  -- spi interface
  SIGNAL spi_data_in_s       : std_logic_vector(7 DOWNTO 0);
  SIGNAL spi_data_out_s      : std_logic_vector(7 DOWNTO 0);
  SIGNAL spi_send_data_s     : std_logic;
  SIGNAL spi_busy_s          : std_logic;

  SIGNAL spi_adns_cs_s       : std_logic_vector(1 DOWNTO 0);
  signal cs1_ns : std_logic;
-------------------------------------------------------------------------------
  -- debug
  signal cs_number_s : std_logic_vector(7 downto 0);

  
  ---------------------------------------------------------------------------
  -- signal command

  SIGNAL mode_select_s : std_logic;


  SIGNAL reset_ns : std_logic;
  -------------------------------------------------------------------------
  -------------------------------------------------------------------------

BEGIN  -- adns9500_1

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
    cs1_no => cs1_ns,
    cs2_no => cs2_no,
    cs3_no => cs3_no,
    
    data_in_i   => spi_data_in_s,
    data_out_o  => spi_data_out_s,
    send_data_i => spi_send_data_s,
    busy_o      => spi_busy_s,
    cs_i        => spi_adns_cs_s);
  
cs1_no <= cs1_ns;

process(wbs_clk_i)
  variable cs1_buf_v : std_logic_vector(3 downto 0);
  begin
    if rising_edge(wbs_clk_i) then
      if cs1_buf_v = "0000" then
        --cs1_no <= '0';
      elsif cs1_buf_v = "1111" then
        --cs1_no <= '1';
      end if;
      cs1_buf_v := cs1_buf_v(2 downto 0) & cs1_ns;
    end if;
  end process;

process(cs1_ns, reset_ns)
  variable cs_number_v : natural range 0 to 255;
  variable v_last_cs1_no : std_logic;
  begin
  if reset_ns = '0' then
    cs_number_v := 0;
    
  elsif rising_edge(cs1_ns) then
    --if v_last_cs1_no = '0' and cs1_ns= '1' then

      cs_number_v := cs_number_v +1;
    --end if;
    cs_number_s <= std_logic_vector(to_unsigned(cs_number_v, 8));
    --v_last_cs1_no := cs1_ns;
  end if;  
end process;
  

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  
  adns1_latch :  adns9500_latch_nbits
  GENERIC MAP(
    data_width_c => 32,  -- width of the data bus latched
    squal_width_c => 8)  -- width of the squal bus latched
  PORT MAP(
    clk_i            => wbs_clk_i,
    reset_ni         => reset_ns,
    deltax_i         => adns1_delta_X_s,
    deltay_i         => adns1_delta_Y_s,
    squal_i          => adns1_squal_s,
    deltax_latched_o => adns1_delta_X_latched_s,
    deltay_latched_o => adns1_delta_Y_latched_s,
    squal_latched_o  => adns1_squal_latched_s,
    latch_data_i     => adns1_lock_s);


  adns2_latch :  adns9500_latch_nbits
  GENERIC MAP(
    data_width_c => 32,  -- width of the data bus latched
    squal_width_c => 8)  -- width of the squal bus latched
  PORT MAP(
    clk_i            => wbs_clk_i,
    reset_ni         => reset_ns,
    deltax_i         => adns2_delta_X_s,
    deltay_i         => adns2_delta_Y_s,
    squal_i          => adns2_squal_s,
    deltax_latched_o => adns2_delta_X_latched_s,
    deltay_latched_o => adns2_delta_Y_latched_s,
    squal_latched_o  => adns2_squal_latched_s,
    latch_data_i     => adns2_lock_s);

  
  adns3_latch :  adns9500_latch_nbits
  GENERIC MAP(
    data_width_c => 32,  -- width of the data bus latched
    squal_width_c => 8)  -- width of the squal bus latched
  PORT MAP(
    clk_i            => wbs_clk_i,
    reset_ni         => reset_ns,
    deltax_i         => adns3_delta_X_s,
    deltay_i         => adns3_delta_Y_s,
    squal_i          => adns3_squal_s,
    deltax_latched_o => adns3_delta_X_latched_s,
    deltay_latched_o => adns3_delta_Y_latched_s,
    squal_latched_o  => adns3_squal_latched_s,
    latch_data_i     => adns3_lock_s);
  
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
    -- interface to the first sensor

    adns1_lock_o => adns1_lock_s,
    adns1_delta_X_i => adns1_delta_X_latched_s,
    adns1_delta_Y_i => adns1_delta_Y_latched_s,
    adns1_squal_i   => adns1_squal_latched_s,

    ---------------------------------------------------------------------------
    -- interface to the second sensor

    adns2_lock_o => adns2_lock_s,
    adns2_delta_X_i => adns2_delta_X_latched_s,
    adns2_delta_Y_i => adns2_delta_Y_latched_s,
    adns2_squal_i   => adns2_squal_latched_s,

    ---------------------------------------------------------------------------
    -- interface to the third sensor

    adns3_lock_o => adns3_lock_s,
    adns3_delta_X_i => adns3_delta_X_latched_s,
    adns3_delta_Y_i => adns3_delta_Y_latched_s,
    adns3_squal_i   => adns3_squal_latched_s,

    ---------------------------------------------------------------------------
    -- common register to the ControlUnit

    fault_i => fault_s,

    auto_enable_o => auto_enable_s,

    cs_number_i => cs_number_s,
    ---------------------------------------------------------------------------
    -- interface to the spi (controled by the µc when auto_enable_o is low)

    spi_data_i => wb_data_out_s,
    spi_data_o => wb_data_in_s,
    spi_send_data_o => wb_send_data_s,
    spi_busy_i => wb_busy_s,
    
    adns_reset_o => adns_reset_o,
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
    addr_register_motion_burst_c => x"50",
    bit_motion_register_motion_c => 7,
    bit_fault_register_motion_c => 6,
    fault_offset_c => 0,
    timing_ratio_c => 1,
    timing_ncs_sck_c => 120,
    timing_srad_mot_c => 100000,
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
    adns1_deltax_o => adns1_delta_X_s, 
    adns1_deltay_o => adns1_delta_Y_s,
    adns1_squal_o  => adns1_squal_s,
    
    -- second encoder values
    adns2_deltax_o => adns2_delta_X_s,
    adns2_deltay_o => adns2_delta_Y_s,
    adns2_squal_o  => adns2_squal_s,
    
    -- third encoder values
    adns3_deltax_o => adns3_delta_X_s,
    adns3_deltay_o => adns3_delta_Y_s,
    adns3_squal_o  => adns3_squal_s,
    fault_o => fault_s);

  
END adns9500_1;
