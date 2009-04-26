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
--!    - reset the interruption flag
--!        in write mode at adresses 0xF000 (for buffer ping),
--!        in write mode at adresses 0xF001 (for buffer pong),
--!
--!    - read the output RAM buffer for Red and Green
--!        in read mode for adresses from 0x0000 to 0x07FF (for buffer ping),
--!        in read mode for adresses from 0x1000 to 0x17FF (for buffer pong),
--!        (first 8 bits (from LSB) are for Red, last 8 bits are for Green)
--!    - read the output RAM buffer for Blue and Status flags
--!        in read mode for adresses from 0x2000 to 0x27FF (for buffer ping),
--!        in read mode for adresses from 0x3000 to 0x37FF (for buffer pong),
--!        (first 8 bits (from LSB) are for Blue, bit 9: camera line flag,
--!         bit 10: camera frame flag, bit 11: reset camera flag)
--!
--! This bloc also generate an interuption when the RAM is ready for reading
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
end wishbone_interface;

-----------------------------------------------------------------------
architecture wishbone_interface_1 of wishbone_interface is
-----------------------------------------------------------------------

-- declaration
	
	 -- the concatenation of R,G,B and the result of the segmentation
	 signal old_ack_s       : std_logic;

	 -- adresses for ram writing
	 signal RAM_w_adress_s  : std_logic_vector(10  downto 0);
	 signal eRAM_w_adress_s : std_logic_vector(11  downto 0);
	 
	 -- adresses for reading the RAM
	 signal RAM_adress_s    : std_logic_vector(10  downto 0);
	 
	 signal R_ping_val_s    : std_logic_vector(7  downto 0);
	 signal G_ping_val_s    : std_logic_vector(7  downto 0);
	 signal B_ping_val_s    : std_logic_vector(7  downto 0);
	 
	 signal R_pong_val_s    : std_logic_vector(7  downto 0);
	 signal G_pong_val_s    : std_logic_vector(7  downto 0);
	 signal B_pong_val_s    : std_logic_vector(7  downto 0);
	 
	 signal line_ping_s     : std_logic_vector(0  downto 0);
	 signal frame_ping_s    : std_logic_vector(0  downto 0);
	 signal rst_cam_ping_s  : std_logic_vector(0  downto 0);

	 signal line_pong_s     : std_logic_vector(0  downto 0);
	 signal frame_pong_s    : std_logic_vector(0  downto 0);
	 signal rst_cam_pong_s  : std_logic_vector(0  downto 0);
	 
	 signal vec_status_s    : std_logic_vector(2  downto 0);
	 signal vec_new_line_s  : std_logic_vector(0  downto 0);
	 signal vec_new_frame_s : std_logic_vector(0  downto 0);
	 signal vec_rst_camera_s: std_logic_vector(0  downto 0);
	 
	 -- intermediate signals
	 signal en_ping_s : std_logic;
	 signal en_pong_s : std_logic;
	 
