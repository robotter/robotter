-------------------------------------------------------------------------------
-- Title      : test bench du fichier spi_slave.vhd
-- Project    : 
-------------------------------------------------------------------------------
-- File       : spi_slave_tb.vhd
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



-------------------------------------------------------------------------------
-- package necessaire au test bench
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE fction_spi IS

  PROCEDURE envoi_spi(
    CONSTANT c_periode_clk : IN time;     -- periode de l'horloge
    CONSTANT s_data_to_send : IN std_logic_vector(7 DOWNTO 0);  -- donnee a envoyer sur la spi
    SIGNAL sck : OUT std_ulogic;          -- clock de la spi
    SIGNAL mosi : OUT std_ulogic);         -- donnees de la spi

  
  PROCEDURE envoi_1_bit (
    CONSTANT c_periode_clk : IN time;  -- periode de l'horloge
    CONSTANT bit_to_send : IN std_ulogic;
    SIGNAL sck : OUT std_ulogic;          -- clock de la spi
    SIGNAL mosi : OUT std_ulogic);         -- donnees de la spi

END fction_spi;

PACKAGE BODY fction_spi IS

  

  PROCEDURE envoi_spi (
    CONSTANT c_periode_clk : IN time;     -- periode de l'horloge
    CONSTANT s_data_to_send : IN std_logic_vector(7 DOWNTO 0);  -- donnee a envoyer sur la spi
    SIGNAL sck : OUT std_ulogic;          -- clock de la spi
    SIGNAL mosi : OUT std_ulogic         -- donnees de la spi
    ) IS
    VARIABLE v_cpt_envoi : natural RANGE 7 DOWNTO 0;
BEGIN
  envoi_octet: FOR v_cpt_envoi IN 7 DOWNTO 0 LOOP
    envoi_1_bit(c_periode_clk, s_data_to_send(v_cpt_envoi),sck, mosi);
  END LOOP envoi_octet;

END envoi_spi;


PROCEDURE envoi_1_bit (
  CONSTANT c_periode_clk : IN time;  -- periode de l'horloge
  CONSTANT bit_to_send : IN std_ulogic;
  SIGNAL sck : OUT std_ulogic;          -- clock de la spi
  SIGNAL mosi : OUT std_ulogic)IS        -- donnees de la spi
BEGIN

  mosi <= bit_to_send;
  sck <= '0';
  WAIT FOR c_periode_clk/2;
  sck <= '1';
  WAIT FOR c_periode_clk/2;

END envoi_1_bit;

END fction_spi;



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.fction_spi.ALL;

ENTITY spi_slave_tb IS
  GENERIC(
    CONSTANT c_periode_clk_spi : IN time := 1 us;
    CONSTANT c_periode_clk : IN time := 37 ns
    );
  PORT (
    data_out           : OUT  std_logic_vector(7 DOWNTO 0)  -- donnees recues par le peripherique
    );
END spi_slave_tb;

ARCHITECTURE robotter OF spi_slave_tb IS


  COMPONENT spi_slave IS
    
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

  END COMPONENT;

  

  SIGNAL s_clk : std_ulogic := '0';
  SIGNAL  s_reset : std_ulogic;
  SIGNAL s_data_out : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_tranfert_done, s_tranfert_done_read : std_ulogic;
  SIGNAL s_MOSI, s_CS, s_SCK : std_ulogic;  -- lignes spi

  
BEGIN  -- robotter

  entity_testee : spi_slave
    PORT MAP (
      reset=> s_reset,
      clk  => s_clk,
      data_out => data_out,
      tranfert_done => s_tranfert_done,
      tranfert_done_read => s_tranfert_done_read,
      MOSI => s_MOSI,
      sck => s_SCK,
      CS => s_CS);


  horloge: PROCESS
  BEGIN  -- PROCESS horloge

    s_clk <= not(s_clk);
    WAIT FOR c_periode_clk/2;
  END PROCESS horloge;

  reset : PROCESS
  BEGIN  -- PROCESS
    s_reset <= '1';
    WAIT FOR 6 us;
    s_reset <= '0';
    WAIT FOR 1 us;
    s_reset <= '1';
    WAIT FOR 1 ms;
    s_reset <= '0';
    WAIT FOR 1 us;
    s_reset <= '1';
  END PROCESS;


  -- purpose: gestion de data_out et des transfert_done
  -- type   : combinational
  -- inputs : 
  -- outputs: 
  PROCESS
  BEGIN  -- PROCESS
      wait until rising_edge(s_clk);
    IF s_tranfert_done = '1'  THEN
      data_out <= s_data_out;
      s_tranfert_done_read <= '1';
    ELSE    
      s_tranfert_done_read <= '0';
    END IF;

  END PROCESS;


  -- purpose: envoi des donnees sur le bus spi
  -- type   : sequential
  -- inputs : 
  -- outputs: 
  envoi_data: PROCESS 
  BEGIN  -- PROCESS envoi_data
    s_CS <= '1';
    WAIT FOR 10 us;
    s_CS <= '0';
    envoi_spi(c_periode_clk_spi, X"A5", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"55", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"19", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"EF", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"00", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"FF", s_SCK, s_MOSI);
    s_CS <= '1';
    WAIT FOR 10 us;
    envoi_spi(c_periode_clk_spi, X"99", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"43", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"55", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"11", s_SCK, s_MOSI);
    envoi_spi(c_periode_clk_spi, X"AA", s_SCK, s_MOSI);
    s_CS <= '1';
  END PROCESS envoi_data;
  
  
  
END robotter;


