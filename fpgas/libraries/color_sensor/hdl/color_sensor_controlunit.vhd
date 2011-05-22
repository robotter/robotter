
-------------------------------------------------------------------------------
-- Title      : color_sensor_controlunit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : color_sensor_controlunit.vhd
-- Author     : paul  <paul@rouletabille>
-- Company    : 
-- Created    : 2011-05-19
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
-- 2011-05-19  1.0      paul    Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity color_sensor_controlunit is
  
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

end color_sensor_controlunit;

architecture color_sensor_controlunit_1 of color_sensor_controlunit is

  type   state_machine_type is (sm_sleep, sm_red_measure, sm_red_interval, sm_blue_measure, sm_blue_interval);
  signal s_state_machine : state_machine_type;

  signal s_red_interval_done, s_blue_interval_done : std_logic;
  
begin  -- color_sensor_controlunit_1


	run_red_color_measure_o <= '1' when s_state_machine = sm_red_measure
			else '0';


	run_blue_color_measure_o <= '1' when s_state_machine = sm_blue_measure
			else '0';
	
  -----------------------------------------------------------------------------
  
  state_machine_p : process(clk_i, reset_ni)
    variable v_previous_red_color_measure_active, v_previous_blue_color_measure_active : std_logic;
  begin
    if reset_ni = '0' then
      s_state_machine <= sm_sleep;
      
    elsif rising_edge(clk_i) then

      case s_state_machine is
        
        when sm_sleep =>
          if enable_measure_i = '1' then
            s_state_machine <= sm_red_measure;
          else
            s_state_machine <= sm_sleep;
          end if;

        when sm_red_measure =>
          if v_previous_red_color_measure_active = '1' and red_color_measure_active_i = '0' then
            s_state_machine <= sm_red_interval;
          else
            s_state_machine <= sm_red_measure;
          end if;

        when sm_red_interval =>
          if s_red_interval_done = '1' then
            s_state_machine <= sm_blue_measure;
          else
            s_state_machine <= sm_red_interval;
          end if;

        when sm_blue_measure =>
          if v_previous_blue_color_measure_active = '1' and blue_color_measure_active_i = '0' then
            s_state_machine <= sm_blue_interval;
          else
            s_state_machine <= sm_blue_measure;
          end if;

        when sm_blue_interval =>
          if s_blue_interval_done = '1' then
            s_state_machine <= sm_sleep;
          else
            s_state_machine <= sm_blue_interval;
          end if;
      end case;
			v_previous_red_color_measure_active := red_color_measure_active_i;
			v_previous_blue_color_measure_active := blue_color_measure_active_i;
    end if;
  end process;

  -------------------------------------------------------------------------

  interval_p : process(clk_i, reset_ni)
    variable v_cnt : natural range 0 to 100000;
  begin
    if reset_ni = '0' then
      s_red_interval_done  <= '0';
      s_blue_interval_done <= '0';
      v_cnt                := 0;
      
    elsif rising_edge(clk_i) then

      if s_state_machine = sm_red_interval or s_state_machine = sm_blue_interval then

        if v_cnt = c_color_measure_interval_us * (c_fpga_frequency_khz /1000) then
          if s_state_machine = sm_red_interval then
            s_red_interval_done <= '1';
          elsif s_state_machine = sm_blue_interval then
            s_blue_interval_done <= '1';
          end if;
        else
          v_cnt := v_cnt +1;
        end if;
        
      else
        s_red_interval_done  <= '0';
        s_blue_interval_done <= '0';
        v_cnt                := 0;
      end if;

    end if;
  end process;
  
  

end color_sensor_controlunit_1;
