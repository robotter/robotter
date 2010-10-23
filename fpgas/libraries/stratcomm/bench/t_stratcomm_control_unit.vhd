-----------------------------------------------------------------------------
-- Title    : Communication Control Unit Testbench
-- Project  : 
-----------------------------------------------------------------------------
-- File     : stratcomm_control_unit_tb.vhd
-- Author   : Lamygalle
-- Company  : Rob'Otter
-- 
-- Creation date : 2009-11-21
-- Platform : 
-----------------------------------------------------------------------------
-- Description : Testbench for the i2c communication control unit 
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
-------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE p_i2c_module_proc IS

  PROCEDURE i2c_read_sequence(
    constant freq_i2c_c : in natural;      -- i2c frequency (in kHz)
    SIGNAL i2c_communicating_so : out std_logic;
    signal i2c_new_transfert_so : out std_logic;
    signal i2c_r_nw_operation_so : out std_logic;
    signal i2c_data_in_si: in std_logic_vector(7 downto 0));


  PROCEDURE i2c_write_sequence(
    constant freq_i2c_c : in natural;      -- i2c frequency (in kHz)
    SIGNAL i2c_communicating_so : out std_logic;
    signal i2c_new_transfert_so : out std_logic;
    signal i2c_r_nw_operation_so : out std_logic;
	signal data_beginning_si : natural;
    signal i2c_data_out_so : out std_logic_vector(7 downto 0));

END p_i2c_module_proc;

PACKAGE BODY p_i2c_module_proc IS

  PROCEDURE i2c_read_sequence(
    constant freq_i2c_c : in natural;      -- i2c frequency (in kHz)
    SIGNAL i2c_communicating_so : out std_logic;
    signal i2c_new_transfert_so : out std_logic;
    signal i2c_r_nw_operation_so : out std_logic;
    signal i2c_data_in_si : in std_logic_vector(7 downto 0))
  is
    variable i2c_period_v : time;
    variable it_v : natural;
  begin
    i2c_new_transfert_so <= '0';
    i2c_period_v := 1000000/freq_i2c_c * 1 ns;
    i2c_communicating_so <= '1';
    i2c_r_nw_operation_so <= '1';
    for it_v in 0 to 14 loop
      i2c_new_transfert_so <= '1', '0' after 20 ns;
      wait for 9 * i2c_period_v;
    end loop;  -- it_v
    i2c_communicating_so <= '0';
	wait for i2c_period_v;
  end i2c_read_sequence;

  PROCEDURE i2c_write_sequence(
    constant freq_i2c_c : in natural;      -- i2c frequency (in kHz)
    SIGNAL i2c_communicating_so : out std_logic;
    signal i2c_new_transfert_so : out std_logic;
    signal i2c_r_nw_operation_so : out std_logic;
	signal data_beginning_si : natural;
    signal i2c_data_out_so : out std_logic_vector(7 downto 0))
  is
    variable i2c_period_v : time;
    variable it_v : natural;
  begin
    i2c_new_transfert_so <= '0';
    i2c_period_v := 1000000/freq_i2c_c * 1 ns;
    i2c_communicating_so <= '1';
    i2c_r_nw_operation_so <= '0';
    for it_v in 0 to 14 loop
      i2c_data_out_so <= std_logic_vector(to_unsigned(it_v+data_beginning_si,8));
      i2c_new_transfert_so <= '1', '0' after 20 ns;
      wait for 9 * i2c_period_v;
    end loop;  -- it_v
	i2c_communicating_so <= '0';
	wait for i2c_period_v;
  end i2c_write_sequence;

  
END p_i2c_module_proc;


-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.p_i2c_module_proc.all;
use work.std_logic_1164_ram.all;

---------------------------------------------------------------------------
entity t_stratcomm_control_unit is 
generic(
      reception_buffer_size_c : natural := 25;
      emission_buffer_size_c  : natural := 25);
---------------------------------------------------------------------------
end t_stratcomm_control_unit;


