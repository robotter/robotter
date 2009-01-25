-----------------------------------------------------------------------------
-- Title    : ADNS 6010 Control Unit Testbench
-- Project  : UNIOC_NG Optic Encoders
-----------------------------------------------------------------------------
-- File     : t_adns6010_controlunit.vhd
-- Author   : JD (jd@robotter.fr)
-- Company  : Rob'Otter
-- 
-- Creation date : 24/01/2009
-- Platform : 
-----------------------------------------------------------------------------
-- Description : Testbench for ADNS 6010 Control Unit
-- 
-----------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2, or (at your option)
-- any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------
entity t_adns6010_controlunit is 
---------------------------------------------------------------------------
end t_adns6010_controlunit;


---------------------------------------------------------------------------
architecture t_adns6010_controlunit_1 of t_adns6010_controlunit is
---------------------------------------------------------------------------

  component cu
    port (
      -- FPGA signals
      clk_i : in std_logic;
      reset_ni : in std_logic;

      ----------------------------------------------------------
      -- enable signal activate component on high state
      enable_i : in std_logic;

      ----------------------------------------------------------
      -- spi port
      spi_datain_o   : out std_logic_vector (7 downto 0);
      spi_dataout_i  : in std_logic_vector (7 downto 0);
      spi_senddata_o : out std_logic;
      spi_busy_i     : in std_logic;

      ----------------------------------------------------------
      -- cs adns selection
      adns_cs_o : out std_logic_vector (1 downto 0);

      ----------------------------------------------------------
      -- first encoder values
      adns1_deltax_o : out std_logic_vector (31 downto 0);
      adns1_deltay_o : out std_logic_vector (31 downto 0);
      adns1_squal_o  : out std_logic_vector (7 downto 0);

      -- second encoder values
      adns2_deltax_o : out std_logic_vector (31 downto 0);
      adns2_deltay_o : out std_logic_vector (31 downto 0);
      adns2_squal_o  : out std_logic_vector (7 downto 0);

      -- third encoder values
      adns3_deltax_o : out std_logic_vector (31 downto 0);
      adns3_deltay_o : out std_logic_vector (31 downto 0);
      adns3_squal_o  : out std_logic_vector (7 downto 0)
    );
  end component;

  --------------------------------------------
  for cu_0 : cu use entity work.adns6010_controlunit;

  -- FPGA signals
  signal clk_s : std_logic;
  signal reset_s : std_logic;

  -- enable signal activate component on high state
  signal enable_s : std_logic;

  -- spi port
  signal spi_datain_s   : std_logic_vector (7 downto 0);
  signal spi_dataout_s  : std_logic_vector (7 downto 0);
  signal spi_senddata_s : std_logic;
  signal spi_busy_s     : std_logic;

  -- cs adns selection
  signal adns_cs_s : std_logic_vector (1 downto 0);

  -- first encoder values
  signal adns1_deltax_s : std_logic_vector (31 downto 0);
  signal adns1_deltay_s : std_logic_vector (31 downto 0);
  signal adns1_squal_s  : std_logic_vector (7 downto 0);

  -- second encoder values
  signal adns2_deltax_s : std_logic_vector (31 downto 0);
  signal adns2_deltay_s : std_logic_vector (31 downto 0);
  signal adns2_squal_s  : std_logic_vector (7 downto 0);

  -- third encoder values
  signal adns3_deltax_s : std_logic_vector (31 downto 0);
  signal adns3_deltay_s : std_logic_vector (31 downto 0);
  signal adns3_squal_s  : std_logic_vector (7 downto 0); 

  ---------------------------------------------
  -- Simulation stuff
  signal endofsimulation_s : boolean := false;

begin

	------------------------------------------------------------
	-- Component declaration
	cu_0: cu port map (
		clk_i => clk_s,
		reset_ni => reset_s,
    enable_i => enable_s,
    spi_datain_o => spi_datain_s,
    spi_dataout_i => spi_dataout_s,
    spi_senddata_o => spi_senddata_s,
    spi_busy_i => spi_busy_s,
    adns_cs_o => adns_cs_s,
    adns1_deltax_o => adns1_deltax_s,
    adns1_deltay_o => adns1_deltay_s,
    adns1_squal_o => adns1_squal_s,
    adns2_deltax_o => adns2_deltax_s,
    adns2_deltay_o => adns2_deltay_s,
    adns2_squal_o => adns2_squal_s,
    adns3_deltax_o => adns3_deltax_s,
    adns3_deltay_o => adns3_deltay_s,
    adns3_squal_o => adns3_squal_s
    );    

	------------------------------------------------------------
	-- Process
  clk_generator : process
  begin
    if endofsimulation_s then
      report "1> end of test" severity note;
      wait;
    end if;

    clk_s <= '1', '0' after 10 ns;
    wait for 20 ns;
  end process; -- clk_generator


  main : process
  begin
    
    spi_dataout_s <= x"00";
    spi_busy_s <= '0';

    enable_s <= '1';

    reset_s <= '0';
    wait for 20 ns;
    reset_s <= '1';
    
    ----------------------------------

    for i in 0 to 7 loop

      -- ADDRESS
      wait until spi_senddata_s = '1';
      wait for 40 ns;
      spi_busy_s <= '1';

      spi_dataout_s <= x"00";

      wait until spi_senddata_s = '0';
      wait for 3.2 us;
      spi_busy_s <= '0';

      ----------------
      -- MOTION
      wait until spi_senddata_s = '1';
      wait for 40 ns;
      spi_busy_s <= '1';

      spi_dataout_s <= x"80";

      wait until spi_senddata_s = '0';
      wait for 3.2 us;
      spi_busy_s <= '0';

      ----------------
      -- DELTAX
      wait until spi_senddata_s = '1';
      wait for 40 ns;
      spi_busy_s <= '1';

      spi_dataout_s <= x"1F";

      wait until spi_senddata_s = '0';
      wait for 3.2 us;
      spi_busy_s <= '0';

      ----------------
      -- DELTAY
      wait until spi_senddata_s = '1';
      wait for 40 ns;
      spi_busy_s <= '1';

      spi_dataout_s <= x"2F";

      wait until spi_senddata_s = '0';
      wait for 3.2 us;
      spi_busy_s <= '0';

      ----------------
      -- SQUAL
      wait until spi_senddata_s = '1';
      wait for 40 ns;
      spi_busy_s <= '1';

      spi_dataout_s <= x"3F";

      wait until spi_senddata_s = '0';
      wait for 3.2 us;
      spi_busy_s <= '0';

    end loop;
    ----------------------------------
  
    endofsimulation_s <= true;
    report "2> end of test" severity note;

    -- wait forever
    wait;

  end process; -- main

end t_adns6010_controlunit_1;

