-- xilinx carte_prop

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

--USE IEEE.STD_LOGIC_ARITH.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY carte1 IS
  PORT ( CLK : IN std_logic;
         sortie : OUT unsigned(7 DOWNTO 0);

         SEL : IN unsigned(1 DOWNTO 0);
			TX_bus : OUT std_logic;
			RX_bus : IN std_logic;
			TX_avr : IN std_logic;
			RX_avr : OUT std_logic;

         AB0 : IN unsigned(1 DOWNTO 0);
         AB1 : IN unsigned(1 DOWNTO 0);

         

       

--         MASSE : std_logic

         );
         
         
--  carte 1
  ATTRIBUTE pin_assign : string;
  ATTRIBUTE pin_assign OF CLK : SIGNAL IS "7"; --clock
  ATTRIBUTE pin_assign OF sortie : SIGNAL IS "11 12 9 8 6 5 4 3 ";  --data 0
                                                                    -- a 7


	ATTRIBUTE pin_assign OF AB0 : SIGNAL IS "27 26";  --cod_d0
	ATTRIBUTE pin_assign OF AB1 : SIGNAL IS "25 29";  --cod_g0
	ATTRIBUTE pin_assign OF RX_bus : SIGNAL IS "19";  --rx_bus
	ATTRIBUTE pin_assign OF TX_bus : SIGNAL IS "22";  --tx_bus
	ATTRIBUTE pin_assign OF RX_avr : SIGNAL IS "14";  --rx_avr
	ATTRIBUTE pin_assign OF TX_avr : SIGNAL IS "13";  --tx_avr
	ATTRIBUTE pin_assign OF SEL : SIGNAL IS "1 44";  -- il reste data2 qui est inutilise
 --  ATTRIBUTE pin_assign OF MASSE : SIGNAL IS " 43";



  
END carte1;


ARCHITECTURE Behavioral OF carte1 IS

-- 1 traitement de codeur
COMPONENT compteur
   GENERIC (Nb_bascules : natural);
   PORT ( AB : IN unsigned(1 DOWNTO 0);
         cpt : OUT unsigned(7 DOWNTO 0);
         clk : IN std_ulogic;
         INV : IN std_ulogic
         );
END COMPONENT;

  
  SIGNAL sortie0 : unsigned(7 DOWNTO 0);
  SIGNAL sortie1 : unsigned(7 DOWNTO 0);


  for cod0 : compteur
   use entity work.compteur(Behavioral);
  for cod1 : compteur



BEGIN


-- compteur 0
  cod0 : compteur
    GENERIC MAP (Nb_bascules => 1)
    PORT MAP ( AB => AB0, cpt => sortie0, clk => CLK , INV => '0' );

-- compteur 1
  cod1 : compteur
    GENERIC MAP (Nb_bascules => 1)
    PORT MAP ( AB => AB1, cpt => sortie1, clk => CLK, INV => '1' );
 

  MUX: PROCESS (SEL, sortie0, sortie1, sortie2, sortie3)
  BEGIN  -- PROCESS MUX
    CASE SEL IS
      WHEN "00" => sortie <= sortie0;
      WHEN "01" => sortie <= sortie1;


      WHEN OTHERS => sortie <= (OTHERS => 'Z');
    END CASE;

	 
  END PROCESS MUX;
  
UART : PROCESS (TX_avr,RX_bus)
BEGIN -- PROCESS UART

	TX_bus <= TX_avr;
	RX_avr <= RX_bus;

END PROCESS UART;

END Behavioral;
