-------------------------------------------------------------------------------
-- Title      : color_sensor_top
-- Project    : 
-------------------------------------------------------------------------------
-- File       : color_sensor_top.vhd
-- Author     :   <Paul@ROULETABILLE>
-- Company    : 
-- Created    : 2011-05-21
-- Last update: 2011-05-21
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-21  1.0      Paul    Created
-------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity color_sensor_top is
  generic (
    c_id                             : natural range 1 to 255    := 2;
    c_fpga_frequency_khz             : natural range 1 to 100000 := 50000;
    c_color_measure_interval_us      : natural range 1 to 1000   := 100;
    c_apds_enable_to_ledPwm_delay_us : natural range 1 to 100    := 30;
    c_led_pwm_frequency_khz          : natural range 10 to 1000  := 100;
    c_led_pwm_pulse_width_us         : natural range 1 to 120    := 1);
  port (
    --! Wishbone interface
    -- wishbone interface
    wbs_rst_i : in std_logic;           -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock

    wbs_adr_i : in  std_logic_vector(5 downto 0);  -- address BUS
    wbs_dat_o : out std_logic_vector(7 downto 0);  -- data readden
                                                   -- from bus
    wbs_dat_i : in  std_logic_vector(7 downto 0);  -- data write from BUS
    wbs_we_i  : in  std_logic;          -- read/write
    wbs_stb_i : in  std_logic;          -- validate read/write operation
    wbs_ack_o : out std_logic;          -- operation succesful
    wbs_cyc_i : in  std_logic;

    red_apds9700_enable_no : out std_logic;
    red_apds9700_pwm_o     : out std_logic;
    red_apds9700_dout_i    : in  std_logic;

    blue_apds9700_enable_no : out std_logic;
    blue_apds9700_pwm_o     : out std_logic;
    blue_apds9700_dout_i    : in  std_logic);


end color_sensor_top;

architecture color_sensor_top_1 of color_sensor_top is

  
  component color_sensor_controlunit is
    
    generic (
      c_fpga_frequency_khz        : natural range 1 to 100000 := 50000;
      c_color_measure_interval_us : natural range 0 to 1000   := 100);
    port (
      clk_i                       : in  std_logic;
      reset_ni                    : in  std_logic;
      enable_measure_i            : in  std_logic;
      run_blue_color_measure_o    : out std_logic;
      blue_color_measure_active_i : in  std_logic;
      run_red_color_measure_o     : out std_logic;
      red_color_measure_active_i  : in  std_logic);

  end component;


  component color_sensor_unit is
    
    generic (
      c_fpga_frequency_khz             : natural range 0 to 100000 := 50000;
      c_apds_enable_to_ledPwm_delay_us : natural range 1 to 100    := 30;
      c_led_pwm_frequency_khz          : natural range 10 to 1000  := 100;
      c_led_pwm_pulse_width_us         : natural range 1 to 120    := 1);
    port (
      clk_i    : in std_logic;
      reset_ni : in std_logic;

      -- thresold used to detect the color
      threshold_i              : in  std_logic_vector(8 downto 0);
      update_parameters_i      : in  std_logic;
      update_parameters_done_o : out std_logic;
      --threshold applied
      threshold_o              : out std_logic_vector(8 downto 0);

      -- rising_edge on run_measure_trigger_i will run a single measure
      run_measure_trigger_i : in std_logic;

      -- high level indicates that a color measure is in pro
      measure_in_progress_o : out std_logic;

      -- apds9700 control signal
      apds9700_enable_no : out std_logic;
      apds9700_pwm_o     : out std_logic;
      apds9700_dout_i    : in  std_logic;

      -- signal that indicates that the corresponding color has been detected
      color_detected_o : out std_logic);

  end component;


  component color_sensor_interface is

    generic (
      c_id : natural range 1 to 255
      );

    port (
      --! Wishbone interface
      -- wishbone interface
      wbs_rst_i : in std_logic;         -- asynchronous reset, active high
      wbs_clk_i : in std_logic;         -- clock

      wbs_adr_i : in  std_logic_vector(5 downto 0);  -- address BUS
      wbs_dat_o : out std_logic_vector(7 downto 0);  -- data readden
                                                     -- from bus
      wbs_dat_i : in  std_logic_vector(7 downto 0);  -- data write from BUS
      wbs_we_i  : in  std_logic;        -- read/write
      wbs_stb_i : in  std_logic;        -- validate read/write operation
      wbs_ack_o : out std_logic;        -- operation succesful
      wbs_cyc_i : in  std_logic;

      -- global enable signal
      enable_color_detection_o : out std_logic;

      -- red color measure parameters
      red_color_threshold_o       : out std_logic_vector(8 downto 0);
      update_red_parameter_o      : out std_logic;
      update_red_parameter_done_i : in  std_logic;
      red_color_threshold_i       : in  std_logic_vector(8 downto 0);
      red_color_detected_i        : in  std_logic;

      -- blue color measure parameters
      blue_color_threshold_o       : out std_logic_vector(8 downto 0);
      update_blue_parameter_o      : out std_logic;
      update_blue_parameter_done_i : in  std_logic;
      blue_color_threshold_i       : in  std_logic_vector(8 downto 0);
      blue_color_detected_i        : in  std_logic
      );

  end component;

  signal s_reset : std_logic;

  signal s_enable_color_detection : std_logic;

  signal s_red_color_threshold_out, s_red_color_threshold_in                       : std_logic_vector(8 downto 0);
  signal s_update_red_parameter, s_update_red_parameter_done, s_red_color_detected : std_logic;
  signal s_run_red_measure, s_red_measure_in_progress                              : std_logic;

  signal s_blue_color_threshold_out, s_blue_color_threshold_in                        : std_logic_vector(8 downto 0);
  signal s_update_blue_parameter, s_update_blue_parameter_done, s_blue_color_detected : std_logic;
  signal s_run_blue_measure, s_blue_measure_in_progress                               : std_logic;

