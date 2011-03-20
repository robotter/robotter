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
--! @file posman_wishbone_interface.vhd
--! @author JD
-----------------------------------------------------------------------------

library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity posman_wishbone_interface is
  generic (
    id_c : natural;
    wb_size_c : natural := 8;
    matrix_ram_addr_width_c : natural;
    results_ram_addr_width_c : natural;
    ram_data_width_c : natural;
    freq_fpga_c  : natural
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

    -- matrix ram access
    matrix_ram_addr_o : out natural range 0 to 2**matrix_ram_addr_width_c-1;
    matrix_ram_data_o : out std_logic_vector(ram_data_width_c-1 downto 0);
    matrix_ram_we_o : out std_logic;

    -- results ram access
    results_ram_addr_o : out natural range 0 to 2**results_ram_addr_width_c-1;
    results_ram_data_i : in std_logic_vector(ram_data_width_c-1 downto 0)
    
  );

end posman_wishbone_interface;

architecture posman_wishbone_interface_1 of posman_wishbone_interface is

  signal ack_read_s : std_logic ;
  signal ack_write_s: std_logic ;

begin  -- adns9500_wishbone_interface_1

  wbs_ack_o <= ack_write_s or ack_read_s;

  -- manage register
  write_bloc_p : process(wbs_clk_i, wbs_rst_i)
  begin
    if wbs_rst_i = '1' then 
      ack_write_s <= '0';
      
    elsif rising_edge(wbs_clk_i) then
      if ((wbs_stb_i and wbs_we_i and wbs_cyc_i) = '1' ) then
        ack_write_s <= '1';
        case to_integer(unsigned(wbs_adr_i)) is
          
          -- MATRIX RAM address
          when 1 =>
            matrix_ram_addr_o <= to_integer(unsigned(
                              wbs_dat_i(matrix_ram_addr_width_c-1 downto 0)));

          -- MATRIX RAM data push (AVR is little endian, so 2 is LSB)
          when 2 =>
            matrix_ram_data_o(wb_size_c-1 downto 0) <= wbs_dat_i;
            matrix_ram_we_o <= '1';

          when 3 =>
            matrix_ram_data_o(ram_data_width_c-1 downto wb_size_c) <=
              wbs_dat_i(ram_data_width_c-wb_size_c-1 downto 0);
            matrix_ram_we_o <= '1';
          
          -- RESULTS RAM address
          when 4 =>
            results_ram_addr_o <= to_integer(unsigned(
                              wbs_dat_i(results_ram_addr_width_c-1 downto 0)));

          when others=>
        end case;                        
      else
        ack_write_s <= '0';
        -- clear RAM write
        matrix_ram_we_o <= '0';
      end if;
    end if;

  end process write_bloc_p;


  read_bloc_p : process(wbs_clk_i, wbs_rst_i)
  begin
    if wbs_rst_i = '1' then
      wbs_dat_o <= (others => '0');
      ack_read_s <= '0';

    elsif rising_edge(wbs_clk_i) then
      if (wbs_stb_i = '1' and wbs_we_i = '0'  and wbs_cyc_i = '1' ) then
        ack_read_s <= '1';
        case to_integer(unsigned(wbs_adr_i)) is
          -- entity WB ID 
          when 0 =>
            wbs_dat_o <= std_logic_vector(to_unsigned(id_c,wb_size_c));

          -- RESULTS RAM data pull
          when 6 => -- LO
            wbs_dat_o <= results_ram_data_i(wb_size_c-1 downto 0);

          when 7 => -- HI
            wbs_dat_o <= results_ram_data_i(ram_data_width_c-1 downto wb_size_c);

          when others => null;
        end case;

      else
        wbs_dat_o <= (others => '0');
        ack_read_s <= '0';
      end if;
    end if;
  end process read_bloc_p;

end posman_wishbone_interface_1;
