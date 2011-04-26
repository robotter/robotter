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

-- NOTE: always update first period and then pulse width


-----------------------------------------------------------------------------
--! @file
--! @author lamygalle
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity pwm_wishbone_interface is

  generic (
    id_c      :    natural := 10;       --! module ID
    wb_size_c :    natural := 8         -- data port size
    );
  port (
    --! Wishbone interface
    -- wishbone interface
    wbs_rst_i : IN std_logic;           -- asynchronous reset, active high
    wbs_clk_i : IN std_logic;           -- clock

    wbs_adr_i : IN  std_logic_vector(5 DOWNTO 0);  -- address BUS
    wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data readden
                                        -- from bus
    wbs_dat_i : IN  std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data write from BUS
    wbs_we_i  : IN  std_logic;          -- read/write
    wbs_stb_i : IN  std_logic;          -- validate read/write operation
    wbs_ack_o : OUT std_logic;          -- operation succesful
    wbs_cyc_i : IN  std_logic;

    -- pwm watchdog
    watchdog_timeout_o             : out std_logic_vector(7 downto 0);  --watchdog timout value (in ms)
    watchdog_timeout_i             : in  std_logic_vector(7 downto 0);  --watchdog timout value used (in ms)
    watchdog_timeout_update_o      : out std_logic;  -- update watchdog_timout, watchdog_timout taken on reset_watchdog_i rising edge
    watchdog_timeout_update_done_i : in  std_logic;
    watchdog_timout_reached_i      : in  std_logic;
    watchdog_enable_o              : out std_logic;
    watchdog_enable_i              : in  std_logic;

    --pwm interface 1
    pwm_1_period_o            : out std_logic_vector(12 downto 0);  -- period of the pwm
    pwm_1_pulse_duration_o    : out std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
    pwm_1_period_i            : in  std_logic_vector(12 downto 0);  -- period of the pwm currently applied
    pwm_1_pulse_duration_i    : in  std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
    pwm_1_update_param_o      : out std_logic;  -- update values of period and pulse duration signal
    pwm_1_update_param_done_i : in  std_logic;  -- update values of period and pulse duration signa
    pwm_1_ce_pwm_o            : out std_logic;  -- enable emission of pwm

    --pwm interface 2
    pwm_2_period_o            : out std_logic_vector(12 downto 0);  -- period of the pwm
    pwm_2_pulse_duration_o    : out std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
    pwm_2_period_i            : in  std_logic_vector(12 downto 0);  -- period of the pwm currently applied
    pwm_2_pulse_duration_i    : in  std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
    pwm_2_update_param_o      : out std_logic;  -- update values of period and pulse duration signal
    pwm_2_update_param_done_i : in  std_logic;  -- update values of period and pulse duration signa
    pwm_2_ce_pwm_o            : out std_logic;  -- enable emission of pwm

    --pwm interface 3
    pwm_3_period_o            : out std_logic_vector(12 downto 0);  -- period of the pwm
    pwm_3_pulse_duration_o    : out std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
    pwm_3_period_i            : in  std_logic_vector(12 downto 0);  -- period of the pwm currently applied
    pwm_3_pulse_duration_i    : in  std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
    pwm_3_update_param_o      : out std_logic;  -- update values of period and pulse duration signal
    pwm_3_update_param_done_i : in  std_logic;  -- update values of period and pulse duration signa
    pwm_3_ce_pwm_o            : out std_logic  -- enable emission of pwm
    );

end entity pwm_wishbone_interface;

architecture pwm_wishbone_interface_1 of pwm_wishbone_interface is
  signal enable_pwm_1_s, enable_pwm_2_s, enable_pwm_3_s, watchdog_enable_s : std_logic;
  SIGNAL ack_read_s                                                        : std_logic;
  SIGNAL ack_write_s                                                       : std_logic;

