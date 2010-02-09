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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity t_stratcomm_i2cslave is
end entity t_stratcomm_i2cslave;

architecture t_stratcomm_i2cslave_1 of t_stratcomm_i2cslave is

  signal endofsimulation_s : boolean := false;

  constant fpga_period_c : time := 20 ns; -- FPGA period

  signal clk_s   : std_logic;
  signal reset_s : std_logic;

	signal i2c_scl_s : std_logic;
	signal i2c_sda_s : std_logic;

  signal i2c_self_address_s : std_logic_vector(6 downto 0);

  signal data_in_s : std_logic_vector(7 downto 0);
  signal data_out_s : std_logic_vector(7 downto 0);
  signal write_s : std_logic;
  signal read_s : std_logic;

  component stratcomm_i2cslave is
    port (
      clk_i   : in  std_logic;
      reset_ni : in  std_logic;

      i2c_scl_i : in std_logic;
      i2c_sda_io : inout std_logic;

      i2c_self_address_i : in std_logic_vector(6 downto 0);

      data_in_i : in std_logic_vector(7 downto 0);
      data_out_o : out std_logic_vector(7 downto 0);
      lock_write_o : out std_logic;
      lock_read_o : out std_logic
    );
  end component stratcomm_i2cslave;

  for stratcomm_i2cslave_0 : stratcomm_i2cslave use entity work.stratcomm_i2cslave;

  procedure i2c_start (
    signal i2c_scl_o : out std_logic;
    signal i2c_sda_io : inout std_logic
  ) is 
  begin
    -- generate START condition
    i2c_scl_o <= '1';
    i2c_sda_io <= '1';
    wait for 2 us;
    i2c_sda_io <= '0';
    wait for 2 us;
  end procedure i2c_start;

  procedure i2c_stop (
    signal i2c_scl_o : out std_logic;
    signal i2c_sda_io : inout std_logic
  ) is 
  begin
    -- generate STOP condition
    i2c_scl_o <= '1';
    i2c_sda_io <= '0';
    wait for 2 us;
    i2c_sda_io <= '1';
    wait for 2 us;
  end procedure i2c_stop;


  procedure i2c_senddata (
    signal i2c_scl_o : out std_logic;
    signal i2c_sda_io : inout std_logic;
    constant i2c_data_c : in std_logic_vector(7 downto 0)
  ) is 
  begin
    -- send address + R/W bit
    for it in 0 to 7 loop
      i2c_scl_o <= '0';
      wait for 1 us;
      i2c_sda_io <= i2c_data_c(7-it);
      wait for 1 us;
      i2c_scl_o <= '1';
      wait for 2 us;
    end loop;
  end procedure i2c_senddata;

  procedure i2c_waitforack (
    signal i2c_scl_o : out std_logic;
    signal i2c_sda_io : inout std_logic
  ) is 
  begin
    i2c_scl_o <= '0';
    i2c_sda_io <= 'Z';
    wait for 2 us;
    -- generate clock hi and sample ACK
    i2c_scl_o <= '1';
    -- check ACK
    assert i2c_sda_io = '0' report "transmission not acknowledged" severity error;
    wait for 2 us;
    i2c_scl_o <= '0';
  end procedure i2c_waitforack;


begin

  stratcomm_i2cslave_0 : stratcomm_i2cslave
  port map (
    clk_i   => clk_s,
    reset_ni => reset_s,
		i2c_scl_i => i2c_scl_s,
		i2c_sda_io => i2c_sda_s,
    i2c_self_address_i => i2c_self_address_s,
    data_in_i => data_in_s,
    data_out_o => data_out_s,
    lock_write_o => write_s,
    lock_read_o => read_s
  );


  stimuli_p : process
    
  begin

    reset_s <= '0';
    wait for 5 us;
    
    i2c_scl_s <= '1';
    i2c_sda_s <= '1';

    i2c_self_address_s <= "0010001"; -- 0x20

    reset_s <= '1';
    wait for 2 us;

    i2c_start(i2c_scl_s, i2c_sda_s);
    i2c_senddata(i2c_scl_s, i2c_sda_s, x"22");
    i2c_stop(i2c_scl_s, i2c_sda_s);

    i2c_start(i2c_scl_s, i2c_sda_s);
    i2c_senddata(i2c_scl_s, i2c_sda_s, x"22");
    i2c_waitforack(i2c_scl_s, i2c_sda_s);
    i2c_senddata(i2c_scl_s, i2c_sda_s, x"01");
    i2c_waitforack(i2c_scl_s, i2c_sda_s);
    i2c_senddata(i2c_scl_s, i2c_sda_s, x"FE");
    i2c_stop(i2c_scl_s, i2c_sda_s);

    wait for 10 us;
    report "end of tests" severity note;
    endofsimulation_s <= true;
    wait;

  end process stimuli_p;


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

end architecture t_stratcomm_i2cslave_1;


