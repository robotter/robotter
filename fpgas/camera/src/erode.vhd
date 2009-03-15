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
--! @file erode.vhd
--! @brief 3x3 erosion
--! @author BLANCHARD Remy <remyb718 at gmail dot com>
--!
--! Platform   : Spartan 3
--!
--! Description: This bloc perform a 3*3 erosion on a binary image.
--!              Each bit of the 8 bit entry is the result of a different
--!              threshold process.
-----------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;
library XilinxCoreLib;
use XilinxCoreLib.all;


-----------------------------------------------------------------------
entity eroder is
-----------------------------------------------------------------------
    port (
        clk_i          : in  std_ulogic;
        reset_i        : in  std_ulogic;
		  
		  -- input signals
		  segm_i         : in std_logic_vector(7 downto 0);
		  
        -- camera input (with delay)
        camera_clk_i   : in  std_ulogic; -- new pixel signal
        camera_rst_i   : in  std_ulogic; -- new image signal
		  
        -- average outputs
        segm_erode_o   : out std_logic_vector(7 downto 0)
        
    );
end eroder;

-----------------------------------------------------------------------
architecture eroder_1 of eroder is
-----------------------------------------------------------------------

	 -- signal for the first part

	 --signal for detecting rising edges of clk_camera_i
	 signal last_clk_camera_s: std_ulogic;
	 
	 -- the position of the element in the RAM
    signal write_element_pos_s: unsigned (10 downto 0);
	 signal write_element_pos_bit_vec_s: std_logic_vector(10 downto 0);
	 
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

	 -- relative position of the pixel to sum
    signal offset_value_s: unsigned(10 downto 0);

	 -- signal to determine if the state machine is in an active state
	 signal st_mach_actif_s: std_ulogic;
	 
	 -- adress to read in RAMs
	 signal in_ram_pos_s: std_logic_vector(10 downto 0);

	 -- definition of the state machine elements
    type sweep_pix is (init, pix_tl, pix_tc, pix_tr, pix_cl, pix_cc, pix_cr, 
      pix_bl, pix_bc, pix_br, w_state);
    signal current_pixel_s, next_pixel_s: sweep_pix;
	 
	 -- RAM output
	 signal erode_element_s: std_logic_vector(7 downto 0);
	 
	 -- output of the AND door
	 signal erode_tmp_s    : std_logic_vector(7 downto 0);
	
begin
	 ---------------------------------------------------------
	 -- first part: writting the incoming elements in both RAM
	 ---------------------------------------------------------
	 
	 -- position to write in the RAM
    incomming_RAM_position_p: process
    begin
		wait until rising_edge(clk_i);
		if reset_i='1' or camera_rst_i='1' then
         write_element_pos_s<="00000000000";
		elsif last_clk_camera_s='0' and camera_clk_i='1' then
         write_element_pos_s<=write_element_pos_s+1;
			valid_ram_pos_s<='1';
		else
			valid_ram_pos_s<='0';
      end if;
		last_clk_camera_s<=camera_clk_i;
    end process incomming_RAM_position_p;
	 write_element_pos_bit_vec_s<=std_logic_vector(write_element_pos_s);
	 
	 ---------------------------------------------------------
	 -- second part: reading and averaging the stored data
	 ---------------------------------------------------------
	 
    -- switch to next state or reset handle
    next_state_process_p: process
    begin
    wait until rising_edge(clk_i);
	 if reset_i='1' or camera_rst_i='1' then
        current_pixel_s<=init;
    else
        current_pixel_s<=next_pixel_s;
    end if;
    end process next_state_process_p;
	 
	 
    -- sweep all the stored pixel (output: the offset for the
	 -- analysed pixel)
    sweep_pixel_p: process
	 begin
		wait until rising_edge(clk_i);
		case current_pixel_s is
			  when init   => offset_value_s<="11111111111";
								  st_mach_actif_s<='0';
								  if camera_clk_i='1' then
										next_pixel_s<=pix_tl;
								  end if;

			  when pix_tl => offset_value_s<=ELEM_POS_TL;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_tc;

			  when pix_tc => offset_value_s<=ELEM_POS_TC;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_tr;

			  when pix_tr => offset_value_s<=ELEM_POS_TR;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_cl;

			  when pix_cl => offset_value_s<=ELEM_POS_CL;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_cc;

			  when pix_cc => offset_value_s<=ELEM_POS_CC;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_cr;

			  when pix_cr => offset_value_s<=ELEM_POS_CR;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_bl;

			  when pix_bl => offset_value_s<=ELEM_POS_BL;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_bc;

			  when pix_bc => offset_value_s<=ELEM_POS_BC;
								  st_mach_actif_s<='1';
								  next_pixel_s<=pix_br;

			  when pix_br => offset_value_s<=ELEM_POS_BR;
								  st_mach_actif_s<='1';
								  next_pixel_s<=w_state;

			  when w_state=> offset_value_s<="11111111111";
								  st_mach_actif_s<='0';
								  if camera_clk_i='0' then
										next_pixel_s<=init;
								  end if;
		 end case;
	 end process sweep_pixel_p;
	 	 
	 -- read position
	 in_ram_pos_s<=std_logic_vector(write_element_pos_s-offset_value_s);
	 
	 -- "And" process
	 and_process_p: process
    begin
		wait until rising_edge(clk_i);
		if st_mach_actif_s='0' then
			erode_tmp_s<="00000000";
		else
			erode_tmp_s<=erode_tmp_s and erode_element_s;
		end if;
	 end process and_process_p;
	 
	 -- latch it in the right time in the output
	 erode_output_latch_p: process
    begin
		wait until rising_edge(clk_i);
		if current_pixel_s=w_state then
			segm_erode_o<=erode_tmp_s;
		end if;
	end process erode_output_latch_p;
	
	 -- 2 RAM dual access
	 
    -- RAMB16_S9_S9: Spartan-3 2k x 8 + 1 unused Parity bits Dual-Port RAM
    RAMB16_inst : RAMB16_S9_S9
	 generic map (
      INIT_A => "000000000", --  Value of output RAM registers at startup
      INIT_B => "000000000", --  Value of output RAM registers at startup
		SRVAL_A => "000000000", --  Ouput value upon SSR assertion
      SRVAL_B => "000000000", --  Ouput value upon SSR assertion
		WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
		WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "NONE", -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
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
      DIA   => segm_i,                         -- 8-bit Data Input
      DIPA  => "0",                            -- 1-bit parity Input
      ENA   => valid_ram_pos_s,                -- RAM Enable Input
      SSRA  => '0',                            -- Synchronous Set/Reset Input
      WEA   => '1',                            -- Write Enable Input
		
		-- PORT B: fetch for erosion
      DOB   => erode_element_s,                -- 8-bit Data Output
      DOPB  => open,                           -- 1-bit parity Output
      ADDRB => in_ram_pos_s,                   -- 10-bit Address Input
      CLKB  => clk_i,                          -- Clock
      DIB   => "00000000",                     -- 8-bit Data Input
      DIPB  => "0",                            -- 1-bit parity Input
      ENB   => '1',                            -- RAM Enable Input
      SSRB  => '0',                            -- Synchronous Set/Reset Input
      WEB   => '0'                             -- Write Enable Input
    ); 
	 
end eroder_1;