begin

  wbs_ack_o <= ack_write_s OR ack_read_s;

  pwm_1_ce_pwm_o    <= enable_pwm_1_s;
  pwm_2_ce_pwm_o    <= enable_pwm_2_s;
  pwm_3_ce_pwm_o    <= enable_pwm_3_s;
  watchdog_enable_o <= watchdog_enable_s;

  write_bloc_p                                                                : PROCESS(wbs_clk_i, wbs_rst_i)
    variable v_pwm_1_update_param, v_pwm_2_update_param, v_pwm_3_update_param : std_logic;
    variable v_watchdog_timeout_update                                        : std_logic;
  BEGIN
    IF wbs_rst_i = '1' THEN
      ack_write_s       <= '0';
      v_pwm_1_update_param      := '0';
      v_pwm_2_update_param      := '0';
      v_pwm_3_update_param      := '0';
      v_watchdog_timeout_update := '0';
      enable_pwm_1_s    <= '0';
      enable_pwm_2_s    <= '0';
      enable_pwm_3_s    <= '0';
      watchdog_enable_s <= '0';

    ELSIF rising_edge(wbs_clk_i) THEN
      IF ((wbs_stb_i AND wbs_we_i AND wbs_cyc_i) = '1') THEN
        ack_write_s                    <= '1';
        CASE to_integer(unsigned(wbs_adr_i))IS
          -- pwm config
          WHEN 1 => watchdog_enable_s  <= wbs_dat_i(1);
          WHEN 2 => watchdog_timeout_o <= wbs_dat_i;
                    v_watchdog_timeout_update := '1';

                    -- pwm config
          when 3 => enable_pwm_1_s <= wbs_dat_i(0);
                    enable_pwm_2_s <= wbs_dat_i(1);
                    enable_pwm_3_s <= wbs_dat_i(2);


                    -- pwm 1 parameters
          when 4 => pwm_1_period_o(7 downto 0)          <= wbs_dat_i;
          when 5 => pwm_1_period_o(12 downto 8)         <= wbs_dat_i(4 downto 0);
          when 6 => pwm_1_pulse_duration_o(7 downto 0)  <= wbs_dat_i;
                    v_pwm_1_update_param := '1';
          when 7 => pwm_1_pulse_duration_o(12 downto 8) <= wbs_dat_i(4 downto 0);
                    pwm_1_pulse_duration_o(13)          <= wbs_dat_i(7);  -- recopy sign

                    -- pwm 2 parameters
          when 8  => pwm_2_period_o(7 downto 0)          <= wbs_dat_i;
          when 9  => pwm_2_period_o(12 downto 8)         <= wbs_dat_i(4 downto 0);
          when 10 => pwm_2_pulse_duration_o(7 downto 0)  <= wbs_dat_i;
                     v_pwm_2_update_param := '1';
          when 11 => pwm_2_pulse_duration_o(12 downto 8) <= wbs_dat_i(4 downto 0);
                     pwm_2_pulse_duration_o(13)          <= wbs_dat_i(7);  -- recopy sign

                     -- pwm 2 parameters
          when 12     => pwm_3_period_o(7 downto 0)          <= wbs_dat_i;
          when 13     => pwm_3_period_o(12 downto 8)         <= wbs_dat_i(4 downto 0);
          when 14     => pwm_3_pulse_duration_o(7 downto 0)  <= wbs_dat_i;
                     v_pwm_3_update_param := '1';
          when 15     => pwm_3_pulse_duration_o(12 downto 8) <= wbs_dat_i(4 downto 0);
                     pwm_3_pulse_duration_o(13)              <= wbs_dat_i(7);  -- recopy sign
          WHEN OTHERS => NULL;
        END CASE;
      ELSE
        ack_write_s                                          <= '0';
        pwm_1_update_param_o                                 <= v_pwm_1_update_param;
        pwm_2_update_param_o                                 <= v_pwm_2_update_param;
        pwm_3_update_param_o                                 <= v_pwm_3_update_param;
        watchdog_timeout_update_o                            <= v_watchdog_timeout_update;
      END IF;

      if pwm_1_update_param_done_i = '1' then
        v_pwm_1_update_param := '0';
      end if;

      if pwm_2_update_param_done_i = '1' then
        v_pwm_2_update_param := '0';
      end if;

      if pwm_3_update_param_done_i = '1' then
        v_pwm_3_update_param := '0';
      end if;

      if watchdog_timeout_update_done_i = '1' then
        v_watchdog_timeout_update := '0';
      end if;

    END IF;

  END PROCESS write_bloc_p;


  read_bloc_p : PROCESS(wbs_clk_i, wbs_rst_i)
  BEGIN
    IF wbs_rst_i = '1' THEN
      wbs_dat_o  <= (OTHERS => '0');
      ack_read_s <= '0';

    ELSIF rising_edge(wbs_clk_i) THEN
      IF (wbs_stb_i = '1' AND wbs_we_i = '0' AND wbs_cyc_i = '1') THEN
        ack_read_s            <= '1';
        CASE to_integer(unsigned(wbs_adr_i)) IS
          WHEN 0 => wbs_dat_o <= std_logic_vector(to_unsigned(id_c, wb_size_c));
                    -- lock adns latchs
          WHEN 1 => wbs_dat_o <= (0 => watchdog_timout_reached_i, 1 => watchdog_enable_i, others => '0');
                    -- pwm period
          WHEN 2 => wbs_dat_o <= watchdog_timeout_i;
          when 3 => wbs_dat_o <= (0 => enable_pwm_1_s, 1 => enable_pwm_2_s, 2 => enable_pwm_3_s, others => '0');

                    -- pwm 1
          when 4 => wbs_dat_o <= pwm_1_period_i(7 downto 0);
          when 5 => wbs_dat_o <= "000" & pwm_1_period_i(12 downto 8);
          when 6 => wbs_dat_o <= pwm_1_pulse_duration_i(7 downto 0);
          when 7 => wbs_dat_o <= pwm_1_pulse_duration_i(13) & "00" & pwm_1_pulse_duration_i(12 downto 8);

                    -- pwm 2
          when 8  => wbs_dat_o <= pwm_2_period_i(7 downto 0);
          when 9  => wbs_dat_o <= "000" & pwm_2_period_i(12 downto 8);
          when 10 => wbs_dat_o <= pwm_2_pulse_duration_i(7 downto 0);
          when 11 => wbs_dat_o <= pwm_2_pulse_duration_i(13) & "00" & pwm_2_pulse_duration_i(12 downto 8);

                    -- pwm 3
          when 12     => wbs_dat_o <= pwm_3_period_i(7 downto 0);
          when 13     => wbs_dat_o <= "000" & pwm_3_period_i(12 downto 8);
          when 14     => wbs_dat_o <= pwm_3_pulse_duration_i(7 downto 0);
          when 15     => wbs_dat_o <= pwm_3_pulse_duration_i(13) & "00" & pwm_3_pulse_duration_i(12 downto 8);
          WHEN OTHERS => NULL;
        END CASE;

      ELSE
        wbs_dat_o  <= (OTHERS => '0');
        ack_read_s <= '0';
      END IF;
    END IF;
  END PROCESS read_bloc_p;


end architecture pwm_wishbone_interface_1;
