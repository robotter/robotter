// Set of function for all the midi2pwm project

// Author: RB

#ifndef __GPFUNCTIONS_H__
#define __GPFUNCTIONS_H__

/* 
  Some data in the MIDI file have a variable len for the representation this fonction read thoses informations
  On FAILURE return -1
 See section "Data Formats" in http://www.sonicspot.com/guide/midifiles.html
*/
int get_variable_len_value(FILE * fp);

#endif /* __GPFUNCTIONS_H__ */
