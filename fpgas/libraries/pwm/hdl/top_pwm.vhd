-------------------------------------------------------------------------------
-- Title      : top_pwm
-- Project    : 
-------------------------------------------------------------------------------
-- File       : top_pwm.vhd
-- Author     :   lamygalle
-- Company    : 
-- Last update: 2011-04-23
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: top of the pwm module for galiper robot 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/04/14  1.0      lamygalle       Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity top_pwm is

  generic (
    id_c                 : natural                 := 10;  -- module ID
    wb_size_c            : natural                 := 8;  -- data port size
    default_period_c     : natural range 0 to 8191 := 8191;  -- pwm period after reset
    fpga_frequency_khz_c : natural                 := 50000
    );
  port (
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

    -- pwm outputs
    pwm_out_1_o  : out std_logic;
    pwm_sign_1_o : out std_logic;

    pwm_out_2_o  : out std_logic;
    pwm_sign_2_o : out std_logic;

    pwm_out_3_o  : out std_logic;
    pwm_sign_3_o : out std_logic
    );
end top_pwm;

architecture top_pwm_1 of top_pwm is
  component pwm_watchdog
    is generic (
      fpga_frequency_khz_c :    natural                 := 50000
      );
    port (
      clk_i                : in std_logic;  -- clock
      reset_i              : in std_logic;  -- reset

      watchdog_timeout_i             : in  std_logic_vector(7 downto 0);  --watchdog timout value (in ms)
      watchdog_timeout_o             : out std_logic_vector(7 downto 0);  --watchdog timout value used (in ms)
      watchdog_timeout_update_i      : in  std_logic;  -- update watchdog_timout,
                                        -- watchdog_timout taken on
                                        -- reset_watchdog_i rising edge
      watchdog_timeout_update_done_o : out std_logic;  --watchdog_timeout_update_i handshake

      watchdog_enable_i : in  std_logic;  -- enable watchdog if high
      watchdog_enable_o : out std_logic;

      reset_watchdog_i          : in  std_logic;  -- resets the watchdog counter
      watchdog_timout_reached_o : out std_logic  -- timout signal, reset by reset_watchdog_i
      );                                -- sign of the pwm
  end component;


  component pwm_signed
    is generic (
      default_period_c :    natural range 0 to 8191 := 8191  -- pwm period after reset
      );
    port (
      clk_i            : in std_logic;  -- clock
      reset_i          : in std_logic;  -- reset

      period_i            : in  std_logic_vector(12 downto 0);  -- period of the pwm
      pulse_duration_i    : in  std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
      period_o            : out std_logic_vector(12 downto 0);  -- period of the pwm currently applied
      pulse_duration_o    : out std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
      update_param_i      : in  std_logic;  -- update values of period and pulse duration signal
      update_param_done_o : out std_logic;  -- update values of period and pulse duration signa
      ce_pwm_i            : in  std_logic;  -- enable emission of pwm
      pwm_out_o           : out std_logic;  -- pwm
      pwm_sign_o          : out std_logic);  -- sign of the pwm
  end component;

  component pwm_wishbone_interface
    is generic (
      id_c      :    natural := 10;     --! module ID
      wb_size_c :    natural := 8       -- data port size
      );
    port (
      --! Wishbone interface
      -- wishbone interface
      wbs_rst_i : IN std_logic;         -- asynchronous reset, active high
      wbs_clk_i : IN std_logic;         -- clock

      wbs_adr_i : IN  std_logic_vector(5 DOWNTO 0);  -- address BUS
      wbs_dat_o : OUT std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data readden
                                        -- from bus
      wbs_dat_i : IN  std_logic_vector(wb_size_c-1 DOWNTO 0);  -- data write from BUS
      wbs_we_i  : IN  std_logic;        -- read/write
      wbs_stb_i : IN  std_logic;        -- validate read/write operation
      wbs_ack_o : OUT std_logic;        -- operation succesful
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

  end component;

  signal watchdog_timeout_is            : std_logic_vector(7 downto 0);  --watchdog timout value (in ms)
  signal watchdog_timeout_os            : std_logic_vector(7 downto 0);  --watchdog timout value used (in ms)
  signal watchdog_timeout_update_s      : std_logic;  -- update watchdog_timout, watchdog_timout taken on reset_watchdog_i rising edge
  signal watchdog_timeout_update_done_s : std_logic;
  signal watchdog_enable_is             : std_logic;
  signal watchdog_enable_os             : std_logic;


  --pwm interface 1
  signal pwm_1_period_os           : std_logic_vector(12 downto 0);  -- period of the pwm
  signal pwm_1_pulse_duration_os   : std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
  signal pwm_1_period_is           : std_logic_vector(12 downto 0);  -- period of the pwm currently applied
  signal pwm_1_pulse_duration_is   : std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
  signal pwm_1_update_param_s      : std_logic;  -- update values of period and pulse duration signal
  signal pwm_1_update_param_done_s : std_logic;  -- update values of period and pulse duration signa
  signal pwm_1_ce_pwm_s            : std_logic;  -- enable emission of pwm

  --pwm interface 2
  signal pwm_2_period_os           : std_logic_vector(12 downto 0);  -- period of the pwm
  signal pwm_2_pulse_duration_os   : std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
  signal pwm_2_period_is           : std_logic_vector(12 downto 0);  -- period of the pwm currently applied
  signal pwm_2_pulse_duration_is   : std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
  signal pwm_2_update_param_s      : std_logic;  -- update values of period and pulse duration signal
  signal pwm_2_update_param_done_s : std_logic;  -- update values of period and pulse duration signa
  signal pwm_2_ce_pwm_s            : std_logic;  -- enable emission of pwm

  --pwm interface 3
  signal pwm_3_period_os           : std_logic_vector(12 downto 0);  -- period of the pwm
  signal pwm_3_pulse_duration_os   : std_logic_vector(13 downto 0);  -- pulse duration of the pwm, signed
  signal pwm_3_period_is           : std_logic_vector(12 downto 0);  -- period of the pwm currently applied
  signal pwm_3_pulse_duration_is   : std_logic_vector(13 downto 0);  -- pulse duration of the pwm currently applied
  signal pwm_3_update_param_s      : std_logic;  -- update values of period and pulse duration signal
  signal pwm_3_update_param_done_s : std_logic;  -- update values of period and pulse duration signa
  signal pwm_3_ce_pwm_s            : std_logic;  -- enable emission of pwm

  signal watchdog_timeout_reached_s : std_logic;
  signal reset_s                    : std_logic;
begin  -- top_pwm_1

  reset_s <= not(wbs_rst_i);

  wbs_interface : pwm_wishbone_interface
    generic map (
      id_c      => id_c,
      wb_size_c => wb_size_c)
    port map (
      wbs_rst_i => wbs_rst_i,
      wbs_clk_i => wbs_clk_i,
      wbs_adr_i => wbs_adr_i,
      wbs_dat_o => wbs_dat_o,
      wbs_dat_i => wbs_dat_i,
      wbs_we_i  => wbs_we_i,
      wbs_stb_i => wbs_stb_i,
      wbs_ack_o => wbs_ack_o,
      wbs_cyc_i => wbs_cyc_i,

      watchdog_timeout_i             => watchdog_timeout_is,
      watchdog_timeout_o             => watchdog_timeout_os,
      watchdog_timeout_update_o      => watchdog_timeout_update_s,
      watchdog_timeout_update_done_i => watchdog_timeout_update_done_s,
      watchdog_timout_reached_i      => watchdog_timeout_reached_s,
      watchdog_enable_o              => watchdog_enable_os,
      watchdog_enable_i              => watchdog_enable_is,

      pwm_1_period_o            => pwm_1_period_os,
      pwm_1_pulse_duration_o    => pwm_1_pulse_duration_os,
      pwm_1_period_i            => pwm_1_period_is,
      pwm_1_pulse_duration_i    => pwm_1_pulse_duration_is,
      pwm_1_update_param_o      => pwm_1_update_param_s,
      pwm_1_update_param_done_i => pwm_1_update_param_done_s,
      pwm_1_ce_pwm_o            => pwm_1_ce_pwm_s,

      pwm_2_period_o            => pwm_2_period_os,
      pwm_2_pulse_duration_o    => pwm_2_pulse_duration_os,
      pwm_2_period_i            => pwm_2_period_is,
      pwm_2_pulse_duration_i    => pwm_2_pulse_duration_is,
      pwm_2_update_param_o      => pwm_2_update_param_s,
      pwm_2_update_param_done_i => pwm_2_update_param_done_s,
      pwm_2_ce_pwm_o            => pwm_2_ce_pwm_s,

      pwm_3_period_o            => pwm_3_period_os,
      pwm_3_pulse_duration_o    => pwm_3_pulse_duration_os,
      pwm_3_period_i            => pwm_3_period_is,
      pwm_3_pulse_duration_i    => pwm_3_pulse_duration_is,
      pwm_3_update_param_o      => pwm_3_update_param_s,
      pwm_3_update_param_done_i => pwm_3_update_param_done_s,
      pwm_3_ce_pwm_o            => pwm_3_ce_pwm_s
      );

  pwm_watchdog_component : pwm_watchdog
    generic map (
      fpga_frequency_khz_c           => fpga_frequency_khz_c
      )
    port map (
      clk_i                          => wbs_clk_i,
      reset_i                        => reset_s,
      watchdog_timeout_i             => watchdog_timeout_os,
      watchdog_timeout_o             => watchdog_timeout_is,
      watchdog_timeout_update_i      => watchdog_timeout_update_s,
      watchdog_timeout_update_done_o => watchdog_timeout_update_done_s,
      watchdog_enable_i              => watchdog_enable_os,
      watchdog_enable_o              => watchdog_enable_is,
      reset_watchdog_i               => pwm_1_update_param_s or pwm_2_update_param_s or pwm_3_update_param_s,
      watchdog_timout_reached_o      => watchdog_timeout_reached_s);

  pwm_1_comp : pwm_signed
    generic map (
      default_period_c    => default_period_c)
    port map (
      clk_i               => wbs_clk_i,
      reset_i             => reset_s,
      period_i            => pwm_1_period_os,
      pulse_duration_i    => pwm_1_pulse_duration_os,
      period_o            => pwm_1_period_is,
      pulse_duration_o    => pwm_1_pulse_duration_is,
      update_param_i      => pwm_1_update_param_s,
      update_param_done_o => pwm_1_update_param_done_s,
      ce_pwm_i            => pwm_1_ce_pwm_s and not(watchdog_timeout_reached_s),
      pwm_out_o           => pwm_out_1_o,
      pwm_sign_o          => pwm_sign_1_o);

  pwm_2_comp : pwm_signed
    generic map (
      default_period_c    => default_period_c)
    port map (
      clk_i               => wbs_clk_i,
      reset_i             => reset_s,
      period_i            => pwm_2_period_os,
      pulse_duration_i    => pwm_2_pulse_duration_os,
      period_o            => pwm_2_period_is,
      pulse_duration_o    => pwm_2_pulse_duration_is,
      update_param_i      => pwm_2_update_param_s,
      update_param_done_o => pwm_2_update_param_done_s,
      ce_pwm_i            => pwm_2_ce_pwm_s and not(watchdog_timeout_reached_s),
      pwm_out_o           => pwm_out_2_o,
      pwm_sign_o          => pwm_sign_2_o);

  pwm_3_comp : pwm_signed
    generic map (
      default_period_c    => default_period_c)
    port map (
      clk_i               => wbs_clk_i,
      reset_i             => reset_s,
      period_i            => pwm_3_period_os,
      pulse_duration_i    => pwm_3_pulse_duration_os,
      period_o            => pwm_3_period_is,
      pulse_duration_o    => pwm_3_pulse_duration_is,
      update_param_i      => pwm_3_update_param_s,
      update_param_done_o => pwm_3_update_param_done_s,
      ce_pwm_i            => pwm_3_ce_pwm_s and not(watchdog_timeout_reached_s),
      pwm_out_o           => pwm_out_3_o,
      pwm_sign_o          => pwm_sign_3_o);

end top_pwm_1;
