LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.numeric_std.all;

entity bus_atmel is
port(
	clk : IN std_logic;
	reset : IN std_logic;
	
	-- comm avec le µC
	DA : INOUT std_logic_vector(7 downto 0); 	 -- adresse basses et données
	Address_H : IN std_logic_vector(7 downto 0); -- adresse de 8 à 15
	RD : IN std_ulogic;
	WR : IN std_ulogic;
	ALE : IN std_ulogic;
	
	-- direction des buffers
	DIR_buffer : OUT std_ulogic;
	
	-- bus de comm interne avec les differents periphs 
	adresse : OUT std_logic_vector(15 downto 0) ;
	data_in : IN std_logic_vector(7 downto 0);
	data_out : OUT std_logic_vector(7 downto 0);
	read : out std_ulogic;
	write : out std_logic
	 );
end bus_atmel;

architecture premier_tst of bus_atmel is 

SIGNAL s_data_in : std_logic_vector(7 downto 0);
SIGNAL s_data_out : std_logic_vector(7 downto 0);

BEGIN


process(clk, RD, WR)
BEGIN
	IF rising_edge(clk) THEN
		read <= RD;
		write <= WR;
	END IF;
END PROCESS;

adresse(15) <= '0';


process(clk, DA, WR)
BEGIN
	IF rising_edge(clk) THEN
		data_out <= DA;
	END IF;
END PROCESS;
--data_out <= DA WHEN WR = '0' 
--	ELSE (OTHERS => '0');

	
adresse(14 downto 8)<= 	Address_H(6 DOWNTO 0);

process(clk, DA, ALE)
BEGIN
	IF rising_edge(clk) THEN
		
		IF ALE = '1' THEN
			adresse(7 downto 0) <=  DA;--  WHEN (ALE = '1');
		END IF;
	END IF;
END PROCESS;
			
---------------------------------
-- gestion du bus de comm avec l'atmel
PROCESS(ALE, RD, WR, data_in, Address_H, DA)
BEGIN
--	IF ALE = '1' THEN
--		adresse(14 downto 0)<= 	Address_H(6 DOWNTO 0) & DA;
--		data_out <= (OTHERS => '0');

	IF RD = '0' THEN
		DA <= data_in;
		--data_out <= (OTHERS => '0');
		
--	ELSIF WR = '0' THEN
--		data_out <= DA;
		
	ELSE
		DA <= (OTHERS => 'Z');
		--data_out <= (OTHERS => '0');
		
	END IF;
END PROCESS;


-----------------------------------
---- gestion du bus de comm avec l'atmel
--PROCESS(ALE, RD, WR, data_in, Address_H, DA)
--BEGIN
--	IF ALE = '1' THEN
--		adresse(14 downto 0)<= 	Address_H(6 DOWNTO 0) & DA;
--	END IF;
--END PROCESS;
--	
--PROCESS(ALE, RD, WR, data_in, Address_H, DA)
--BEGIN
--	IF RD = '0' THEN
--		DA <= data_in;
--	ELSE
--		DA <= (OTHERS => 'Z');
--	END IF;
--END PROCESS;
--
--PROCESS(ALE, RD, WR, data_in, Address_H, DA)
--BEGIN		
--	IF WR = '0' THEN
--		data_out <= DA;
--	END IF;
--END PROCESS;
---------------------------------
-- buffer bidirectionnel 74ALVC164245
PROCESS(RD)
BEGIN
	IF RD = '0'  THEN -- on n'ecrit sur le bus que si l'atmel demande une lecture de donnees
		DIR_buffer <= '1';
	ELSE
		DIR_buffer <= '0'; -- par defaut on ecoute l'atmel
	END IF;
END PROCESS;


END premier_tst;

--
--architecture second_jet of bus_atmel is 
--
--SIGNAL s_data_in : std_logic_vector(7 downto 0);
--SIGNAL s_data_out : std_logic_vector(7 downto 0);
--
--BEGIN
--
--read <= RD;
--write <= WR;
--
----DA <= (OTHERS => 'Z');
--
----adresse(15) <= '0';
--
--Affectation_adresse : process(clk, ALE, Address_H, DA)
--  VARIABLE v_ale_precedent : std_ulogic;
--  BEGIN
--    IF rising_edge(clk) THEN
--      IF ALE = '0' AND v_ale_precedent = '1' THEN
--        adresse <= '0' & Address_H(6 DOWNTO 0) & DA;
--      END IF;
--          v_ale_precedent := ALE;
--    END IF;
--  END PROCESS Affectation_adresse;
--
--affectation_DA: PROCESS (clk, reset, data_in, RD)
--  BEGIN
--    IF rising_edge(clk) THEN
--      IF RD = '0'  THEN                 -- on affecte DA seulement en cas de lecture
--        DA <= data_in;
--      ELSE                              -- sinon on le laisse en haute impédance
--        DA <= (OTHERS => 'Z');  
--      END IF;
--      
--    END IF;
--  END PROCESS;
--  
--
--
--  Affectation_data_out: PROCESS (clk, DA, WR)
--  BEGIN  -- PROCESS Affectation_data_out
--    IF rising_edge(clk) THEN
--      IF WR='0' THEN
--        data_out <= DA;
--      ELSE
--        data_out <= (OTHERS => '0');
--      END IF;
--    END IF;
--  END PROCESS Affectation_data_out;
--
--
--  DIR_buffer <= not(RD);
--  
--END second_jet;


