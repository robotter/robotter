// Set of function to handle meta event and System Exclusive Events of a midi file 

// Author: RB

#ifndef __METAEVENT_H__

/* 
  Function to display Sequence/Track Name information
  
  input:
    fp: File descriptor to the MIDI file, the pointer must be set after the 
        Meta Event Type
  return value: 
    0: OK, 1: Error
*/
int disp_seq_name(FILE * fp);

#define __METAEVENT_H__
#endif /* __METAEVENT_H__ */
