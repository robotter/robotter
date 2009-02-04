-----------------------------------------------------------------------------
-- title    : adns 6010 wishbone interface
-- project  : unioc_ng optic encoders
-----------------------------------------------------------------------------
-- file     : adns6010_wishbone_interface.vhd
-- author   : lamygale
-- company  : rob'otter
-- 
-- creation date : 25/01/2009
-- platform : altera cyclone
-----------------------------------------------------------------------------
-- description : provide registers acces from wishbone bus to the mouse sensor
-----------------------------------------------------------------------------
-- this program is free software; you can redistribute it and/or modify
-- it under the terms of the gnu general public license as published by
-- the free software foundation; either version 2, or (at your option)
-- any later version.
-- 
-- this program is distributed in the hope that it will be useful,
-- but without any warranty; without even the implied warranty of
-- merchantability or fitness for a particular purpose.  see the
-- gnu general public license for more details.
-- 
-- you should have received a copy of the gnu general public license
-- along with this program; if not, write to the free software
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------
entity adns6010_wishbone_interface is
  
  generic (
    id      : natural := 2;
    wb_size_c : natural := 8;           -- data port size
    adns_size_c : natural range 8 to 32:= 32;        -- data sensor port size
    squal_size_c : natural range 8 to 32:= 8  -- squal port size
    );

  port (
    ---------------------------------------------------------------------------
    -- wishbone interface
    wbs_rst_i : in  std_logic;          -- asynchronous reset, active high
    wbs_clk_i : in std_logic;           -- clock

    wbs_adr_i : in std_logic_vector(5 downto 0);    -- adress bus
    wbs_dat_o : out std_logic_vector(wb_size_c-1 downto 0);  -- data readden
                                                             -- from bus
    wbs_dat_i : in std_logic_vector(wb_size_c-1 downto 0); -- data write from bus
    wbs_we_i  : in std_logic;           -- read/write
    wbs_stb_i : in std_logic;           -- validate read/write operation
    wbs_ack_o : out std_logic;           -- operation succesful
    wbs_cyc_i : in std_logic;

    ---------------------------------------------------------------------------
    -- interface to the first sensor

    adns1_lock_o : out std_logic;
    adns1_delta_x_i : in std_logic_vector(adns_size_c-1 downto 0);
    adns1_delta_y_i : in std_logic_vector(adns_size_c-1 downto 0);
    adns1_squal_i   : in std_logic_vector(squal_size_c-1 downto 0);

    ---------------------------------------------------------------------------
    -- interface to the second sensor

    adns2_lock_o : out std_logic;
    adns2_delta_x_i : in std_logic_vector(adns_size_c-1 downto 0);
    adns2_delta_y_i : in std_logic_vector(adns_size_c-1 downto 0);
    adns2_squal_i   : in std_logic_vector(squal_size_c-1 downto 0);

    ---------------------------------------------------------------------------
    -- interface to the third sensor

    adns3_lock_o : out std_logic;
    adns3_delta_x_i : in std_logic_vector(adns_size_c-1 downto 0);
    adns3_delta_y_i : in std_logic_vector(adns_size_c-1 downto 0);
    adns3_squal_i   : in std_logic_vector(squal_size_c-1 downto 0);

    ---------------------------------------------------------------------------
    -- common register to the controlunit

    fault_i : in std_logic_vector(7 downto 0);

    auto_enable_o : out std_logic;      --enable the control unit (active high)

    ---------------------------------------------------------------------------
    -- interface to the spi (controled by the µc when auto_enable_o is low)

    spi_data_i : in std_logic_vector(7 downto 0);  -- data received by the spi
    spi_data_o : out std_logic_vector(7 downto 0);  -- data to be sent by the spi
    spi_send_data_o : out std_logic;    -- send spi_data_o (active high)
    spi_busy_i : in std_logic;          -- spi transmitting (active high)
    
    adns_reset_o : out std_logic;       -- reset of the 3 sensors
    spi_cs_o     : out std_logic_vector(1 downto 0)  -- selection of the slave
                                                      -- adressed by the spi
    
    );
end adns6010_wishbone_interface;

architecture adns6010_wishbone_interface_1 of adns6010_wishbone_interface is

  signal auto_enable_s : std_logic;
  signal lock_adns_s : std_logic_vector(2 downto 0);
  signal adns_reset_s : std_logic;
  signal spi_send_data_s : std_logic;
  signal spi_cs_s : std_logic_vector(1 downto 0);

  signal ack_read_s : std_logic ;
  signal ack_write_s: std_logic ;
  
begin  -- adns6010_wishbone_interface_1

wbs_ack_o <= ack_write_s or ack_write_s;

