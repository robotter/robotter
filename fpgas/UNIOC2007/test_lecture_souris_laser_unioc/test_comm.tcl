# Copyright (C) 1991-2008 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: test_comm.tcl
# Generated on: Sat Jan 10 22:52:28 2009

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1


# Make assignments
	set_location_assignment PIN_59 -to adresse_H[6]
	set_location_assignment PIN_60 -to adresse_H[5]
	set_location_assignment PIN_61 -to adresse_H[4]
	set_location_assignment PIN_62 -to adresse_H[3]
	set_location_assignment PIN_67 -to adresse_H[2]
	set_location_assignment PIN_68 -to adresse_H[1]
	set_location_assignment PIN_58 -to ale
	set_location_assignment PIN_16 -to clk
	set_location_assignment PIN_53 -to DA[5]
	set_location_assignment PIN_52 -to DA[4]
	set_location_assignment PIN_51 -to DA[3]
	set_location_assignment PIN_50 -to DA[2]
	set_location_assignment PIN_49 -to DA[1]
	set_location_assignment PIN_48 -to DA[0]
	set_location_assignment PIN_47 -to DIR_buffer
	set_location_assignment PIN_71 -to RD
	set_location_assignment PIN_72 -to WR
	set_location_assignment PIN_56 -to DA[6]
	set_location_assignment PIN_57 -to DA[7]
	set_location_assignment PIN_69 -to adresse_H[0]
	set_location_assignment PIN_33 -to SCL
	set_location_assignment PIN_34 -to SDA
	set_location_assignment PIN_35 -to reset
	set_location_assignment PIN_36 -to INT1
	set_location_assignment PIN_37 -to INT0
	set_location_assignment PIN_38 -to maitre
	set_location_assignment PIN_5 -to sck
	set_location_assignment PIN_40 -to RX
	set_location_assignment PIN_70 -to LED
	set_location_assignment PIN_125 -to pwm1
	set_location_assignment PIN_129 -to pwm0
	set_location_assignment PIN_131 -to pwm2
	set_location_assignment PIN_133 -to dir1
	set_location_assignment PIN_139 -to dir2
	set_location_assignment PIN_83 -to dir_sdio
	set_location_assignment PIN_79 -to nCS0
	set_location_assignment PIN_77 -to nCS1
	set_location_assignment PIN_75 -to nCS2
	set_location_assignment PIN_74 -to servo2
	set_location_assignment PIN_76 -to servo3
	set_location_assignment PIN_78 -to sdio
	set_location_assignment PIN_39 -to TX
	set_location_assignment PIN_11 -to cs
	set_location_assignment PIN_3 -to mosi
	set_location_assignment PIN_7 -to miso