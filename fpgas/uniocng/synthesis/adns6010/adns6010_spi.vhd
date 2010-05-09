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
--! @brief ADNS 6010 SPI unit
--! @author ~ryder
-----------------------------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;


entity adns6010_spi is
  generic (
    spi_freq_c : natural :=  1000; -- SPI clock frequency in kHz
    clk_freq_c : natural := 50000  -- FPGA clock frequency in kHz
  );
  port (
    clk_i     : in std_logic;
    reset_ni  : in std_logic;

    --! @name SPI signals
    --!@{
    mosi_o : out std_logic;
    miso_i : in  std_logic;
    sck_o  : out std_logic;
    cs1_no : out std_logic;
    cs2_no : out std_logic;
    cs3_no : out std_logic;
    --!@}

    --! @name Control unit port
    --!@{
    data_in_i   : in  std_logic_vector(7 downto 0); --! sent byte
    data_out_o  : out std_logic_vector(7 downto 0); --! received byte
    send_data_i : in  std_logic; --! transfer data on rising edges
    busy_o      : out std_logic; --! '1' if SPI is transfering data
    --!@}

    --! Muxed Chip Select
    cs_i        : in  std_logic_vector(1 downto 0)
  );
end entity adns6010_spi;


architecture adns6010_spi_1 of adns6010_spi is 

  --! @name SPI clock, generated from main clock
  --!@{
  signal spi_clk_s       : std_logic;
  signal spi_rising_s    : boolean;
  signal spi_falling_s   : boolean;
  --!@}

  signal transfer_s      : boolean;

  --! Current transfer bit count
  signal bit_cnt_s       : natural range 0 to 8;

begin

  --! Sequencer
  sequencer_p : process (clk_i, reset_ni, send_data_i)
    variable last_send_data_v : std_logic;
  begin

    if reset_ni = '0' then
      transfer_s <= false;
      last_send_data_v := '0';
      bit_cnt_s <= 8;

    elsif rising_edge(clk_i) then

      if transfer_s = true then
        if spi_rising_s = true then
          if bit_cnt_s = 8 then
            -- last bit, EOT
            transfer_s <= false;
          end if;
        elsif spi_falling_s = true then
          -- transferring
          bit_cnt_s <= bit_cnt_s + 1;
        end if;

      elsif send_data_i = '1' and last_send_data_v = '0' then
        -- new transmission (rising edge)
        bit_cnt_s <= 0;

      elsif bit_cnt_s = 0 and spi_rising_s = true then

        -- start transfer on SPI clock high state and wait for the first
        -- falling edge to align transfer start with SPI clock cycles
        -- (and avoid incomplete first cycles)
        transfer_s <= true;

      end if;
      last_send_data_v := send_data_i;

    end if;

  end process sequencer_p;


  --! Busy on transfer, but do not unbusy too early
  busy_p : process (clk_i, reset_ni)
  begin

    if reset_ni = '0' then
      busy_o <= '0';

    elsif rising_edge(clk_i) then
      if transfer_s = true then
        busy_o <= '1';
      elsif spi_falling_s = true then
        busy_o <= '0';
      end if;
    end if;
  end process busy_p;

  --! MOSI transfer
  mosi_p : process (clk_i, reset_ni, data_in_i)
    variable data_mosi_v : std_logic_vector(7 downto 0);
  begin

    if reset_ni = '0' then
      mosi_o <= 'Z';

    elsif rising_edge(clk_i) then
      if spi_falling_s = true and transfer_s = true then

        if bit_cnt_s = 0 then
          -- start transfer
          data_mosi_v := data_in_i;
        end if;

        mosi_o <= data_mosi_v(7);
        data_mosi_v(7 downto 1) := data_mosi_v(6 downto 0);

      end if;
    end if;

  end process mosi_p;


  --! MISO transfer
  miso_p : process (clk_i, reset_ni, miso_i)
    variable data_miso_v : std_logic_vector(7 downto 0);
  begin 

    if reset_ni = '0' then
      data_out_o <= (others => '0');

    elsif rising_edge(clk_i) then
      if spi_rising_s = true and transfer_s = true then

        data_miso_v(7 downto 1) := data_miso_v(6 downto 0);
        data_miso_v(0) := miso_i;

        if bit_cnt_s = 8 then
          -- end transfer
          data_out_o <= data_miso_v;
        end if;

      end if;
    end if;

  end process miso_p;


  -- Chip select
  cs1_no <= '0' when cs_i = "01" else '1';
  cs2_no <= '0' when cs_i = "10" else '1';
  cs3_no <= '0' when cs_i = "11" else '1';


  -- SPI clock ticks only during data transfer
  sck_o <= spi_clk_s when transfer_s = true else '1';

  --! Generate SPI clock
  spi_clk_p : process (clk_i, reset_ni)
    subtype  spi_clk_ticks is natural range 0 to clk_freq_c/(2*spi_freq_c);
    variable ticks_v : spi_clk_ticks; --! SPI clock ticks, downcounted
  begin

    if reset_ni = '0' then
      spi_clk_s <= '1';
      spi_rising_s  <= false;
      spi_falling_s <= false;
      ticks_v := 0;

    elsif rising_edge(clk_i) then
      
      if ticks_v = 0 then
        -- SPI tick
        if spi_clk_s = '0' then
          spi_clk_s <= '1';
          spi_rising_s  <= true;
          spi_falling_s <= false;
        else
          spi_clk_s <= '0';
          spi_rising_s  <= false;
          spi_falling_s <= true;
        end if;
        ticks_v := spi_clk_ticks'high;

      else
 
        ticks_v := ticks_v - 1;
        spi_rising_s  <= false;
        spi_falling_s <= false;
      end if;

    end if;

  end process spi_clk_p;


end architecture adns6010_spi_1;

