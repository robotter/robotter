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


entity pwm_signed is
  
  generic (
    default_period_c : natural range 0 to 8191 := 8191  -- pwm period after reset
    );
  port (
    clk_i   : in std_logic;             -- clock
    reset_i : in std_logic;             -- reset

    period_i            : in  std_logic_vector(12 downto 0);  -- period of the pwm
    pulse_duration_i    : in  std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
    period_o            : out std_logic_vector(12 downto 0);  -- period of the pwm currently applied
    pulse_duration_o    : out std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
    update_param_i      : in  std_logic;  -- update values of period and pulse duration signal
    update_param_done_o : out std_logic;  -- update values of period and pulse duration signa
    ce_pwm_i            : in  std_logic;  -- enable emission of pwm
    pwm_out_o           : out std_logic;  -- pwm
    pwm_sign_o          : out std_logic);  -- sign of the pwm
end entity;

architecture pwm_signed_1 of pwm_signed
is
  SIGNAL period_s                  : natural range 0 to 8191;
  SIGNAL pulse_duration_s          : natural range 0 to 8191;  -- = pulse_duration_s 
  SIGNAL pwm_sign_s                : std_logic;  -- sign of the pwm, applied to output
                                        -- synchronously with beginning of
                                                 -- pulse ( data extracted from pulse_duration_i(12))
  signal pwm_out_s, pwm_sign_out_s : std_logic;  -- pwm signal 
  
  
begin  -- pwm_signed_1

  actualize_data_p : process (clk_i, reset_i)
    variable previous_update_param_v : std_logic;
  begin
    if reset_i = '0' then
      period_s                <= default_period_c;
      pulse_duration_s        <= 0;
      pwm_sign_s              <= '0';
      previous_update_param_v := '0';
      update_param_done_o     <= '0';
      period_o <= (others => '1');
      pulse_duration_o <= (others => '0');
      
    elsif rising_edge(clk_i) then

      -- avoid to affect period to 0, 
      if previous_update_param_v = '0' and update_param_i = '1' and period_i /= "0000000000000" then
        period_s            <= to_integer(unsigned(period_i(12 downto 0)));
        pwm_sign_s          <= pulse_duration_i(13);
        if pulse_duration_i(13) = '0' then
          pulse_duration_s    <= to_integer(unsigned(pulse_duration_i(12 downto 0)));
          else
          pulse_duration_s    <= to_integer(unsigned(not(pulse_duration_i(12 downto 0))));
        end if;
        
        update_param_done_o <= '1';
        period_o <= period_i;
        pulse_duration_o <= pulse_duration_i;
      end if;

      if update_param_i = '0' then
        update_param_done_o <= '0';
      end if;

      previous_update_param_v := update_param_i;
    end if;
  end process actualize_data_p;



  pwm_process_p : process(clk_i, reset_i)
    variable pwm_counter_v            : natural range 0 to 8191;
    variable period_pwm_v             : natural range 0 to 8191;
    variable pulse_duration_v         : natural range 0 to 8191;
    variable pwm_sign_v               : std_logic;
    variable pwm_out_v                : std_logic;
    
  begin
    if reset_i = '0' then
      pwm_counter_v            := 0;
      pwm_sign_out_s           <= '0';
      pwm_out_s                <= '0';
      period_pwm_v             := default_period_c;
      pwm_sign_v               := '0';
      pulse_duration_v         := 1;
      pwm_out_v                := '0';
      
    elsif rising_edge(clk_i) then


      -- begining of pulse
      if pwm_counter_v = period_pwm_v then
        pwm_out_v     := not(pwm_sign_s);
        pwm_counter_v := 0;

        -- update pwm parameters for current cycle
        pwm_sign_v       := pwm_sign_s;
        period_pwm_v     := period_s;
        pulse_duration_v := pulse_duration_s;
      end if;

      -- end of pulse
      if pwm_counter_v = pulse_duration_v then
        pwm_out_v := pwm_sign_v;
      end if;

      -- increment pwm counter
      if pwm_counter_v = 8191 then
        pwm_counter_v := 0;
      end if;
      pwm_counter_v := pwm_counter_v +1;

      -- affects signal to outputs
      pwm_out_s      <= pwm_out_v;
      pwm_sign_out_s <= pwm_sign_v;
    end if;
  end process pwm_process_p;


  -- allow emission on pwm outputs only if ce_pwm_i allow it
  pwm_sign_o <= pwm_sign_out_s when ce_pwm_i = '1'
                else '0';
  
  pwm_out_o <= pwm_out_s when ce_pwm_i = '1'
               else '0';
  
end pwm_signed_1;