begin  -- color_sensor_top_1

  s_reset <= not(wbs_rst_i);

  color_sensor_interface_1 : color_sensor_interface
    generic map (
      c_id => c_id)
    port map (
      wbs_rst_i                   => wbs_rst_i,
      wbs_clk_i                   => wbs_clk_i,
      wbs_adr_i                   => wbs_adr_i,
      wbs_dat_o                   => wbs_dat_o,
      wbs_dat_i                   => wbs_dat_i,
      wbs_we_i                    => wbs_we_i,
      wbs_stb_i                   => wbs_stb_i,
      wbs_ack_o                   => wbs_ack_o,
      wbs_cyc_i                   => wbs_cyc_i,
      enable_color_detection_o    => s_enable_color_detection,
      red_color_threshold_o       => s_red_color_threshold_out,
      update_red_parameter_o      => s_update_red_parameter,
      update_red_parameter_done_i => s_update_red_parameter_done,
      red_color_threshold_i       => s_red_color_threshold_in,
      red_color_detected_i        => s_red_color_detected,

      blue_color_threshold_o       => s_blue_color_threshold_out,
      update_blue_parameter_o      => s_update_blue_parameter,
      update_blue_parameter_done_i => s_update_blue_parameter_done,
      blue_color_threshold_i       => s_blue_color_threshold_in,
      blue_color_detected_i        => s_blue_color_detected);

  red_color_sensor_unit : color_sensor_unit
    generic map (
      c_fpga_frequency_khz             => c_fpga_frequency_khz,
      c_apds_enable_to_ledPwm_delay_us => c_apds_enable_to_ledPwm_delay_us,
      c_led_pwm_frequency_khz          => c_led_pwm_frequency_khz,
      c_led_pwm_pulse_width_us         => c_led_pwm_pulse_width_us)
    port map (
      clk_i                    => wbs_clk_i,
      reset_ni                 => s_reset,
      threshold_i              => s_red_color_threshold_out,
      update_parameters_i      => s_update_red_parameter,
      update_parameters_done_o => s_update_red_parameter_done,
      threshold_o              => s_red_color_threshold_in,
      run_measure_trigger_i    => s_run_red_measure,
      measure_in_progress_o    => s_red_measure_in_progress,
      apds9700_enable_no       => red_apds9700_enable_no,
      apds9700_pwm_o           => red_apds9700_pwm_o,
      apds9700_dout_i          => red_apds9700_dout_i,
      color_detected_o         => s_red_color_detected);

  blue_color_sensor_unit : color_sensor_unit
    generic map (
      c_fpga_frequency_khz             => c_fpga_frequency_khz,
      c_apds_enable_to_ledPwm_delay_us => c_apds_enable_to_ledPwm_delay_us,
      c_led_pwm_frequency_khz          => c_led_pwm_frequency_khz,
      c_led_pwm_pulse_width_us         => c_led_pwm_pulse_width_us)
    port map (
      clk_i                    => wbs_clk_i,
      reset_ni                 => s_reset,
      threshold_i              => s_blue_color_threshold_out,
      update_parameters_i      => s_update_blue_parameter,
      update_parameters_done_o => s_update_blue_parameter_done,
      threshold_o              => s_blue_color_threshold_in,
      run_measure_trigger_i    => s_run_blue_measure,
      measure_in_progress_o    => s_blue_measure_in_progress,
      apds9700_enable_no       => blue_apds9700_enable_no,
      apds9700_pwm_o           => blue_apds9700_pwm_o,
      apds9700_dout_i          => blue_apds9700_dout_i,
      color_detected_o         => s_blue_color_detected);

  color_sensor_controlunit_1 : color_sensor_controlunit
    generic map (
      c_fpga_frequency_khz        => c_fpga_frequency_khz,
      c_color_measure_interval_us => c_color_measure_interval_us)
    port map (
      clk_i                       => wbs_clk_i,
      reset_ni                    => s_reset,
      enable_measure_i            => s_enable_color_detection,
      run_blue_color_measure_o    => s_run_blue_measure,
      blue_color_measure_active_i => s_blue_measure_in_progress,
      run_red_color_measure_o     => s_run_red_measure,
      red_color_measure_active_i  => s_red_measure_in_progress);

end color_sensor_top_1;


















