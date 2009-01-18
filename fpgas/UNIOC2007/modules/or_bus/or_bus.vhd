  LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL; 



ENTITY or_bus IS
PORT(
	in0: IN std_logic_vector(7 downto 0);
	in1: IN std_logic_vector(7 downto 0);
	
	outb : OUT std_ulogic_vector(7 downto 0)
	);
END;

ARCHITECTURE Eirbot OF or_bus IS

BEGIN


PROCESS(in0, in1)
	VARIABLE i : INTEGER RANGE 0 TO 7;
BEGIN
	FOR i IN 0 TO 7 LOOP
		outb(i) <= in0(i) OR in1(i);
	END LOOP;
END PROCESS;
END;

