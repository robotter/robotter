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
--! @file rgb2hy.vhd
--! @brief RGB to Hue and light
--! @author BLANCHARD Remy <remyb718 at gmail dot com>
--!
--! Platform   : Spartan 3
--!
--! Description: Convert a pixel in the RGB colors space into an hue (H) and 
--!        Light (Y)
--!          TODO: Timing synchronisation
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

-----------------------------------------------------------------------
entity rgb2hy is
-----------------------------------------------------------------------
  port (
    clk_i      : in  std_ulogic;
    -- camera RGB input
    R_i        : in  unsigned (7 downto 0);
    G_i        : in  unsigned (7 downto 0);
    B_i        : in  unsigned (7 downto 0);
    -- new color space outputs
    Y_o        : out unsigned (7 downto 0);
    H_o        : out unsigned (7 downto 0)
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
  signal offset_s    : integer range 0 to 400;

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
 -- 60x(g-b)/(max-min)    if max=r et g>=b
 -- 60x(g-b)/(max-min)+360  if max=r et g<b
 -- 60x(b-r)/(max-min)+120  if max=g
 -- 60x(r-g)/(max-min)+240  if max=b
 -- after modification:
 -- in order the change the bus width 
 -- before modification: H in [0; 360[
 -- after the affine correction modification: H in [0; 256[
 -- H =
 -- 0 if min=max
 -- 42.67x(g-b)/(max-min)    if max=r et g>=b
 -- 42.67x(g-b)/(max-min)+256  if max=r et g<b
 -- 42.67x(b-r)/(max-min)+85.33  if max=g
 -- 42.67x(r-g)/(max-min)+170.67 if max=b

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

  -- the offset={0,85,171,256} (see H definition)
  offset_s<=
    0 when (R_int_s>=G_int_s and R_int_s>=B_int_s and G_int_s>=B_int_s) else
    256 when (R_int_s>=G_int_s and R_int_s>=B_int_s) else
    85  when (G_int_s>=R_int_s and G_int_s>=B_int_s) else
    171;
 
  -- the entry of the bloc RAM
  RAM_in_s<="00"&std_logic_vector(to_unsigned(diff_min_max_s,8));
	 -- effective computation of H (see H definition)
  H_large_s<=signed("0"&RAM_out_s)*to_signed(diff_nominat_s,9);
  H_bias_s<=H_large_s(25 downto 9)+to_signed(offset_s,17);
  H_o<=unsigned(H_bias_s(7 downto 0));
	 

-- the output of this bloc RAM is (60/RAM_in)*2^10
-- modification of the formulae: (42/RAM_in)*2^10

  -- RAMB16_S18: Virtex-II/II-Pro, Spartan-3 1k x 16 + 2 Parity bits Single-Port RAM
  RAMB16_S18_inst : RAMB16_S18
  generic map (
    INIT => X"00000", --  Value of output RAM registers at startup
    SRVAL => X"00000", --  Ouput value upon SSR assertion
    WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
    INIT_00 => X"0001AAAA555538E32AAA22221C711861155512F611110F830E380D200C300B60",
    INIT_01 => X"0AAA0A0A097B08FB0888082007C1076B071C06D306900652061805E205B00581",
    INIT_02 => X"0555052B050504E004BD049C047D046004440429041003F803E003CA03B503A1",
    INIT_03 => X"038E037B03690358034803380329031A030C02FE02F102E402D802CC02C002B5",
    INIT_04 => X"02AA02A00295028C0282027902700267025E0256024E0246023E023702300229",
    INIT_05 => X"0222021B0214020E0208020201FC01F601F001EA01E501E001DA01D501D001CB",
    INIT_06 => X"01C701C201BD01B901B401B001AC01A801A401A0019C019801940190018D0189",
    INIT_07 => X"01860182017F017B017801750172016F016C0169016601630160015D015A0158",
    INIT_08 => X"015501520150014D014A0148014601430141013E013C013A0138013501330131",
    INIT_09 => X"012F012D012B01290127012501230121011F011D011B01190118011601140112",
    INIT_0A => X"0111010F010D010C010A01080107010501040102010100FF00FE00FC00FB00F9",
    INIT_0B => X"00F800F600F500F400F200F100F000EE00ED00EC00EA00E900E800E700E500E4",
    INIT_0C => X"00E300E200E100E000DE00DD00DC00DB00DA00D900D800D700D600D500D400D3",
    INIT_0D => X"00D200D100D000CF00CE00CD00CC00CB00CA00C900C800C700C600C500C400C3",
    INIT_0E => X"00C300C200C100C000BF00BE00BD00BD00BC00BB00BA00B900B900B800B700B6",
    INIT_0F => X"00B600B500B400B300B300B200B100B000B000AF00AE00AE00AD00AC00AC00AB",
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
    DO => RAM_out_s,    -- 16-bit Data Output
    DOP => open,  -- 2-bit parity Output
    ADDR => RAM_in_s,  -- 10-bit Address Input
    CLK => clk_i,  -- Clock
    DI => X"0000",    -- 16-bit Data Input
    DIP => "00",  -- 2-bit parity Input
    EN => '1',    -- RAM Enable Input
    SSR => '0',  -- Synchronous Set/Reset Input
    WE => '0'     -- Write Enable Input
  ); 
 
end rgb2hy_1; 

