// Set of function to handle meta event and System Exclusive Events of a midi file 

// Author: RB

#ifndef __METAEVENT_H__
#define __METAEVENT_H__

/*
  Time signature structure
*/ 
typedef struct{
  int numer;
  int denom;
  int metro;
  int v32nds;
  float ratio;
} time_sign;


/* 
  Function to display Text event information
  
  input:
    fp: File descriptor to the MIDI file, the pointer must be set after the 
        Meta Event Type
  return value: 
    0: OK, 1: Error
*/
int disp_text_event(FILE * fp);


/* 
  Function to get time signature for the midi file

    input:
      fp: File descriptor to the MIDI file, the pointer must be set after the 
          Meta Event Type
      time_sign: pointer to the return structure of time signature

    return value: 
      0: OK, 1: Error
*/
int get_time_sign(FILE * fp,time_sign * time_sign);

#endif /* __METAEVENT_H__ */
