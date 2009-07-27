// Set of function for all the midi2pwm project

// Author: RB

#include <stdio.h>
#include <string.h>

/* 
 *  Some data in the MIDI file have a variable len for the representation this 
 *      fonction read thoses informations
 *    input:
 *      fp: File descriptor to the MIDI file, the pointer must be set after the 
 *          Meta Event Type
 *    return value: 
 *      0: OK, -1: Error
 *  See section "Data Formats" in http://www.sonicspot.com/guide/midifiles.html
 */

int get_variable_len_value(FILE * fp){
  int get_chr;
  get_chr=fgetc(fp);
  // TODO
  if (get_chr>127){
    printf("Invalid tempo value=> TODO\n");
    return -1;
  }
  return get_chr;
}

/* 
 *  Get the controler name string for the input value
 *    input:
 *      param1: the number of the controler
 *      control_name: the name of the controler
 *    return value: 
 *      0: OK, -1: Error
 *  See section "Data Formats" in http://www.sonicspot.com/guide/midifiles.html
 */

int get_controller_by_value(int param1,char * control_name){
  char var2string[][55]={"Bank Select",
    "Modulation",
    "Breath Controller",
    "Foot Controller",
    "Portamento Time",
    "Data Entry (MSB)",
    "Main Volume",
    "Balance",
    "Pan",
    "Expression Controller",
    "Effect Control 1",
    "Effect Control 2",
    "General-Purpose Controllers 1",
    "General-Purpose Controllers 2",
    "General-Purpose Controllers 3",
    "General-Purpose Controllers 4",
    "LSB for controllers 0",
    "LSB for controllers 1",
    "LSB for controllers 2",
    "LSB for controllers 3",
    "LSB for controllers 4",
    "LSB for controllers 5",
    "LSB for controllers 6",
    "LSB for controllers 7",
    "LSB for controllers 8",
    "LSB for controllers 9",
    "LSB for controllers 10",
    "LSB for controllers 11",
    "LSB for controllers 12",
    "LSB for controllers 13",
    "LSB for controllers 14",
    "LSB for controllers 15",
    "LSB for controllers 16",
    "LSB for controllers 17",
    "LSB for controllers 18",
    "LSB for controllers 19",
    "LSB for controllers 20",
    "LSB for controllers 21",
    "LSB for controllers 22",
    "LSB for controllers 23",
    "LSB for controllers 24",
    "LSB for controllers 25",
    "LSB for controllers 26",
    "LSB for controllers 27",
    "LSB for controllers 28",
    "LSB for controllers 29",
    "LSB for controllers 30",
    "LSB for controllers 31",
    "Damper pedal (sustain)",
    "Portamento",
    "Sostenuto",
    "Soft Pedal",
    "Legato Footswitch",
    "Hold 2",
    "Sound Controller 1 (default: Timber Variation)",
    "Sound Controller 2 (default: Timber/Harmonic Content)",
    "Sound Controller 3 (default: Release Time)",
    "Sound Controller 4 (default: Attack Time)",
    "Sound Controller 6",
    "Sound Controller 7",
    "Sound Controller 8",
    "Sound Controller 9",
    "Sound Controller 10",
    "General-Purpose Controllers 5",
    "General-Purpose Controllers 6",
    "General-Purpose Controllers 7",
    "General-Purpose Controllers 8",
    "Portamento Control",
    "Effects 1 Depth (formerly External Effects Depth)",
    "Effects 2 Depth (formerly Tremolo Depth)",
    "Effects 3 Depth (formerly Chorus Depth)",
    "Effects 4 Depth (formerly Celeste Detune)",
    "Effects 5 Depth (formerly Phaser Depth)",
    "Data Increment",
    "Data Decrement",
    "Non-Registered Parameter Number (LSB)",
    "Non-Registered Parameter Number (MSB)",
    "Registered Parameter Number (LSB)",
    "Registered Parameter Number (MSB)",
    "Mode Messages",
    "Mode Messages",
    "Mode Messages",
    "Mode Messages",
    "Mode Messages",
    "Mode Messages",
    "Mode Messages",
    "Unknow"};
  int val2get;

  if (param1>127) val2get=128;
  else val2get=param1;

  strncpy(control_name,var2string[val2get],100);

  return 0;

}


