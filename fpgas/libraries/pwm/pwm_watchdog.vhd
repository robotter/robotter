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
--! @author lamygalle
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pwm_watchdog is
  
  generic (
    fpga_frequency_khz_c : natural                 := 50000;
    default_period_c     : natural range 0 to 4095 := 4095  -- pwm period after reset
    );
  port (
    clk_i   : in std_logic;             -- clock
    reset_i : in std_logic;             -- reset

    watchdog_timeout_i             : in  std_logic_vector(7 downto 0);  --watchdog timout value (in ms)
    watchdog_timeout_update_i      : in  std_logic;  -- update watchdog_timout,
                                                     -- watchdog_timout taken on
                                                     -- reset_watchdog_i rising edge
    watchdog_timeout_update_done_o : out std_logic;  --watchdog_timeout_update_i handshake

    reset_watchdog_i          : in  std_logic;  -- resets the watchdog counter
    watchdog_timout_reached_o : out std_logic  -- timout signal, reset by reset_watchdog_i
    );                                  -- sign of the pwm
end entity;

architecture pwm_watchdog_1 of pwm_watchdog
is
  signal s_clk_1ms : std_logic;

  signal s_watchdog_timeout : natural range 1 to;
  
begin  -- pwm_signed_1


  update_parameters_p : process (clk_i, reset_i)
    variable v_previous_update_param_i : std_logic;
    variable v_previous_reset_watchdog : std_logic;
  begin  -- process update_parameters_p
    if reset_i = '0' then                   -- asynchronous reset (active low)
      v_previous_update_param := '1';
      v_previous_reset_watchdog
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge
        if v_previous_update_param = '0' and update_param_i = '1' then
          v_watchdog_timeout := natural(to_unsigned(watchdog_timout_i(7 downto 0)));
        end if;

        -- only update timout when data isn't used
        if v_previous_reset_watchdog = '0' and reset_watchdog_i = '1' then
          s_watchdog_timeout <= v_previous_reset_watchdog
        end if;
        v_previous_update_param := update_param_i;
        v_previous_reset_watchdog := reset_watchdog_i;
      end if;
  end process update_parameters_p;


  clk_1ms_p : process(clk_i, reset_i)
    variable v_counter : natural range 0 to fpga_frequency_khz_c /2;
  begin
    if reset_i = '0' then
      v_counter := 0;
      s_clk_1ms <= '0';
      
    elsif rising_edge(clk_i) then
      v_counter := v_counter +1;
      if v_counter = fpga_frequency_khz_c/2 then
        s_clk_1ms <= not(s_clk_1ms);
        v_counter := 0;
      end if;
    end if;
  end process;


  watchdog_p: process (clk_i, reset_i)
    variable v_previous_clk_1ms : std_logic;
    variable v_counter  : natural range 0 to 255;
    variable v_previous_reset_watchdog : std_logic;
  begin  -- process watchdog_p
    if reset_i = '0' then
      watchdog_timout_reached_o <= '0';
      v_previous_clk_1ms := '1';
      v_counter := 0;
      v_previous_reset_watchdog := '1';
      
    elsif rising_edge(clk_i) then
      if v_previous_clk_1ms = '0' and s_clk_1ms = '1' and s_watchdog_timout_reached = '0' then
        v_counter := v_counter +1;
        if v_counter = s_watchdog_timeout then
          s_watchdog_timout_reached <= '1';
        end if;
      end if;

      if v_previous_reset_watchdog = '0' and reset_watchdog_i = '1' then
        s_watchdog_timout_reached <= '0';
      end if;

      v_previous_reset_watchdog := reset_watchdog_i;
      v_previous_clk_1ms := s_clk_1ms;
      
    end if;
  end process watchdog_p;
  
end pwm_watchdog_1;
