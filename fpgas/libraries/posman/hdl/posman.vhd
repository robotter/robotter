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
--! @file posman.vhd
--! @author JD
--! Top level file for Galipeur position manager
-----------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity posman is
  generic (
    id_c         : natural := 3;
    wb_size_c    : natural := 8;           -- data port size
    adns_size_c  : natural := 16;        -- data sensor port size
    squal_size_c : natural := 8;  -- squal port size
    freq_fpga_c  : natural := 50000
    );

  port (
    ---------------------------------------------------------------------
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

    ---------------------------------------------------------------------
    -- ADNS9500 inputs
    adns1_deltax_i : in signed (15 downto 0);
    adns1_deltay_i : in signed (15 downto 0);
    adns2_deltax_i : in signed (15 downto 0);
    adns2_deltay_i : in signed (15 downto 0);
    adns3_deltax_i : in signed (15 downto 0);
    adns3_deltay_i : in signed (15 downto 0);
    
    -- motors encoders inputs
    motor1_i : in signed (15 downto 0);
    motor2_i : in signed (15 downto 0);
    motor3_i : in signed (15 downto 0);
    
    -- calculus synchronisation
    synchro_o : out std_logic;

    -- XXX debug
    debug_i : in std_logic
  );

end posman;

architecture posman_1 of posman is
  --
  signal clk_s : std_logic;
  signal reset_ns : std_logic;

  --
  constant ram_data_width_c : natural := 16;
  constant matrix_ram_addr_width_c : natural := 8;
  constant results_ram_addr_width_c : natural := 8;

  constant int_size_c : natural := 16;
  constant frac_size_c : natural := 8;

  constant matrices_n_c : natural := 4;

  -----------------------------------
  -- position manager control 
  component posman_control is
  generic (
    freq_fpga_c : natural;
    ram_data_width_c : natural;
    matrix_ram_addr_width_c : natural;
    results_ram_addr_width_c : natural;
    int_size_c : natural;
    matrices_n_c : natural
    );
  port (
    clk_i : std_logic;
    reset_ni : std_logic;

    matrix_ram_addr_o : out natural range 0 to 2**matrix_ram_addr_width_c-1;
    matrix_ram_data_i : in std_logic_vector(ram_data_width_c-1 downto 0);
    results_ram_addr_o : out natural range 0 to 2**results_ram_addr_width_c-1;
    results_ram_data_o : out std_logic_vector(ram_data_width_c-1 downto 0);
    results_ram_we_o : out std_logic;

    start_i : in std_logic;
    done_o : out std_logic;
    synchro_o : out std_logic;
    matrix_valid_o : out std_logic;
    matrix_value_o : out signed(int_size_c-1 downto 0);
    matrix_compute_o : out std_logic;
    matrix_done_i : in std_logic;
    matrix_output0_i, matrix_output1_i, matrix_output2_i : in signed(int_size_c-1 downto 0)
  );
  end component posman_control;

  --
  signal cu_start_s : std_logic;
  signal cu_done_s : std_logic;
  signal cu_synchro_s : std_logic;

  -----------------------------------
  -- dual RAM for matrix
  component dual_port_ram is
  generic 
  (
    DATA_WIDTH : natural;
    ADDR_WIDTH : natural
  );
  port 
  (
    clk		: in std_logic;
    raddr	: in natural range 0 to 2**ADDR_WIDTH - 1;
    waddr	: in natural range 0 to 2**ADDR_WIDTH - 1;
    data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
    we		: in std_logic := '1';
    q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
  );
  end component dual_port_ram;

  --
  signal matrix_ram_raddr_s : natural range 0 to 2**matrix_ram_addr_width_c-1;
  signal matrix_ram_waddr_s : natural range 0 to 2**matrix_ram_addr_width_c-1;
  signal matrix_ram_data_s : std_logic_vector(ram_data_width_c-1 downto 0);
  signal matrix_ram_q_s : std_logic_vector(ram_data_width_c-1 downto 0);
  signal matrix_ram_we_s : std_logic;

  signal results_ram_raddr_s : natural range 0 to 2**results_ram_addr_width_c-1;
  signal results_ram_waddr_s : natural range 0 to 2**results_ram_addr_width_c-1;
  signal results_ram_data_s : std_logic_vector(ram_data_width_c-1 downto 0);
  signal results_ram_q_s : std_logic_vector(ram_data_width_c-1 downto 0);
  signal results_ram_we_s : std_logic;
  ----

  component multiplier93 is
  generic
  (
    int_size_c : natural;
    frac_size_c : natural;
    clk_freq_c : natural
  );
  port (
    clk_i     : in std_logic;
    reset_ni  : in std_logic;
    valid_i : in std_logic;
    element_value_i : in signed(int_size_c-1 downto 0);
    compute_i : in std_logic;
    done_o : out std_logic;
    input0_i, input1_i, input2_i,
    input3_i, input4_i, input5_i,
    input6_i, input7_i, input8_i : in signed(int_size_c-1 downto 0);
    output0_o, output1_o, output2_o : out signed(int_size_c-1 downto 0)
  );
  end component multiplier93;

  --
  signal matrix_valid_s : std_logic;
  signal matrix_element_value_s : signed(int_size_c-1 downto 0);
  signal matrix_compute_s : std_logic;
  signal matrix_done_s : std_logic;
  signal matrix_input0_s : signed(int_size_c-1 downto 0);
  signal matrix_input1_s : signed(int_size_c-1 downto 0);
  signal matrix_input2_s : signed(int_size_c-1 downto 0);
  signal matrix_input3_s : signed(int_size_c-1 downto 0);
  signal matrix_input4_s : signed(int_size_c-1 downto 0);
  signal matrix_input5_s : signed(int_size_c-1 downto 0);
  signal matrix_input6_s : signed(int_size_c-1 downto 0);
  signal matrix_input7_s : signed(int_size_c-1 downto 0);
  signal matrix_input8_s : signed(int_size_c-1 downto 0);
  signal matrix_output0_s : signed(int_size_c-1 downto 0);
  signal matrix_output1_s : signed(int_size_c-1 downto 0);
  signal matrix_output2_s : signed(int_size_c-1 downto 0);
  
  ----

  component posman_wishbone_interface is
  generic (
    id_c : natural;
    wb_size_c : natural := 8;
    matrix_ram_addr_width_c : natural;
    results_ram_addr_width_c : natural;
    ram_data_width_c : natural;
    freq_fpga_c  : natural
    );
  port (
    wbs_rst_i : IN  std_logic;
    wbs_clk_i : IN std_logic;
    wbs_adr_i : IN std_logic_vector(5 DOWNTO 0);
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);
    wbs_dat_i : IN std_logic_vector(wb_size_c-1 DOWNTO 0);
    wbs_we_i  : IN std_logic;
    wbs_stb_i : IN std_logic;
    wbs_ack_o : OUT std_logic;
    wbs_cyc_i : IN std_logic;
    matrix_ram_addr_o : out natural range 0 to 2**matrix_ram_addr_width_c-1;
    matrix_ram_data_o : out std_logic_vector(ram_data_width_c-1 downto 0);
    matrix_ram_we_o : out std_logic;
    results_ram_addr_o : out natural range 0 to 2**results_ram_addr_width_c-1;
    results_ram_data_i : in std_logic_vector(ram_data_width_c-1 downto 0);
    cu_start_o : out std_logic;
    cu_done_i : in std_logic

  );
  end component posman_wishbone_interface;
  
  --
  signal wbs_rst_s : std_logic;
  signal wbs_clk_s : std_logic;
  signal wbs_adr_s : std_logic_vector(5 downto 0);
  signal wbs_dato_s : std_logic_vector(wb_size_c-1 downto 0);
  signal wbs_dati_s : std_logic_vector(wb_size_c-1 downto 0);
  signal wbs_we_s  : std_logic;
  signal wbs_stb_s : std_logic;
  signal wbs_ack_s : std_logic;
  signal wbs_cyc_s : std_logic;