begin
	-- found nothing else for conversion
	vec_status_s<= rst_camera_i&new_frame_i&new_line_i;
	vec_new_line_s  <=vec_status_s(0 downto 0);
	vec_new_frame_s <=vec_status_s(1 downto 1);
	vec_rst_camera_s<=vec_status_s(2 downto 2);

	 -- set the ouput
	 output_val_p : process
	 begin
	  wait until rising_edge(wbs_clk_i);
	  if    wbs_adr_i(15 downto 12)=X"0" and wbs_we_i='1' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
		wbs_dat_o     <= G_ping_val_s & R_ping_val_s;
	  elsif wbs_adr_i(15 downto 12)=X"1" and wbs_we_i='1' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
		wbs_dat_o     <= G_pong_val_s & R_pong_val_s;
	  elsif wbs_adr_i(15 downto 12)=X"2" and wbs_we_i='1' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
	  	wbs_dat_o     <= "00000"& rst_cam_ping_s &
			frame_ping_s& line_ping_s & B_ping_val_s;
	  elsif wbs_adr_i(15 downto 12)=X"3" and wbs_we_i='1' 
	  and wbs_stb_i='1' and wbs_cyc_i ='1' then
	  	wbs_dat_o     <= "00000"& rst_cam_pong_s &
			frame_pong_s& line_pong_s & B_pong_val_s;
	  else
	  	wbs_dat_o     <= wbs_dat_i;
	  end if;
	 end process output_val_p;
	 
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

	 -- handle the interrupt signal
	 int_sig_p : process
    begin
		wait until rising_edge(clk_i);
      if rst_i='1' or wbs_rst_i='1' then
          pod_irq_ping_o<='0';
			 pod_irq_pong_o<='0';
	   elsif wbs_adr_i="1111000000000000" and wbs_we_i='0' 
	     and wbs_stb_i='1' and wbs_cyc_i ='1' then
		    pod_irq_ping_o<='0';
	   elsif wbs_adr_i="1111000000000001" and wbs_we_i='0' 
	     and wbs_stb_i='1' and wbs_cyc_i ='1' then
		    pod_irq_pong_o<='0';
		-- signal the interruption before the end of ping
	   elsif eRAM_w_adress_s="011111111111" then
		    pod_irq_pong_o<='1';
		-- signal the interruption before the end of pong
	   elsif eRAM_w_adress_s="111111111111" then
		    pod_irq_pong_o<='1';
      end if;
	 end process;

    -- set the RAM writing adress
	 ram_pos_adress_p : process
	     VARIABLE detect : std_logic_vector(1 DOWNTO 0);
    begin
		wait until rising_edge(clk_i);
		detect(1) := detect(0);
      detect(0) := img_clk_i;
      if rst_i='1' then
          eRAM_w_adress_s<="000000000000";
	   elsif detect = "01" then
		   eRAM_w_adress_s<=std_logic_vector(unsigned(eRAM_w_adress_s)+1);
      end if;
	 end process;

	RAM_adress_s<=wbs_adr_i(10 downto 0);

	RAM_w_adress_s<=eRAM_w_adress_s(10 downto 0);
	
