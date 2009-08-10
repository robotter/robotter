-----------------------------------------------------------------------------
-- Title    : I2C communication 
-- Project  : UNIOC_NG FPGA level strategic communication
-----------------------------------------------------------------------------
-- File     : stratcomm_i2cslave.vhd
-- Author   : JD (jd@robotter.fr)
-- Company  : Rob'Otter
-- 
-- Creation date : 01/08/2009
-- Platform : Altera Cyclone II
-----------------------------------------------------------------------------
-- Description : i2c communication entity for strategic communication
-- This entity shall:
-- * provide a slave interface for i2c bus like a DS1339 chip
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

---------------------------------------------------------------------------
entity stratcomm_i2cslave is 
---------------------------------------------------------------------------
generic (
  ---------- FPGA ---------------------------------------------------------
  -- FPGA clock period in ns
  fpga_clock_period_c : natural := 20;

  ---------- I2C ----------------------------------------------------------
  -- entity i2c slave address
  i2c_self_address_c : std_logic_vector(6 downto 0) := "0010001"
  
);
port (
  -- FPGA signals
  clk_i : in std_logic;
  reset_ni : in std_logic;

  -- i2c signals
  i2c_scl_i : in std_logic;
  i2c_sda_io : inout std_logic;

  -- array addressing signals
  subaddress_o : out std_logic_vector(7 downto 0);
  data_in_i : in std_logic_vector(7 downto 0);
  data_out_o : out std_logic_vector(7 downto 0);
  write_o : out std_logic;
  read_i : in std_logic
);
end entity;


---------------------------------------------------------------------------
architecture stratcomm_i2c_1 of stratcomm_i2cslave is
---------------------------------------------------------------------------

signal debug_addr_s : std_logic_vector(6 downto 0);
signal debug_state_s : natural;

signal subaddress_s : std_logic_vector(7 downto 0);

begin
	
  subaddress_o <= subaddress_s;

  -- handle i2c communication
  i2c_p : process(reset_ni, clk_i)
    
    -- iterator used on i2c clock
    variable i2c_addrit_v : natural range 0 to 7;
    -- current received data is subaddress
    variable i2c_issubaddr_v : std_logic;
    -- current i2c address
    variable i2c_address_v : std_logic_vector(6 downto 0);
    -- current i2c data
    variable i2c_data_v : std_logic_vector(7 downto 0);
    -- current i2c state 
    variable i2c_state_v : natural range 0 to 10;
    -- i2c communication R/W bit
    -- '0' for write / '1' for read
    variable i2c_rw_bit : std_logic;
    -- previous sda value
    variable i2c_psda_v : std_logic;
    -- previous scl value
    variable i2c_pscl_v : std_logic;
  begin

    if reset_ni = '0' then
      -- on reset 
      i2c_sda_io <= 'Z';
      i2c_state_v := 0;
      write_o <= '0';
    else
      if rising_edge(clk_i) then
        -- on clock rising edge
        
        -- XXX DEBUG
        debug_addr_s <= i2c_address_v;
        debug_state_s <= i2c_state_v;
        --- DEBUG XXX

        -------------------------------------
        -- state 0 : Initial state
        if i2c_state_v = 0 then

          -- START condition
          if i2c_psda_v = '1' and i2c_sda_io = '0' and i2c_scl_i = '1' then
            i2c_state_v := 1;
            i2c_address_v := "0000000";
            i2c_addrit_v := 6;
          end if;

        -------------------------------------
        -- state 1 : START condition received, waiting for address
        elsif i2c_state_v = 1 then
          
          -- SCL rising edge
          if i2c_pscl_v = '0' and i2c_scl_i = '1' then
            
            -- sample address data on SCL r_e
            i2c_address_v(i2c_addrit_v) := i2c_sda_io;

            if i2c_addrit_v = 0 then
              
              -- i2c address received, checking if self address
              if i2c_address_v = i2c_self_address_c then
                -- OK, reading R/W bit
                i2c_state_v := 2;
                -- next data will be the subaddress
                i2c_issubaddr_v := '1';
              else
                -- KO, wait for START condition
                i2c_state_v := 0;
              end if;

            else
              i2c_addrit_v := i2c_addrit_v - 1;
            end if;

          end if; -- SCL rising edge

        -------------------------------------
        -- state 2 : 7-bits address received, waiting for R/W bit
        elsif i2c_state_v = 2 then
          
          -- SCL rising edge
          if i2c_pscl_v = '0' and i2c_scl_i = '1' then
            -- sample R/W bit
            i2c_rw_bit := i2c_sda_io;
            i2c_state_v := i2c_state_v + 1;
          end if; -- SCL r_e
        
        -------------------------------------
        -- state 3 : waiting for SCL low to generate ACK (pull SDA low)
        elsif i2c_state_v = 3 then

          if i2c_scl_i = '0' then
            i2c_sda_io <= '0';
            i2c_state_v := i2c_state_v + 1;
          end if;

        -------------------------------------
        -- state 4 : waiting for SCL falling edge to give line back to master
        elsif i2c_state_v = 4 then
          
          if i2c_pscl_v = '1' and i2c_scl_i = '0' then
            i2c_sda_io <= 'Z';
            i2c_addrit_v := 7;
            if i2c_rw_bit = '0' then
              -- write
              i2c_state_v := 5;
            else
              -- read
              i2c_state_v := 7;
            end if;
          end if; -- scl falling edge

        -------------------------------------
        -- state 5 : write communication, waiting for data from master
        elsif i2c_state_v = 5 then
        
          -- SCL rising edge
          if i2c_pscl_v = '0' and i2c_scl_i = '1' then 
            i2c_data_v(i2c_addrit_v) := i2c_sda_io;
            
            if i2c_addrit_v = 0 then
              -- all data sampled
              
              if i2c_issubaddr_v = '1' then
                -- data is a subaddress
                subaddress_s <= i2c_data_v;
                i2c_issubaddr_v := '0';
                i2c_state_v := 3;
              else
                data_out_o <= i2c_data_v;
                write_o <= '0';
                i2c_state_v := i2c_state_v + 1;
              end if;

            else
              i2c_addrit_v := i2c_addrit_v - 1;
            end if;
          end if; -- SCL r_e

        -------------------------------------
        -- state 6 : data received perform write to array
        elsif i2c_state_v = 6 then 

          -- generate write r_e to sample data
          write_o <= '1';
          subaddress_s <= std_logic_vector(to_unsigned(
                            to_integer(unsigned(subaddress_s)) + 1
                            ,8));
          -- go to generate ACK state
          i2c_state_v := 3;

        -------------------------------------
        -- state 7 : increment subaddress
        elsif i2c_state_v = 6 then 


        end if; -- state machine
        
        -- update previous sda & scl values
        i2c_psda_v := i2c_sda_io;
        i2c_pscl_v := i2c_scl_i;

      end if; -- r_e(clk_i)
    end if; -- reset_ni = '0'

  end process i2c_p;

end architecture stratcomm_i2c_1;

