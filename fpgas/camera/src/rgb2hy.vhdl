-----------------------------------------------------------------------------
-- Title      : RGB to Hue and light
-- Project    : Carte camera 2009
-----------------------------------------------------------------------------
-- File       : rgb2hy.vhdl
-- Author     : BLANCHARD Remy <remyb718 at gmail dot com>
-- Company    : Rob'Otter
-- Last update: 03/07/2008
-- Platform   : Spartan 3
-----------------------------------------------------------------------------
-- Description: Convert a pixel in the RGB colors space into an hue (H) and 
--              Light (Y)
--                  TODO: Timing synchronisation
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
-- | 1.00 | 17/03/08 | RBL  | Creation                                      |
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
entity rgb2hy is
-----------------------------------------------------------------------
    port (
        clk_i          : in  std_ulogic;
        -- camera RGB input
        R_i            : in  unsigned (7 downto 0);
        G_i            : in  unsigned (7 downto 0);
        B_i            : in  unsigned (7 downto 0);
        -- new color space outputs
        Y_o            : out unsigned (7 downto 0);
        H_o            : out unsigned (8 downto 0)
    );
end rgb2hy;

-----------------------------------------------------------------------
architecture rgb2hy_1 of rgb2hy is
-----------------------------------------------------------------------

-- declaration

    -- for Y

    -- the R, G and B constants to determine Y
    CONSTANT R_coef_c: unsigned := "010011001";
    CONSTANT G_coef_c: unsigned := "100101101";
    CONSTANT B_coef_c: unsigned := "000111010";

    -- R,G and B after the constant multiplication
    signal R_output_s: unsigned (16 downto 0);
    signal G_output_s: unsigned (16 downto 0);
    signal B_output_s: unsigned (16 downto 0);

    -- sum of {R,G,B}_output_s (keep the first part of this signal for Y)
    signal Y_large_s : unsigned (17 downto 0);

    -- for H
    -- to find Min and the max of R,G,B
    signal min_s: integer range 0 to 255;
    signal max_s: integer range 0 to 255;

    -- variables to calculate H
    signal diff_min_max_s: integer range 0 to 255;
    signal diff_nominat_s: integer range -255 to 255;
    signal offset_s      : integer range 0 to 400;

    -- variables for types convertion
    signal R_int_s: integer range 0 to 255;
    signal G_int_s: integer range 0 to 255;
    signal B_int_s: integer range 0 to 255;

    -- variables for RAM query
    signal RAM_in_s : STD_LOGIC_VECTOR (9 downto 0);
    signal RAM_out_s: STD_LOGIC_VECTOR (15 downto 0);

    -- output of the multiplication RAM_out_s*diff_nominat_s
    signal H_large_s: signed (25 downto 0);
	 -- H_large_s+offset_s
    signal H_bias_s : signed (16 downto 0);
	