-- ***********************************
-- ***********************************
-- *****       PING BUFFER       *****
-- ***********************************
-- ***********************************
   en_ping_s <= not(eRAM_w_adress_s(11)) and img_clk_i;
   R_ping_inst : RAMB16_S9_S9
   generic map (
      INIT_A => X"000", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => X"000", --  Port A ouput value upon SSR assertion
      SRVAL_B => X"000", --  Port B ouput value upon SSR assertion
      WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL") -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
   port map (
	-- port A : wishbone side
      DOA => R_ping_val_s,      -- Port A 8-bit Data Output
      DOPA => line_ping_s,  -- Port A 1-bit Parity Output
      ADDRA => RAM_adress_s,  -- Port A 11-bit Address Input
      CLKA => wbs_clk_i,    -- Port A Clock
      DIA => X"00",      -- Port A 8-bit Data Input
      DIPA => "0",    -- Port A 1-bit parity Input
      ENA => '1',      -- Port A RAM Enable Input
      SSRA => '0',    -- Port A Synchronous Set/Reset Input  
      WEA => '0',      -- Port A Write Enable Input
		
    -- port B: camera side
		DOB => open,      -- Port B 8-bit Data Output
		DOPB => open,    -- Port B 1-bit Parity Output
		ADDRB => RAM_w_adress_s,  -- Port B 11-bit Address Input
		CLKB => clk_i,    -- Port B Clock
		DIB => R_i,      -- Port B 8-bit Data Input
		DIPB => vec_new_line_s,    -- Port-B 1-bit parity Input
		ENB => en_ping_s,      -- PortB RAM Enable Input
		SSRB => '0',    -- Port B Synchronous Set/Reset Input
		WEB => '1'       -- Port B Write Enable Input
   );

	G_ping_inst : RAMB16_S9_S9
   generic map (
      INIT_A => X"000", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => X"000", --  Port A ouput value upon SSR assertion
      SRVAL_B => X"000", --  Port B ouput value upon SSR assertion
      WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL") -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
   port map (
	-- port A : wishbone side
      DOA => G_ping_val_s,      -- Port A 8-bit Data Output
      DOPA => frame_ping_s,  -- Port A 1-bit Parity Output
      ADDRA => RAM_adress_s,  -- Port A 11-bit Address Input
      CLKA => wbs_clk_i,    -- Port A Clock
      DIA => X"00",      -- Port A 8-bit Data Input
      DIPA => "0",    -- Port A 1-bit parity Input
      ENA => '1',      -- Port A RAM Enable Input
      SSRA => '0',    -- Port A Synchronous Set/Reset Input  
      WEA => '0',      -- Port A Write Enable Input
		
    -- port B: camera side
		DOB => open,      -- Port B 8-bit Data Output
		DOPB => open,    -- Port B 1-bit Parity Output
		ADDRB => RAM_w_adress_s,  -- Port B 11-bit Address Input
		CLKB => clk_i,    -- Port B Clock
		DIB => G_i,      -- Port B 8-bit Data Input
		DIPB => vec_new_frame_s,    -- Port-B 1-bit parity Input
		ENB => en_ping_s,      -- PortB RAM Enable Input
		SSRB => '0',    -- Port B Synchronous Set/Reset Input
		WEB => '1'       -- Port B Write Enable Input
   );

B_ping_inst : RAMB16_S9_S9
   generic map (
      INIT_A => X"000", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => X"000", --  Port A ouput value upon SSR assertion
      SRVAL_B => X"000", --  Port B ouput value upon SSR assertion
      WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL") -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
   port map (
	-- port A : wishbone side
      DOA => B_ping_val_s,      -- Port A 8-bit Data Output
      DOPA => rst_cam_ping_s,  -- Port A 1-bit Parity Output
      ADDRA => RAM_adress_s,  -- Port A 11-bit Address Input
      CLKA => wbs_clk_i,    -- Port A Clock
      DIA => X"00",      -- Port A 8-bit Data Input
      DIPA => "0",    -- Port A 1-bit parity Input
      ENA => '1',      -- Port A RAM Enable Input
      SSRA => '0',    -- Port A Synchronous Set/Reset Input  
      WEA => '0',      -- Port A Write Enable Input
		
    -- port B: camera side
		DOB => open,      -- Port B 8-bit Data Output
		DOPB => open,    -- Port B 1-bit Parity Output
		ADDRB => RAM_w_adress_s,  -- Port B 11-bit Address Input
		CLKB => clk_i,    -- Port B Clock
		DIB => B_i,      -- Port B 8-bit Data Input
		DIPB => vec_rst_camera_s,    -- Port-B 1-bit parity Input
		ENB => en_ping_s,      -- PortB RAM Enable Input
		SSRB => '0',    -- Port B Synchronous Set/Reset Input
		WEB => '1'       -- Port B Write Enable Input
   );
	

-- ***********************************
-- ***********************************
-- *****       PONG BUFFER       *****
-- ***********************************
-- ***********************************
   en_pong_s <= eRAM_w_adress_s(11) and img_clk_i;
   R_pong_inst : RAMB16_S9_S9
   generic map (
      INIT_A => X"000", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => X"000", --  Port A ouput value upon SSR assertion
      SRVAL_B => X"000", --  Port B ouput value upon SSR assertion
      WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL") -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
   port map (
	-- port A : wishbone side
      DOA => R_pong_val_s,      -- Port A 8-bit Data Output
      DOPA => line_pong_s,  -- Port A 1-bit Parity Output
      ADDRA => RAM_adress_s,  -- Port A 11-bit Address Input
      CLKA => wbs_clk_i,    -- Port A Clock
      DIA => X"00",      -- Port A 8-bit Data Input
      DIPA => "0",    -- Port A 1-bit parity Input
      ENA => '1',      -- Port A RAM Enable Input
      SSRA => '0',    -- Port A Synchronous Set/Reset Input  
      WEA => '0',      -- Port A Write Enable Input
		
    -- port B: camera side
		DOB => open,      -- Port B 8-bit Data Output
		DOPB => open,    -- Port B 1-bit Parity Output
		ADDRB => RAM_w_adress_s,  -- Port B 11-bit Address Input
		CLKB => clk_i,    -- Port B Clock
		DIB => R_i,      -- Port B 8-bit Data Input
		DIPB => vec_new_line_s,    -- Port-B 1-bit parity Input
		ENB => en_pong_s,      -- PortB RAM Enable Input
		SSRB => '0',    -- Port B Synchronous Set/Reset Input
		WEB => '1'       -- Port B Write Enable Input
   );

	G_pong_inst : RAMB16_S9_S9
   generic map (
      INIT_A => X"000", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => X"000", --  Port A ouput value upon SSR assertion
      SRVAL_B => X"000", --  Port B ouput value upon SSR assertion
      WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL") -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
   port map (
	-- port A : wishbone side
      DOA => G_pong_val_s,      -- Port A 8-bit Data Output
      DOPA => frame_pong_s,  -- Port A 1-bit Parity Output
      ADDRA => RAM_adress_s,  -- Port A 11-bit Address Input
      CLKA => wbs_clk_i,    -- Port A Clock
      DIA => X"00",      -- Port A 8-bit Data Input
      DIPA => "0",    -- Port A 1-bit parity Input
      ENA => '1',      -- Port A RAM Enable Input
      SSRA => '0',    -- Port A Synchronous Set/Reset Input  
      WEA => '0',      -- Port A Write Enable Input
		
    -- port B: camera side
		DOB => open,      -- Port B 8-bit Data Output
		DOPB => open,    -- Port B 1-bit Parity Output
		ADDRB => RAM_w_adress_s,  -- Port B 11-bit Address Input
		CLKB => clk_i,    -- Port B Clock
		DIB => G_i,      -- Port B 8-bit Data Input
		DIPB => vec_new_frame_s,    -- Port-B 1-bit parity Input
		ENB => en_pong_s,      -- PortB RAM Enable Input
		SSRB => '0',    -- Port B Synchronous Set/Reset Input
		WEB => '1'       -- Port B Write Enable Input
   );

B_pong_inst : RAMB16_S9_S9
   generic map (
      INIT_A => X"000", --  Value of output RAM registers on Port A at startup
      INIT_B => X"000", --  Value of output RAM registers on Port B at startup
      SRVAL_A => X"000", --  Port A ouput value upon SSR assertion
      SRVAL_B => X"000", --  Port B ouput value upon SSR assertion
      WRITE_MODE_A => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "ALL") -- "NONE", "WARNING", "GENERATE_X_ONLY", "ALL" 
   port map (
	-- port A : wishbone side
      DOA => B_pong_val_s,      -- Port A 8-bit Data Output
      DOPA => rst_cam_pong_s,  -- Port A 1-bit Parity Output
      ADDRA => RAM_adress_s,  -- Port A 11-bit Address Input
      CLKA => wbs_clk_i,    -- Port A Clock
      DIA => X"00",      -- Port A 8-bit Data Input
      DIPA => "0",    -- Port A 1-bit parity Input
      ENA => '1',      -- Port A RAM Enable Input
      SSRA => '0',    -- Port A Synchronous Set/Reset Input  
      WEA => '0',      -- Port A Write Enable Input
		
    -- port B: camera side
		DOB => open,      -- Port B 8-bit Data Output
		DOPB => open,    -- Port B 1-bit Parity Output
		ADDRB => RAM_w_adress_s,  -- Port B 11-bit Address Input
		CLKB => clk_i,    -- Port B Clock
		DIB => B_i,      -- Port B 8-bit Data Input
		DIPB => vec_rst_camera_s,    -- Port-B 1-bit parity Input
		ENB => en_pong_s,      -- PortB RAM Enable Input
		SSRB => '0',    -- Port B Synchronous Set/Reset Input
		WEB => '1'       -- Port B Write Enable Input
   );
	 
end wishbone_interface_1; 
