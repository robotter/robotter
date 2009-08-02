// Set of function for all the midi2pwm project

// Author: RB

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include "gpfunctions.h"
#include "config.h"

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
  int value;
  char c; 
  if ((value = getc(fp)) & 0x80) {
    value &= 0x7f; 
    do { 
      value = (value << 7) + ((c = getc(fp)) & 0x7f);
    } while ((c & 0x80)&&(!feof(fp))); 
  } 
  if (feof(fp)){
    return -1;
  }
  return value;
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
  char var2string[101][55]={"Bank Select",
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

  strncpy(control_name,var2string[val2get],99);
  control_name[99]=0;

  return 0;

}



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
  int * last_event, note * notes_processed, int * nb_notes, float timestamp){
      int param1,param2;
      int i;

      switch(get_chr&0xF0){
        case 0x80:
          printf("Note Off\n");
          printf("Not implemented... Exiting\n");
          return EXIT_FAILURE;
          break;

        case 0x90:
          printf("Note On\n");
          param1=fgetc(fp);
          printf("  Note Number: %d\n", param1);
          param2=fgetc(fp);
          printf("  Velocity: %d\n", param2);
          *last_event=0x90;
       
          if (param2==0){
            // Key released
            for (i=(*nb_notes)-1;i>=0;i--){
              if ((notes_processed[i].value==param1)
                &&(notes_processed[i].rst_at==0.0)){
                notes_processed[i].rst_at=timestamp;
                // no break to close all the previous unclosed notes
              }             
            }
            
          }else{
            // New key

            // check that this key is not already pressed
            for (i=0;i<(*nb_notes);i++){
              if ((notes_processed[i].value==param1)
                &&(notes_processed[i].rst_at==0.0)){
                  printf("< W: %s:%d >     This note is already active.\n",
                    __FILE__, __LINE__);
              }
            }
            //adding it
            (*nb_notes)++;
            // this do not work
            notes_processed=(note *)realloc(notes_processed,(*nb_notes)*sizeof(note));
            // ......OK.... THE FOLLOWING IS VERY VERY VERY BAD
            /*{
              note * temp=malloc((*nb_notes)*sizeof(note));
              if (notes_processed!=NULL){
                // copy
                if (temp!=NULL) memcpy ( temp, notes_processed, (*nb_notes)*sizeof(note) );
                //free
                //free(notes_processed);
                notes_processed=temp;
              }
            }*/

            if (notes_processed==NULL){
                printf("< E: %s:%d >     Memory allocation error\n", 
                  __FILE__, __LINE__);
                return EXIT_FAILURE;
            }
 
            notes_processed[(*nb_notes)-1].value=param1;
            notes_processed[(*nb_notes)-1].velocity=param2;
            notes_processed[(*nb_notes)-1].set_at=timestamp;
            notes_processed[(*nb_notes)-1].rst_at=0.0;
          }
  
          break;

        case 0xA0:
          printf("Note Aftertouch\n");
          printf("Not implemented... Exiting\n");
          return EXIT_FAILURE;
          break;

        case 0xB0:
          printf("Controller\n");
          param1=fgetc(fp);
          get_controller_by_value(param1,control_name);
          printf("  Controller Type: %s (%d)\n",control_name, param1);
          param2=fgetc(fp);
          printf("  Value: %d\n", param2);
          *last_event=0xB0;
          break;

        case 0xC0:
          printf("Program Change\n");
          param1=fgetc(fp);
          printf("  Program number: %d\n", param1);
          *last_event=0xC0;
          break;

        case 0xD0:
          printf("Channel Aftertouch\n");
          printf("Not implemented... Exiting\n");
          return EXIT_FAILURE;
          break;

        case 0xE0:
          printf("Pitch Bend\n");
          printf("Not implemented... Exiting\n");
          return EXIT_FAILURE;
          break;

        default:
          printf("\rNew midi event: Running event: ");
          if (((*last_event)&0xF0)<0x80){  // Avoid any initialisation problems
            printf("Initialisation Error: Possible infinite loop\n");
            return EXIT_FAILURE;
          }
          // Rewind of 1 char
          fseek ( fp , -1 , SEEK_CUR );
          if (get_midi_event_info(fp,*last_event,control_name, last_event,
              notes_processed, nb_notes, timestamp)==EXIT_FAILURE){
            return EXIT_FAILURE;
          }

          break;
      }
      return EXIT_SUCCESS;
}
 


/* 
 *  Process the transformation of the note structure into PWM functions
 *    input:
 *      notes_processed: the played notes
 *      nb_notes: the number of played notes
 *      fw: file to write the C lines
 *    return value: 
 *      0: OK, 1: Error
 */
int notes2pwm(note * notes_processed,int nb_notes, FILE * fw){
  int i,j;

  printf("Number of notes: %d\n", nb_notes);

  //for (i=0;i<(nb_notes%6==0)?nb_notes/6:(nb_notes/6)+1;i++){
  for (i=0;i<((nb_notes%20==0)?nb_notes/20:(nb_notes/20))+1;i++){
    printf("\n\n+-----------");
    for (j=0;j<20;j++) printf("-------+");
    printf("\n|  Value   |");
    for (j=0;j<20;j++) printf("   %3d |",(i*20+j<nb_notes)?notes_processed[i*20+j].value:0);

    printf("\n+-----------");
    for (j=0;j<20;j++) printf("-------+");
    printf("\n| Velocity |");
    for (j=0;j<20;j++) printf("   %3d |",(i*20+j<nb_notes)?notes_processed[i*20+j].velocity:0);

    printf("\n+-----------");
    for (j=0;j<20;j++) printf("-------+");
    printf("\n|  Set at  |");
    for (j=0;j<20;j++) printf("%7.3lf|",(i*20+j<nb_notes)?notes_processed[i*20+j].set_at:0);

    printf("\n+-----------");
    for (j=0;j<20;j++) printf("-------+");
    printf("\n| Reset at |");
    for (j=0;j<20;j++) printf("%7.3f|",(i*20+j<nb_notes)?notes_processed[i*20+j].rst_at:0);

    printf("\n+-----------");
    for (j=0;j<20;j++) printf("-------+");
    printf("\n");

  }

  return EXIT_SUCCESS;
}



















