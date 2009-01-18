LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY filtre IS
  
  GENERIC (
    c_longueur_filtre : natural RANGE 1 TO 512 := 10);  -- longueur du filtre

  PORT (
    clk    : IN std_ulogic;
    reset  : IN std_logic;
    entree : IN std_ulogic;
    sortie : OUT std_ulogic
    );

END filtre;

ARCHITECTURE eirbot OF filtre IS

BEGIN  -- eirbot

  PROCESS (clk, reset, entree)
    VARIABLE v_buf, v_buf0, v_buf1 : std_logic_vector( c_longueur_filtre-1 DOWNTO 0);
  BEGIN  -- PROCESS
    IF reset = '0' THEN
      v_buf := (OTHERS => '0');
      sortie <= '0';
      v_buf0 := (others => '0');
	  v_buf1 := (others => '1');
	
    ELSIF rising_edge(clk) THEN

      v_buf0 := (others => '0');
	  v_buf1 := (others => '1');
	
      v_buf := v_buf(c_longueur_filtre-2 DOWNTO 0) & entree;

      IF v_buf = v_buf1 THEN
        sortie <= '1';
      ELSIF v_buf = v_buf0 THEN
        sortie <= '0';
      END IF;
      
    END IF;
  END PROCESS;

END eirbot;
