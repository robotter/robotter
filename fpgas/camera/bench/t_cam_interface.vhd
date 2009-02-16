-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY t_cam_interface IS
  END t_cam_interface;

  ARCHITECTURE behavior_1 OF t_cam_interface IS 

  -- Component Declaration
          COMPONENT cam_interface
          PORT(

				  clk_i          : in  std_logic;
				  rst_i          : in  std_logic;
				  
				  -- camera side
				  -- Y signal (see documentation)
				  Y_i            : in  std_logic_vector(7 downto 0);
				  -- UV signal (see documentation)
				  UV_i           : in  std_logic_vector(7 downto 0);
				  PCLK_i         : in  std_logic;
				  HREF_i         : in  std_logic;
				  VSYNC_i        : in  std_logic;
				  FODD_i         : in  std_logic;

				  -- FPGA side
				  R_o            : out std_logic_vector(7 downto 0);
				  G_o            : out std_logic_vector(7 downto 0);
				  B_o            : out std_logic_vector(7 downto 0);
				  new_pix_o      : out std_logic;
				  -- this signal indicate a new line on falling edge and rising edge
				  new_line_o     : out std_logic;
				  new_frame_o    : out std_logic;
				  rst_camera_o   : out std_logic
          );
          END COMPONENT;

          SIGNAL clk_s          : std_logic;
          SIGNAL rst_s          : std_logic;
          SIGNAL Y_s            : std_logic_vector(7 downto 0);
          SIGNAL UV_s           : std_logic_vector(7 downto 0);
          SIGNAL PCLK_s         : std_logic;
          SIGNAL HREF_s         : std_logic;
          SIGNAL VSYNC_s        : std_logic;
          SIGNAL FODD_s         : std_logic;
          SIGNAL R_s            : std_logic_vector(7 downto 0);
          SIGNAL G_s            : std_logic_vector(7 downto 0);
          SIGNAL B_s            : std_logic_vector(7 downto 0);
          SIGNAL new_pix_s      : std_logic;
          SIGNAL new_line_s     : std_logic;
          SIGNAL new_frame_s    : std_logic;
          SIGNAL rst_camera_s   : std_logic;
			 
          -- timing constant
          constant periode_c : time := 10 ns;     -- 100 MHz
          constant periode_cc: time := 100 ns;    -- 10 MHz


			 
  BEGIN

  -- Component Instantiation
     uut: cam_interface PORT MAP(
        clk_i        => clk_s,
		  rst_i        => rst_s,
        Y_i          => Y_s,
        UV_i         => UV_s,
		  PCLK_i       => PCLK_s,
		  HREF_i       => HREF_s,
		  VSYNC_i      => VSYNC_s,
		  FODD_i       => FODD_s,
		  R_o          => R_s,
		  G_o          => G_s,
		  B_o          => B_s,
		  new_pix_o    => new_pix_s,
		  new_line_o   => new_line_s,
		  new_frame_o  => new_frame_s,
		  rst_camera_o => rst_camera_s
      );

	  -- input: clock
	  clock_p : PROCESS
	  BEGIN
		 clk_s <= '1', '0' after periode_c/2;
		 wait for periode_c;
	  end process clock_p;

    -- input: camera reset
    camera_rst_p : PROCESS
    BEGIN
        VSYNC_s <= '0', '1' after periode_cc*18;
        wait for 36*periode_cc;
    end process camera_rst_p;

    -- input: general reset
    reset_p : PROCESS
    BEGIN
        rst_s <= '1', '0' after periode_c*2;
        wait for 72*periode_cc;
    end process reset_p;

	  -- input: camera clock
	  cam_clock_p : PROCESS
	  BEGIN
		 PCLK_s <= '0', '1' after periode_cc/2;
		 wait for periode_cc;
	  end process cam_clock_p;

	  -- input: FODD
	  new_line_p : PROCESS
	  BEGIN
		 FODD_s <= '1', '0' after periode_cc*6;
		 wait for periode_cc*12;
	  end process new_line_p;

	  -- input: HREF
	  new_image_p : PROCESS
	  BEGIN
		 HREF_s <= '1', '0' after periode_cc*64;
		 wait for periode_cc*72;
	  end process new_image_p;
	  
	  -- input: Y
	  Y_p : PROCESS
	  BEGIN
		 Y_s <= "10101010";
		 wait for periode_cc;
		 Y_s <= "01010101";
		 wait for periode_cc;
		 Y_s <= "11111111";
		 wait for periode_cc;
		 Y_s <= "00000000";
		 wait for periode_cc;
		 Y_s <= "11110000";
		 wait for periode_cc;
		 Y_s <= "10101010";
		 wait for periode_cc;
	  end process Y_p;

	  -- input: UV
	  UV_p : PROCESS
	  BEGIN
		 UV_s <= "00001111";
		 wait for periode_cc;
		 UV_s <= "11001100";
		 wait for periode_cc;
		 UV_s <= "00110011";
		 wait for periode_cc;
		 UV_s <= "11111111";
		 wait for periode_cc;
		 UV_s <= "10101010";
		 wait for periode_cc;
		 UV_s <= "00000000";
		 wait for periode_cc;
	  end process UV_p;
  END;
