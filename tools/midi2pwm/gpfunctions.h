// Set of function for all the midi2pwm project

// Author: RB

#ifndef __GPFUNCTIONS_H__
#define __GPFUNCTIONS_H__

/* 
  Some data in the MIDI file have a variable len for the representation this fonction read thoses informations
  input:
    fp: File descriptor to the MIDI file, the pointer must be set after the 
        Meta Event Type
  return value: 
    0: OK, -1: Error
 See section "Data Formats" in http://www.sonicspot.com/guide/midifiles.html
*/
int get_variable_len_value(FILE * fp);

/* 
  Get the controler name string for the input value
  input:
    param1: the number of the controler
    control_name: the name of the controler
  return value: 
    0: OK, -1: Error

 See section "Data Formats" in http://www.sonicspot.com/guide/midifiles.html
*/

int get_controller_by_value(int param1,char * control_name);

#endif /* __GPFUNCTIONS_H__ */
