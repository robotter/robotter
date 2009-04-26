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
--! @file 
--! @brief Camera bloc topdesign
--! @author BLANCHARD Remy <remyb718 at gmail dot com>
--!
--!
--! Platform   : Spartan 3
--!
--! Description:
--! This bloc is the top design of the camera bloc, for more informations
--! please see each bloc.
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--! 								SOLUTION B
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;

use UNISIM.VComponents.all;

-----------------------------------------------------------------------
entity topdesign_camera is
-----------------------------------------------------------------------
	port (
			clk_i          : in  std_logic;
			rst_i          : in  std_logic;

			-- ****************
			-- Wishbone signals
			wbs_rst_i      : in  std_logic;
			wbs_clk_i      : in  std_logic;
			wbs_adr_i      : in  std_logic_vector(15 downto 0);
			wbs_dat_o      : out std_logic_vector(15 downto 0);
			wbs_dat_i      : in  std_logic_vector(15 downto 0);
			wbs_we_i       : in  std_logic;
			wbs_stb_i      : in  std_logic;
			wbs_ack_o      : out std_logic;
			wbs_cyc_i      : in  std_logic;
			pod_irq_ping_o : out std_logic; --ping buffer full
			pod_irq_pong_o : out std_logic; --pong buffer full

			-- *******************
			-- Camera input signals
			  -- Y signal (see documentation)
			  Y_i            : in  std_logic_vector(7 downto 0);
			  -- UV signal (see documentation)
			  UV_i           : in  std_logic_vector(7 downto 0);
			  PCLK_i         : in  std_logic;
			  HREF_i         : in  std_logic;
			  VSYNC_i        : in  std_logic;
			  FODD_i         : in  std_logic;

			  R_o            : out std_logic_vector(7 downto 0);
			  G_o            : out std_logic_vector(7 downto 0);
			  B_o            : out std_logic_vector(7 downto 0);
			  new_pix_o      : out std_logic;
			  -- this signal indicate a new line on falling edge and rising edge
			  new_line_o     : out std_logic;
			  new_frame_o    : out std_logic;
			  rst_camera_o   : out std_logic
	);
end topdesign_camera;

-----------------------------------------------------------------------
architecture topdesign_camera_1 of topdesign_camera is
-----------------------------------------------------------------------

-- the intermediate signals
	signal R_s            : std_logic_vector(7 downto 0);
	signal G_s            : std_logic_vector(7 downto 0);
	signal B_s            : std_logic_vector(7 downto 0);
	signal new_pix_s      : std_logic;
	signal new_line_s     : std_logic;
	signal new_frame_s    : std_logic;
	signal rst_camera_s   : std_logic;

-- The blocs
 component  wishbone_interface
    PORT (
        clk_i          : in  std_logic;
		  rst_i          : in  std_logic;
		  
		  -- ****************
        -- Wishbone signals
		  wbs_rst_i      : in  std_logic;
		  wbs_clk_i      : in  std_logic;
		  wbs_adr_i      : in  std_logic_vector(15 downto 0);
		  wbs_dat_o      : out std_logic_vector(15 downto 0);
		  wbs_dat_i      : in  std_logic_vector(15 downto 0);
		  wbs_we_i       : in  std_logic;
		  wbs_stb_i      : in  std_logic;
		  wbs_ack_o      : out std_logic;
		  wbs_cyc_i      : in  std_logic;
		  pod_irq_ping_o : out std_logic; --ping buffer full
		  pod_irq_pong_o : out std_logic; --pong buffer full

        -- *******************
        -- Camera side signals
		  img_clk_i      : in  std_logic;
		  R_i            : in  std_logic_vector(7  downto 0);
		  G_i            : in  std_logic_vector(7  downto 0);
		  B_i            : in  std_logic_vector(7  downto 0);
		  new_line_i     : in  std_logic;
		  new_frame_i    : in  std_logic;
		  rst_camera_i   : in  std_logic
		  );
  END component;


 component  cam_interface
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
  END component;

begin

  F0 : cam_interface port map (
        clk_i          =>clk_i,
		  rst_i          =>rst_i,
        Y_i            =>Y_i,
        UV_i           =>UV_i,
		  PCLK_i         =>PCLK_i,
		  HREF_i         =>HREF_i,
		  VSYNC_i        =>VSYNC_i,
		  FODD_i         =>FODD_i,
		  R_o            =>R_s,
		  G_o            =>G_s,
		  B_o            =>B_s,
		  new_pix_o      =>new_pix_s,
		  new_line_o     =>new_line_s,
		  new_frame_o    =>new_frame_s,
		  rst_camera_o   =>rst_camera_s
		);

  F1 : wishbone_interface port map (
        clk_i          =>clk_i,
		  rst_i          =>rst_i,
		  wbs_rst_i      =>wbs_rst_i,
		  wbs_clk_i      =>wbs_clk_i,
		  wbs_adr_i      =>wbs_adr_i,
		  wbs_dat_o      =>wbs_dat_o,
		  wbs_dat_i      =>wbs_dat_i,
		  wbs_we_i       =>wbs_we_i,
		  wbs_stb_i      =>wbs_stb_i,
		  wbs_ack_o      =>wbs_ack_o,
		  wbs_cyc_i      =>wbs_cyc_i,
		  pod_irq_ping_o =>pod_irq_ping_o,
		  pod_irq_pong_o =>pod_irq_pong_o,
		  img_clk_i      =>new_pix_s,
		  R_i            =>R_s,
		  G_i            =>G_s,
		  B_i            =>B_s,
		  new_line_i     =>new_line_s,
		  new_frame_i    =>new_frame_s,
		  rst_camera_i   =>rst_camera_s
    );

end topdesign_camera_1; 