LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

--USE IEEE.STD_LOGIC_ARITH.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--USE IEEE.STD_LOGIC_SIGNED.ALL;


ENTITY compteur IS
  GENERIC ( Nb_bascules : natural := 1
          );
  PORT ( AB : IN unsigned(1 DOWNTO 0);
         cpt : OUT  unsigned(7 DOWNTO 0);
         clk : IN std_ulogic;
         INV : IN std_ulogic
         );
END compteur;

ARCHITECTURE Behavioral OF compteur IS
TYPE tableau IS ARRAY (Nb_bascules downto 0) OF unsigned(1 DOWNTO 0);
SIGNAL A_B : tableau;
    
SIGNAL tmp : unsigned(7 DOWNTO 0);
BEGIN

  -- double latch des codeurs
copie : PROCESS
  BEGIN
    WAIT UNTIL rising_edge(clk) ;

    A_B(0)<= AB(1) & (AB(0) XOR INV); 

    FOR i IN 1 TO Nb_bascules LOOP
	 	A_B(i) <= A_B(i-1);
    END LOOP;

  END PROCESS copie;
   

  
-- decodage de la quadrature et comptage
  comptage: PROCESS
  BEGIN  
    WAIT UNTIL falling_edge(clk) ;


  IF (A_B(Nb_bascules-1) = "00" and A_B(Nb_bascules) = "01") OR (A_B(Nb_bascules-1) = "01" AND A_B(Nb_bascules) = "11") OR (A_B(Nb_bascules-1) = "11" AND A_B(Nb_bascules) = "10") OR (A_B(Nb_bascules-1) = "10" AND A_B(Nb_bascules) = "00") THEN
    tmp <= tmp - 1;
      
  ELSIF (A_B(Nb_bascules) = "00" and A_B(Nb_bascules-1) = "01") OR (A_B(Nb_bascules) = "01" AND A_B(Nb_bascules-1) = "11") OR (A_B(Nb_bascules) = "11" AND A_B(Nb_bascules-1) = "10") OR (A_B(Nb_bascules) = "10" AND A_B(Nb_bascules-1) = "00") THEN
    tmp <= tmp + 1;

  END IF;    
  END PROCESS comptage;
  
  cpt <= tmp;

END Behavioral;
