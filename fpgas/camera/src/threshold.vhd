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
--! @file threshold.vhd
--! @brief Threshold bloc
--! @author BLANCHARD Remy <remyb718 at gmail dot com>
--! @platform Spartan 3
--!
--! Platform   : Spartan 3
--!
--! Determine if the input are in or outside the wanted values
--! This bloc uses a block RAM per entry and a "AND" door: the 
--! value must within range for all inputs.
--! Optimisation: only one RAM bloc can be used
-----------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

-----------------------------------------------------------------------
entity threshold is
-----------------------------------------------------------------------
    port (
        clk_i          : in  std_ulogic;
        -- input to be tested
        Y_i            : in  std_logic_vector(8 downto 0);
        H_i            : in  std_logic_vector(8 downto 0);

        -- threshold modifier (modify bloc RAM inside)
        valid_i        : in  std_ulogic; -- write RAM if active
		  value_i        : in  std_logic_vector(15 downto 0);
		  -- for adress_i: MSB=1 modify Y Look-Up Table else H LUT
        adress_i       : in  std_logic_vector(9 downto 0); 

        -- vector of all threshold result
        result_o       : out std_logic_vector(15 downto 0) --latched
    );
end threshold;

-----------------------------------------------------------------------
architecture threshold_1 of threshold is
-----------------------------------------------------------------------

-- declaration

    -- Y memory signals
    signal Y_thres_s    : std_logic_vector(15 downto 0);
    signal Y_ADDR_A_s   : std_logic_vector(9 downto 0);
    signal Y_ADDR_B_s   : std_logic_vector(9 downto 0);
    signal Y_enable_B_s : std_ulogic;

    signal H_thres_s    : std_logic_vector(15 downto 0);
    signal H_ADDR_A_s   : std_logic_vector(9 downto 0);
    signal H_ADDR_B_s   : std_logic_vector(9 downto 0);
    signal H_enable_B_s : std_ulogic;

begin
    -- the main program

    -- Y memory signals
	 Y_ADDR_A_s <= "0"&Y_i;
    Y_ADDR_B_s <= "0"&adress_i(8 downto 0);
    Y_enable_B_s <=adress_i(9) and valid_i;

    -- RAMB16_S18_S18: Spartan-3 1k x 16 + 2 Parity bits Dual-Port RAM
    RAMB16_Y_inst : RAMB16_S18_S18
    generic map (
		--  Value of output RAM registers at startup
      INIT_A => "000000000000000000", 
      INIT_B => "000000000000000000"
		)
    port map (
		-- PORT A: Threshold
      DOA   => Y_thres_s,     -- 16-bit Data Output
      DOPA  => open,          -- 2-bit parity Output
      ADDRA => Y_ADDR_A_s,    -- 10-bit Address Input
      CLKA  => clk_i,         -- Clock
      DIA   => X"0000",       -- 16-bit Data Input
      DIPA  => "00",          -- 2-bit parity Input
      ENA   => '1',           -- RAM Enable Input
      SSRA  => '0',           -- Synchronous Set/Reset Input
      WEA   => '0',           -- Write Enable Input
		
		-- PORT B: modification
      DOB   => open,          -- 16-bit Data Output
      DOPB  => open,          -- 2-bit parity Output
      ADDRB => Y_ADDR_B_s,    -- 10-bit Address Input
      CLKB  => clk_i,         -- Clock
      DIB   => value_i,       -- 16-bit Data Input
      DIPB  => "00",          -- 2-bit parity Input
      ENB   => Y_enable_B_s,  -- RAM Enable Input
      SSRB  => '0',           -- Synchronous Set/Reset Input
      WEB   => '1'            -- Write Enable Input
    ); 
	 
	 
   -- H memory signals
	 H_ADDR_A_s <= "0"&H_i;
    H_ADDR_B_s <= "0"&adress_i(8 downto 0);
    H_enable_B_s <=not(adress_i(9)) and valid_i;

    -- RAMB16_S18_S18: Spartan-3 1k x 16 + 2 Parity bits Dual-Port RAM
    RAMB16_H_inst : RAMB16_S18_S18
    generic map (
		--  Value of output RAM registers at startup
      INIT_A => "000000000000000000", 
      INIT_B => "000000000000000000"
	)
    port map (
		-- PORT A: Threshold
      DOA   => H_thres_s,     -- 16-bit Data Output
      DOPA  => open,          -- 2-bit parity Output
      ADDRA => H_ADDR_A_s,    -- 10-bit Address Input
      CLKA  => clk_i,         -- Clock
      DIA   => X"0000",       -- 16-bit Data Input
      DIPA  => "00",          -- 2-bit parity Input
      ENA   => '1',           -- RAM Enable Input
      SSRA  => '0',           -- Synchronous Set/Reset Input
      WEA   => '0',           -- Write Enable Input
		
		-- PORT B: modification
      DOB   => open,          -- 16-bit Data Output
      DOPB  => open,          -- 2-bit parity Output
      ADDRB => H_ADDR_B_s,    -- 10-bit Address Input
      CLKB  => clk_i,         -- Clock
      DIB   => value_i,       -- 16-bit Data Input
      DIPB  => "00",          -- 2-bit parity Input
      ENB   => H_enable_B_s,  -- RAM Enable Input
      SSRB  => '0',           -- Synchronous Set/Reset Input
      WEB   => '1'            -- Write Enable Input
    ); 
	 
    -- output = true => H_thres_s && Y_thres_s
    latch_out_p : process
	 begin
        wait until rising_edge(clk_i);
		  result_o <= H_thres_s and Y_thres_s;
    end process latch_out_p;
	 
end threshold_1; 

