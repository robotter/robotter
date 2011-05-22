-------------------------------------------------------------------------------
-- Title      : color_sensor_interface
-- Project    : 
-------------------------------------------------------------------------------
-- File       : color_sensor_interface.vhd
-- Author     :   <paul@rouletabille>
-- Company    : 
-- Last update: 2011-05-21
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: color_sensor wishbone interface
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/05/16  1.0      cgalle  Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity color_sensor_interface is

  generic (
    c_id : natural range 1 to 255 
    );

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

end color_sensor_interface;

architecture color_sensor_interface_1 of color_sensor_interface is

  signal ack_read_s               : std_logic;
  signal ack_write_s              : std_logic;
  signal s_enable_color_detection : std_logic;
  
begin

  wbs_ack_o <= ack_write_s or ack_read_s;

  enable_color_detection_o <= s_enable_color_detection;

  write_bloc_p : process(wbs_clk_i, wbs_rst_i)
    variable v_update_blue_parameter, v_update_red_parameter : std_logic;
  begin
    if wbs_rst_i = '1' then
      ack_write_s              <= '0';
      v_update_red_parameter   := '0';
      v_update_blue_parameter  := '0';
      s_enable_color_detection <= '0';

    elsif rising_edge(wbs_clk_i) then
      if ((wbs_stb_i and wbs_we_i and wbs_cyc_i) = '1') then
        ack_write_s <= '1';
        case to_integer(unsigned(wbs_adr_i))is
          -- pwm config
          when 1 => s_enable_color_detection          <= wbs_dat_i(0);
          when 2 => null;               -- read only
                    -- red color threshold
          when 3 => red_color_threshold_o(7 downto 0) <= wbs_dat_i;
                    v_update_red_parameter := '1';
                    
                    
          when 4 => red_color_threshold_o(8) <= wbs_dat_i(0);

                    -- blue color threshold
          when 5 => blue_color_threshold_o(7 downto 0) <= wbs_dat_i;
                    v_update_blue_parameter := '1';
          when 6 => blue_color_threshold_o(8) <= wbs_dat_i(0);

          when others => null;
        end case;
      else
        ack_write_s             <= '0';
        update_red_parameter_o  <= v_update_red_parameter;
        update_blue_parameter_o <= v_update_blue_parameter;
      end if;

      if update_red_parameter_done_i = '1' then
        v_update_red_parameter := '0';
      end if;

      if update_blue_parameter_done_i = '1' then
        v_update_blue_parameter := '0';
      end if;
    end if;

  end process write_bloc_p;


  read_bloc_p : process(wbs_clk_i, wbs_rst_i)
  begin
    if wbs_rst_i = '1' then
      wbs_dat_o  <= (others => '0');
      ack_read_s <= '0';

    elsif rising_edge(wbs_clk_i) then
      if (wbs_stb_i = '1' and wbs_we_i = '0' and wbs_cyc_i = '1') then
        ack_read_s <= '1';
        case to_integer(unsigned(wbs_adr_i)) is
          when 0 => wbs_dat_o <= std_logic_vector(to_unsigned(c_id, wbs_dat_o'length));
                    -- color sensor status
          when 1 => wbs_dat_o <= (0 => s_enable_color_detection, others => '0');
                    -- color sensor result
          when 2 => wbs_dat_o <= (0 => red_color_detected_i, 1 => blue_color_detected_i, others => '0');

                    -- red threshold
          when 3 => wbs_dat_o <= red_color_threshold_i(7 downto 0);
          when 4 => wbs_dat_o <= (0=> red_color_threshold_i(8), others => '0');

                    -- blue threshold
          when 5      => wbs_dat_o <= blue_color_threshold_i(7 downto 0);
          when 6      => wbs_dat_o <= (0=> blue_color_threshold_i(8), others => '0');
          when others => null;
        end case;

      else
        wbs_dat_o  <= (others => '0');
        ack_read_s <= '0';
      end if;
    end if;
  end process read_bloc_p;

end color_sensor_interface_1;
