-----------------------------------------------------------------------------
-- Title      : Camera interface bloc
-- Project    : Carte camera 2009
-----------------------------------------------------------------------------
-- File       : cam_interface.vhdl
-- Author     : BLANCHARD Remy <remyb718 at gmail dot com>
-- Company    : Rob'Otter
-- Last update: 01/02/2008
-- Platform   : Spartan 3
-----------------------------------------------------------------------------
-- Description: This bloc makes the link between the camera and the rest of
--              the design by providing an RGB signal on 3 channels
--              (the camera in Raw RGB mode Interlaced Mode 16 Bit Format)
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
entity cam_interface is
-----------------------------------------------------------------------
    port (
        clk_i          : in  std_logic;
		  rst_i          : in  std_logic;
		  
        -- camera side
		  -- Y signal (see documentation)
        Y_i            : in  std_logic_vector(7 downto 0);
		  -- UV signal (see documentation)
        UV_i           : in  std_logic_vector(7 downto 0);
		  PCLK_i         : in  std_logic;
		  HREF_i         : in  std_logic;
		  VSYNC_i        : in  std_logic;
		  FODD_i         : in  std_logic;

        -- FPGA side
		  R_o            : out std_logic_vector(7 downto 0);
		  G_o            : out std_logic_vector(7 downto 0);
		  B_o            : out std_logic_vector(7 downto 0);
		  new_pix_o      : out std_logic;
		  -- this signal indicate a new line on falling edge and rising edge
		  new_line_o     : out std_logic;
		  new_frame_o    : out std_logic;
		  rst_camera_o   : out std_logic
    );
end cam_interface;

-----------------------------------------------------------------------
architecture cam_interface_1 of cam_interface is
-----------------------------------------------------------------------

-- declaration

    signal old_PCLK_s   : std_logic;
	 
	 -- the reading mode: 0: first part of the signal
	 --                   1: second part of the signal
	 -- see datasheet
	 signal mode_s       : std_logic;
	 
	 --intermediate signals for line delays
	 signal last_camera_rst   : std_logic;
	 signal last_frame_status : std_logic;
	 signal last_line_status  : std_logic;
	 
begin
    -- the main program


    -- internal clock handle
    internal_clk_p : process
	 begin
        wait until rising_edge(clk_i);
		  old_PCLK_s<=PCLK_i;
    end process internal_clk_p;



    -- convert the data into 
    output_clk_p : process
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='1' or HREF_i='0' then
		      mode_s<='1';
		  elsif old_PCLK_s='0' and PCLK_i='1' then -- on rising edge of PCLK
				mode_s<=not(mode_s);
		  end if;
    end process output_clk_p;



    -- convert the data into 
    to_RGB_convertor_p : process
	 begin
        wait until rising_edge(clk_i);
			if mode_s='1' then -- on rising edge of PCLK
				   B_o<=Y_i;
					G_o<="00000000";
					R_o<="00000000";
		  else
					G_o<=Y_i;
					R_o<=UV_i;
		  end if;
    end process to_RGB_convertor_p;
	 
	 -- mode is in fact the clock for pixels
	 new_pix_o<=mode_s;
	 
	 -- one camera clock delay for line odd flag
	 new_line_flag_p : process
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='0' then
		      new_line_o<='1';
		  elsif old_PCLK_s='0' and PCLK_i='1' then -- on rising edge of PCLK
				new_line_o<=last_line_status;
		  elsif old_PCLK_s='1' and PCLK_i='0' then -- on falling edge of PCLK
				-- store the last state
				last_line_status<=FODD_i;
		  end if;
    end process new_line_flag_p;

	 -- one camera clock delay for line new image flag
	 new_frame_flag_p : process
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='0' then
		      new_frame_o<='1';
		  elsif old_PCLK_s='0' and PCLK_i='1' then -- on rising edge of PCLK
				new_frame_o<=last_frame_status;
		  elsif old_PCLK_s='1' and PCLK_i='0' then -- on falling edge of PCLK
				-- store the last state
				last_frame_status<=VSYNC_i;
		  end if;
    end process new_frame_flag_p;
	 
	 -- one camera clock delay for line new image flag
	 rst_camera_flag_p : process
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='0' then
		      rst_camera_o<='1';
		  elsif old_PCLK_s='0' and PCLK_i='1' then -- on rising edge of PCLK
				rst_camera_o<=last_camera_rst;
		  elsif old_PCLK_s='1' and PCLK_i='0' then -- on falling edge of PCLK
				-- store the last state
				last_camera_rst<=not(HREF_i); -- Cam signal valid on HREF high stat
		  end if;
    end process rst_camera_flag_p;

	 
end cam_interface_1; 
