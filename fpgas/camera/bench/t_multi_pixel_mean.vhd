-----------------------------------------------------------------------------
-- Title      : Averager bloc test
-- Project    : Carte camera 2009
-----------------------------------------------------------------------------
-- File       : t_multi_pixel_mean.vhdl
-- Author     : BLANCHARD Remy <remyb718 at gmail dot com>
-- Company    : Rob'Otter
-- Last update: 28/01/2008
-- Platform   : Spartan 3
-----------------------------------------------------------------------------
-- Description: the aim of this bloc is to average the incoming H and Y with
-- 9 elements (the center pixel in 8-connexity).
-- 
-- This bloc sum the 9 elements and divide them by 8 (instead of 9), this
-- have to be consider in the next bloc.
-- 
-- This bloc uses a dual access RAM per signal to store the last pixels in
-- order to make a multiline average. This bloc is divided in 2 parts, the
-- first one only records the incoming pixels, the second one average the
-- recorded pixels.
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
-- | 1.00 | 28/01/08 | RBL  | Creation                                      |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
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
ENTITY t_multi_pixel_mean IS
-----------------------------------------------------------------------------
END t_multi_pixel_mean;



-----------------------------------------------------------------------------
ARCHITECTURE behavior_1 OF t_multi_pixel_mean IS 
-----------------------------------------------------------------------------

    -- Component Declaration for the Unit Under Test
    COMPONENT multi_pixel_mean
    PORT(
        clk_i          : in  std_ulogic;
        reset_i        : in  std_ulogic;
		  
		  -- input signals
		  Y_i            : in std_logic_vector(7 downto 0);
		  H_i            : in std_logic_vector(7 downto 0);
		  
        -- camera input (with delay)
        camera_clk_i   : in  std_ulogic; -- new pixel signal
        camera_rst_i   : in  std_ulogic; -- new image signal
		  
        -- average outputs
        mean_Y_o   : out  unsigned(8 downto 0);
        mean_H_o   : out  unsigned(8 downto 0)
      );
    END COMPONENT;

    -- signals for connection
    signal clk_s : std_logic;
    signal reset_s : std_logic;
	 
    signal Y_s : std_logic_vector(7 downto 0);
    signal H_s : std_logic_vector(7 downto 0);

    signal camera_clk_s : std_logic;
    signal camera_rst_s : std_logic;

    signal mean_Y_s  : unsigned(8 downto 0);
    signal mean_H_s  : unsigned(8 downto 0);

    -- timing constant
    constant periode_c : time := 10 ns;     -- 100 MHz
	 constant periode_cc: time := 100 ns;    -- 10 MHz

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: multi_pixel_mean PORT MAP(
      clk_i => clk_s,
		reset_i => reset_s,
      Y_i => Y_s,
      H_i => H_s,
		camera_clk_i => camera_clk_s,
		camera_rst_i => camera_rst_s,
      mean_Y_o => mean_Y_s,
      mean_H_o => mean_H_s
    );

    -- input: clock
    clock_p : PROCESS
    BEGIN
        clk_s <= '1', '0' after periode_c/2;
        wait for periode_c;
    end process clock_p;
	 
	 
    -- input: camera clock
    camera_clock_p : PROCESS
    BEGIN
        camera_clk_s <= '1', '0' after periode_cc/2;
        wait for periode_cc;
    end process camera_clock_p;

    -- input: camera reset
    camera_rst_p : PROCESS
    BEGIN
		  -- (full res. 81672=332*246; test res. (10 lines) 332*10)
        camera_rst_s <= '1', '0' after periode_cc*1660;
        wait for 3320*periode_cc;
    end process camera_rst_p;
	 
    -- input: general reset
    reset_p : PROCESS
    BEGIN
        reset_s <= '1', '0' after periode_c*10;
        wait for 6660*periode_c;
    end process reset_p;

    -- input: Y
    main_Y_p : PROCESS
    begin
      Y_s<="00000000";
      wait for periode_cc;
      Y_s<="00000001";
      wait for periode_cc;
		Y_s<="00000010";
      wait for periode_cc;
		Y_s<="00000100";
      wait for periode_cc;
		Y_s<="00001000";
      wait for periode_cc;
		Y_s<="00010000";
      wait for periode_cc;
		Y_s<="00100000";
      wait for periode_cc;
		Y_s<="01000000";
      wait for periode_cc;
		Y_s<="10000000";
      wait for periode_cc;
		Y_s<="11111111";
      wait for periode_cc;
		Y_s<="11111110";
      wait for periode_cc;
		Y_s<="11111101";
      wait for periode_cc;
		Y_s<="11111011";
      wait for periode_cc;
		Y_s<="11110111";
      wait for periode_cc;
		Y_s<="11101111";
      wait for periode_cc;
		Y_s<="11011111";
      wait for periode_cc;
		Y_s<="10111111";
      wait for periode_cc;
		Y_s<="01111111";
      wait for periode_cc;
		Y_s<="00000000";
      wait for periode_cc;
		Y_s<="10101101";
      wait for periode_cc;
		Y_s<="10011100";
      wait for periode_cc;
		Y_s<="10101010";
      wait for periode_cc;
		Y_s<="00000000";
      wait for periode_cc;
		Y_s<="00000000";
      wait for periode_cc;
    end process main_Y_p;
	 
    -- input: H
    main_H_p : PROCESS
    begin
		H_s<="00001000";
      wait for periode_cc;
		H_s<="00010000";
      wait for periode_cc;
		H_s<="00100000";
      wait for periode_cc;
		H_s<="01000000";
      wait for periode_cc;
		H_s<="10000000";
      wait for periode_cc;
		H_s<="11111111";
      wait for periode_cc;
		H_s<="11111110";
      wait for periode_cc;
		H_s<="11111101";
      wait for periode_cc;
		H_s<="11111011";
      wait for periode_cc;
		H_s<="11110111";
      wait for periode_cc;
		H_s<="11101111";
      wait for periode_cc;
		H_s<="11011111";
      wait for periode_cc;
		H_s<="10111111";
      wait for periode_cc;
		H_s<="01111111";
      wait for periode_cc;
		H_s<="00000000";
      wait for periode_cc;
		H_s<="10101101";
      wait for periode_cc;
		H_s<="10011100";
      wait for periode_cc;
		H_s<="10101010";
      wait for periode_cc;
		H_s<="00000000";
      wait for periode_cc;
      H_s<="00000001";
      wait for periode_cc;
		H_s<="00000010";
      wait for periode_cc;
		H_s<="00000100";
      wait for periode_cc;
    end process main_H_p;
END;