begin
    -- the main program

 --  Y = 0,299.R + 0,587.V + 0,114.B
 -- Q9 format:
 --  Y = 010011001.R + 100101101.V + 000111010.B
 -- size optimisations:
 --  - do it in 3 cycles
 --  - Y=R+G+B
 -- speed optimisation:
 --  - Y=R+G+B

    R_output_s<=R_i*R_coef_c;
    G_output_s<=G_i*G_coef_c;
    B_output_s<=B_i*B_coef_c;

    Y_large_s<=resize(R_output_s,18)+resize(G_output_s,18)+resize(B_output_s,18);
    Y_o<=Y_large_s(16 downto 9);

 -- H =
 -- 0 if min=max
 -- 60x(g-b)/(max-min)        if max=r et g>=b
 -- 60x(g-b)/(max-min)+360    if max=r et g<b
 -- 60x(b-r)/(max-min)+120    if max=g
 -- 60x(r-g)/(max-min)+240    if max=b

    -- type convertion
    R_int_s<=to_integer(R_i);
    G_int_s<=to_integer(G_i);
    B_int_s<=to_integer(B_i);
	 
    -- the minimum
    min_s<= R_int_s when (R_int_s<=G_int_s and R_int_s<=B_int_s) else 
            G_int_s when (G_int_s<=R_int_s and G_int_s<=B_int_s) else 
            B_int_s;

    -- the maximum
    max_s<= R_int_s when (R_int_s>=G_int_s and R_int_s>=B_int_s) else
            G_int_s when (G_int_s>=R_int_s and G_int_s>=B_int_s) else
            B_int_s;

    -- the difference between max and min
    diff_min_max_s<=max_s-min_s;

    -- the nominator (see H definition)
    diff_nominat_s<=
          G_int_s-B_int_s when (R_int_s>=G_int_s and R_int_s>=B_int_s) else
          B_int_s-R_int_s when (G_int_s>=R_int_s and G_int_s>=B_int_s) else
          R_int_s-G_int_s;

    -- the offset={0,120,140,360} (see H definition)
    offset_s<=
     0 when (R_int_s>=G_int_s and R_int_s>=B_int_s and G_int_s>=B_int_s) else
     360 when (R_int_s>=G_int_s and R_int_s>=B_int_s) else
     120 when (G_int_s>=R_int_s and G_int_s>=B_int_s) else
     240;

    -- the entry of the bloc RAM
    RAM_in_s<="00"&std_logic_vector(to_unsigned(diff_min_max_s,8));
	 -- effective computation of H (see H definition)
    H_large_s<=signed("0"&RAM_out_s)*to_signed(diff_nominat_s,9);
    H_bias_s<=H_large_s(25 downto 9)+to_signed(offset_s,17);
    H_o<=unsigned(H_bias_s(8 downto 0));
	 

-- the output of this bloc RAM is (60/RAM_in)*2^10

    -- RAMB16_S18: Virtex-II/II-Pro, Spartan-3 1k x 16 + 2 Parity bits Single-Port RAM
    RAMB16_S18_inst : RAMB16_S18
    generic map (
      INIT => X"00000", --  Value of output RAM registers at startup
      SRVAL => X"00000", --  Ouput value upon SSR assertion
      WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      INIT_00 => X"100011241276140015d118001aaa1e002249280030003c0050007800f0000000",
      INIT_01 => X"07bd08000846089208e3093b09990a000a6f0ae80b6d0c000ca10d550e1e0f00",
      INIT_02 => X"051b053705550574059405b605da060006270650067c06aa06db070f07450780",
      INIT_03 => X"03cf03de03ef04000411042304350449045d04710487049d04b404cc04e50500",
      INIT_04 => X"03090313031d03280333033e034903550361036d037a0387039503a203b103c0",
      INIT_05 => X"0286028d0294029b02a302aa02b202ba02c202ca02d202db02e402ed02f60300",
      INIT_06 => X"0229022e02330238023e02430249024e0254025a02600266026c027202790280",
      INIT_07 => X"01e301e701eb01ef01f301f701fb020002040208020d02110216021a021f0224",
      INIT_08 => X"01ad01b001b301b601ba01bd01c001c301c701ca01cd01d101d501d801dc01e0",
      INIT_09 => X"0182018401870189018c018e0191019401960199019c019f01a101a401a701aa",
      INIT_0A => X"015f01610163016501670169016b016d016f0172017401760178017b017d0180",
      INIT_0B => X"01410143014501460148014a014c014d014f01510153015501570159015b015d",
      INIT_0C => X"0128012a012b012d012e0130013101330134013601370139013b013c013e0140",
      INIT_0D => X"011301140116011701180119011b011c011d011f012001210123012401250127",
      INIT_0E => X"010101020103010401050106010701080109010b010c010d010e010f01110112",
      INIT_0F => X"00f000f100f200f300f400f500f600f700f800f900fa00fb00fc00fd00fe0100",
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
      DO => RAM_out_s,      -- 16-bit Data Output
      DOP => open,    -- 2-bit parity Output
      ADDR => RAM_in_s,  -- 10-bit Address Input
      CLK => clk_i,    -- Clock
      DI => X"0000",      -- 16-bit Data Input
      DIP => "00",    -- 2-bit parity Input
      EN => '1',      -- RAM Enable Input
      SSR => '0',    -- Synchronous Set/Reset Input
      WE => '0'       -- Write Enable Input
    ); 
 
end rgb2hy_1; 

