-------------------------------------------------------------------------------
-- Title      : test bench du fichier latch_nbits_tb.vhd
-- Project    : 
-------------------------------------------------------------------------------
-- File       : latch_nbits_tb.vhd
-- Author     :   <Paul@PITHIVIER>
-- Company    : 
-- Created    : 2008-08-06
-- Last update: 2008-08-07
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2008 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2008-08-06  1.0      Paul	Created
-------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY t_adns6010_latch_nbits IS
  GENERIC(
    CONSTANT c_periode_maj_data : IN time := 200 ns;
    CONSTANT c_periode_clk : IN time := 37 ns;
		CONSTANT data_width_c : natural RANGE 0 TO 127 := 32;
		CONSTANT squal_width_c : natural := 8
    );
  PORT (
    deltax_o         : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data to be latched
    deltay_o         : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data to be latched
    squal_o          : OUT std_logic_vector(squal_width_c-1 DOWNTO 0);  -- data to be latched
    deltax_latched_o : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data latched
    deltay_latched_o : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data latched
    squal_latched_o  : OUT std_logic_vector(squal_width_c-1 DOWNTO 0)  -- data latched
    );
END t_adns6010_latch_nbits;

ARCHITECTURE t_adns6010_latch_nbits_1 OF t_adns6010_latch_nbits IS


  COMPONENT adns6010_latch_nbits IS
  
  GENERIC (
    CONSTANT data_width_c : natural RANGE 0 TO 127 := 32;  -- width of the data bus latched
		CONSTANT squal_width_c : natural := 8								 -- width of the squal bus latched
		);
  PORT (
    clk_i            : IN  std_ulogic;
    reset_ni         : IN  std_ulogic;
    deltax_i         : IN  std_logic_vector(data_width_c-1 DOWNTO 0);  -- data to be latched
    deltay_i         : IN  std_logic_vector(data_width_c-1 DOWNTO 0);  -- data to be latched
    squal_i          : IN  std_logic_vector(squal_width_c-1 DOWNTO 0);  -- data to be latched
    deltax_latched_o : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data latched
    deltay_latched_o : OUT std_logic_vector(data_width_c-1 DOWNTO 0);  -- data latched
    squal_latched_o  : OUT std_logic_vector(squal_width_c-1 DOWNTO 0);  -- data latched
    latch_data_i     : IN  std_ulogic);  -- latches squal_i detlay_i deltax_i while it is active (i.e. '1')
END COMPONENT;


  

  SIGNAL clk_s : std_ulogic := '0';
  SIGNAL reset_ns: std_ulogic;
  SIGNAL deltax_s: std_logic_vector(data_width_c-1 DOWNTO 0) := (OTHERS => '0');  -- data to be latched
  SIGNAL deltay_s: std_logic_vector(data_width_c-1 DOWNTO 0) := (OTHERS => '0');  -- data to be latched
  SIGNAL squal_s : std_logic_vector(squal_width_c-1 DOWNTO 0) := (OTHERS => '0');  -- data to be latched
	SIGNAL latch_data_s : std_ulogic := '0';
  
BEGIN  -- t_adns6010_latch_nbits_1

  entity_testee : adns6010_latch_nbits
	GENERIC MAP(
    data_width_c => data_width_c,
		squal_width_c => squal_width_c
		)  -- width of the bus latched

  PORT MAP(
    clk_i    =>clk_s,
    reset_ni => reset_ns,
    deltax_i => deltax_s,
    deltay_i => deltay_s,
    squal_i  => squal_s,
    deltax_latched_o => deltax_latched_o,
    deltay_latched_o => deltay_latched_o,
    squal_latched_o  => squal_latched_o,
    latch_data_i => latch_data_s);  -- latches data_i while it is active (i.e. '1')



  horloge: PROCESS
  BEGIN  -- PROCESS horloge

    clk_s <= not(clk_s);
    WAIT FOR c_periode_clk/2;
  END PROCESS horloge;

  reset : PROCESS
  BEGIN  -- PROCESS
    reset_ns <= '1';
    WAIT FOR 6 us;
    reset_ns <= '0';
    WAIT FOR 1 us;
    reset_ns <= '1';
    WAIT FOR 1 ms;
    reset_ns <= '0';
    WAIT FOR 1 us;
    reset_ns <= '1';
  END PROCESS;

  latch_data : PROCESS
  BEGIN  -- PROCESS
		latch_data_s <= '0';
    WAIT FOR 1.67 us;
    latch_data_s <= '1';
		WAIT FOR 2 us;
  END PROCESS;


  -- purpose: envoi des donnees sur le bus spi
  -- type   : sequential
  -- inputs : 
  -- outputs: 
  maj_data: PROCESS 
  BEGIN  -- PROCESS envoi_data
    WAIT FOR c_periode_maj_data;
		
		deltax_s <= std_logic_vector(unsigned(deltax_s) + 1);
		deltay_s <= std_logic_vector(unsigned(deltay_s) + 1);
		squal_s <= std_logic_vector(unsigned(squal_s) + 1);
		
  END PROCESS maj_data;
  
	
	deltax_o <= deltax_s;
  deltay_o <= deltay_s;
  squal_o <= squal_s;
  
  
END t_adns6010_latch_nbits_1;



