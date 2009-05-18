---------------------------------------------------------------------------
-- Company     : Vim Inc
-- Author(s)   : Fabien Marteau
-- 
-- Creation Date : 23/04/2008
-- File          : atmega_pkg.vhd
--
-- Abstract : Simulate atmega128 read and write
--
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


package atmega_emi_pkg is
    procedure atmega_write(
        Address : in std_logic_vector( 15 downto 0);
        value   : in std_logic_vector( 7 downto 0);
        signal clk : in std_logic ;
        signal Address_H : out std_logic_vector( 6 downto 0);
        signal DA  : inout std_logic_vector( 7 downto 0);
        signal ALE : out std_logic ;
        signal RD  : out std_logic ;
        signal WR  : out std_logic ;
        signal DIR_buffer : in std_logic ;
        wait_states : natural
        );
        
    procedure atmega_read(
        Address : in std_logic_vector( 15 downto 0);
        signal value : out std_logic_vector( 7 downto 0);
        signal clk : in std_logic ;
        signal Address_H : out std_logic_vector( 6 downto 0);
        signal DA : inout std_logic_vector( 7 downto 0);
        signal ALE : out std_logic ;
        signal RD  : out std_logic ;
        signal WR  : out std_logic ;
        signal DIR_buffer : in std_logic ;
        wait_states : natural
        );

end package atmega_emi_pkg;

package body atmega_emi_pkg is

    CONSTANT TCLCL : time :=62 ns; -- 16 MHz

    --Write value
    procedure atmega_write(
        Address : in std_logic_vector( 15 downto 0);
        value   : in std_logic_vector( 7 downto 0);
        signal clk : in std_logic ;
        signal Address_H : out std_logic_vector( 6 downto 0);
        signal DA  : inout std_logic_vector( 7 downto 0);
        signal ALE : out std_logic ;
        signal RD  : out std_logic ;
        signal WR  : out std_logic ;
        signal DIR_buffer : in std_logic ;
        wait_states : natural
        ) is
    begin
        WR <= '1';
        RD <= '1';
        wait until falling_edge(clk);
        ALE <= '1';
        wait until rising_edge(clk);
        Address_H <= Address(14 downto 8);
        DA <=  Address(7 downto 0);
        wait until falling_edge(clk);
        ALE <= '0';
        wait for 5 ns;
        DA <= (others => 'Z');
        wait until rising_edge(clk);
        DA <= value;
        -- 0.5TCLCL - 20 ns
        wait for 0.5*TCLCL - 20 ns;
        WR <= '0';
        wait until falling_edge(clk);
        wait until rising_edge(clk);

        if wait_states >= 0 then
          for n in 1 to wait_states loop
            wait until rising_edge(clk);
          end loop;
        end if;

        WR <= '1';
        wait until falling_edge(clk);
        DA <= (others => 'Z');
        Address_H <= (others => 'Z');

    end procedure atmega_write;

    --Read value
    procedure atmega_read(
        Address : in std_logic_vector( 15 downto 0);
        signal value : out std_logic_vector( 7 downto 0);
        signal clk : in std_logic ;
        signal Address_H : out std_logic_vector( 6 downto 0);
        signal DA : inout std_logic_vector( 7 downto 0);
        signal ALE : out std_logic ;
        signal RD  : out std_logic ;
        signal WR  : out std_logic ;
        signal DIR_buffer : in std_logic ;
        wait_states : natural
        ) is
    begin
        RD <=  '1';
        WR <=  '1';
        wait until falling_edge(clk);
        ALE <= '1';
        wait until rising_edge(clk);
        Address_H <= Address(14 downto 8);
        DA <=  Address(7 downto 0);
        wait until falling_edge(clk);
        ALE <= '0';
        wait for 5 ns;
        DA <= (others => 'Z');
        wait until rising_edge(clk);
        wait for 0.5*TCLCL - 20 ns;
        RD <= '0';
        wait until rising_edge(clk); -- 0 wait states

        if wait_states >= 0 then
          for n in 1 to wait_states loop
            wait until rising_edge(clk);
          end loop;
        end if;

        assert DIR_buffer = '1' report "buffer direction error" severity error;
        value <= DA;
        RD <= '1';
        wait until falling_edge(clk);
        DA <= (others => 'Z');
        Address_H <= (others => 'Z');
    end procedure atmega_read;

end package body atmega_emi_pkg;
