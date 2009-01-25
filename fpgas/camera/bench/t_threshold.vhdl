-----------------------------------------------------------------------------
-- Title      : Threshold bloc
-- Project    : Carte camera 2009
-----------------------------------------------------------------------------
-- File       : t_threshold.vhdl
-- Author     : BLANCHARD Remy <remyb718 at gmail dot com>
-- Company    : Rob'Otter
-- Last update: 16/11/2008
-- Platform   : Spartan 3
-----------------------------------------------------------------------------
-- Description: Determine if the input are in or outside the wanted values
--              This bloc uses a block RAM per entry and a "AND" door: the 
--              value must within range for all inputs
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
-- HISTORY :
-- +------------------------------------------------------------------------+
-- | Ver. | Date     | Aut. | Commentaire                                   |
-- +------------------------------------------------------------------------+
-- | 1.00 | 16/11/08 | RBL  | Creation                                      |
-- +------------------------------------------------------------------------+
-- | 1.05 | 18/01/09 | RBL  | Modification of the H's output size           |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
-- +------------------------------------------------------------------------+

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY unisim;
USE unisim.vcomponents.all;

-----------------------------------------------------------------------------
ENTITY t_threshold IS
-----------------------------------------------------------------------------
END t_threshold;

-----------------------------------------------------------------------------
ARCHITECTURE behavior_1 OF t_threshold IS 
-----------------------------------------------------------------------------

    -- Component Declaration for the Unit Under Test
    COMPONENT threshold
    PORT(
        clk_i          : in  std_ulogic;
        -- input to be tested
        Y_i            : in  std_logic_vector(8 downto 0);
        H_i            : in  std_logic_vector(8 downto 0);

        -- threshold modifier (modify bloc RAM inside)
        valid_i        : in  std_ulogic; -- write RAM if active
        value_i        : in  std_logic_vector(15 downto 0);
        -- for adress_i: MSB=1 modify Y Look-Up Table else H LUT
        adress_i       : in  std_logic_vector(9 downto 0); 

        -- vector of all threshold result
        result_o       : out std_logic_vector(15 downto 0) --latched
      );
    END COMPONENT;

    -- signals for connection
    signal clk_s : std_logic;
    signal Y_s : std_logic_vector(8 downto 0);
    signal H_s : std_logic_vector(8 downto 0);

    signal valid_s  : std_ulogic;
    signal value_s  : std_logic_vector(15 downto 0);
    signal adress_s : std_logic_vector(9 downto 0); 
    signal result_s : std_logic_vector(15 downto 0);

    -- timing constant
    constant periode_c : time := 10 ns;     -- 100 MHz

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: threshold PORT MAP(
      clk_i => clk_s,
      Y_i => Y_s,
      H_i => H_s,
      valid_i => valid_s,
      value_i => value_s,
      adress_i => adress_s,
      result_o => result_s
    );

    -- input: clock
    clock_p : PROCESS
    BEGIN
        clk_s <= '1', '0' after periode_c/2;
        wait for periode_c;
    end process clock_p;

    -- input: R
    main_p : PROCESS
    begin
      -- first step: filling the RAMs
      -- don't care about the video signals 
      -- avoid port A & B adress match:
      -- A read was performed on address 000 (hex) of port A while a write
      -- was requested to the same address on Port B  The write will be
      -- successful however the read value is unknown until the next CLKA
      -- cycle
      Y_s<="111111111";
      H_s<="111111111";
      -- writting in the H buffer
      valid_s<='0';
      value_s<="1111111111111111";
      adress_s<="0000000000";
      wait for 2*periode_c;
      valid_s<='1';
      wait for 2*periode_c;
      valid_s<='0';
      wait for 2*periode_c;
      value_s<="0000000000000000";
      adress_s<="0000000001";
      wait for 2*periode_c;
      valid_s<='1';
      wait for 2*periode_c;
      valid_s<='0';
      wait for 2*periode_c;
      -- writting in the Y buffer
      value_s<="1010101010101010";
      adress_s<="1000000000";
      wait for 2*periode_c;
      valid_s<='1';
      wait for 2*periode_c;
      valid_s<='0';
      wait for 2*periode_c;
      value_s<="0101010101010101";
      adress_s<="1000000001";
      wait for 2*periode_c;
      valid_s<='1';
      wait for 2*periode_c;
      valid_s<='0';
      wait for 10*periode_c;
      -- second step: tested the filled RAMs
      value_s<="0000000000000000";
      adress_s<="0000000000";
      Y_s<="000000000";
      H_s<="000000000";
      wait for 2*periode_c;
      Y_s<="000000000";
      H_s<="000000001";
      wait for 2*periode_c;
      Y_s<="000000001";
      H_s<="000000001";
      wait for 2*periode_c;
      Y_s<="000000001";
      H_s<="000000000";
      wait for 10*periode_c;
    end process main_p;

END;

