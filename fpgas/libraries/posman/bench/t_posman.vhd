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
--! @brief POSition MANager top testbench
--! @author JD <jd@robotter.fr>
-----------------------------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

use work.p_wishbone_testbench.all;

entity t_posman is
end entity t_posman;

architecture t_posman_1 of t_posman is

  constant fpga_period_c : time := 20 ns; -- FPGA period

  signal endofsimulation_s : boolean := false;

  signal reset_s      : std_logic;
  signal clk_s      : std_logic;
  signal wbs_adr_s  : std_logic_vector(5 downto 0);
  signal wbs_dato_s : std_logic_vector(7 downto 0);
  signal wbs_dati_s : std_logic_vector(7 downto 0);
  signal wbs_we_s   : std_logic;
  signal wbs_stb_s  : std_logic;
  signal wbs_ack_s  : std_logic;
  signal wbs_cyc_s  : std_logic;

  signal adns1_deltax_s : signed (15 downto 0);
  signal adns1_deltay_s : signed (15 downto 0);
  signal adns2_deltax_s : signed (15 downto 0);
  signal adns2_deltay_s : signed (15 downto 0);
  signal adns3_deltax_s : signed (15 downto 0);
  signal adns3_deltay_s : signed (15 downto 0);
  signal motor1_s : signed (15 downto 0);
  signal motor2_s : signed (15 downto 0);
  signal motor3_s : signed (15 downto 0);

  signal out_s : std_logic_vector(7 downto 0);
  signal byte_s : std_logic_vector(7 downto 0);
  
  signal synchro_s : std_logic;

  signal debug_s : std_logic;

  component posman is 
  generic (
    id_c         : natural := 2;
    wb_size_c    : natural := 8;           -- data port size
    adns_size_c  : natural := 16;        -- data sensor port size
    squal_size_c : natural := 8;  -- squal port size
    freq_fpga_c  : natural := 50000
    );
  port (
    -- wishbone interface
    wbs_rst_i : in  std_logic;
    wbs_clk_i : in std_logic;
    wbs_adr_i : in std_logic_vector(5 downto 0);
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0);
    wbs_we_i  : in std_logic;
    wbs_stb_i : in std_logic;
    wbs_ack_o : out std_logic;
    wbs_cyc_i : in std_logic;
    adns1_deltax_i : in signed (15 downto 0);
    adns1_deltay_i : in signed (15 downto 0);
    adns2_deltax_i : in signed (15 downto 0);
    adns2_deltay_i : in signed (15 downto 0);
    adns3_deltax_i : in signed (15 downto 0);
    adns3_deltay_i : in signed (15 downto 0);
    motor1_i : in signed (15 downto 0);
    motor2_i : in signed (15 downto 0);
    motor3_i : in signed (15 downto 0);
    synchro_o : out std_logic;
    debug_i : in std_logic
    );
  end component posman;

  for top_posman_0 : posman use entity work.posman;

begin

  top_posman_0 : posman
  generic map (
    freq_fpga_c => 50000
  )
  port map (
    wbs_rst_i => reset_s,
    wbs_clk_i => clk_s,
    wbs_adr_i => wbs_adr_s,
    wbs_dat_o => wbs_dato_s,
    wbs_dat_i => wbs_dati_s,
    wbs_we_i  => wbs_we_s,
    wbs_stb_i => wbs_stb_s,
    wbs_ack_o => wbs_ack_s,
    wbs_cyc_i => wbs_cyc_s,
    adns1_deltax_i => adns1_deltax_s,
    adns1_deltay_i => adns1_deltay_s,
    adns2_deltax_i => adns2_deltax_s,
    adns2_deltay_i => adns2_deltay_s,
    adns3_deltax_i => adns3_deltax_s,
    adns3_deltay_i => adns3_deltay_s,
    motor1_i => motor1_s, 
    motor2_i => motor2_s, 
    motor3_i => motor3_s, 
    synchro_o => synchro_s,
    debug_i => debug_s
  );


  -------------------------------------------------
  -- CLOCK GENERATION PROCESS
  clock_p : process
  begin
    if endofsimulation_s = true then
      wait;
    end if;

    clk_s <= '1';
    wait for fpga_period_c/2;
    clk_s <= '0';
    wait for fpga_period_c/2;
  end process clock_p;
  -------------------------------------------------

  -------------------------------------------------
  -- MAIN PROCESS
  main_p : process
    variable address_v : std_logic_vector(7 downto 0);
    variable data_v : std_logic_vector(15 downto 0);
  begin

    reset_s <= '1';
    
    wbs_adr_s <= "ZZZZZZ";
    wbs_we_s <= 'Z';
    wbs_stb_s <= '0';
    wbs_cyc_s <= '0';
    wbs_dati_s <= x"00";

    adns1_deltax_s <= x"0000";
    adns1_deltay_s <= x"0000";
    adns2_deltax_s <= x"0000";
    adns2_deltay_s <= x"0000";
    adns3_deltax_s <= x"0000";
    adns3_deltay_s <= x"0000";
    motor1_s <= x"0000";
    motor2_s <= x"0000";
    motor3_s <= x"0000";

    debug_s <= '0';

    wait for 20 ns;
    reset_s <= '0';
    wait for 20 ns;
    
    -- read ID
    wb_read("000000", clk_s, wbs_adr_s, wbs_dato_s, wbs_we_s, 
             wbs_stb_s, wbs_ack_s, wbs_cyc_s, byte_s);
    wait until rising_edge(clk_s);
    
    -- fill matrix
    for i in 0 to 26 loop
      address_v := std_logic_vector(to_unsigned(i,8));
      data_v :=    std_logic_vector(to_unsigned(1, 16));
      wb_write("000001", address_v, clk_s, wbs_adr_s, wbs_dati_s,
               wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
      wb_write("000010", data_v(7 downto 0), clk_s, wbs_adr_s,
                wbs_dati_s, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
      wb_write("000011", data_v(15 downto 8), clk_s, wbs_adr_s,
                wbs_dati_s, wbs_we_s, wbs_stb_s, wbs_ack_s, wbs_cyc_s);
    end loop;
    
    -- start a calculus
    debug_s <= '1';

    adns1_deltax_s <= x"0100";
    adns1_deltay_s <= x"0100";
    adns2_deltax_s <= x"0100";
    adns2_deltay_s <= x"0100";
    adns3_deltax_s <= x"0100";
    adns3_deltay_s <= x"0100";
    motor1_s <= x"0100";
    motor2_s <= x"0100";
    motor3_s <= x"0100";


    wait for 5 us;

    endofsimulation_s <= true;
    wait;
  end process main_p;
  -------------------------------------------------


end architecture t_posman_1;



