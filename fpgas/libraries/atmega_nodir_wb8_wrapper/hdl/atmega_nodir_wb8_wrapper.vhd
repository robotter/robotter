---------------------------------------------------------------------------
-- Company     : Vim Inc
-- Author(s)   : Fabien Marteau
-- 
-- Creation Date : 23/04/2008
-- File          : atmega_nodir_wb8_wrapper.vhd
--
-- Abstract : An atmega128 to wishbone wrapper components. 
--
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

---------------------------------------------------------------------------
Entity atmega_nodir_wb8_wrapper is 
  ---------------------------------------------------------------------------
  port 
    (
      -- Atmega128 port
      Address_H : in std_logic_vector( 6 downto 0);
      DA        : inout std_logic_vector( 7 downto 0);
      ALE       : in std_logic ;
      RD        : in std_logic ;
      WR        : in std_logic ;

      -- Wishbone port
      wbm_address : out std_logic_vector( 14 downto 0);
      wbm_readdata : in std_logic_vector( 7 downto 0);
      wbm_writedata: out std_logic_vector( 7 downto 0);
      wbm_strobe : out std_logic ;
      wbm_write : out std_logic ;
      wbm_ack : in std_logic ;
      wbm_cycle : out std_logic ;

      -- clock 50MHz and reset
      clk     : in std_logic ;
      reset : in std_logic 

      );
end entity;


---------------------------------------------------------------------------
Architecture atmega_nodir_wb8_wrapper_1 of atmega_nodir_wb8_wrapper is
  ---------------------------------------------------------------------------

  signal write : std_logic ;
  signal strobe : std_logic ;
  signal cycle : std_logic ;
  signal writedata : std_logic_vector( 7 downto 0);
  signal address : std_logic_vector( 14 downto 0);
begin

  synchro : process(clk,reset)
  begin
    if reset = '1' then
      strobe   <= '0';
      write    <= '0';
      cycle    <= '0';
      address <= (others => '0');
      writedata <= (others => '0');
    elsif rising_edge(clk) then
      
      -- Address bus latching
      if ALE = '1' then
        address(14 downto 8) <= Address_H; 
        address(7 downto 0)  <= DA;
      else
        address <= address;
      end if;

      writedata <= DA;

      -- signals controls
      strobe <=  not(RD and WR);
      cycle <= not(RD and WR);
      write <= (not WR);
    end if;  
  end process synchro;

  wbm_write <= write;
  wbm_strobe<= strobe;
  wbm_cycle <= cycle;
  wbm_address <= address;
  wbm_writedata <= writedata when (write = '1') else (others => '0'); 

  -- buffer direction
  DA <= wbm_readdata when write = '0' and strobe='1' else (others => 'Z');

end architecture atmega_nodir_wb8_wrapper_1;


