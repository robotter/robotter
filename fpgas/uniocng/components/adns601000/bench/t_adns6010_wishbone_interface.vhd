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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.p_wishbone_testbench.ALL;

ENTITY t_adns6010_wishbone_interface IS
  GENERIC(
    CONSTANT clk_period_c : IN time := 37 ns;
    CONSTANT update_data_period_c : IN time:= 49 ns;
    CONSTANT wb_size_c : natural := 8;           -- data port size
    CONSTANT adns_size_c : natural RANGE 8 TO 32:= 32;        -- data sensor port size
    CONSTANT squal_size_c : natural RANGE 8 TO 32:= 8  -- squal port size
  );
  PORT (

    adns1_lock_o : OUT std_logic;
    adns2_lock_o : OUT std_logic;
    adns3_lock_o : OUT std_logic;
    auto_enable_o : OUT std_logic;
    spi_data_o : OUT std_logic_vector(7 DOWNTO 0);
    spi_send_data_o : OUT std_logic;
    adns_reset_o : OUT std_logic;
    spi_cs_o : OUT std_logic_vector(1 DOWNTO 0);

    data_read_o : OUT std_logic_vector(7 DOWNTO 0)
    
    );
END t_adns6010_wishbone_interface;



ARCHITECTURE t_adns6010_wishbone_interface_1 OF t_adns6010_wishbone_interface IS


COMPONENT adns6010_wishbone_interface IS
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
    wbs_adr_i : IN std_logic_vector(5 DOWNTO 0);    -- address BUS
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data readden
                                                             -- from bus
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0); -- data write from BUS
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
END COMPONENT;
   
  
  
  SIGNAL clk_s : std_logic := '0';
  SIGNAL rst_ns : std_logic;
  SIGNAL rst_s : std_logic;
  
  SIGNAL wbs_adr_s : std_logic_vector(5 DOWNTO 0);
  SIGNAL wbs_dat_os : std_logic_vector(wb_size_c-1 DOWNTO 0);
  SIGNAL wbs_dat_is : std_logic_vector(wb_size_c-1 DOWNTO 0);
  SIGNAL wbs_we_s : std_logic;
  SIGNAL wbs_stb_s : std_logic;
  SIGNAL wbs_ack_s : std_logic;
  SIGNAL wbs_cyc_s : std_logic;
  SIGNAL adns1_delta_X_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns1_delta_Y_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns1_squal_s : std_logic_vector(squal_size_c-1 DOWNTO 0);
  SIGNAL adns2_delta_X_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns2_delta_Y_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns2_squal_s : std_logic_vector(squal_size_c-1 DOWNTO 0);
  SIGNAL adns3_delta_X_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns3_delta_Y_s : std_logic_vector(adns_size_c-1 DOWNTO 0);
  SIGNAL adns3_squal_s : std_logic_vector(squal_size_c-1 DOWNTO 0);
  SIGNAL fault_s : std_logic_vector(7 DOWNTO 0);
  SIGNAL spi_data_is : std_logic_vector (7 DOWNTO 0);
  SIGNAL spi_busy_s : std_logic;
    
  SIGNAL cpt_size_adns_s : std_logic_vector(adns_size_c-1 DOWNTO 0) := X"12345678";
  
  
