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
-- Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
--! @file cam_interface.vhd
--! @brief Camera interface bloc
--! @author BLANCHARD Remy <remyb718 at gmail dot com>
--!
--! Platform   : Spartan 3
--!
--! Description: This bloc makes the link between the camera and the rest of
--!              the design by providing an RGB signal on 3 channels
--!              (the camera in Raw RGB mode Interlaced Mode 16 Bit Format)
-----------------------------------------------------------------------------

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

    signal r_edge_pclk_s   : std_logic;
    signal f_edge_pclk_s   : std_logic;
	 
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
	  VARIABLE detect : std_logic_vector(1 DOWNTO 0);
	  BEGIN
			WAIT UNTIL rising_edge (clk_i); -- c'est donc synchrone de clk
			  r_edge_pclk_s <= '0'; 
			  f_edge_pclk_s <= '0'; 
			 detect(1) := detect(0);
			 detect(0) := PCLK_i;
			 IF detect = "01" THEN
							 r_edge_pclk_s <= '1';
			 END IF;
			 IF detect = "10" THEN
							 f_edge_pclk_s <= '1';
			 END IF;
    end process internal_clk_p;



    -- convert the data into 
    output_clk_p : process
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='1' or HREF_i='0' then
		      mode_s<='1';
		  elsif r_edge_pclk_s='1' then -- on rising edge of PCLK
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
	  VARIABLE detect : std_logic_vector(1 DOWNTO 0);
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='1' then
		      new_line_o<='1';
		  elsif r_edge_pclk_s='1' then -- on rising edge of PCLK
				 detect(1) := detect(0);
				 detect(0) := FODD_i;
				new_line_o<=detect(1);
		  end if;
    end process new_line_flag_p;

	 -- one camera clock delay for line new image flag
	 new_frame_flag_p : process
	  VARIABLE detect : std_logic_vector(1 DOWNTO 0);
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='1' then
		      new_frame_o<='1';
		  elsif r_edge_pclk_s='1' then -- on rising edge of PCLK
				 detect(1) := detect(0);
				 detect(0) := VSYNC_i;
				new_frame_o<=detect(1);
		  end if;
    end process new_frame_flag_p;
	 
	 -- one camera clock delay for line new image flag
	 rst_camera_flag_p : process
	  VARIABLE detect : std_logic_vector(1 DOWNTO 0);
	 begin
        wait until rising_edge(clk_i);
		  if rst_i='1' then
		      rst_camera_o<='1';
		  elsif r_edge_pclk_s='1' then -- on rising edge of PCLK
				detect(1) := detect(0);
				 detect(0) := not(HREF_i); -- Cam signal valid on HREF high stat
				rst_camera_o<=detect(1);
		  end if;
    end process rst_camera_flag_p;

	 
end cam_interface_1; 
