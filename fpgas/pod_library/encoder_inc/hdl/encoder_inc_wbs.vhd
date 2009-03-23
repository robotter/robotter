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
--! @author ~ryder <benoit@ryder.fr>
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--! Incremental coder wishbone interface
--!
--! 5 byte registers are written. The first 4 bytes are angle value, big
--! endian. The last byte is module ID.
--! Thus, if angle value is 0x12345678 and ID is 0x1D, register values are:
--!   0x12 0x34 0x56 0x78 0x1D
entity encoder_inc_wbs is

  generic (
    id_c : natural := 5  --! module ID
  );
  port (
    --! Wishbone interface
    wbs_rst_i : in  std_logic;
    wbs_clk_i : in  std_logic;
    wbs_adr_i : in  std_logic_vector(2 downto 0);
    wbs_dat_o : out std_logic_vector(7 downto 0);
    wbs_we_i  : in  std_logic;
    wbs_stb_i : in  std_logic;
    wbs_ack_o : out std_logic;
    wbs_cyc_i : in  std_logic;

    --! Angle value
    angle_i   : in  integer
  );

end entity encoder_inc_wbs;


architecture encoder_inc_wbs_1 of encoder_inc_wbs is
  signal angle_reg_s : std_logic_vector(31 downto 0);
begin

  angle_reg_s <= std_logic_vector(to_signed(angle_i, 32));

  write_angle_p : process (wbs_clk_i, wbs_rst_i)
  begin

    if wbs_rst_i = '1' then
      wbs_dat_o <= (others => '0');
      wbs_ack_o <= '0';

    elsif rising_edge(wbs_clk_i) then
      if wbs_stb_i = '1' and wbs_we_i = '0' then
        case wbs_adr_i is
          when "000"  => wbs_dat_o <= angle_reg_s(31 downto 24);
          when "001"  => wbs_dat_o <= angle_reg_s(23 downto 16);
          when "010"  => wbs_dat_o <= angle_reg_s(15 downto  8);
          when "011"  => wbs_dat_o <= angle_reg_s( 7 downto  0);
          when others => wbs_dat_o <= std_logic_vector(to_unsigned(id_c, 8));
        end case;
        wbs_ack_o <= '1';
      else
        wbs_ack_o <= '0';
      end if;

    end if;

  end process write_angle_p;

end architecture encoder_inc_wbs_1;

