library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_signed_tb is  
  generic (
    fpga_frequency_c : natural range 1 to 100000 := 50000  -- fpga frequency
    );
  port (
    clk_o           : out  std_logic;    -- clock
    reset_o         : out  std_logic;    -- reset
    pwm_out_o       : out  std_logic    --  pwm
    );
end entity;

architecture pwm_signed_tb_1 of pwm_signed_tb
is
  
  component pwm_signed is
    generic (
      default_period_c : natural range 0 to 4095 := 4095  -- pwm period after reset
      );
    port (
      clk_i           : in  std_logic;    -- clock
      reset_i         : in  std_logic;    -- reset
      period_i        : in  std_logic_vector(11 downto 0);  -- period of the pwm
      pulse_duration_i : in std_logic_vector(12 downto 0);  -- pulse duration of the pwm, signed
      update_param_i : in  std_logic;  -- update values of period and pulse duration signal
	  	ce_pwm_i        : in std_logic;   -- enable emission of pwm
      pwm_out_o       : out std_logic;    -- pwm
      pwm_sign_o      : out std_logic);   -- sign of the pwm
  end component;
  
  signal period_s : std_logic_vector(11 downto 0) := (others => '0');--natural range 0 to 4095;
  signal pulse_duration_s : std_logic_vector(12 downto 0):= (others => '0'); --natural range 0 to 4095;  -- = pulse_duration_s 
  signal pwm_sign_s : std_logic;               -- sign of the pwm, applied to output
                                               -- synchronously with beginning of pulse

  signal clk_s : std_logic := '0';
  signal reset_s : std_logic;

  signal update_param_s, pwm_out_s : std_logic;
  signal pulse_duration_modification_period_s : time := 100 us;

  signal end_of_simulation : std_logic := '0';

begin  -- pwm_signed_tb_1

  entity_tested : pwm_signed
    generic map(
      default_period_c => 254
      )
    port map(
      clk_i => clk_s,
      reset_i => reset_s,

      period_i => period_s, --std_logic_vector(to_unsigned(period_s)),
      pulse_duration_i => pulse_duration_s, --std_logic_vector(to_unsigned(pulse_duration_s)),
      update_param_i => update_param_s,
	  ce_pwm_i => '1',
      pwm_out_o => pwm_out_s,
      pwm_sign_o => pwm_sign_s
      );

	pwm_out_o <= pwm_out_s;

  generate_clk_p : process
    variable tempo_v : time;
  begin
    tempo_v := (1000000/fpga_frequency_c) *1 ns;
    wait for tempo_v;
    clk_s <= not(clk_s);  
  end process generate_clk_p;


  generate_reset_p : process
  begin
    reset_s <= '1';
    wait FOR 30 us;
    reset_s <= '0';
    wait for 1 us;
    reset_s <= '1';
    wait until end_of_simulation = '1';
  end process generate_reset_p;
  
  modify_period_p : process
    variable v_it : natural := 0;
  begin
	pulse_duration_s(11 downto 0) <= std_logic_vector(to_unsigned(v_it, 12));

    update_param_s <= '1';
	wait for 40 ns;
    update_param_s <= '0';
    
	wait for 1 ms;
	wait for 432 us;
    v_it := v_it + 42;

    if v_it >= to_integer(unsigned(period_s)) then
      v_it := 0;
      pulse_duration_s(12) <= not(pulse_duration_s(12));
    end if;

  end process modify_period_p;

  modify_frequency_p : process
    variable v_it : natural := 0;
  begin
    
    period_s <= std_logic_vector(to_unsigned(v_it, 12));
    wait for 5 ms;
	wait for 231 us;
    v_it := v_it +139;
    if v_it >= 4095  then
      v_it := 0; 
    end if;
  end process modify_frequency_p;
  
  
end pwm_signed_tb_1;
