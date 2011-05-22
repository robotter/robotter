-------------------------------------------------------------------------------
-- Title      : color_sensor_unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : color_sensor_unit.vhd
-- Author     :   <Paul@ROULETABILLE>
-- Company    : 
-- Created    : 2011-05-16
-- Last update: 2011-05-16
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-05-16  1.0      Paul    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity color_sensor_unit is
  
  generic (
    c_fpga_frequency_khz             : natural range 0 to 100000 := 50000;
    c_apds_enable_to_ledPwm_delay_us : natural range 1 to 100    := 30;
    c_led_pwm_frequency_khz          : natural range 10 to 1000  := 100;
    c_led_pwm_pulse_width_us         : natural range 1 to 120    := 1
    );

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

end color_sensor_unit;

architecture color_sensor_unit_1 of color_sensor_unit is

  --state machine enumeration
  type   state_machine_type is (sm_sleep_mode, sm_enable_to_ledPwm_delay, sm_led_pwm);
  signal s_state_machine : state_machine_type;

  -- state machine return signal
  signal s_enable_to_ledPwm_delay_done : std_logic;
  signal s_led_pwm_state_done          : std_logic;

  signal s_apds9700_pwm  : std_logic;
  signal s_apds9700_dout : std_logic;
  signal s_threshold     : natural range 0 to 511;
  
