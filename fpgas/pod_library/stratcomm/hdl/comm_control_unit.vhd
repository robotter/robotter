library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.std_logic_1164_ram.all;
entity comm_control_unit is
  
  generic (
    reception_buffer_size_c : natural := 20;
    emission_buffer_size_c  : natural := 20);

  port (
    clk_i    : in std_logic;            -- clock
    reset_ni : in std_logic;            -- reset

    -- whishbone interface
    i2c_write_in_progress_o : out std_logic;  -- indicates that reception buffer is
                                              -- curently  modified and should not be readden
    reception_buffer_o      : out std_logic_ram_8(reception_buffer_size_c downto 0);
    i2c_read_in_progress_o  : out std_logic;  -- indicates that emission buffer
                                              -- is used and should not be accessed
    emission_buffer_i       : in  std_logic_ram_8(emission_buffer_size_c-1 downto 0);

    -- i2c module
    i2c_data_in_i        : in  std_logic_vector(7 downto 0);  -- data received by i2c module
    i2c_data_out_o       : out std_logic_vector(7 downto 0);  -- data sent by i2c module (read operation)
    i2c_r_nw_operation_i : in  std_logic;  -- indicates if current transfert is a read operation (='1') or write operation (='0')
    i2c_communicating_i  : in  std_logic;  -- indicates if a communication is occuring
    i2c_new_transfert_i  : in  std_logic);  -- indicates that a new data is required on data_out_o or avaliable on data_in_i

end comm_control_unit;

architecture comm_contol_unit_1 of comm_control_unit is


  type control_unit_state is(wait_for_communication, rd_begin_emission, rd_send_byte, rd_update_read_index, rd_finish_read, wr_begin_reception, wr_receive_byte, wr_update_write_index, wr_finish_write);  -- states of the control unit
-- (rd or wr prefix indicates if it is an i2c read operation or i2c write operation)

  signal control_unit_state_s : control_unit_state;  -- current state of the control unit

  signal rd_read_index_updated_s, wr_write_index_updated_s : std_logic;  -- index updated

  signal rd_begin_emission_done_s, wr_begin_reception_done_s : std_logic;  -- process return

  signal rd_byte_sent_s, wr_byte_received_s : std_logic;  -- i2c interface updated

  signal rd_finish_read_done_s, wr_finish_write_done_s : std_logic;


  -- size +1 because buffer transmits data received  plus number of bytes
  -- received at adress zero
  signal write_index_s : natural range 0 to reception_buffer_size_c;

  signal read_index_s : natural range 0 to emission_buffer_size_c-1;

                                        -- 
  
