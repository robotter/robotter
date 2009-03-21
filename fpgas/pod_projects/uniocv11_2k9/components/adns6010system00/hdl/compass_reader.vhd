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
--! @author ~ryder <benoit@ryder.fr>
-----------------------------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;


--! Read angle from compass PWM
entity compass_reader is

  generic (
    clk_freq_c : natural := 50000 --! FPGA clock frequency, in kHz
  );
  port (
    clk_i   : in  std_logic;
    reset_i : in  std_logic;
    pwm_i   : in  std_logic;
    --! read angle, 1/10 of deg
    angle_o : out natural range 0 to 3599
  );

end entity compass_reader;


--! Angle is computed by counting clock ticks.
--! First ticks (1ms) are skipped by subtracting 10.0 to the final value.
--!
--! @note Angle value count starts at 1 because it is more effective to
--! to subtract 100 than 99.
architecture compass_reader_1 of compass_reader is

  --! number of ticks per angle unit value
  constant angle_period_c : natural := clk_freq_c/100;

  --! angle value ticks (0.1 deg every 0.01 ms), down counted
  signal angle_ticks_s  : natural range 0 to angle_period_c-1;
  --! current counted angle value, including skipped 10.0 deg
  signal angle_val_s    : natural range 0 to 3699;

begin

  count_p : process (clk_i, reset_i)

    variable last_pwm_v : std_logic; --! last PWM value

  begin

    if reset_i = '1' then
      angle_ticks_s <= 0;
      angle_val_s   <= 0;
      angle_o       <= 0;
      last_pwm_v := '0';

    elsif rising_edge(clk_i) then

      if last_pwm_v = '0' and pwm_i = '1' then
        -- PWM rising edge: reset counts
        angle_ticks_s <= angle_period_c-1;
        angle_val_s   <= 1;

      elsif last_pwm_v = '1' and pwm_i = '0' then
        -- PWM falling edge: new angle value is ready
        if angle_val_s < 100 then
          angle_o <= 0;
        else
          angle_o <= angle_val_s - 100;
        end if;

      elsif pwm_i = '1' then
        -- impulse
        if angle_ticks_s = 0 then
          -- increase angle value, reset tick count
          angle_val_s <= angle_val_s + 1;
          angle_ticks_s <= angle_period_c-1;
        else
          -- increase angle ticks
          angle_ticks_s <= angle_ticks_s - 1;
        end if;

      end if;

      last_pwm_v := pwm_i;

    end if;

  end process count_p;

end architecture compass_reader_1;

