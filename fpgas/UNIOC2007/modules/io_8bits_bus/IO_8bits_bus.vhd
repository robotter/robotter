--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----	module : IO_8bits_bus.vhd
----	by : Lamygalle
----	
----	Description : Interface avec le bus 8 bits interne au FPGA et permettant de
----	disposer de 8 entrées et 8 sorties addressables par le bus.
----
----	Note : Les entrées ne sont pas latchées, si l'une d'entre elles est modifiée durant la lecture,
----	 ce changement sera directement repercuté sur le registre. Ceci peut poser problèmes avec des interrupteurs par exemple.
----
----	TODO : placer un filtre optionnel dont la largeur est réglable sur les entrées.
----
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

--USE IEEE.STD_LOGIC_ARITH.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--USE IEEE.STD_LOGIC_SIGNED.ALL;


ENTITY IO_8bits_bus IS
	-- adresse de base du module ( parametrable via le symbole)
  GENERIC ( c_base_adresse : std_logic_vector(15 downto 0) := X"000F"
          );
  PORT (
		clk : IN std_ulogic;
		reset : IN std_ulogic;
		
		-- bus de comm interne avec les differents periphs 
		adresse : IN std_logic_vector(15 downto 0) ;
		data_in : IN std_logic_vector(7 downto 0);
		data_out : OUT std_logic_vector(7 downto 0);
		read : IN std_ulogic;
		write : IN std_logic;
		
		in_b : IN std_logic_vector(7 DOWNTO 0);
                out_b : OUT std_logic_vector(7 DOWNTO 0)
         );
END IO_8bits_bus;

ARCHITECTURE non_latch OF IO_8bits_bus IS
SIGNAL s_latch_out : std_ulogic;
BEGIN

-- communication avec le bus interne
PROCESS(read, adresse, data_in, in_b)
BEGIN
	IF ( read = '0' AND adresse = c_base_adresse ) THEN  		-- lecture des entrées num
		--data_out <= in_7 & in_6 & in_5 & in_4 & in_3 & in_2 & in_1 & in_0;

          data_out <= in_b;
	ELSE
		data_out <= (OTHERS => '0');
		
	END IF;
END PROCESS;

s_latch_out <= '1' WHEN  write = '0' AND adresse = c_base_adresse else
		       '0';
		       
		       
PROCESS(s_latch_out, data_in)
BEGIN
	IF (s_latch_out='1') THEN 	-- ecriture sur les sorties num
		out_b <= data_in;
	END IF;
END PROCESS;

END non_latch;
