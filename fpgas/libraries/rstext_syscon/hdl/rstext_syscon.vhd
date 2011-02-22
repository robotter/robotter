---------------------------------------------------------------------------
-- Company     : ARMadeus Systems
-- Author(s)   : Fabien Marteau
-- 
-- Creation Date : 20/07/2008
-- File          : rstext_syscon.vhd
--
-- Abstract : wishbone syscon with external reset
--
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

---------------------------------------------------------------------------
Entity rstext_syscon is 
---------------------------------------------------------------------------
generic(
    invert_reset : std_logic := '0' -- 0 : not invert, 1: invert
);
port 
(
  -- external signals
  ext_clk :   in std_logic ;
  ext_rst_n : in std_logic ;
  --internal signals
  gls_clk :   out std_logic ;
  gls_reset : out std_logic 
);
end entity;


---------------------------------------------------------------------------
Architecture rstext_syscon_1 of rstext_syscon is
---------------------------------------------------------------------------
   signal rff1 : std_logic ; 
begin

    gls_clk <= ext_clk;

    reset_synchroniser : process (ext_clk,ext_rst_n)
    begin
        if ext_rst_n = not invert_reset then
            rff1 <= '1';
            gls_reset <= '1';
        elsif rising_edge(ext_clk) then
            rff1 <= '0';
            gls_reset <= rff1;
        end if;
    end process reset_synchroniser;
  
end architecture rstext_syscon_1;

