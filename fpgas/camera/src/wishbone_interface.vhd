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
--! @file wishbone_interface.vhd
--! @brief Wishbone interface bloc
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
end wishbone_interface;

-----------------------------------------------------------------------
architecture wishbone_interface_1 of wishbone_interface is
-----------------------------------------------------------------------

-- declaration
	
	 -- the concatenation of R,G,B and the result of the segmentation
	 signal buffer_data_in_s: std_logic_vector(31 downto 0);
	 
	 -- the adresses for storing the concatenation
	 signal addr_buf_s      : std_logic_vector(9  downto 0);
	 -- adresses for reading the RAM
	 signal RAM_adress_s    : std_logic_vector(8  downto 0);
	 signal RAM_valid_s     : std_logic;
	 signal RAM_data_o_s    : std_logic_vector(15  downto 0);
	 
	 -- ack signal
	 signal old_ack_s: std_logic;
	 
begin
    -- the main program



    -- dispatch process validation signals for write
	 dispatch_p : process
	 begin
	  if wbs_adr_i(15 downto 12)=X"1" and wbs_we_i='0' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
		prgseg_valid_o <= '1';
	  else
		prgseg_valid_o <= '0';
	  end if;
	 end process dispatch_p;
	 
    -- set the output data signal
	 output_val_p : process
	 begin
	  if    wbs_adr_i(15 downto 12)=X"0" and wbs_we_i='1' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
		wbs_dat_o     <= RAM_data_o_s;
	  elsif wbs_adr_i(15 downto 12)=X"2" and wbs_we_i='1' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
	  	wbs_dat_o     <= pt_data_i;
	  else
	  	wbs_dat_o     <= wbs_dat_i;
	  end if;
	 end process output_val_p;
	 
	 -- set the output data for write
	 output_data_p : process
	 begin
	  if wbs_adr_i(15 downto 12)=X"1" and wbs_we_i='0' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
		prgseg_data_o <= wbs_dat_i;
	  --else
	  end if;
	 end process output_data_p;
	 
	 -- handle the ack signal
	 ack_wishbone_p : process
	 begin
	    wait until rising_edge(wbs_clk_i);
		 if wbs_stb_i='1' and wbs_cyc_i ='1' and old_ack_s='0' then
		   wbs_ack_o<='1';
			old_ack_s<='1';
		 elsif wbs_stb_i='1' and wbs_cyc_i ='1' and old_ack_s='1' then
			wbs_ack_o<='0';
		   old_ack_s<='1';
		 else
	      wbs_ack_o<='0';
			old_ack_s<='0';
	    end if;
	 end process ack_wishbone_p;

    -- set the RAM writing adress
	 ram_pos_adress_p : process
	     VARIABLE detect : std_logic_vector(1 DOWNTO 0);
    begin
		wait until rising_edge(clk_i);
		detect(1) := detect(0);
      detect(0) := img_clk_i;
      if rst_i='1' or img_rst_i='1' then
          RAM_adress_s<="000000000";
	   elsif detect = "01" then
		   RAM_adress_s<=std_logic_vector(unsigned(RAM_adress_s)+1);
      end if;
	 end process;

	 -- handle the interrupt signal (could change)
	 int_sig_p : process
    begin
		wait until rising_edge(clk_i);
      if rst_i='1' then
          pod_irq_o<='0';
	   elsif wbs_adr_i="1111000000000000" and wbs_we_i='0' 
	     and wbs_stb_i='1' and wbs_cyc_i ='1' then
		    pod_irq_o<='0';
		-- signal the interruption before the half-RAM swap
	   elsif RAM_adress_s="011100000" or RAM_adress_s="111100000" then
		    pod_irq_o<='1';
      end if;
	 end process;

	 -- generating the adresses
	 addr_buf_s    <=wbs_adr_i(9 downto 0);
	 prgseg_addr_o <=wbs_adr_i(9 downto 0);
	 pt_addr_o     <=wbs_adr_i(9 downto 0);
	
	 -- buffer for the RAM entry
    buffer_data_in_s(7  downto 0 ) <= R_i;
	 buffer_data_in_s(15 downto 8 ) <= G_i;
	 buffer_data_in_s(23 downto 16) <= B_i;
	 buffer_data_in_s(31 downto 24) <= segm_i;

	-- RAMB16_S18_S36: Virtex-II/II-Pro, Spartan-3/3E 1k/512 x 16/32
	-- + 2/4 Parity bits Dual-Port RAM
   -- Xilinx HDL Language Template, version 10.1

   RAMB16_S18_S36_inst : RAMB16_S18_S36
   generic map (
      INIT_A => X"00000", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000000000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => X"00000", --  Port A ouput value upon SSR assertion
      SRVAL_B => X"000000000", --  Port B ouput value upon SSR assertion
      WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL", -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
      -- The following INIT_xx declarations specify the initial contents of the RAM
      -- Port A Address 0 to 255, Port B Address 0 to 127
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
      -- Port A Address 256 to 511, Port B Address 128 to 255
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
      -- Port A Address 512 to 767, Port B Address 256 to 383
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
      -- Port A Address 768 to 1023, Port B Address 384 to 511
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
      -- The next set of INITP_xx are for the parity bits
      -- Port A Address 0 to 255, Port B Address 0 to 127
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Port A Address 256 to 511, Port B Address 128 to 255
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Port A Address 512 to 767, Port B Address 256 to 383
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Port A Address 768 to 1023, Port B Address 384 to 511
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
	-- port A : wishbone side
      DOA   => RAM_data_o_s,       -- Port A 16-bit Data Output
      DOPA  => open,               -- Port A 2-bit Parity Output
      ADDRA => addr_buf_s,         -- Port A 10-bit Address Input
      CLKA  => wbs_clk_i,          -- Port A Clock
      DIA   => X"0000",            -- Port A 16-bit Data Input
		DIPA  => "00",               -- Port A 2-bit parity Input
		ENA   => '1',                -- Port A RAM Enable Input
      SSRA  => '0',                -- Port A Synchronous Set/Reset Input
		WEA   => '0',                -- Port A Write Enable Input
		
	-- port B: camera side
		DOB   => open,               -- Port B 32-bit Data Output
		DOPB  => open,               -- Port B 4-bit Parity Output
		ADDRB => RAM_adress_s,       -- Port B 9-bit Address Input
		CLKB  => clk_i,              -- Port B Clock
      DIB   => buffer_data_in_s,   -- Port B 32-bit Data Input
      DIPB  => X"0",               -- Port B 4-bit parity Input
      ENB   => img_clk_i,          -- Port B RAM Enable Input
      SSRB  => '0',                -- Port B Synchronous Set/Reset Input
      WEB   => '0'                 -- Port B Write Enable Input
   );

   -- End of RAMB16_S18_S36_inst instantiation
	 
end wishbone_interface_1; 
