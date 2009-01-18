-------------------------------------------------------------------------------
-- Title      : spi_slave
-- Project    : 
-------------------------------------------------------------------------------
-- File       : spi_slave.vhd
-- Author     :   <Paul@PITHIVIER>
-- Company    : 
-- Created    : 2008-08-06
-- Last update: 2008-08-07
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: utilisé pour récupérer le firmware des souris optiques
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

ENTITY spi_slave IS
  
  PORT (
    reset              : IN  std_ulogic;
    clk                : IN  std_ulogic;
    data_out           : OUT std_logic_vector(7 DOWNTO 0);  -- registre contenant les données recues par la spi
    tranfert_done      : OUT std_ulogic;   -- flag indiquant qu'une nouvelle
                                           -- donnée a été recue et est
                                           -- disponible sur data_out
    tranfert_done_read : IN  std_ulogic;

    ------ pins de la spi ------
    MOSI               : IN std_ulogic;    -- master out slave in : ligne de donnée de la spi
    CS                 : IN std_ulogic;    -- Chip Select : ligne de donnee de
                                           -- la spi
    SCK                : IN std_ulogic     -- horloge de la spi

    );  -- flag indiquant que la donnée recue par le périphérique a été lue

END spi_slave;

ARCHITECTURE robotter OF spi_slave IS

  SIGNAL s_buf_reception : std_logic_vector(7 DOWNTO 0);  -- buffer de reception de la spi
  SIGNAL s_octet_received  : std_ulogic;  -- flag signalant qu'une nouvelle donnée est dispo

  
BEGIN  -- robotter

--data_out <= X"EF";--s_buf_reception;

  -- purpose: affecte les divers signaux communiquant avec d'autre modules
  -- type   : sequential
  -- inputs : clk, reset, s_buf_reception, s_octet_received, tranfert_done_read
  -- outputs: 
  communication: PROCESS (clk)
  VARIABLE v_last_octet_received : std_ulogic;
  BEGIN  -- PROCESS communication
  
    if rising_edge(clk) THEN -- rising clock edge
      IF reset = '0' THEN                 -- asynchronous reset (active low)
      tranfert_done <= '0';
      data_out <= (OTHERS => '0');
      v_last_octet_received := s_octet_received;
       
    

      ELSIF s_octet_received = '1' AND v_last_octet_received = '0'  THEN
        data_out <= s_buf_reception;
        tranfert_done <= '1';
                
      ELSIF tranfert_done_read = '1' THEN
        tranfert_done <= '0';
      
      END IF;
      
      v_last_octet_received := s_octet_received;
	end if;
  END PROCESS communication;
  


  -- purpose: recupere les donnees recues par spi et leve un flag a chaque octet recu
  -- type   : sequential
  -- inputs : clk, reset, MOSI, CS, SCK
  reception_spi: PROCESS (clk)
    VARIABLE v_last_sck : std_ulogic;   -- valeur precedente de sck
    VARIABLE v_cpt_recept : natural RANGE 0 TO 7;  -- compteur de bits recus
  BEGIN  -- PROCESS reception_spi
	IF clk'event AND clk = '1' THEN  -- rising clock edge

	  IF reset = '0' THEN                 -- asynchronous reset (active low)
		  v_last_sck := SCK;
		  s_buf_reception <= (OTHERS => '0');
		  s_octet_received <= '0';
		  v_cpt_recept := 0;
		  
      ELSIF SCK = '1' AND v_last_sck = '0'  AND CS = '0' THEN
        IF v_cpt_recept = 7  THEN
          s_octet_received <= '1';
          v_cpt_recept := 0;
        ELSE
          v_cpt_recept := v_cpt_recept +1;              -- on incremente le nb de bits recus
                                        -- (automatiquement remis a 0 lorsque
                                        -- l'on passe a 8.
          s_octet_received <= '0';
        END IF;

        s_buf_reception <= s_buf_reception(6 DOWNTO 0)& MOSI;  -- maj du buffer
                                                               -- de reception
        
        
      ELSIF CS = '1' THEN
        v_cpt_recept := 0;
        s_octet_received <= '0';
              -- reinitialisation du flag sauf lors
                                        -- de la reception de bits via SCK
      END IF;
      v_last_sck := SCK;
    END IF;
  END PROCESS reception_spi;


  
END robotter;
