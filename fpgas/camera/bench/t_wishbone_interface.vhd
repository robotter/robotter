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
--! @brief Wishbone interface bloc test
--! @author BLANCHARD Remy <remyb718 at gmail dot com>
--!
--!
--! Platform   : Spartan 3
--!
--! Description:
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY unisim;
USE unisim.vcomponents.all;

-----------------------------------------------------------------------------
ENTITY t_wishbone_interface IS
-----------------------------------------------------------------------------
END t_wishbone_interface;

-----------------------------------------------------------------------------
ARCHITECTURE behavior_1 OF t_wishbone_interface IS 
-----------------------------------------------------------------------------

    -- Component Declaration for the Unit Under Test
    COMPONENT wishbone_interface
    PORT(
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
		  pod_irq_o      : out std_logic;

        -- *******************
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
		  
		  -- signals for the post traitement output
		  pt_addr_o      : out std_logic_vector(9  downto 0);
		  pt_data_i      : in  std_logic_vector(15 downto 0)
      );
    END COMPONENT;


    signal clk_s          : std_logic;
    signal rst_s          : std_logic;
		  
		  -- ****************
        -- Wishbone signals
    signal wbs_rst_s      : std_logic;
    signal wbs_clk_s      : std_logic;
    signal wbs_adr_s      : std_logic_vector(15 downto 0);
    signal wbs_dat_o_s    : std_logic_vector(15 downto 0);
    signal wbs_dat_s      : std_logic_vector(15 downto 0);
    signal wbs_we_s       : std_logic;
    signal wbs_stb_s      : std_logic;
    signal wbs_ack_s      : std_logic;
    signal wbs_cyc_s      : std_logic;
    signal pod_irq_s      : std_logic;

        -- *******************
        -- Camera side signals
    signal img_clk_s      : std_logic;
    signal img_rst_s      : std_logic;
    signal R_s            : std_logic_vector(7  downto 0);
    signal G_s            : std_logic_vector(7  downto 0);
    signal B_s            : std_logic_vector(7  downto 0);
    signal segm_s         : std_logic_vector(7  downto 0);
		  
		  -- signals for programming the segmentation
    signal prgseg_addr_s  : std_logic_vector(9  downto 0);
    signal prgseg_data_s  : std_logic_vector(15 downto 0);
    signal prgseg_valid_s : std_logic;
		  
		  -- signals for the post traitement output
    signal pt_addr_s      : std_logic_vector(9  downto 0);
	 signal pt_data_s      : std_logic_vector(15 downto 0);

    -- timing constant for general clock
    constant periode_clk_c      : time := 10 ns;     -- 100 MHz
	 -- timing constant for the camera clock
    constant periode_cam_c      : time := 30 ns;
	 -- timing constant for wishbone clock
    constant periode_wb_c   : time := 15 ns;  
	 -- timing constant for the reset
	 constant periode_rst_c    : time := 10 us;  
	 -- timing constant for the wishbone reset
	 constant periode_rst_wb_c : time := 10 us;  
	 -- timing constant for the camera reset
	 constant periode_rcam_c : time := 1 us;  
	 -- timing constant for the Wen
	 constant periode_we_c : time := 800 ns;  
BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: wishbone_interface PORT MAP(
      clk_i          => clk_s,
		rst_i          => rst_s,
		wbs_rst_i      => wbs_rst_s,
		wbs_clk_i      => wbs_clk_s,
		wbs_adr_i      => wbs_adr_s,
		wbs_dat_o      => wbs_dat_o_s,
		wbs_dat_i      => wbs_dat_s,
		wbs_we_i       => wbs_we_s,
		wbs_stb_i      => wbs_stb_s,
		wbs_ack_o      => wbs_ack_s,
		wbs_cyc_i      => wbs_cyc_s,
		pod_irq_o      => pod_irq_s,
		img_clk_i      => img_clk_s,
		img_rst_i      => img_rst_s,
		R_i            => R_s,
		G_i            => G_s,
		B_i            => B_s,
		segm_i         => segm_s,
		prgseg_addr_o  => prgseg_addr_s,
		prgseg_data_o  => prgseg_data_s,
		prgseg_valid_o => prgseg_valid_s,
		pt_addr_o      => pt_addr_s,
		pt_data_i      => pt_data_s        
    );

    -- input: clock
    clock_p : PROCESS
    BEGIN
        clk_s <= '1', '0' after periode_clk_c/2;
        wait for periode_clk_c;
    end process clock_p;
	 
	 -- input: clock wishbone
    clock_wb_p : PROCESS
    BEGIN
        wbs_clk_s <= '1', '0' after periode_wb_c/2;
        wait for periode_wb_c;
    end process clock_wb_p;

	input_rst_p: PROCESS
	BEGIN
		  rst_s <= '1', '0' after periode_clk_c*2;
        wait for periode_rst_c;
	end process input_rst_p;
	
	input_rst_wsb_p: PROCESS
	BEGIN
		  wbs_rst_s <= '1', '0' after periode_clk_c*2;
        wait for periode_rst_wb_c;
	end process input_rst_wsb_p;

   -- first part: whe fill the RAM
	R_s<="01010101";
	G_s<="10101010";
	B_s<="11110000";
	segm_s<="00001111";
	
	-- camera input clk
	 clock_c_p : PROCESS
    BEGIN
        img_clk_s <= '1', '0' after periode_cam_c/2;
        wait for periode_cam_c;
    end process clock_c_p;
	 
	-- camera input rst
	reset_c_p : PROCESS
    BEGIN
        img_rst_s <= '1', '0' after periode_rcam_c/2;
        wait for periode_rcam_c;
    end process reset_c_p;
	 
	-- set default values for the result
	pt_data_s<="0011001100110011";
	
	
	-- Wishbone query
	whishbone_p : PROCESS
    BEGIN
	
		  wbs_adr_s <= X"0000";
		  wait for periode_wb_c*4;
--	loop
--        wbs_adr_s <= std_logic_vector(unsigned(wbs_adr_s)+1);
--        wait for periode_wb_c*4;
--    end loop;
    end process whishbone_p;
	 
	 whishbone_we_p : PROCESS
    BEGIN
        wbs_we_s <= '1', '0' after periode_wb_c/2;
        wait for periode_wb_c;
    end process whishbone_we_p;
			
	 wbs_dat_s<="1100110011001100";
	
	 wbs_stb_s<='1';
	 
	whishbone_cyc_p : PROCESS
    BEGIN
        wbs_cyc_s <= '0';
        wait for 2*periode_wb_c;
        wbs_cyc_s <= '1';
        wait for 2*periode_wb_c;
    end process whishbone_cyc_p;


--    -- input: R
--    main_p : PROCESS
--    begin
--      -- first step: filling the RAMs
--      -- don't care about the video signals 
--      -- avoid port A & B adress match:
--      -- A read was performed on address 000 (hex) of port A while a write
--      -- was requested to the same address on Port B  The write will be
--      -- successful however the read value is unknown until the next CLKA
--      -- cycle
--      Y_s<="111111111";
--      H_s<="111111111";
--      -- writting in the H buffer
--      valid_s<='0';
--      value_s<="1111111111111111";
--      adress_s<="0000000000";
--      wait for 2*periode_c;
--      valid_s<='1';
--      wait for 2*periode_c;
--      valid_s<='0';
--      wait for 2*periode_c;
--      value_s<="0000000000000000";
--      adress_s<="0000000001";
--      wait for 2*periode_c;
--      valid_s<='1';
--      wait for 2*periode_c;
--      valid_s<='0';
--      wait for 2*periode_c;
--      -- writting in the Y buffer
--      value_s<="1010101010101010";
--      adress_s<="1000000000";
--      wait for 2*periode_c;
--      valid_s<='1';
--      wait for 2*periode_c;
--      valid_s<='0';
--      wait for 2*periode_c;
--      value_s<="0101010101010101";
--      adress_s<="1000000001";
--      wait for 2*periode_c;
--      valid_s<='1';
--      wait for 2*periode_c;
--      valid_s<='0';
--      wait for 10*periode_c;
--      -- second step: tested the filled RAMs
--      value_s<="0000000000000000";
--      adress_s<="0000000000";
--      Y_s<="000000000";
--      H_s<="000000000";
--      wait for 2*periode_c;
--      Y_s<="000000000";
--      H_s<="000000001";
--      wait for 2*periode_c;
--      Y_s<="000000001";
--      H_s<="000000001";
--      wait for 2*periode_c;
--      Y_s<="000000001";
--      H_s<="000000000";
--      wait for 10*periode_c;
--    end process main_p;

END;

