-----------------------------------------------------------------------------
-- Title    : ADNS 9500 Control Unit
-- Project  : UNIOC_NG Optic Encoders
-----------------------------------------------------------------------------
-- File     : adns9500_controlunit.vhd
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
entity adns9500_controlunit is 
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
    timing_srad_mot_c : natural := 100000;
    
    ---------- PHYSICAL PARAMETERS ------------------------------------------
    -- number of ADNS9500 chips
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
end entity adns9500_controlunit;

---------------------------------------------------------------------------
architecture adns9500_controlunit_1 of adns9500_controlunit is
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

		type SPI_STATE_TYPE is (SPI_STATE_INIT, SPI_STATE_DATA, SPI_STATE_BEGIN, SPI_STATE_BUSY, SPI_STATE_WAIT);
		attribute SPI_ENUM_ENCODING: STRING;
		attribute SPI_ENUM_ENCODING of SPI_STATE_TYPE: type is "001 010 011 100 101";

    variable spi_state_v : SPI_STATE_TYPE;

  begin
    
    if reset_ni = '0' or enable_i = '0' then

      spi_senddata_o <= '0';
      spi_datain_o   <= x"00";
      
      spi_done_s <= '0';
      spi_state_v := SPI_STATE_WAIT;
      spi_datareceived_s <= x"00";
      spi_pstart_v := '0';

    else
      if rising_edge(clk_i) then
        
        -- start SPI transmission on r_e( spi_start_s )
        if spi_pstart_v = '0' and spi_start_s = '1' then
          spi_state_v := SPI_STATE_INIT;
        end if;

        -- end SPI transmission on f_e( spi_start_s )
        if spi_pstart_v = '1' and spi_start_s = '0' then
          spi_done_s <= '0';
        end if;
        
        -- store last spi_start value
        spi_pstart_v := spi_start_s;

				case spi_state_v is
       	  -- init communication
					when SPI_STATE_INIT =>
 	          spi_senddata_o <= '0';
   	        spi_state_v := SPI_STATE_DATA;

        	-- send data to SPI and wait one tick
        	when SPI_STATE_DATA =>
          	spi_datain_o <= spi_datatosend_s;
          	spi_state_v := SPI_STATE_BEGIN;
        
        	-- set senddata high to begin SPI communication 
        	-- and wait for busy to go high
        	when SPI_STATE_BEGIN =>
 	          spi_senddata_o <= '1';
          	if spi_busy_i = '1' then
            	spi_state_v := SPI_STATE_BUSY;
	          end if;
        
        	-- set senddata low and wait for busy to go low
        	-- to read data from SPI
        	when SPI_STATE_BUSY =>
          	spi_senddata_o <= '0';
          	if spi_busy_i = '0' then
            	spi_datareceived_s <= spi_dataout_i;
            	spi_done_s <= '1';
            	spi_state_v := SPI_STATE_WAIT;
          	end if;

        	-- final state, machine stay here
        	when SPI_STATE_WAIT =>
						-- it's a trap
				end case;
      end if; -- r_e(clk_i)
    end if; -- reset_ni = '0' 


  end process spi_p;

  ---------------------------------------------------------
  -- Control Unit 
  -- Main state machine handling data sent over SPI
  controlunit_p : process(reset_ni, clk_i, enable_i)

		type CU_STATE_TYPE is (CU_INIT,CU_1,CU_2,CU_3,CU_4,CU_5,CU_6,CU_7,
														CU_8,CU_9,CU_10,CU_11,CU_12,CU_13,CU_14,
														CU_15,CU_16,CU_17,CU_18,CU_19);
		attribute CU_ENUM_ENCODING: STRING;
		attribute CU_ENUM_ENCODING of CU_STATE_TYPE:type is "00001 00010 00011 00100 00101 00110 00111 01000 01001 01010 01011 01100 01101 01110 01111 10000 10001 10010 10011";

		variable controlunit_state_v : CU_STATE_TYPE;

    variable timer_v : natural := 0;
    variable current_adns_v : natural range 1 to 4 := 1;

    variable sumdeltax_v : std_logic_vector(31 downto 0);
    variable sumdeltay_v : std_logic_vector(31 downto 0);

    variable deltax_v : std_logic_vector(15 downto 0);
    variable deltay_v : std_logic_vector(15 downto 0);
    variable squal_v : std_logic_vector(7 downto 0);

  begin
    
    -- fpga reset or enable go low
    if reset_ni = '0' or enable_i = '0' then

      spi_start_s <= '0';

      adns_cs_o <= "00";

      fault_o <= x"00";

      adns1_deltax_s <= (others => '0');
      adns1_deltay_s <= (others => '0');
      adns1_squal_s  <= (others => '0');
                    
      adns2_deltax_s <= (others => '0');
      adns2_deltay_s <= (others => '0');
      adns2_squal_s  <= (others => '0');

      adns3_deltax_s <= (others => '0');
      adns3_deltay_s <= (others => '0');
      adns3_squal_s  <= (others => '0');

      spi_datatosend_s <= (others => '0');
      
      -- reset machine state
      current_adns_v := 1;
      controlunit_state_v := CU_INIT;

    elsif rising_edge( clk_i ) then
      
			case controlunit_state_v is
        -- set CS high for current ADNS9500
        when CU_INIT =>

          -- pull CS high for current ADNS
          adns_cs_o <= std_logic_vector( to_unsigned(current_adns_v,2) );
          
          -- reset timer
          timer_v := 0;
          
          -- go next state
          controlunit_state_v := CU_1;
        
        -- wait at least t(NCS-SCK) 
        when CU_1 =>

          -- increment timer
          timer_v := timer_v +  1;

          -- check if we wait enough
          if timer_v >= ((timing_ncs_sck_c/fpga_clock_period_c)*timing_ratio_c) then
            controlunit_state_v := CU_2;
          end if;

        -- start sending address over SPI
        when CU_2 =>
          
          -- start a Motion Burst 
          spi_datatosend_s <= addr_register_motion_burst_c;
          spi_start_s <= '1';
          
          controlunit_state_v := CU_3;

        -- wait for data to be sent 
        when CU_3 =>
          
          if spi_done_s = '1' then
            spi_start_s <= '0';
            timer_v := 0;
            controlunit_state_v := CU_4;
          end if;
        
        -- wait at least t(SRAD-MOT)
        when CU_4 =>
          
          timer_v := timer_v + 1;
              
          if timer_v >= ((timing_srad_mot_c/fpga_clock_period_c)*timing_ratio_c) then
            controlunit_state_v := CU_5;
          end if;
        
        -- start reading first byte of Motion burst
        when CU_5 =>

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := CU_6;
        
        -- wait Motion byte to be received 
        when CU_6 =>

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

              controlunit_state_v := CU_7;

            else
              ----------------------------------------------------------------------
              -- no motion occured
              ----------------------------------------------------------------------
              -- * exit burst mode by pulling CS low for 4us
              -- * switch to next ADNS
              --
              -- NOTE : 
              -- It's useless to wait 4us here, because the next ADNS will be driven
              -- at least approx. 100us (tSRAD-MOT).

              -- Pull all CS low
              adns_cs_o <= "00";

              -- Select next ADNS
              current_adns_v := current_adns_v + 1;

              if current_adns_v > adns_number_c then
                current_adns_v :=  1;
              end if;

              -- Go back to first state
              controlunit_state_v := CU_INIT;

            end if;

          end if;

        -- prepare to read next byte
        when CU_7 =>

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := CU_8;
    
        -- read OBSERVATION byte
        when CU_8 =>

          if spi_done_s = '1' then
            spi_start_s <= '0';
            controlunit_state_v := CU_9;
          end if;

        -- prepare to read next byte
        when CU_9 =>

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := CU_10;
    
        -- read Delta_X_L byte
        when CU_10 =>

          if spi_done_s = '1' then
            spi_start_s <= '0';
            deltax_v(7 downto 0) :=  spi_datareceived_s;
            controlunit_state_v := CU_11;
          end if;

        -- prepare to read next byte
        when CU_11 =>

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := CU_12;
    
  
        -- read Delta_X_H byte
        when CU_12 =>

          if spi_done_s = '1' then
            spi_start_s <= '0';
            deltax_v(15 downto 8) :=  spi_datareceived_s;
            controlunit_state_v := CU_13;
          end if;

        -- prepare to read next byte
        when CU_13 =>

          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := CU_14;
    
        -- read Delta_Y_L byte
        when CU_14 =>

          if spi_done_s = '1' then
            spi_start_s <= '0';
            deltay_v(7 downto 0) :=  spi_datareceived_s;
            controlunit_state_v := CU_15;
          end if;          

        -- prepare to read next byte
        when CU_15 =>
          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := CU_16;
    
        -- read Delta_Y_H byte
        when CU_16 =>
          if spi_done_s = '1' then
            spi_start_s <= '0';
            deltay_v(15 downto 8) :=  spi_datareceived_s;
            controlunit_state_v := CU_17;
          end if;

        -- prepare to read next byte
        when CU_17 =>
          spi_datatosend_s <= x"00";
          spi_start_s <= '1';

          controlunit_state_v := CU_18;
    
        -- read SQUAL byte
        when CU_18 =>
          if spi_done_s = '1' then
            spi_start_s <= '0';
            squal_v :=  spi_datareceived_s;
            controlunit_state_v := CU_19;
          end if;

        -- sum deltas, update squal and go next ADNS
        when CU_19 =>
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
          sumdeltax_v := std_logic_vector(signed(sumdeltax_v) + signed(deltax_v));
          sumdeltay_v := std_logic_vector(signed(sumdeltay_v) + signed(deltay_v));       

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
          -- at least approx. 100us (tSRAD-MOT).

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
          controlunit_state_v := CU_INIT;
		 	
				end case;
        -----------------------------------------

    end if; -- reset_ni = '0' 
    
  end process controlunit_p;

end adns9500_controlunit_1;