BEGIN  

  entity_testee : adns6010_wishbone_interface 
  GENERIC MAP(
    id_c      => 42,
    wb_size_c => 8,     -- data port size
    adns_size_c => 32,        -- data sensor port size
    squal_size_c => 8  -- squal port size
    )

  PORT MAP(
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i => rst_s,
    wbs_clk_i => clk_s,
    wbs_adr_i => wbs_adr_s,
    wbs_dat_o => wbs_dat_os,
    wbs_dat_i => wbs_dat_is,
    wbs_we_i  => wbs_we_s,
    wbs_stb_i => wbs_stb_s,
    wbs_ack_o => wbs_ack_s,
    wbs_cyc_i => wbs_cyc_s,

    ---------------------------------------------------------------------------
    -- interface to the first sensor

    adns1_lock_o => adns1_lock_o,
    adns1_delta_X_i => adns1_delta_X_s,
    adns1_delta_Y_i => adns1_delta_Y_s,
    adns1_squal_i => adns1_squal_s,

    ---------------------------------------------------------------------------
    -- interface to the second sensor

    adns2_lock_o => adns2_lock_o,
    adns2_delta_X_i => adns2_delta_X_s,
    adns2_delta_Y_i => adns2_delta_Y_s,
    adns2_squal_i   => adns2_squal_s,

    ---------------------------------------------------------------------------
    -- interface to the third sensor

    adns3_lock_o => adns3_lock_o,
    adns3_delta_X_i => adns3_delta_X_s,
    adns3_delta_Y_i => adns3_delta_Y_s,
    adns3_squal_i  => adns3_squal_s ,

    ---------------------------------------------------------------------------
    -- common register to the ControlUnit

    fault_i => fault_s,

    auto_enable_o => auto_enable_o,
    
    ---------------------------------------------------------------------------
    -- interface to the spi (controled by the µc when auto_enable_o is low)

    spi_data_i => spi_data_is,
    spi_data_o => spi_data_o,
    spi_send_data_o => spi_send_data_o,
    spi_busy_i => spi_busy_s,
    
    adns_reset_o => adns_reset_o,
    spi_cs_o     => spi_cs_o
    
    );

  -------------------------------------------------------------------------------
  -- reset and clock

  

  clk_p : PROCESS
  BEGIN

    clk_s <= not(clk_s);
    WAIT FOR clk_period_c/2;
  END PROCESS clk_p;

  reset_p : PROCESS
  BEGIN
    rst_ns <= '1';
    WAIT FOR 2 us;
    rst_ns <= '0';
    WAIT FOR 1 us;
    rst_ns <= '1';
    WAIT FOR 1 ms;
    rst_ns <= '0';
    WAIT FOR 1 us;
    rst_ns <= '1';
  END PROCESS reset_p;
  
  rst_s <= not(rst_ns); -- wishbone reset



  -------------------------------------------------------------------------------
  -- modification des donnees lues
  
  update_data_p : PROCESS 
  BEGIN
    WAIT FOR update_data_period_c;
    cpt_size_adns_s <= std_logic_vector(unsigned(cpt_size_adns_s)+1);
  END PROCESS update_data_p;

  adns1_delta_X_s <= cpt_size_adns_s;
  adns1_delta_Y_s <= cpt_size_adns_s;
  adns1_squal_s <= cpt_size_adns_s(squal_size_c-1 DOWNTO 0);

  adns2_delta_X_s <= cpt_size_adns_s;
  adns2_delta_Y_s <= cpt_size_adns_s;
  adns2_squal_s <= cpt_size_adns_s(squal_size_c-1 DOWNTO 0);

  adns3_delta_X_s <= cpt_size_adns_s;
  adns3_delta_Y_s <= cpt_size_adns_s;
  adns3_squal_s <= cpt_size_adns_s(squal_size_c-1 DOWNTO 0);

  fault_s <= cpt_size_adns_s(7 DOWNTO 0);

  spi_data_is <= cpt_size_adns_s(7 DOWNTO 0);
  spi_busy_s <= cpt_size_adns_s(2);

  ------------------------------------------------------------------------------
  -- acces wishbone

  wishbone_p : PROCESS
    VARIABLE cpt_adr_v : integer;
  BEGIN
    WAIT FOR 3 us; 
    FOR cpt_adr_v IN 0 TO 32 LOOP
      wb_read(std_logic_vector(to_unsigned(cpt_adr_v,6)), clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s, data_read_o);
      wb_write( std_logic_vector(to_unsigned(cpt_adr_v,6)), X"55", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
      wb_read(std_logic_vector(to_unsigned(cpt_adr_v,6)), clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s, data_read_o);
      wb_write( std_logic_vector(to_unsigned(cpt_adr_v,6)), X"AA", clk_s, wbs_adr_s, wbs_dat_is, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
      wb_read(std_logic_vector(to_unsigned(cpt_adr_v,6)), clk_s, wbs_adr_s, wbs_dat_os, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s, data_read_o);
      WAIT FOR 500 ns;
    END LOOP;  -- cpt_adr_v
    
    
  END PROCESS wishbone_p;
  
END t_adns6010_wishbone_interface_1;
