// Set of function to handle meta event and System Exclusive Events of a midi file 

// Author: RB

#include <stdio.h>
#include <stdlib.h>
#include "gpfunctions.h"
#include "metaevent.h"

/* 
  Function to display Text event information
  
  input:
    fp: File descriptor to the MIDI file, the pointer must be set after the 
        Meta Event Type
  return value: 
    0: OK, 1: Error
*/
int disp_text_event(FILE * fp){
  int name_len,i;
  char * name;
  name_len=get_variable_len_value(fp);
  if (name_len==-1){
      printf("< E: %s:%d >     Can't read the meta event length\n", __FILE__, __LINE__);
      return 1;
  }
  printf("  Length:%d\n",name_len);
  name=malloc((name_len+1)*sizeof(char));
  if (name==NULL){
      printf("< E: %s:%d >     Can't set the memory for this text event\n",
              __FILE__, __LINE__);
      return 1;
  }
  for(i=0;i<name_len;i++) name[i]=fgetc(fp);
  name[name_len]=0;
  printf("  Value: %s\n",name);
  free(name);
  return 0;
}

/* 
  Function to get time signature for the midi file

    input:
      fp: File descriptor to the MIDI file, the pointer must be set after the 
          Meta Event Type
      time_sign: pointer to the return structure of time signature

    return value: 
      0: OK, 1: Error
*/
int get_time_sign(FILE * fp,time_sign * time_sign){
  int struct_len;

  struct_len=get_variable_len_value(fp);
  if (struct_len==-1){
      printf("< E: %s:%d >     Can't read the meta event length\n", __FILE__, __LINE__);
      return 1;
  }
  printf("  Length:%d\n",struct_len);
  if (struct_len!=4){
      printf("< E: %s:%d >     Invalid structure len\n", __FILE__, __LINE__);
      return 1;
  }

  time_sign->numer=fgetc(fp);
  printf("  Numer:%d\n",time_sign->numer);
  time_sign->denom=fgetc(fp);
  printf("  Denum:%d\n",time_sign->denom);
  time_sign->metro=fgetc(fp);
  printf("  Metro:%d\n",time_sign->metro);
  time_sign->v32nds=fgetc(fp);
  printf("  32nds:%d\n",time_sign->v32nds);

  if (time_sign->denom!=0)
    time_sign->ratio=(float)time_sign->numer/(float)time_sign->denom;
  else
    time_sign->ratio=0.0;
  printf("  Ratio:%f\n",time_sign->ratio);



  return 0;
}



