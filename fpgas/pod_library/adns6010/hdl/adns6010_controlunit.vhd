-----------------------------------------------------------------------------
-- Title    : ADNS 6010 Control Unit
-- Project  : UNIOC_NG Optic Encoders
-----------------------------------------------------------------------------
-- File     : adns6010_controlunit.vhd
-- Author   : JD (jd@robotter.fr)
-- Company  : Rob'Otter
-- 
-- Creation date : 24/01/2009
-- Platform : Altera Cyclone
-----------------------------------------------------------------------------
-- Description : Control unit for the automated mode of optical sensors.
-- This entity shall :
-- * access sequentialy each ADNS / using SPI MOTION BURST.
-- * store and output sum of delta_x, delta_y for each ADNS
-- * output immediate value of squal for each ADNS
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------
entity adns6010_controlunit is 
---------------------------------------------------------------------------
  generic (
    ---------- FPGA ---------------------------------------------------------
    -- FPGA clock period in ns
    fpga_clock_period_c : natural := 40;

    ---------- REGISTERS ----------------------------------------------------
    -- register Motion_Burst address
    addr_register_motion_burst_c : std_logic_vector(7 downto 0) := x"50";

    -- motion bit in motion register
    bit_motion_register_motion_c : natural := 7;
    
    -- fault bit in motion register
    bit_fault_register_motion_c : natural := 1;

    --
    -- Motion register / fault offset in fault output
    fault_offset_c : natural := 0;

    ---------- TIMINGS in ns ------------------------------------------------
    -- timing ratio
    timing_ratio_c : natural := 1;

    -- timing between NCS falling edge to first SCK rising edge
    timing_ncs_sck_c : natural := 120;

    -- timing between SCK falling edge to next SCK rising edge
    -- after a read address and motion data
    timing_srad_mot_c : natural := 75000;
    
    ---------- PHYSICAL PARAMETERS ------------------------------------------
    -- number of ADNS6010 chips
    adns_number_c : natural := 3
  );

  port 
  (
    -- FPGA signals
    clk_i : in std_logic;
    reset_ni : in std_logic;

    ----------------------------------------------------------
    -- Enable signal activate component on high state
    enable_i : in std_logic;

    ----------------------------------------------------------
    -- SPI port
    spi_datain_o   : out std_logic_vector (7 downto 0);
    spi_dataout_i  : in std_logic_vector (7 downto 0);
    spi_senddata_o : out std_logic;
    spi_busy_i     : in std_logic;

    ----------------------------------------------------------
    -- CS ADNS selection
    adns_cs_o : out std_logic_vector (1 downto 0);

    ----------------------------------------------------------
    -- first encoder values
    adns1_deltax_o : out std_logic_vector (31 downto 0);
    adns1_deltay_o : out std_logic_vector (31 downto 0);
    adns1_squal_o  : out std_logic_vector (7 downto 0);

    -- second encoder values
    adns2_deltax_o : out std_logic_vector (31 downto 0);
    adns2_deltay_o : out std_logic_vector (31 downto 0);
    adns2_squal_o  : out std_logic_vector (7 downto 0);

    -- third encoder values
    adns3_deltax_o : out std_logic_vector (31 downto 0);
    adns3_deltay_o : out std_logic_vector (31 downto 0);
    adns3_squal_o  : out std_logic_vector (7 downto 0);

    -----------------------------------------------------------
    -- fault
    -- 7 :              3 : 
    -- 6 :              2 : ADNS #3 Fault
    -- 5 :              1 : ADNS #2 Fault
    -- 4 :              0 : ADNS #1 Fault
    fault_o : out std_logic_vector (7 downto 0)

  );
end entity adns6010_controlunit;

