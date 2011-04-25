-----------------------------------------------------------------------------
-- Title    : top level design
-- Project  : UNIOC_NG FPGA level strategic communication
-----------------------------------------------------------------------------
-- File     : top_stratcomm.vhd
-- Author   : JD (jd@robotter.fr)
-- Company  : Rob'Otter
-- 
-- Creation date : 17/01/2010
-- Platform : 
-----------------------------------------------------------------------------
-- Description :
-- 
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.std_logic_1164_ram.all;

---------------------------------------------------------------------------
entity stratcomm is 
---------------------------------------------------------------------------
  generic (
    id           : natural := 7;
    wb_size_c    : natural := 8;           -- data port size
    freq_fpga_c  : natural := 25000;
    reception_buffer_size_c : natural := 20;
    emission_buffer_size_c : natural := 20
    );

  port (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : in  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock
    wbs_adr_i : in std_logic_vector(4 downto 0);    -- address BUS
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);  -- data read from bus
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0); -- data written from bus
    wbs_we_i  : in std_logic;           -- read/write
    wbs_stb_i : in std_logic;           -- validate read/write operation
    wbs_ack_o : out std_logic;           -- operation succesful
    wbs_cyc_i : in std_logic;

    ---------------------------------------------------------------------------
    -- i2c interface
    i2c_scl_i : in std_logic;
    i2c_sda_io : inout std_logic

    );
end entity;


---------------------------------------------------------------------------
architecture stratcomm_1 of stratcomm is
---------------------------------------------------------------------------

  --------------------------------------------------------------------------
  --
  component stratcomm_wishbone is
  generic (
    id_c      : natural;
    wb_size_c : natural := 8; -- data port size
    addr_size_c : natural := 5;
    reception_buffer_size_c : natural := 20;
    emission_buffer_size_c : natural := 20
    );

  port (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : in  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock
    wbs_adr_i : in std_logic_vector(addr_size_c-1 downto 0);    -- address bus
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);  -- data read
                                                             -- from bus
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0); -- data written from bus
    wbs_we_i  : in std_logic;           -- read/write
    wbs_stb_i : in std_logic;           -- validate read/write operation
    wbs_ack_o : out std_logic;           -- operation succesful
    wbs_cyc_i : in std_logic;

    ---------------------------------------------------------------------------
    -- whishbone interface
    i2c_write_in_progress_i : in std_logic;
    reception_buffer_i : in std_logic_ram_8(reception_buffer_size_c downto 0);
    i2c_read_in_progress_i : in std_logic;
    emission_buffer_o : out std_logic_ram_8(emission_buffer_size_c-1 downto 0);
    i2c_self_address_o : out std_logic_vector(6 downto 0)
    );
  end component stratcomm_wishbone;


  --------------------------------------------------------------------------
  --

  component stratcomm_control_unit is
    generic (
      reception_buffer_size_c : natural := 20;
      emission_buffer_size_c  : natural := 20
      );

    port (
      clk_i    : in std_logic;
      reset_ni : in std_logic;
      i2c_write_in_progress_o : out std_logic;
      reception_buffer_o : out std_logic_ram_8(reception_buffer_size_c downto 0);
      i2c_read_in_progress_o : out std_logic;
      emission_buffer_i : in  std_logic_ram_8(emission_buffer_size_c-1 downto 0);
      i2c_data_in_i        : in  std_logic_vector(7 downto 0);
      i2c_data_out_o       : out std_logic_vector(7 downto 0);
      i2c_r_nw_operation_i : in  std_logic;
      i2c_communicating_i  : in  std_logic;
      i2c_new_transfert_i  : in  std_logic
      );

  end component stratcomm_control_unit;



  --------------------------------------------------------------------------
  --
  component stratcomm_i2cslave is
  port (
    clk_i : in std_logic;
    reset_ni : in std_logic;
    i2c_scl_i : in std_logic;
    i2c_sda_io : inout std_logic;
    i2c_self_address_i : in std_logic_vector(6 downto 0);

    data_in_i : in std_logic_vector(7 downto 0);
    data_out_o : out std_logic_vector(7 downto 0);
    i2c_new_transfert_o : out std_logic;
    i2c_communicating_o : out std_logic;
    i2c_r_nw_operation_o : out std_logic
  );
  end component stratcomm_i2cslave;

  --------------------------------------------------------------------------
  --
  signal reset_ns : std_logic;

  signal i2c_write_in_progress_s : std_logic;
  signal i2c_read_in_progress_s : std_logic;
  signal reception_buffer_s : std_logic_ram_8(reception_buffer_size_c downto 0);
  signal emission_buffer_s : std_logic_ram_8(emission_buffer_size_c-1 downto 0);
  
  signal i2c_self_address_s : std_logic_vector(6 downto 0);


  signal i2c_data_in_s : std_logic_vector(7 downto 0);
  signal i2c_data_out_s : std_logic_vector(7 downto 0);
  signal i2c_r_nw_operation_s : std_logic;
  signal i2c_communicating_s : std_logic;
  signal i2c_new_transfert_s : std_logic;

begin -- stratcomm_1

  reset_ns <= not(wbs_rst_i);

  ---------------------------------------------------------------
  wishbone_interface : stratcomm_wishbone
  generic map (
    id_c => id,
    wb_size_c => wb_size_c )
  port map (
    --------------------------
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
    
    i2c_write_in_progress_i => i2c_write_in_progress_s,
    i2c_read_in_progress_i => i2c_read_in_progress_s,
    reception_buffer_i => reception_buffer_s,
    emission_buffer_o => emission_buffer_s,
    
    i2c_self_address_o => i2c_self_address_s
  );

  ---------------------------------------------------------------
  control_unit : stratcomm_control_unit
  port map (
    clk_i => wbs_clk_i,
    reset_ni => reset_ns,

    i2c_write_in_progress_o => i2c_write_in_progress_s,
    i2c_read_in_progress_o =>  i2c_read_in_progress_s,
    reception_buffer_o => reception_buffer_s,
    emission_buffer_i => emission_buffer_s,

    i2c_data_in_i => i2c_data_in_s,
    i2c_data_out_o => i2c_data_out_s,
    i2c_r_nw_operation_i => i2c_r_nw_operation_s,
    i2c_communicating_i => i2c_communicating_s,
    i2c_new_transfert_i => i2c_new_transfert_s
  );
  
  ---------------------------------------------------------------
  i2cslave : stratcomm_i2cslave 
  port map (
    clk_i => wbs_clk_i,
    reset_ni => reset_ns,

    i2c_scl_i => i2c_scl_i,
    i2c_sda_io => i2c_sda_io,

    i2c_self_address_i => i2c_self_address_s,

    data_in_i => i2c_data_out_s,
    data_out_o => i2c_data_in_s,
    
    i2c_new_transfert_o => i2c_new_transfert_s,
    i2c_communicating_o => i2c_communicating_s,
    i2c_r_nw_operation_o => i2c_r_nw_operation_s

  );

 
  

end architecture stratcomm_1;

