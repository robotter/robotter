-----------------------------------------------------------------------------
-- Title      : RGB to Hue and light
-- Project    : Carte camera 2009
-----------------------------------------------------------------------------
-- File       : t_rgb2hy.vhdl
-- Author     : BLANCHARD Remy <remyb718 at gmail dot com>
-- Company    : Rob'Otter
-- Last update: 03/07/2008
-- Platform   : Spartan 3
-----------------------------------------------------------------------------
-- Description: Convert a pixel in the RGB colors space into an hue (H) and 
--              Light (Y)
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
-- | 1.05 | 18/01/09 | RBL  | Modification of the H's output size           |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
-- +------------------------------------------------------------------------+
-- |      |          |      |                                               |
-- +------------------------------------------------------------------------+

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY unisim;
USE unisim.vcomponents.all;

-----------------------------------------------------------------------------
ENTITY t_rgb2hy_vhd IS
-----------------------------------------------------------------------------
END t_rgb2hy_vhd;

-----------------------------------------------------------------------------
ARCHITECTURE behavior_1 OF t_rgb2hy_vhd IS 
-----------------------------------------------------------------------------

    -- Component Declaration for the Unit Under Test
    COMPONENT rgb2hy
    PORT(
      clk_i : IN  std_logic;
      R_i   : IN  unsigned (7 downto 0);
      G_i   : IN  unsigned (7 downto 0);
      B_i   : IN  unsigned (7 downto 0);          
      Y_o   : OUT unsigned (7 downto 0);
      H_o   : OUT unsigned (7 downto 0)
      );
    END COMPONENT;

    -- signals for connection
    signal clk_s : std_logic;
    signal R_s,G_s,B_s   : unsigned (7 downto 0);
    signal Y_s : unsigned (7 downto 0);
    signal H_s : unsigned (7 downto 0);

    -- timing constant
    constant periode_c : time := 10 ns;     -- 100 MHz


BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: rgb2hy PORT MAP(
      clk_i => clk_s,
      R_i => R_s,
      G_i => G_s,
      B_i => B_s,
      Y_o => Y_s,
      H_o => H_s
    );

    -- input: clock
    clock_p : PROCESS
    BEGIN
        clk_s <= '1', '0' after periode_c/2;
        wait for periode_c;
    end process clock_p;

    -- input: R
    R_entree_p : PROCESS
    begin
      R_s <= "00000000";
      wait for 120*periode_c;
      R_s <= "11111111";
      wait for 120*periode_c;
      R_s <= "01100100";
      wait for 120*periode_c;
      R_s <= "11111111";
      wait for 120*periode_c;
      R_s <= "00010000";
      wait for 120*periode_c;
      R_s <= "11111111";
      wait for 120*periode_c;
      R_s <= "01111111";
      wait for 120*periode_c;
    end process R_entree_p;

    -- input: G
    G_entree_p : PROCESS
    begin
      G_s <= "00000000";
      wait for 90*periode_c;
      G_s <= "00000000";
      wait for 90*periode_c;
      G_s <= "11111110";
      wait for 90*periode_c;
      G_s <= "11111111";
      wait for 90*periode_c;
      G_s <= "10000000";
      wait for 90*periode_c;
      G_s <= "00011001";
      wait for 90*periode_c;
      G_s <= "11111111";
      wait for 90*periode_c;
    end process G_entree_p;

    -- input: B
    B_entree_p : PROCESS
    begin
      B_s <= "00000000";
      wait for 60*periode_c;
      B_s <= "00000001";
      wait for 60*periode_c;
      B_s <= "11001000";
      wait for 60*periode_c;
      B_s <= "11111111";
      wait for 60*periode_c;
      B_s <= "00010000";
      wait for 60*periode_c;
      B_s <= "00011001";
      wait for 60*periode_c;
      B_s <= "00000000";
      wait for 60*periode_c;
    end process B_entree_p;

END;
