-----------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2, or (at your option)
-- any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHout ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
--! @file posman_control.vhd
--! @author JD
--! Position manager control unit, drive calculus
-----------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity posman_control is
  generic (
    freq_fpga_c  : natural;
    ram_data_width_c : natural;
    matrix_ram_addr_width_c : natural;
    results_ram_addr_width_c : natural;
    int_size_c : natural;
    -- number of matrices to compute
    matrices_n_c : natural
    );

  port (
    -- 
    clk_i : std_logic;
    reset_ni : std_logic;

    -- RAM access
    matrix_ram_addr_o : out natural range 0 to 2**matrix_ram_addr_width_c-1;
    matrix_ram_data_i : in std_logic_vector(ram_data_width_c-1 downto 0);

    results_ram_addr_o : out natural range 0 to 2**results_ram_addr_width_c-1;
    results_ram_data_o : out std_logic_vector(ram_data_width_c-1 downto 0);
    results_ram_we_o : out std_logic;

    -- calculation control
    start_i : in std_logic;
    done_o : out std_logic;
    synchro_o : out std_logic;

    -- matrix loading
    matrix_valid_o : out std_logic;
    matrix_value_o : out signed(int_size_c-1 downto 0);
    -- matrix access
    matrix_compute_o : out std_logic;
    matrix_done_i : in std_logic;
    matrix_output0_i, matrix_output1_i, matrix_output2_i : in signed(int_size_c-1 downto 0)
  );

end posman_control;

architecture posman_control_1 of posman_control is
  
  signal matrix_valid_s : std_logic;

  signal matrix_loader_start_s : std_logic;
  signal matrix_loader_done_s : std_logic;
  -- matrix start address in RAM
  signal matrix_loader_address_s : natural range 0 to 2**matrix_ram_addr_width_c-1;

begin
  
  matrix_valid_o <= matrix_valid_s;

  ----------------------------------------------------------
  -- main calculus process
  calculus_p : process(reset_ni, clk_i)
    -- calculus state machine state
    type CALCULUS_STATE_TYPE is (CC_INIT,
                                 CC_PREPARE,
                                 CC_LOADING,
                                 CC_COMPUTING,
                                 CC_SAVING_C0,
                                 CC_SAVING_C1,
                                 CC_SAVING_C2,
                                 CC_LOOP,
                                 CC_DONE);
    variable state_v : CALCULUS_STATE_TYPE;

    variable l_start_v : std_logic;
    variable l_matrix_done_v : std_logic;
    variable l_matrix_loader_done_v : std_logic;

  begin
    
    if reset_ni = '0' then
      state_v := CC_DONE;
      matrix_loader_start_s <= '0';
      matrix_compute_o <= '0';

      results_ram_we_o <= '0';
      results_ram_addr_o <= 0;
      results_ram_data_o <= (others=>'0');

      synchro_o <= '0';
      done_o <= '0';

    elsif rising_edge(clk_i) then
      -- on start rising edge
      if l_start_v = '0' and start_i = '1' then
        state_v := CC_INIT;
      end if;
      l_start_v := start_i;

      case state_v is
        when CC_INIT =>
          done_o <= '0';
          matrix_loader_address_s <= 0;
          -- latch input vectors
          synchro_o <= '1';
          state_v := CC_PREPARE;

        when CC_PREPARE =>
          synchro_o <= '0';
          matrix_loader_start_s <= '0';
          state_v := CC_LOADING;

        when CC_LOADING =>
          matrix_loader_start_s <= '1';
          
          -- on loader done r_e
          if l_matrix_loader_done_v = '0' and matrix_loader_done_s = '1' then
            matrix_compute_o <= '0';
            state_v := CC_COMPUTING;       
          end if;
          l_matrix_loader_done_v := matrix_loader_done_s;

        when CC_COMPUTING =>

          -- start matrix computation
          matrix_loader_start_s <= '0';
          matrix_compute_o <= '1';

          if l_matrix_done_v = '0' and matrix_done_i = '1' then
            state_v := CC_SAVING_C0;
          end if;
          l_matrix_done_v := matrix_done_i;

        when CC_SAVING_C0 =>
          results_ram_we_o <= '1';
          results_ram_addr_o <= 3*matrix_loader_address_s;
          results_ram_data_o <= std_logic_vector(matrix_output0_i);
          state_v := CC_SAVING_C1;
        when CC_SAVING_C1 =>
          results_ram_we_o <= '1';
          results_ram_addr_o <= 3*matrix_loader_address_s + 1;
          results_ram_data_o <= std_logic_vector(matrix_output1_i);
          state_v := CC_SAVING_C2;
        when CC_SAVING_C2 =>
          results_ram_we_o <= '1';
          results_ram_addr_o <= 3*matrix_loader_address_s + 2;
          results_ram_data_o <= std_logic_vector(matrix_output2_i);
          state_v := CC_LOOP;

        when CC_LOOP =>
          results_ram_we_o <= '0';
          -- if all matrices had been computed go the dead end stage
          if matrix_loader_address_s = matrices_n_c-1 then
            state_v := CC_DONE;
          else
            matrix_loader_address_s <= matrix_loader_address_s + 1;
            state_v := CC_PREPARE;
          end if;

        when CC_DONE =>
          done_o <= '1';     
          -- do nothing
      end case;

    end if;

  end process calculus_p;

  ----------------------------------------------------------
  -- matrix loader
  matrix_loader_p : process(clk_i, reset_ni)
    variable l_matrix_loader_start_v : std_logic;
    variable it_v : natural range 0 to 27;
  begin

    if reset_ni = '0' then
      matrix_loader_done_s <= '1';
      -- matrix
      matrix_valid_s <= '0';
      matrix_value_o <= (others=>'0');
      it_v := 0;

    elsif rising_edge(clk_i) then
      -- on rising edge of start signal
      if l_matrix_loader_start_v = '0' and matrix_loader_start_s = '1' then
        matrix_loader_done_s <= '0';
        -- load first matrix element from RAM
        matrix_ram_addr_o <= 27*matrix_loader_address_s;
        it_v := 0;
      end if;
      l_matrix_loader_start_v := matrix_loader_start_s;

      if matrix_loader_done_s = '0' then
        -- last element latched
        if it_v = 27 then
          matrix_valid_s <= '0';
          matrix_loader_done_s <= '1';
        else
          if matrix_valid_s = '0' then
            -- load value
            matrix_value_o <= signed(matrix_ram_data_i(int_size_c-1 downto 0));
            -- prepare next RAM element
            matrix_ram_addr_o <= 27*matrix_loader_address_s + it_v;
            -- do a valid rising_edge
            matrix_valid_s <= '1';

            it_v := it_v + 1;
          else
            matrix_valid_s <= '0';
          end if;

        end if; -- it_v = 26
      end if; -- done_s = '0'

    end if;

  end process matrix_loader_p;

end posman_control_1;