begin
  --
  clk_s <= wbs_clk_i;
  reset_ns <= not(wbs_rst_i);
 
  -- input matrix connections
  matrix_input0_s <= adns1_deltax_i;
  matrix_input1_s <= adns1_deltay_i;
  matrix_input2_s <= adns2_deltax_i;
  matrix_input3_s <= adns2_deltay_i;
  matrix_input4_s <= adns3_deltax_i;
  matrix_input5_s <= adns3_deltay_i;
  matrix_input6_s <= motor1_i;
  matrix_input7_s <= motor2_i;
  matrix_input8_s <= motor3_i;

  -- synchro signals
  synchro_o <= cu_synchro_s;

  -- wishbone interface
  posman_wbi : posman_wishbone_interface
  generic map (
    id_c => id_c,
    wb_size_c => wb_size_c,
    ram_data_width_c => ram_data_width_c,
    matrix_ram_addr_width_c => matrix_ram_addr_width_c,
    freq_fpga_c => freq_fpga_c
    )
  port map (
    wbs_rst_i => wbs_rst_s,
    wbs_clk_i => wbs_clk_s,
    wbs_adr_i => wbs_adr_s,
    wbs_dat_o => wbs_dato_s,
    wbs_dat_i => wbs_dati_s,
    wbs_we_i => wbs_we_s,
    wbs_stb_i => wbs_stb_s,
    wbs_ack_o => wbs_ack_s,
    wbs_cyc_i => wbs_cyc_s,
    matrix_ram_addr_o => matrix_ram_waddr_s,
    matrix_ram_data_o => matrix_ram_data_s,
    matrix_ram_we_o => matrix_ram_we_s,
    results_ram_addr_o => results_ram_raddr_s,
    results_ram_data_i => results_ram_q_s,
    cu_start_o => cu_start_s,
    cu_done_i => cu_done_s

  );
  --
  wbs_rst_s <= wbs_rst_i;
  wbs_clk_s <= wbs_clk_i;
  wbs_adr_s <= wbs_adr_i;
  wbs_dat_o <= wbs_dato_s;
  wbs_dati_s <= wbs_dat_i;
  wbs_we_s <= wbs_we_i;
  wbs_stb_s <= wbs_stb_i;
  wbs_ack_o <= wbs_ack_s;
  wbs_cyc_s <= wbs_cyc_i;

  -- position manager control unit
  posman_cu : posman_control
  generic map (
    freq_fpga_c => freq_fpga_c,
    ram_data_width_c => ram_data_width_c,
    matrix_ram_addr_width_c => matrix_ram_addr_width_c,
    results_ram_addr_width_c => results_ram_addr_width_c,
    int_size_c => int_size_c,
    matrices_n_c => matrices_n_c)
  port map (
    clk_i => clk_s,
    reset_ni => reset_ns,
    matrix_ram_addr_o => matrix_ram_raddr_s,
    matrix_ram_data_i => matrix_ram_q_s,
    results_ram_addr_o => results_ram_waddr_s,
    results_ram_data_o => results_ram_data_s,
    results_ram_we_o => results_ram_we_s,
    start_i => cu_start_s,
    done_o => cu_done_s,
    synchro_o => cu_synchro_s,
    matrix_valid_o => matrix_valid_s,
    matrix_value_o => matrix_element_value_s,
    matrix_compute_o => matrix_compute_s,
    matrix_done_i => matrix_done_s,
    matrix_output0_i => matrix_output0_s,
    matrix_output1_i => matrix_output1_s,
    matrix_output2_i => matrix_output2_s
  );

  -- matrix ram
  matrix_ram : dual_port_ram
  generic map (
    DATA_WIDTH => ram_data_width_c,
    ADDR_WIDTH => matrix_ram_addr_width_c)
  port map (
    clk => clk_s,
    raddr => matrix_ram_raddr_s,
    waddr => matrix_ram_waddr_s,
    data => matrix_ram_data_s,
    we => matrix_ram_we_s,
    q => matrix_ram_q_s
  );
  
  -- result ram
  result_ram : dual_port_ram
  generic map (
    DATA_WIDTH => ram_data_width_c,
    ADDR_WIDTH => results_ram_addr_width_c)
  port map (
    clk => clk_s,
    raddr => results_ram_raddr_s,
    waddr => results_ram_waddr_s,
    data => results_ram_data_s,
    we => results_ram_we_s,
    q => results_ram_q_s);

  -- matrix multiplier
  matrix_multiplier : multiplier93
  generic map (
    int_size_c => int_size_c,
    frac_size_c => frac_size_c,
    clk_freq_c => freq_fpga_c )
  port map (
    clk_i => clk_s,
    reset_ni => reset_ns,
    valid_i => matrix_valid_s,
    element_value_i => matrix_element_value_s,
    compute_i => matrix_compute_s,
    done_o => matrix_done_s,
    input0_i => matrix_input0_s,
    input1_i => matrix_input1_s,
    input2_i => matrix_input2_s,
    input3_i => matrix_input3_s,
    input4_i => matrix_input4_s,
    input5_i => matrix_input5_s,
    input6_i => matrix_input6_s,
    input7_i => matrix_input7_s,
    input8_i => matrix_input8_s,
    output0_o => matrix_output0_s,
    output1_o => matrix_output1_s,
    output2_o => matrix_output2_s
  );
end posman_1;
