# Pinout file, automaticaly generated by pod
package require ::quartus::project
    set_location_assignment PIN_3 -to encoder_inc02_ch_a_i;
    set_location_assignment PIN_4 -to encoder_inc00_ch_a_i;
    set_location_assignment PIN_7 -to encoder_inc01_ch_b_i;
    set_location_assignment PIN_8 -to encoder_inc00_ch_b_i;
    set_location_assignment PIN_9 -to encoder_inc01_ch_a_i;
    set_location_assignment PIN_42 -to atmega_nodir_wb8_wrapper00_DA[0];
    set_location_assignment PIN_43 -to atmega_nodir_wb8_wrapper00_DA[1];
    set_location_assignment PIN_44 -to atmega_nodir_wb8_wrapper00_DA[2];
    set_location_assignment PIN_45 -to atmega_nodir_wb8_wrapper00_DA[3];
    set_location_assignment PIN_47 -to atmega_nodir_wb8_wrapper00_DA[4];
    set_location_assignment PIN_48 -to atmega_nodir_wb8_wrapper00_DA[5];
    set_location_assignment PIN_51 -to atmega_nodir_wb8_wrapper00_DA[6];
    set_location_assignment PIN_52 -to atmega_nodir_wb8_wrapper00_DA[7];
    set_location_assignment PIN_53 -to atmega_nodir_wb8_wrapper00_ALE;
    set_location_assignment PIN_57 -to atmega_nodir_wb8_wrapper00_Address_H[6];
    set_location_assignment PIN_58 -to atmega_nodir_wb8_wrapper00_Address_H[5];
    set_location_assignment PIN_59 -to atmega_nodir_wb8_wrapper00_Address_H[4];
    set_location_assignment PIN_60 -to atmega_nodir_wb8_wrapper00_Address_H[3];
    set_location_assignment PIN_63 -to atmega_nodir_wb8_wrapper00_Address_H[2];
    set_location_assignment PIN_64 -to atmega_nodir_wb8_wrapper00_Address_H[1];
    set_location_assignment PIN_65 -to atmega_nodir_wb8_wrapper00_Address_H[0];
    set_location_assignment PIN_67 -to atmega_nodir_wb8_wrapper00_RD;
    set_location_assignment PIN_69 -to atmega_nodir_wb8_wrapper00_WR;
    set_location_assignment PIN_70 -to rstext_syscon00_ext_rst_n;
    set_location_assignment PIN_17 -to rstext_syscon00_ext_clk;
    set_location_assignment PIN_73 -to adns601000_cs3_no;
    set_location_assignment PIN_75 -to adns601000_adns_reset_o;
    set_location_assignment PIN_86 -to adns601000_mosi_o;
    set_location_assignment PIN_87 -to adns601000_sck_o;
    set_location_assignment PIN_92 -to adns601000_miso_i;
    set_location_assignment PIN_94 -to adns601000_cs2_no;
    set_location_assignment PIN_97 -to adns601000_cs1_no;
    set_location_assignment PIN_143 -to encoder_inc02_ch_b_i;
    set_location_assignment PIN_144 -to compass00_pwm_i;
    set_location_assignment PIN_72 -to led00_led;
# Reserve unused pin states
    set_location_assignment PIN_71 -to CLK_mega
    set_instance_assignment -name RESERVE_PIN "AS INPUT TRI-STATED" -to CLK_mega
    set_location_assignment PIN_25 -to SDA_fpga
    set_instance_assignment -name RESERVE_PIN "AS INPUT TRI-STATED" -to SDA_fpga
    set_location_assignment PIN_24 -to SCL_fpga
    set_instance_assignment -name RESERVE_PIN "AS INPUT TRI-STATED" -to SCL_fpga
#end