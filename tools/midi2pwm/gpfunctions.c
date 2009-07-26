// Set of function for all the midi2pwm project

// Author: RB

#include <stdio.h>

/* 
  Some data in the MIDI file have a variable len for the representation this fonction read thoses informations
  On FAILURE return -1
 See section "Data Formats" in http://www.sonicspot.com/guide/midifiles.html
*/

int get_variable_len_value(FILE * fp){
    int get_chr;
    get_chr=fgetc(fp);
    // TODO
    if (get_chr>127){
      printf("Invalid tempo value=> TODO");
      return -1;
    }
    return get_chr;
}


