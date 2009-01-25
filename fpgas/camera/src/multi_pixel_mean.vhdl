-----------------------------------------------------------------------------
-- Title      : Pixel averager
-- Project    : Carte camera 2009
-----------------------------------------------------------------------------
-- File       : averager.vhdl
-- Author     : BLANCHARD Remy <remyb718 at gmail dot com>
-- Company    : Rob'Otter
-- Last update: 14/12/2008
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
-- | 1.00 | 14/12/08 | RBL  | Creation                                      |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
-- +------------------------------------------------------------------------+

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

-----------------------------------------------------------------------
entity multi_pixel_mean is
-----------------------------------------------------------------------
    port (
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
end multi_pixel_mean;

-----------------------------------------------------------------------
architecture multi_pixel_mean_1 of multi_pixel_mean is
-----------------------------------------------------------------------

	 -- signal for the first part

	 --signal for detecting rising edges of clk_camera_i
	 signal last_clk_camera_s: std_ulogic;
	 
	 -- the position of the element in the RAM
    signal write_element_pos_s: unsigned (10 downto 0);
	 signal write_element_pos_bit_vec_s: std_logic_vector(10 downto 0); -- for the RAM
	 
	 -- the signal to say that the pixel must be written un RAM
	 signal valid_ram_pos_s: std_ulogic;
	 
	 
	 -- signals for the second part

    -- constants for the state machine to locate stored pixels (pixel...)
    CONSTANT ELEM_POS_TL: unsigned := "10100110010"; -- top left (n-1330)
    CONSTANT ELEM_POS_TC: unsigned := "10100110001"; -- top center (n-1329)
    CONSTANT ELEM_POS_TR: unsigned := "10100110000"; -- top right (n-1328)
    CONSTANT ELEM_POS_CL: unsigned := "01010011010"; -- center left (n-666)
    CONSTANT ELEM_POS_CC: unsigned := "01010011001"; -- center center (n-665)
    CONSTANT ELEM_POS_CR: unsigned := "01010011000"; -- center right (n-664)
    CONSTANT ELEM_POS_BL: unsigned := "00000000010"; -- bottom left (n-2)
    CONSTANT ELEM_POS_BC: unsigned := "00000000001"; -- bottom center (n-1)
    CONSTANT ELEM_POS_BR: unsigned := "00000000000"; -- bottom right (n-0)
--
--    -- elem
--	 signal ram_pos_s: unsigned (10 downto 0);
--	 
--    -- position of the reference point
--    signal pos_ref: unsigned(11 downto 0);
--	 
--
--	 
--	 -- signal to determine if the state machine is in an active state
--	 signal est_actif: std_ulogic;
--
--	 -- 
--    type sweep_pixel is (init, pix_tl, pix_tc, pix_tr, pix_cl, pix_cc, pix_cr, 
--      pix_bl, pix_bc, pix_br, w_state);
--    signal current_pixel, next_pixel: sweep_pixel;
	
begin

	 -- first part: writting the incoming elements in both RAM
	 
	 -- position to write in the RAM
    incomming_RAM_position_p: process
    begin
		wait until rising_edge(clk_i);
		if reset_i='1' or camera_rst_i='1' then
         write_element_pos_s<="00000000000";
		elsif last_clk_camera_s='0' and camera_clk_i='1' then
		-- on rising edge of the low speed signal clk
         write_element_pos_s<=(write_element_pos_s+1) mod "11111001000";
			valid_ram_pos_s<='1';
		else
			valid_ram_pos_s<='0';
      end if;
		last_clk_camera_s<=camera_clk_i;
    end process incomming_RAM_position_p;
	 
	 
	 -- second part: reading and averaging the stored data
--	 
--    -- switch to next state or reset handle
--    next_state_process: process
--    begin
--    wait until rising_edge(clk_i);
--	 if reset_i='1' or camera_rst_i='1' then
--        current_pixel<=init;
--    else
--        current_pixel<=next_pixel;
--    end if;
--    end process next_state_process;
--	 
--	 test_o<=ram_pos_s;
--	 
--	 	 -- position in RAM
--    ram_position_p: process
--    begin
--		wait until rising_edge(clk_i);
--		if reset_i='1' or camera_rst_i='1' then
--         ram_pos_s<="00000000000";
--		elsif last_clk_camera_i='0' and camera_clk_i='1' then
--		-- on rising edge of the low speed signal clk
--         ram_pos_s<=(ram_pos_s+1) mod "11111001000";
--			valid_ram_pos_s<='1';
--		else
--			valid_ram_pos_s<='0';
--      end if;
--		last_clk_camera_i<=camera_clk_i;
--    end process ram_position_p;
--    -- sweep all the stored pixel
--    p_sweep_pixel: process
--	 begin
--		wait until rising_edge(clk_i);
--		case current_pixel is
--			  when init   => actual_position<="11111111111";
--								  est_actif<='0';
--								  if camera_clk_i='1' then
--										next_pixel<=pix_tl;
--								  end if;
--
--			  when pix_tl => actual_position<=ELEM_POS_TL;
--								  est_actif<='1';
--								  next_pixel<=pix_tc;
--
--			  when pix_tc => actual_position<=ELEM_POS_TC;
--								  est_actif<='1';
--								  next_pixel<=pix_tr;
--
--			  when pix_tr => actual_position<=ELEM_POS_TR;
--								  est_actif<='1';
--								  next_pixel<=pix_cl;
--
--			  when pix_cl => actual_position<=ELEM_POS_CL;
--								  est_actif<='1';
--								  next_pixel<=pix_cc;
--
--			  when pix_cc => actual_position<=ELEM_POS_CC;
--								  est_actif<='1';
--								  next_pixel<=pix_cr;
--
--			  when pix_cr => actual_position<=ELEM_POS_CR;
--								  est_actif<='1';
--								  next_pixel<=pix_bl;
--
--			  when pix_bl => actual_position<=ELEM_POS_BL;
--								  est_actif<='1';
--								  next_pixel<=pix_bc;
--
--			  when pix_bc => actual_position<=ELEM_POS_BC;
--								  est_actif<='1';
--								  next_pixel<=pix_br;
--
--			  when pix_br => actual_position<=ELEM_POS_BR;
--								  est_actif<='1';
--								  next_pixel<=w_state;
--
--			  when w_state=> actual_position<="11111111111";
--								  est_actif<='0';
--								  if camera_clk_i='0' then
--										next_pixel<=init;
--								  end if;
--		 end case;
--	 end process p_sweep_pixel;
--	 
--
--	 
--	 -- read position
--	 pos_loc_s<=(ram_pos_s+actual_position) mod "11111001000";
	
	 -- 2 RAM dual access
	 
    -- RAMB16_S9_S9: Spartan-3 2k x 8 + 1 unused Parity bits Dual-Port RAM
    RAMB16_Y_inst : RAMB16_S9_S9
	 generic map (
      INIT_A => X"00000000", --  Value of output RAM registers at startup
      INIT_B => X"00000000", --  Value of output RAM registers at startup
		SRVAL_A => X"00000000", --  Ouput value upon SSR assertion
      SRVAL_B => X"00000000", --  Ouput value upon SSR assertion
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")
    port map (
		-- PORT A: store
      DOA   => open,                           -- 8-bit Data Output
      DOPA  => open,                           -- 1-bit parity Output
      ADDRA => write_element_pos_bit_vec_s,    -- 10-bit Address Input
      CLKA  => clk_i,                          -- Clock
      DIA   => Y_i,                            -- 8-bit Data Input
      DIPA  => "0",                            -- 1-bit parity Input
      ENA   => valid_ram_pos_s,                -- RAM Enable Input
      SSRA  => '0',                            -- Synchronous Set/Reset Input
      WEA   => '0',                            -- Write Enable Input
		
		-- PORT B: modification
      DOB   => open,                           -- 8-bit Data Output
      DOPB  => open,                           -- 1-bit parity Output
      ADDRB => write_element_pos_bit_vec_s,    -- 10-bit Address Input
      CLKB  => clk_i,                          -- Clock
      DIB   => "00000000",                     -- 8-bit Data Input
      DIPB  => "0",                            -- 1-bit parity Input
      ENB   => '1',                            -- RAM Enable Input
      SSRB  => '0',                            -- Synchronous Set/Reset Input
      WEB   => '1'                             -- Write Enable Input
    ); 
	 
	 
    -- RAMB16_S9_S9: Spartan-3 2k x 8 + 1 Parity bits Dual-Port RAM
    RAMB16_H_inst : RAMB16_S9_S9
	 generic map (
      INIT_A => X"00000000", --  Value of output RAM registers at startup
      INIT_B => X"00000000", --  Value of output RAM registers at startup
		SRVAL_A => X"00000000", --  Ouput value upon SSR assertion
      SRVAL_B => X"00000000", --  Ouput value upon SSR assertion
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")
    port map (
		-- PORT A: store
      DOA   => open,                           -- 8-bit Data Output
      DOPA  => open,                           -- 1-bit parity Output
      ADDRA => write_element_pos_bit_vec_s,    -- 10-bit Address Input
      CLKA  => clk_i,                          -- Clock
      DIA   => H_i,                            -- 8-bit Data Input
      DIPA  => "0",                            -- 1-bit parity Input
      ENA   => valid_ram_pos_s,                -- RAM Enable Input
      SSRA  => '0',                            -- Synchronous Set/Reset Input
      WEA   => '0',                            -- Write Enable Input
		
		-- PORT B: modification
      DOB   => open,                           -- 8-bit Data Output
      DOPB  => open,                           -- 1-bit parity Output
      ADDRB => write_element_pos_bit_vec_s,    -- 10-bit Address Input
      CLKB  => clk_i,                          -- Clock
      DIB   => "00000000",                     -- 8-bit Data Input
      DIPB  => "0",                            -- 1-bit parity Input
      ENB   => '1',                            -- RAM Enable Input
      SSRB  => '0',                            -- Synchronous Set/Reset Input
      WEB   => '1'                             -- Write Enable Input
    ); 
	 
end multi_pixel_mean_1; 

