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
--! @wishbone_interface.vhd
--! @brief Wishbone interface bloc
--! @author BLANCHARD Remy <remyb718 at gmail dot com>
--
--! This bloc is the POD complient Wishbone interface (16 bits).
--! the aim of this bloc is to:
--!    - configure the RAMs of the segmentation bloc
--!        in write mode for adresses from 0x1000 to 0x13FF,
--!    - reset the interruption flag
--!        in write mode at adresses 0xF000,
--!    - read the output RAM buffer
--!        in read mode for adresses from 0x0000 to 0x01FF,
--!    - read the result of the last processing bloc
--!        in read mode for adresses from 0x2000 to 0x2???,
--! This bloc also generate an interuption when the RAM is ready for reading
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

-----------------------------------------------------------------------
entity wishbone_interface is
-----------------------------------------------------------------------
    port (
        clk_i          : in  std_logic;
		  rst_i          : in  std_logic;
		  
        -- Wishbone signals
		  wbs_rst_i      : in  std_logic;
		  wbs_clk_i      : in  std_logic;
		  wbs_adr_i      : in  std_logic_vector(15 downto 0);
		  wbs_dat_o      : in  std_logic_vector(15 downto 0);
		  wbs_dat_i      : in  std_logic_vector(15 downto 0);
		  wbs_we_i       : in  std_logic;
		  wbs_stb_i      : in  std_logic;
		  wbs_ack_o      : in  std_logic;
		  wbs_cyc_i      : in  std_logic;


        -- Camera side signals
		  img_clk_i      : in  std_logic;
		  img_rst_i      : in  std_logic;
		  R_i            : in  std_logic_vector(7  downto 0);
		  G_i            : in  std_logic_vector(7  downto 0);
		  B_i            : in  std_logic_vector(7  downto 0);
		  segm_i         : in  std_logic_vector(7  downto 0);
		  
		  -- signals for programming the segmentation
		  prgseg_addr_o  : out std_logic_vector(9  downto 0);
		  prgseg_data_o  : out std_logic_vector(15 downto 0);
		  prgseg_valid_o : out std_logic;
		  
		  -- signals for the post tratement output
		  pt_addr_o      : out std_logic_vector(9  downto 0);
		  pt_data_i      : in  std_logic_vector(15 downto 0);
		  pt_valid       : out std_logic;

    );
end wishbone_interface;

-----------------------------------------------------------------------
architecture wishbone_interface_1 of wishbone_interface is
-----------------------------------------------------------------------

-- declaration

    signal r_edge_pclk_s   : std_logic;
	 
	 
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


	 
end wishbone_interface_1; 
