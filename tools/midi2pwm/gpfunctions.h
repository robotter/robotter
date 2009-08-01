// Set of function for all the midi2pwm project

// Author: RB

#ifndef __GPFUNCTIONS_H__
#define __GPFUNCTIONS_H__


/*
  Note structure
*/ 
typedef struct{
  int value;
  int velocity;
  float set_at;
  float rst_at;
} note;






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

/* 
 *  Process information of a midi event
 *    this function is independent of the main function because the running 
 *      status must call again this function
 *    input:
 *      fp: File descriptor to the MIDI file, the pointer must be set after the 
 *          MIDI Event Type/Channel
 *      get_chr: the 4 MSB of this variable is the midi event
 *      control_name: a char array to get the control name string
 *      last_event: the value of the last event for running status
 *      notes_processed: the played notes
 *      nb_notes: the number of played notes
 *      timestamp: the time position in music
 *    return value: 
 *      0: OK, 1: Error
 */

int get_midi_event_info(FILE * fp,int get_chr,char * control_name,
  int * last_event, note * notes_processed, int * nb_notes, float timestamp);

#endif /* __GPFUNCTIONS_H__ */
