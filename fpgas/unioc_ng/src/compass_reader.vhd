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
--! First ticks (1ms) are skipped. Then, angle is increased every 0.01ms.
architecture compass_reader_1 of compass_reader is

  --! type for skipped ticks count
  subtype skip_ticks_cnt is natural range 0 to clk_freq_c-1;
  --! type for angle value ticks count
  subtype angle_ticks_cnt is natural range 0 to clk_freq_c/100-1;

  --! first impulse ticks to skip (1 ms), down counted
  signal skip_ticks_s   : skip_ticks_cnt;
  --! angle value ticks (0.1 deg every 0.01 ms), down counted
  signal angle_ticks_s  : angle_ticks_cnt;
  --! current counted angle value
  signal angle_val_s    : natural range 0 to 3599;

begin

  count_p : process (clk_i, reset_i)

    variable last_pwm_v : std_logic; --! last PWM value

  begin

    if reset_i = '1' then
      skip_ticks_s  <= 0;
      angle_ticks_s <= 0;
      angle_val_s   <= 0;
      angle_o       <= 0;
      last_pwm_v := '0';

    elsif rising_edge(clk_i) then

      if last_pwm_v = '0' and pwm_i = '1' then
        -- PWM rising edge: reset counts
        skip_ticks_s  <= skip_ticks_cnt'high;
        angle_ticks_s <= angle_ticks_cnt'high;
        angle_val_s   <= 0;

      elsif last_pwm_v = '1' and pwm_i = '0' then
        -- PWM falling edge: new angle value is ready
        angle_o <= angle_val_s;

      elsif pwm_i = '1' then
        -- impulse
        if skip_ticks_s /= 0 then
          -- skipped ticks
          skip_ticks_s <= skip_ticks_s - 1;
        elsif angle_ticks_s = 0 then
          -- increase angle value, reset tick count
          angle_val_s <= angle_val_s + 1;
          angle_ticks_s <= angle_ticks_cnt'high;
        else
          -- increase angle ticks
          angle_ticks_s <= angle_ticks_s - 1;
        end if;

      end if;

      last_pwm_v := pwm_i;

    end if;

  end process count_p;

end architecture compass_reader_1;

