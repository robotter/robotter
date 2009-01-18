-------------------------------------------------------------------------------
-- Title      : io_8_laych
-- Project    : 
-------------------------------------------------------------------------------
-- File       : io_8_latch.vhd
-- Author     :   <Paul@PITHIVIER>
-- Company    : 
-- Created    : 2009-01-13
-- Last update: 2009-01-16
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: registre de lecture sur le bus atmel
-------------------------------------------------------------------------------
-- Copyright (c) 2009 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009-01-13  1.0      Paul	Created
-------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY io_8_latch IS
  
  GENERIC (
    c_adress_base : std_logic_vector(15 DOWNTO 0) := X"1300");  -- adresse de base du systeme
	
  PORT (
    clk      : IN  std_ulogic;          -- clock
    reset    : IN  std_ulogic;
    adresse   : IN  std_logic_vector(15 DOWNTO 0);
    data_out : OUT std_logic_vector(7 DOWNTO 0);
    read     : IN  std_ulogic;

    data_in_spi : IN  std_logic;
    raz_data: out std_ulogic);

END io_8_latch;

ARCHITECTURE tst_souris_laser OF io_8_latch IS
  SIGNAL s_mem_lect : std_ulogic;
  SIGNAL s_raz_buf : std_ulogic;
  SIGNAL s_raz_done : std_ulogic;
  SIGNAL s_data_in_spi: std_ulogic;
BEGIN  -- tst_souris_laser


  raz_data <= s_raz_buf WHEN read = '1' ELSE
              '0';

process(clk, reset, read)
	variable v_last_read : std_ulogic;
begin
	if reset = '0' then
	  v_last_read := read; -- memoire de la 
	  
	elsif rising_edge(clk) THEN

		if v_last_read = '1' AND  read = '0' THEN --sur front descendant de read
			s_data_in_spi <= data_in_spi;
		end if;
		
		v_last_read := read; -- memoire du dernier coup de read
	END IF;
END PROCESS;  
  

  data_out(7 downto 1) <= (OTHERS => '0');
  
  lecture_BUS: PROCESS
  BEGIN  -- PROCESS lecture bus
	WAIT UNTIL rising_edge(clk);
    IF reset = '0' THEN                 -- synchronous reset (active low)
      data_out(0) <= '0';
    ELSIF read = '0' AND adresse = c_adress_base THEN
       data_out(0) <= s_data_in_spi;
    ELSE
       data_out(0) <= '0';
    END IF;
  END PROCESS lecture_bus;



process
begin
	wait until rising_edge(clk);
	if reset = '0' then
		s_raz_buf <= '0';

	ELSIF data_in_spi = '0' THEN
			s_raz_buf <= '0';
	
	ELSIF read = '0' AND adresse = c_adress_base THEN
       	s_raz_buf <= s_data_in_spi;
	END IF;
end process;

END tst_souris_laser;
