# Copyright (C) 1991-2009 Altera Corporation
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
# File: top_uniong_propmmx.tcl
# Generated on: Sat Oct 23 17:53:40 2010

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "uniong_propmmx"]} {
		puts "Project uniong_propmmx is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists uniong_propmmx]} {
		project_open -revision uniong_propmmx uniong_propmmx
	} else {
		project_new -revision uniong_propmmx uniong_propmmx
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone II"
	set_global_assignment -name DEVICE EP2C5T144C8
	set_global_assignment -name TOP_LEVEL_ENTITY top_uniocng_propmmx
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION "9.0 SP1"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "16:36:11  OCTOBER 23, 2010"
	set_global_assignment -name LAST_QUARTUS_VERSION "9.0 SP1"
	set_global_assignment -name USE_GENERATED_PHYSICAL_CONSTRAINTS OFF -section_id eda_blast_fpga
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE ANY
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 144
	set_global_assignment -name USE_CONFIGURATION_DEVICE ON
	set_global_assignment -name VHDL_FILE atmega_nodir_wb8_wrapper00_mwb8_intercon.vhd
	set_global_assignment -name VHDL_FILE top_uniocng_propmmx.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/rstext_syscon/hdl/rstext_syscon.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/led/hdl/led.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/encoder_inc/hdl/encoder_inc_debouncer.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/encoder_inc/hdl/encoder_inc_reader.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/encoder_inc/hdl/encoder_inc_wbs.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/encoder_inc/hdl/top_encoder_inc.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/compass/hdl/compass_reader.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/compass/hdl/compass_wbs.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/compass/hdl/top_compass.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/atmega_nodir_wb8_wrapper/hdl/atmega_nodir_wb8_wrapper.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/adns9500/hdl/adns9500_controlunit.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/adns9500/hdl/adns9500_latch_nbits.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/adns9500/hdl/adns9500_mode_mux.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/adns9500/hdl/adns9500_spi.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/adns9500/hdl/adns9500_wishbone_interface.vhd
	set_global_assignment -name VHDL_FILE ../../libraries/adns9500/hdl/top_adns9500.vhd
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
	set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"
	set_global_assignment -name MISC_FILE "D:/robotter/eurobot/fpgas/projects/uniocng_propmx/uniong_propmmx.dpf"
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
	set_location_assignment PIN_3 -to encoder_inc02_ch_a_i
	set_location_assignment PIN_4 -to encoder_inc00_ch_a_i
	set_location_assignment PIN_7 -to encoder_inc01_ch_b_i
	set_location_assignment PIN_8 -to encoder_inc00_ch_b_i
	set_location_assignment PIN_9 -to encoder_inc01_ch_a_i
	set_location_assignment PIN_28 -to rstext_syscon00_ext_rst_n
	set_location_assignment PIN_42 -to atmega_nodir_wb8_wrapper00_DA[0]
	set_location_assignment PIN_43 -to atmega_nodir_wb8_wrapper00_DA[1]
	set_location_assignment PIN_44 -to atmega_nodir_wb8_wrapper00_DA[2]
	set_location_assignment PIN_45 -to atmega_nodir_wb8_wrapper00_DA[3]
	set_location_assignment PIN_47 -to atmega_nodir_wb8_wrapper00_DA[4]
	set_location_assignment PIN_48 -to atmega_nodir_wb8_wrapper00_DA[5]
	set_location_assignment PIN_51 -to atmega_nodir_wb8_wrapper00_DA[6]
	set_location_assignment PIN_52 -to atmega_nodir_wb8_wrapper00_DA[7]
	set_location_assignment PIN_53 -to atmega_nodir_wb8_wrapper00_ALE
	set_location_assignment PIN_57 -to atmega_nodir_wb8_wrapper00_Address_H[6]
	set_location_assignment PIN_58 -to atmega_nodir_wb8_wrapper00_Address_H[5]
	set_location_assignment PIN_59 -to atmega_nodir_wb8_wrapper00_Address_H[4]
	set_location_assignment PIN_60 -to atmega_nodir_wb8_wrapper00_Address_H[3]
	set_location_assignment PIN_63 -to atmega_nodir_wb8_wrapper00_Address_H[2]
	set_location_assignment PIN_64 -to atmega_nodir_wb8_wrapper00_Address_H[1]
	set_location_assignment PIN_65 -to atmega_nodir_wb8_wrapper00_Address_H[0]
	set_location_assignment PIN_67 -to atmega_nodir_wb8_wrapper00_RD
	set_location_assignment PIN_69 -to atmega_nodir_wb8_wrapper00_WR
	set_location_assignment PIN_17 -to rstext_syscon00_ext_clk
	set_location_assignment PIN_73 -to adns950000_cs3_no
	set_location_assignment PIN_75 -to adns950000_adns_reset_o
	set_location_assignment PIN_86 -to adns950000_mosi_o
	set_location_assignment PIN_87 -to adns950000_sck_o
	set_location_assignment PIN_92 -to adns950000_miso_i
	set_location_assignment PIN_94 -to adns950000_cs2_no
	set_location_assignment PIN_97 -to adns950000_cs1_no
	set_location_assignment PIN_143 -to encoder_inc02_ch_b_i
	set_location_assignment PIN_144 -to compass00_pwm_i
	set_location_assignment PIN_72 -to led00_led
	set_location_assignment PIN_71 -to clk_mega_i

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