begin  -- comm_contol_unit_1

  control_unit : process (clk_i, reset_ni)
  begin  -- process control_unit
    if reset_ni = '0' then
      control_unit_state_s <= wait_for_communication;
      
    elsif rising_edge(clk_i) then

      case control_unit_state_s is
        when wait_for_communication =>
          -- rd operation
          if i2c_communicating_i = '1' and i2c_new_transfert_i = '1' and i2c_r_nw_operation_i = '1' then
            control_unit_state_s <= rd_begin_emission;

            -- wr_operation
          elsif i2c_communicating_i = '1' and i2c_new_transfert_i = '1' and i2c_r_nw_operation_i = '0' then
            control_unit_state_s <= wr_begin_reception;
          end if;

          ---------------------------------------------------------------------
          -- read operation
        when rd_begin_emission =>
          if rd_begin_emission_done_s = '1' then
            control_unit_state_s <= rd_send_byte;
          end if;
          
        when rd_send_byte =>
          if rd_byte_sent_s = '1' then
            control_unit_state_s <= rd_update_read_index;
          end if;

          
        when rd_update_read_index =>
          -- finish transfert if communication is closed
          if rd_read_index_updated_s = '1' and i2c_communicating_i = '0' then
            control_unit_state_s <= rd_finish_read;

            -- else begin new transfert
          elsif rd_read_index_updated_s = '1' and i2c_new_transfert_i = '1' then
            control_unit_state_s <= rd_send_byte;
          end if;

        when rd_finish_read =>
          if rd_finish_read_done_s = '1' then
            control_unit_state_s <= wait_for_communication;
          end if;

          ---------------------------------------------------------------------
          -- write operation
        when wr_begin_reception =>
          if wr_begin_reception_done_s = '1' then
            control_unit_state_s <= wr_receive_byte;
          end if;
          
        when wr_receive_byte =>
          if wr_byte_received_s = '1' then
            control_unit_state_s <= wr_update_write_index;
          end if;

          
        when wr_update_write_index =>
          -- finish transfert if communication is closed
          if wr_write_index_updated_s = '1' and i2c_communicating_i = '0' then
            control_unit_state_s <= wr_finish_write;

            -- else begin new transfert
          elsif wr_write_index_updated_s = '1' and i2c_new_transfert_i = '1' then
            control_unit_state_s <= wr_receive_byte;
          end if;

        when wr_finish_write =>
          if wr_finish_write_done_s = '1' then
            control_unit_state_s <= wait_for_communication;
          end if;
        when others => null;
      end case;
      
      
      
    end if;

    
  end process control_unit;


  manage_read_index_p : process (clk_i, reset_ni)
  begin  -- process manage_read_index_p
    if reset_ni = '0' then              -- asynchronous reset (active low)
      read_index_s             <= 0;
      rd_read_index_updated_s  <= '0';
      rd_begin_emission_done_s <= '0';
      i2c_read_in_progress_o   <= '0';
	  rd_finish_read_done_s    <= '0';
	  
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge

      -- signal that emission buffer must not be accessed
      if control_unit_state_s = rd_begin_emission then
        i2c_read_in_progress_o   <= '1';
        read_index_s             <= 0;
        rd_begin_emission_done_s <= '1';
		rd_finish_read_done_s    <= '0';

        -- increase read index only once and signal that operation has been done
      elsif control_unit_state_s = rd_update_read_index then
        if rd_read_index_updated_s = '0' then  -- update only once
          read_index_s            <= read_index_s +1;
          rd_read_index_updated_s <= '1';
        end if;
        rd_begin_emission_done_s <= '0';

        -- release flag for future transmission
      elsif control_unit_state_s = rd_send_byte then
        rd_read_index_updated_s <= '0';


        -- release all the flags because communication is finished
      elsif control_unit_state_s = rd_finish_read then
        i2c_read_in_progress_o  <= '0';
        rd_read_index_updated_s <= '0';
		rd_finish_read_done_s   <= '1';
      end if;
      
    end if;
  end process manage_read_index_p;


  rd_update_emission_buffer_p : process (clk_i, reset_ni)
  begin  -- process update_buffer_out
    if reset_ni = '0' then              -- asynchronous reset (active low)
      rd_byte_sent_s <= '0';
      
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge

      if control_unit_state_s = rd_send_byte and rd_byte_sent_s = '0' then

        i2c_data_out_o <= emission_buffer_i(read_index_s);
        rd_byte_sent_s <= '1';
      elsif control_unit_state_s = rd_update_read_index then
        rd_byte_sent_s <= '0';
        
      end if;
    end if;
  end process rd_update_emission_buffer_p;


  
  manage_write_index_p : process (clk_i, reset_ni)
  begin  -- process manage_read_index_p
    if reset_ni = '0' then              -- asynchronous reset (active low)

      write_index_s <= 1;
      wr_write_index_updated_s  <= '0';
      wr_begin_reception_done_s <= '0';
	  i2c_write_in_progress_o   <= '0';
	  wr_finish_write_done_s    <= '0';
      
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge

      -- signal that emission buffer must not be accessed
      if control_unit_state_s = wr_begin_reception then
        i2c_write_in_progress_o   <= '1';
        write_index_s             <= 1;
        wr_begin_reception_done_s <= '1';
		wr_finish_write_done_s    <= '0';

        -- increase read index only once and signal that operation has been done
      elsif control_unit_state_s = wr_update_write_index then
        if wr_write_index_updated_s = '0' then  -- update only once
          write_index_s            <= write_index_s +1;
          wr_write_index_updated_s <= '1';
        end if;
        wr_begin_reception_done_s <= '0';

        -- release flag for future transmission
      elsif control_unit_state_s = wr_receive_byte then
        wr_write_index_updated_s <= '0';

        -- release all the flags because communication is finished
      elsif control_unit_state_s = wr_finish_write then
        i2c_write_in_progress_o  <= '0';
        wr_write_index_updated_s <= '0';
		wr_finish_write_done_s   <= '1';
        -- reception_buffer(0) <= std_logic_vector(to_unsigned(write_index_s,8));
      end if;
      
    end if;
  end process manage_write_index_p;



  wr_update_buffer_out_p : process (clk_i, reset_ni)
  begin  -- process update_buffer_out
    if reset_ni = '0' then              -- asynchronous reset (active low)
      wr_byte_received_s <= '0';
      
    elsif clk_i'event and clk_i = '1' then  -- rising clock edge

      if control_unit_state_s = wr_receive_byte and wr_byte_received_s = '0' then
        reception_buffer_o(write_index_s) <= i2c_data_in_i;
        wr_byte_received_s <= '1';
        
      elsif control_unit_state_s = wr_update_write_index then
        reception_buffer_o(0) <= std_logic_vector(to_unsigned(write_index_s,8));
        wr_byte_received_s <= '0';
        
      end if;
    end if;
  end process wr_update_buffer_out_p;
  
end comm_contol_unit_1;