-- manage register
write_bloc : process(wbs_clk_i, wbs_rst_i)
begin
    if wbs_rst_i = '1' then 
        lock_adns_s <= (others => '0');
        auto_enable_s <= '0';
        spi_data_o <= (others => '0');
        adns_reset_s <= '0';
        spi_send_data_s <= '0';
        spi_cs_s <= (others => '0');
        ack_write_s <= '0';
        
    elsif rising_edge(wbs_clk_i) then
        if ((wbs_stb_i and wbs_we_i and wbs_cyc_i) = '1' ) then
          ack_write_s <= '1';
          case to_integer(unsigned(wbs_adr_i)) is
                      -- lock adns latchs
            when 1 => lock_adns_s <= wbs_dat_i(2 downto 0);
                      -- auto enable
            when 30 => auto_enable_s <= wbs_dat_i(0);
                      -- data to send
            when 31 => spi_data_o <= wbs_dat_i(7 downto 0);
                      -- spi control register
            when 32 => adns_reset_s <= wbs_dat_i(7);
                       spi_send_data_s <= wbs_dat_i(2);
                       spi_cs_s <= wbs_dat_i(1 downto 0);
            when others=> null;
          end case;
        else
          ack_write_s <= '0';
        end if;
    end if;

end process write_bloc;

read_bloc : process(wbs_clk_i, wbs_rst_i)
begin
    if wbs_rst_i = '1' then
        wbs_dat_o <= (others => '0');
        ack_read_s <= '0';
    elsif rising_edge(wbs_clk_i) then
        if (wbs_stb_i = '1' and wbs_we_i = '0'  and wbs_cyc_i = '1' ) then
          ack_read_s <= '1';
          case to_integer(unsigned(wbs_adr_i)) is
            when 0 => wbs_dat_o <= std_logic_vector(to_unsigned(id,wb_size_c));
                      -- lock adns latchs
            when 1 => wbs_dat_o(2 downto 0) <= lock_adns_s;
                      --adns 1
            when 2 => wbs_dat_o <= adns1_delta_x_i(7 downto 0);
            when 3 => wbs_dat_o <= adns1_delta_x_i(15 downto 8);
            when 4 => wbs_dat_o <= adns1_delta_x_i(23 downto 16);
            when 5 => wbs_dat_o <= adns1_delta_x_i(31 downto 24);
            when 6 => wbs_dat_o <= adns1_delta_y_i(7 downto 0);
            when 7 => wbs_dat_o <= adns1_delta_y_i(15 downto 8);
            when 8 => wbs_dat_o <= adns1_delta_y_i(23 downto 16);
            when 9 => wbs_dat_o <= adns1_delta_y_i(31 downto 24);
            when 10 => wbs_dat_o <= adns1_squal_i(7 downto 0);
                       -- adns 2
            when 11 => wbs_dat_o <= adns2_delta_x_i(7 downto 0);
            when 12 => wbs_dat_o <= adns2_delta_x_i(15 downto 8);
            when 13 => wbs_dat_o <= adns2_delta_x_i(23 downto 16);
            when 14 => wbs_dat_o <= adns2_delta_x_i(31 downto 24);
            when 15 => wbs_dat_o <= adns2_delta_y_i(7 downto 0);
            when 16 => wbs_dat_o <= adns2_delta_y_i(15 downto 8);
            when 17 => wbs_dat_o <= adns2_delta_y_i(23 downto 16);
            when 18 => wbs_dat_o <= adns2_delta_y_i(31 downto 24);
            when 19 => wbs_dat_o <= adns2_squal_i(7 downto 0);
                       -- adns 3
            when 20 => wbs_dat_o <= adns3_delta_x_i(7 downto 0);
            when 21 => wbs_dat_o <= adns3_delta_x_i(15 downto 8);
            when 22 => wbs_dat_o <= adns3_delta_x_i(23 downto 16);
            when 23 => wbs_dat_o <= adns3_delta_x_i(31 downto 24);
            when 24 => wbs_dat_o <= adns3_delta_y_i(7 downto 0);
            when 25 => wbs_dat_o <= adns3_delta_y_i(15 downto 8);
            when 26 => wbs_dat_o <= adns3_delta_y_i(23 downto 16);
            when 27 => wbs_dat_o <= adns3_delta_y_i(31 downto 24);
            when 28 => wbs_dat_o <= adns3_squal_i(7 downto 0);
                       -- fault
            when 29 => wbs_dat_o <= fault_i;
											 -- auto enable
            when 30 => wbs_dat_o(0) <= auto_enable_s;
											 -- spi interface
            when 31 => wbs_dat_o <= spi_data_i;
            when 32 => wbs_dat_o <= (7=>adns_reset_s,
                                     3=>spi_busy_i,
                                     2=> spi_send_data_s,
                                     1=> spi_cs_s(1),
                                     0=> spi_cs_s(0),
                                     others => '0');
                      
            when others => null;
          end case;
          
        else
            wbs_dat_o <= (others => '0');
            ack_read_s <= '0';
        end if;
    end if;
end process read_bloc;

adns_reset_o <= adns_reset_s;
spi_send_data_o <= spi_send_data_s;
adns1_lock_o <= lock_adns_s(0);
adns2_lock_o <= lock_adns_s(1);
adns3_lock_o <= lock_adns_s(2);
auto_enable_o <= auto_enable_s;
spi_cs_o <= spi_cs_s;

end architecture adns6010_wishbone_interface_1;

