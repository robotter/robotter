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

-----------------------------------------------------------------------------
--! @file
--! @brief SPI interface handling SPI deserialization
--! @author Lamygale
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY spi_slave IS

  PORT (
    reset_ni        : IN  std_logic;
    clk_i           : IN  std_logic;
    --! register for data received by SPI
    data_out_o      : OUT std_logic_vector(7 DOWNTO 0);
    --! a new byte has been received and is available on data_out_o
    transfer_done_o : OUT std_logic;
    transfer_ack_i  : IN  std_logic;

    --! SPI pins
    mosi_i          : IN std_logic; --! Master Out Slave In (SPI)
    cs_i            : IN std_logic; --! Chip Select (SPI)
    sck_i           : IN std_logic  --! SPI clock
  );

END ENTITY spi_slave;


ARCHITECTURE robotter OF spi_slave IS

  --! SPI reception buffer
  SIGNAL buf_reception_s  : std_logic_vector(7 DOWNTO 0);
  --! flag raised when new data is available
  SIGNAL octet_received_s : std_logic;


BEGIN  -- robotter

  --! Affect various signals which communicate with other modules
  communication_p : PROCESS (clk_i)
    VARIABLE last_octet_received_v : std_logic;
  BEGIN

    IF rising_edge(clk_i) THEN -- rising clock edge
      IF reset_ni = '0' THEN   -- asynchronous reset (active low)
        transfer_done_o <= '0';
        data_out_o <= (OTHERS => '0');
        last_octet_received_v := octet_received_s;

      ELSIF octet_received_s = '1' AND last_octet_received_v = '0' THEN
        data_out_o <= buf_reception_s;
        transfer_done_o <= '1';

      ELSIF transfer_ack_i = '1' THEN
        transfer_done_o <= '0';

      END IF;

      last_octet_received_v := octet_received_s;
    END IF;
  END PROCESS communication_p;



  --! Get data received through SPI, raise a flag at each received byte.
  reception_spi_p : PROCESS (clk_i)
    VARIABLE last_sck_v   : std_logic;  -- last SCK value
    VARIABLE cpt_recept_v : natural RANGE 0 TO 7;  -- received bit count
  BEGIN  -- PROCESS reception_spi_p
  IF rising_edge(clk_i) THEN  -- rising clock edge

    IF reset_ni = '0' THEN  -- asynchronous reset (active low)
      last_sck_v := sck_i;
      buf_reception_s <= (OTHERS => '0');
      octet_received_s <= '0';
      cpt_recept_v := 0;

      ELSIF sck_i = '1' AND last_sck_v = '0' AND cs_i = '0' THEN
        IF cpt_recept_v = 7 THEN
          octet_received_s <= '1';
          cpt_recept_v := 0;
        ELSE
          -- increments received bits count
          -- automatically overflow to 0 at 8
          cpt_recept_v := cpt_recept_v + 1;
          octet_received_s <= '0';
        END IF;

        -- update receive buffer
        buf_reception_s <= buf_reception_s(6 DOWNTO 0) & mosi_i;
      ELSIF cs_i = '1' THEN
        cpt_recept_v := 0;
        octet_received_s <= '0';
        -- reset flag except when receiving bits trough SCK
      END IF;
      last_sck_v := sck_i;
    END IF;
  END PROCESS reception_spi_p;

END ARCHITECTURE robotter;