---------------------------------------------------------------------------
architecture adns6010_controlunit_1 of adns6010_controlunit is
---------------------------------------------------------------------------

  signal spi_start_s : std_logic;
  signal spi_done_s : std_logic;
  signal spi_datatosend_s : std_logic_vector(7 downto 0);
  signal spi_datareceived_s : std_logic_vector(7 downto 0);

  signal adns1_deltax_s : std_logic_vector (31 downto 0);
  signal adns1_deltay_s : std_logic_vector (31 downto 0);
  signal adns1_squal_s  : std_logic_vector (7 downto 0);
  signal adns2_deltax_s : std_logic_vector (31 downto 0);
  signal adns2_deltay_s : std_logic_vector (31 downto 0);
  signal adns2_squal_s  : std_logic_vector (7 downto 0);
  signal adns3_deltax_s : std_logic_vector (31 downto 0);
  signal adns3_deltay_s : std_logic_vector (31 downto 0);
  signal adns3_squal_s  : std_logic_vector (7 downto 0);

begin
---------------------------------------------------------------------------

  adns1_deltax_o <= adns1_deltax_s;
  adns1_deltay_o <= adns1_deltay_s;
  adns1_squal_o <= adns1_squal_s;

  adns2_deltax_o <= adns2_deltax_s;
  adns2_deltay_o <= adns2_deltay_s;
  adns2_squal_o <= adns2_squal_s;

  adns3_deltax_o <= adns3_deltax_s;
  adns3_deltay_o <= adns3_deltay_s;
  adns3_squal_o <= adns3_squal_s;


  ----------------------------------------------------------
  -- Spi 
  -- Handle SPI communication with SPI interface
  spi_p : process(reset_ni, clk_i, enable_i)

    variable spi_pstart_v : std_logic;

    variable spi_state_v : natural range 0 to 4 := 4;

  begin
    
    if reset_ni = '0' or enable_i = '0' then

      spi_senddata_o <= '0';
      spi_datain_o   <= x"00";
      
      spi_done_s <= '0';
      spi_state_v := 4;
      spi_datareceived_s <= x"00";
      spi_pstart_v := '0';

    else
      if rising_edge(clk_i) then
        
        -- start SPI transmission on r_e( spi_start_s )
        if spi_pstart_v = '0' and spi_start_s = '1' then
          spi_state_v := 0;
        end if;

        -- end SPI transmission on f_e( spi_start_s )
        if spi_pstart_v = '1' and spi_start_s = '0' then
          spi_done_s <= '0';
        end if;
        
        -- store last spi_start value
        spi_pstart_v := spi_start_s;

        -- state#0
        -- init communication
        if spi_state_v = 0 then

          spi_senddata_o <= '0';
          spi_state_v := spi_state_v + 1;

        -- state#1
        -- send data to SPI and wait one tick
        elsif spi_state_v = 1 then 
          
          spi_datain_o <= spi_datatosend_s;
          spi_state_v := spi_state_v + 1;
        
        -- state#2
        -- set senddata high to begin SPI communication 
        -- and wait for busy to go high
        elsif spi_state_v = 2 then

          spi_senddata_o <= '1';
          
          if spi_busy_i = '1' then
            spi_state_v := spi_state_v + 1;
          end if;
        
        -- state#3
        -- set senddata low and wait for busy to go low
        -- to read data from SPI
        elsif spi_state_v = 3 then
          
          spi_senddata_o <= '0';

          if spi_busy_i = '0' then
            spi_datareceived_s <= spi_dataout_i;
            spi_done_s <= '1';
            spi_state_v := spi_state_v + 1;
          end if;

        -- state#4
        -- final state, machine stay here
        else
          -- "It's a trap !"
        end if;

      end if; -- r_e(clk_i)
    end if; -- reset_ni = '0' 


  end process spi_p;

  ---------------------------------------------------------
  -- Control Unit 
  -- Main state machine handling data sent over SPI
  controlunit_p : process(reset_ni, clk_i, enable_i)

    variable timer_v : natural := 0;
    variable current_adns_v : natural range 1 to 4 := 1;

    variable controlunit_state_v : natural range 0 to 13 := 0;

    variable sumdeltax_v : std_logic_vector(31 downto 0);
    variable sumdeltay_v : std_logic_vector(31 downto 0);

    variable deltax_v : std_logic_vector(7 downto 0);
    variable deltay_v : std_logic_vector(7 downto 0);
    variable squal_v : std_logic_vector(7 downto 0);

  begin
    
    -- fpga reset or enable go low
    if reset_ni = '0' or enable_i = '0' then

      spi_start_s <= '0';

      adns_cs_o <= "00";

      fault_o <= x"00";

      adns1_deltax_s <= x"00000000";
      adns1_deltay_s <= x"00000000";
      adns1_squal_s  <= x"00";
                    
      adns2_deltax_s <= x"00000000";
      adns2_deltay_s <= x"00000000";
      adns2_squal_s  <= x"00";

      adns3_deltax_s <= x"00000000";
      adns3_deltay_s <= x"00000000";
      adns3_squal_s  <= x"00";

      spi_datatosend_s <= x"00";
      
      -- reset machine state
      current_adns_v := 1;
      controlunit_state_v := 0;

    else
      if rising_edge( clk_i ) then
        
        -- state #0
        -- set CS high for current ADNS6010
        if controlunit_state_v = 0 then

          -- pull CS high for current ADNS
          adns_cs_o <= std_logic_vector( to_unsigned(current_adns_v,2) );
          
          -- reset timer
          timer_v := 0;
          
          -- go next state
          controlunit_state_v := controlunit_state_v + 1;
        
        -- state #1
        -- wait at least t(NCS-SCK) 
        elsif controlunit_state_v = 1 then

          -- increment timer
          timer_v := timer_v +  1;

          -- check if we wait enough
          if timer_v >= ((timing_ncs_sck_c/fpga_clock_period_c)*timing_ratio_c) then
            controlunit_state_v := controlunit_state_v + 1;
          end if;

        -- state #2
        -- start sending address over SPI
        elsif controlunit_state_v = 2 then
          
          -- start a Motion Burst 
          spi_datatosend_s <= addr_register_motion_burst_c;
          spi_start_s <= '1';
          
          controlunit_state_v := controlunit_state_v + 1;

        -- state #3
        -- wait for data to be sent 
        elsif controlunit_state_v = 3 then
          
          if spi_done_s = '1' then
            spi_start_s <= '0';
            timer_v := 0;
            controlunit_state_v := controlunit_state_v + 1;
          end if;
        
        -- state #4
        -- wait at least t(SRAD-MOT)
        elsif controlunit_state_v = 4 then
          
          timer_v := timer_v + 1;
              
          if timer_v >= ((timing_srad_mot_c/fpga_clock_period_c)*timing_ratio_c) then
            controlunit_state_v := controlunit_state_v + 1;
          end if;
        
        -- state #5
        -- start reading first byte of Motion burst
        elsif controlunit_state_v = 5 then

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := controlunit_state_v + 1;
        
        -- state #6
        -- wait Motion byte to be received 
        elsif controlunit_state_v = 6 then

          if spi_done_s = '1' then
            spi_start_s <= '0';
            
            -- first byte is Motion register

            -- set fault to 1 if occured
            if spi_datareceived_s(bit_fault_register_motion_c) = '1' then
              -- current_adns_v is ranged 1 to 3
              fault_o(fault_offset_c + current_adns_v - 1) <= '1';
            end if;

            -- check if motion occured since last report
            if spi_datareceived_s(bit_motion_register_motion_c) = '1' then
              ----------------------------------------------------------------------
              -- motion occured
              ----------------------------------------------------------------------
              -- continue to next state

              controlunit_state_v := controlunit_state_v + 1;

            else
              ----------------------------------------------------------------------
              -- no motion occured
              ----------------------------------------------------------------------
              -- * exit burst mode by pulling CS low for 4us
              -- * switch to next ADNS
              --
              -- NOTE : 
              -- It's useless to wait 4us here, because the next ADNS will be driven
              -- at least approx. 75us (tSRAD-MOT).

              -- Pull all CS low
              adns_cs_o <= "00";

              -- Select next ADNS
              current_adns_v := current_adns_v + 1;

              if current_adns_v > adns_number_c then
                current_adns_v :=  1;
              end if;

              -- Go back to first state
              controlunit_state_v := 0;

            end if;

          end if;

        -- state #7
        -- prepare to read next byte
        elsif controlunit_state_v = 7 then

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := controlunit_state_v + 1;
    
        -- state #8
        -- read Delta_X byte
        elsif controlunit_state_v = 8 then

          if spi_done_s = '1' then
            spi_start_s <= '0';
            deltax_v :=  spi_datareceived_s;
            controlunit_state_v := controlunit_state_v + 1;
          end if;

          -- state #9
        -- prepare to read next byte
        elsif controlunit_state_v = 9 then

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := controlunit_state_v + 1;
    
        -- state #10
        -- read Delta_Y byte
        elsif controlunit_state_v = 10 then

          if spi_done_s = '1' then
            spi_start_s <= '0';
            deltay_v :=  spi_datareceived_s;
            controlunit_state_v := controlunit_state_v + 1;
          end if;

        -- state #11
        -- prepare to read next byte
        elsif controlunit_state_v = 11 then

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := controlunit_state_v + 1;
    
        -- state #12
        -- read SQUAL byte
        elsif controlunit_state_v = 12 then

          if spi_done_s = '1' then
            spi_start_s <= '0';
            squal_v :=  spi_datareceived_s;
            controlunit_state_v := controlunit_state_v + 1;
          end if;

        -- state #13
        -- sum deltas, update squal and go next ADNS
        else
          
          -- get current motion values
          if current_adns_v = 1 then
            sumdeltax_v := adns1_deltax_s;
            sumdeltay_v := adns1_deltay_s;
          elsif current_adns_v = 2 then
            sumdeltax_v := adns2_deltax_s;
            sumdeltay_v := adns2_deltay_s;
          else
            sumdeltax_v := adns3_deltax_s;
            sumdeltay_v := adns3_deltay_s;
          end if;
          
          -- sum deltax and deltay
          sumdeltax_v := 
            std_logic_vector(signed(sumdeltax_v) + signed(deltax_v));
          sumdeltay_v := 
            std_logic_vector(signed(sumdeltay_v) + signed(deltay_v));       

          -- update motion values
          if current_adns_v = 1 then
            adns1_deltax_s <= sumdeltax_v;
            adns1_deltay_s <= sumdeltay_v;
            adns1_squal_s  <= squal_v;
          elsif current_adns_v = 2 then
            adns2_deltax_s <= sumdeltax_v;
            adns2_deltay_s <= sumdeltay_v;
            adns2_squal_s  <= squal_v;
          else
            adns3_deltax_s <= sumdeltax_v;
            adns3_deltay_s <= sumdeltay_v;
            adns3_squal_s  <= squal_v;
          end if;     

          ----------------------------------------------
          -- exit burst mode by pulling CS low for 4us
          --
          -- NOTE : 
          -- It's useless to wait 4us here, because the next ADNS will be driven
          -- at least approx. 75us (tSRAD-MOT).

          -- pull all CS low
          adns_cs_o <= "00";

          ------------------------
          -- switch to next ADNS
          current_adns_v := current_adns_v + 1;

          if current_adns_v > adns_number_c then
            current_adns_v :=  1;
          end if;
          
          ---------------------------
          -- go back to first state
          controlunit_state_v := 0;

        end if; -- controlunit_state_v
        -----------------------------------------

      end if; -- r_e(clk_i)
    end if; -- reset_ni = '0' 
    
  end process controlunit_p;

end adns6010_controlunit_1;