---------------------------------------------------------------------------
architecture t_stratcomm_control_unit_1 of t_stratcomm_control_unit is
---------------------------------------------------------------------------

  component stratcomm_control_unit
    generic (
      reception_buffer_size_c : natural := 25;
      emission_buffer_size_c  : natural := 17);

    port (
      clk_i    : in std_logic;            -- clock
      reset_ni : in std_logic;            -- reset

      -- whishbone interface
	  i2c_write_in_progress_o : out std_logic;  -- indicates that reception buffer is
                                              -- curently  modified and should not be readden
    reception_buffer_o      : out std_logic_ram_8(reception_buffer_size_c downto 0);
    i2c_read_in_progress_o  : out std_logic;  -- indicates that emission buffer
                                              -- is used and should not be accessed
    emission_buffer_i       : in  std_logic_ram_8(emission_buffer_size_c-1 downto 0);
      -- i2c module
      i2c_data_in_i        : in  std_logic_vector(7 downto 0);  -- data received by i2c module
      i2c_data_out_o       : out std_logic_vector(7 downto 0);  -- data sent by i2c module (read operation)
      i2c_r_nw_operation_i : in  std_logic;  -- indicates if current transfert is a read operation (='1') or write operation (='0')
      i2c_communicating_i  : in  std_logic;  -- indicates if a communication is occuring
      i2c_new_transfert_i  : in  std_logic);  -- indicates that a new data is required on data_out_o or avaliable on data_in_i

  end component;

-- FPGA signals
  signal clk_s : std_logic;
  signal reset_s : std_logic;

-- wishbone interface
  signal i2c_write_in_progress_s : std_logic;        -- indicates that reception buffer is
                                                     -- curently  modified and should not be readden
  signal reception_buffer_s      : std_logic_ram_8(reception_buffer_size_c downto 0);
  signal i2c_read_in_progress_s  : std_logic;  -- indicates that emission buffer
                                               -- is used and should not be accessed
  signal emission_buffer_s       : std_logic_ram_8(emission_buffer_size_c-1 downto 0);

  -- i2c module
  signal i2c_data_in_s           : std_logic_vector(7 downto 0);  -- data received by i2c module
  signal i2c_data_out_s          : std_logic_vector(7 downto 0);  -- data sent by i2c module (read operation)
  signal i2c_r_nw_operation_s    : std_logic;  -- indicates if current transfert is a read operation (='1') or write operation (='0')
  signal i2c_communicating_s     : std_logic;  -- indicates if a communication is occuring
  signal i2c_new_transfert_s     : std_logic;

---------------------------------------------
-- Simulation stuff
  signal endofsimulation_s : boolean := false;

  signal it_s : natural ;
begin

  ------------------------------------------------------------
  -- Component declaration
  ccu0:stratcomm_control_unit
    generic map (
      reception_buffer_size_c => reception_buffer_size_c,
      emission_buffer_size_c => emission_buffer_size_c
      )
    port map (
      clk_i => clk_s,
      reset_ni => reset_s,
      i2c_write_in_progress_o   => i2c_write_in_progress_s,
      reception_buffer_o        => reception_buffer_s,
      i2c_read_in_progress_o    => i2c_read_in_progress_s,
      emission_buffer_i         => emission_buffer_s,
      i2c_data_in_i             => i2c_data_in_s,
      i2c_data_out_o            => i2c_data_out_s,
      i2c_r_nw_operation_i      => i2c_r_nw_operation_s,
      i2c_communicating_i       => i2c_communicating_s,
      i2c_new_transfert_i       => i2c_new_transfert_s
      );    

  ------------------------------------------------------------
  -- Process
  clk_generator_p : process
  begin
    if endofsimulation_s then
      report "1> end of test" severity note;
      wait;
    end if; 

    clk_s <= '1', '0' after 10 ns;
    wait for 20 ns;
  end process clk_generator_p;

  reset_generator_p : process
  begin
    reset_s <= '1';
    wait for 1 us;
    reset_s <= '0', '1' after 1 us;
    wait for 50 us;
    reset_s <= '0', '1' after 1 us;
	
	wait until endofsimulation_s;
	
  end process reset_generator_p;
  

  
  main_p : process
  begin
	
	it_s <= 0;
	
    for i in 1 to 10 loop
      i2c_read_sequence(400, i2c_communicating_s, i2c_new_transfert_s, i2c_r_nw_operation_s, i2c_data_out_s);
      wait for 10 us;
		
      i2c_write_sequence(400, i2c_communicating_s, i2c_new_transfert_s, i2c_r_nw_operation_s, it_s,  i2c_data_in_s);
      it_s <= it_s +1;
      wait for 10 us;
    end loop;

    ----------------------------------
    
    endofsimulation_s <= true;
    report "2> end of test" severity note;

    -- wait forever
    wait;

  end process main_p;

end t_stratcomm_control_unit_1;