begin  -- color_sensor_unit_1
  -------------------------------------------------------------------------------

  measure_in_progress_o <= '1' when s_state_machine = sm_enable_to_ledPwm_delay or s_state_machine = sm_led_pwm
                           else '0';

  apds9700_enable_no <= '0' when s_state_machine = sm_enable_to_ledPwm_delay or s_state_machine = sm_led_pwm
                        else '1';
												
	apds9700_pwm_o<= s_apds9700_pwm;
  -------------------------------------------------------------------------------

  -------------------------------------------------------------------------------
  -- state machine process
  state_machine_p : process (clk_i, reset_ni)
    variable v_previous_run_measure_trigger : std_logic;
  begin

    if reset_ni = '0' then
      s_state_machine                <= sm_sleep_mode;
      v_previous_run_measure_trigger := '1';
      
    elsif (rising_edge(clk_i)) then

      -- Determine the next state synchronously, based on
      -- the current state and the input
      case s_state_machine is
        
        when sm_sleep_mode =>
          -- wake up from sleep on rising edge of run_measure_trigger_i
          if v_previous_run_measure_trigger = '0' and run_measure_trigger_i = '1' then
            s_state_machine <= sm_enable_to_ledPwm_delay;
          else
            s_state_machine <= sm_sleep_mode;
          end if;
          
        when sm_enable_to_ledPwm_delay =>
          if s_enable_to_ledPwm_delay_done = '1' then
            s_state_machine <= sm_led_pwm;
          else
            s_state_machine <= sm_enable_to_ledPwm_delay;
          end if;
          
        when sm_led_pwm =>
          if s_led_pwm_state_done = '1' then
            s_state_machine <= sm_sleep_mode;
          else
            s_state_machine <= sm_led_pwm;
          end if;
        when others => s_state_machine <= sm_sleep_mode;
      end case;

      v_previous_run_measure_trigger := run_measure_trigger_i;
    end if;
  end process;

  -------------------------------------------------------------------------------

  enable_to_ledPwm_delay_p : process (clk_i, reset_ni)
    variable v_it : natural range 0 to 10000;
  begin  -- process enable_to_ledPwm_delay_p
    if reset_ni = '0' then              -- asynchronous reset (active low)
      v_it                          := 0;
      s_enable_to_ledPwm_delay_done <= '0';
      
    elsif rising_edge(clk_i) then       -- rising clock edge
      if s_state_machine = sm_enable_to_ledPwm_delay then

        -- delay reached
        if v_it = ((c_apds_enable_to_ledPwm_delay_us *1000)/(1000000/c_fpga_frequency_khz)) then
          s_enable_to_ledPwm_delay_done <= '1';
        else
          v_it := v_it +1;
        end if;

      else
        v_it                          := 0;
        s_enable_to_ledPwm_delay_done <= '0';
      end if;
    end if;
  end process enable_to_ledPwm_delay_p;

  -----------------------------------------------------------------------------

  led_pwm_generation_p : process(clk_i, reset_ni)
    variable v_it : natural range 0 to 10000;
  begin
    if reset_ni = '0' then
      v_it           := 0;
      s_apds9700_pwm <= '0';
      
    elsif rising_edge(clk_i) then
      if s_state_machine = sm_led_pwm then
        if v_it = 0 then
          s_apds9700_pwm <= '1';
        elsif v_it = ((c_led_pwm_pulse_width_us*1000)/(1000000/c_fpga_frequency_khz)) then
          s_apds9700_pwm <= '0';
        end if;

        if v_it = (c_fpga_frequency_khz / c_led_pwm_frequency_khz) then
          v_it := 0;
        else
          v_it := v_it +1;
        end if;
        
      else
        v_it           := 0;
        s_apds9700_pwm <= '0';
      end if;
      
    end if;
  end process;

  color_detection_process_p : process(clk_i, reset_ni)
    variable v_pulse_cnt                 : natural range 0 to 511;
    variable v_previous_apds9700_pwm     : std_logic;
    variable v_color_threshold_overtaken : std_logic;
    variable v_previous_apds9700_dout    : std_logic;
    
  begin
    if reset_ni = '0' then
      v_previous_apds9700_pwm     := '1';
      v_pulse_cnt                 := 0;
      v_color_threshold_overtaken := '0';
      s_led_pwm_state_done        <= '0';
      
    elsif rising_edge(clk_i) then
      if s_state_machine = sm_led_pwm then
        
        if v_previous_apds9700_pwm = '0' and s_apds9700_pwm = '1' then
          v_pulse_cnt := v_pulse_cnt +1;
					
          -- detect that threshold that determinates that color is not present
          -- as been reached
          if v_pulse_cnt = s_threshold then
            v_color_threshold_overtaken := '1';
          end if;

          if v_previous_apds9700_dout = '1' and s_apds9700_dout = '0' then
            color_detected_o <= not(v_color_threshold_overtaken);
						s_led_pwm_state_done <= '1';
					elsif v_pulse_cnt = 500 then
						s_led_pwm_state_done <= '1';
						color_detected_o <= '0';
          end if;
          
          v_previous_apds9700_dout := s_apds9700_dout;
        end if;
        
      else
        v_pulse_cnt                 := 0;
        s_led_pwm_state_done        <= '0';
        v_color_threshold_overtaken := '0';
        
      end if;
      v_previous_apds9700_pwm := s_apds9700_pwm;
      
    end if;
  end process;

  -----------------------------------------------------------------------------

  apds9700_dout_filter_p : process(clk_i, reset_ni)
    variable v_filter_data : std_logic_vector(5 downto 0);
    variable v_filter_data_high, v_filter_data_low : std_logic_vector(v_filter_data'range);
      
  begin
    if reset_ni = '0' then
      v_filter_data :=(others => '0');
      s_apds9700_dout <= '0';
      v_filter_data_high := (others => '1');
      v_filter_data_low := (others => '0');
      
    elsif rising_edge(clk_i) then
      v_filter_data := v_filter_data(v_filter_data'left-1 downto 0) & apds9700_dout_i;

      if v_filter_data = v_filter_data_low  then
        s_apds9700_dout <= '0';
      elsif v_filter_data = v_filter_data_high then
        s_apds9700_dout <= '1';
      end if;
      
    end if;
  end process;
  
	 -----------------------------------------------------------------------------

  update_parameters_p : process(clk_i, reset_ni)
		variable v_threshold : natural range 0 to 511;
		variable v_previous_update_parameters : std_logic;
  begin
    if reset_ni = '0' then
      s_threshold <= 20;
			v_threshold := 20;
      v_previous_update_parameters := '1';
			update_parameters_done_o <= '0';
			
    elsif rising_edge(clk_i) then
      
			if v_previous_update_parameters = '0' and update_parameters_i = '1' then
				v_threshold := to_integer(unsigned(threshold_i(8 downto 0)));
				update_parameters_done_o <= '1';
			else
				update_parameters_done_o <= '0';
			end if;
			
			if s_state_machine = sm_sleep_mode then
				s_threshold <= v_threshold;
				threshold_o <= threshold_i;
			end if;
			
      v_previous_update_parameters := update_parameters_i;
    end if;
  end process;
	
end color_sensor_unit_1;
