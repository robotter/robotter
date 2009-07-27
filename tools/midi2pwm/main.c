// Rob'otter midi file reader
// see http://www.sonicspot.com/guide/midifiles.html for reference

// Author: RB

// TODO:
//    - include the fgetc read errors
//    - implement the get_variable_len_value function
//    - handle of input parameters

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <arpa/inet.h>

#include "gpfunctions.h"
#include "metaevent.h"


int main(int argc, char **argv){
  FILE * fp;

  int err=0; // Error level: 0:ok, 1: error, 2: warning

  char fheader[5];
  uint32_t chuck_size=0;
  uint16_t format_type=0; 
  uint16_t nb_tracks=0;
  uint16_t time_division=0;
  uint16_t time_division_flag=0;

  char theader[5];
  uint32_t track_chuck_size=0;

  int get_chr;
  int delta_time;

  time_sign time_sign;
  time_sign.numer=4;
  time_sign.denom=4;
  time_sign.metro=24;
  time_sign.v32nds=8;
  time_sign.ratio=0.0;

  key_sign key_sign;
  key_sign.key=128;
  key_sign.scale=2;

  int tempo; //microseconds per quarter-note

  int param1,param2;
  
  char control_name[100];

  // Open the ringtone file
  fp=fopen(argv[1],"r");
  if (fp==NULL) {
    printf("< E: %s:%d >     Can't open file\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }

  /* **************************************************************
     Header chunk
   ************************************************************** */

  // chunk ID is always "MThd"
  if (fread(fheader,1,4,fp)!=4){
    printf("< E: %s:%d >     Can't read the chunk ID\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }
  fheader[4]=0;
  printf("Chuck ID: %s ... ", fheader);

  if(strncmp (fheader,"MThd",4)==0){
    printf("OK\n");
  }else{
    printf("KO\n");
    err=1;
  }

  // Chunk size is always 6
  if (fread(&chuck_size,4,1,fp)!=1){
    printf("< E: %s:%d >     Can't read the chunk size\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }
  chuck_size=ntohl(chuck_size);
  printf("Chuck size: %d ... ", chuck_size);

  if(chuck_size==6){
    printf("OK\n");
  }else{
    printf("KO\n");
    err=1;
  }

  // Format Type
  if (fread(&format_type,2,1,fp)!=1){
    printf("< E: %s:%d >     Can't read the format type\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }
  format_type=ntohs(format_type);
  printf("Format type: %d ... ", format_type);

  if(format_type==0){
    printf("OK\n");
  }else{
    printf("not supported\n");
    err=1;
  }

  // Number of Tracks
  if (fread(&nb_tracks,2,1,fp)!=1){
    printf("< E: %s:%d >     Can't read the number of tracks\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }
  nb_tracks=ntohs(nb_tracks);
  printf("Number of tracks: %d ... ", nb_tracks);

  if(nb_tracks==1){
    printf("OK\n");
  }else{
    printf("not supported\n");
    err=1;
  }

  // Time division
  if (fread(&time_division,2,1,fp)!=1){
    printf("< E: %s:%d >     Can't read the time division\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }
  time_division_flag=(time_division&0x8000)>>15;
  time_division=time_division&0x7FFF;
  time_division=ntohs(time_division);
  printf("Time division: %d ", time_division);

  if(time_division_flag==0){
    printf("ticks per beat\n");
  }else{
    printf("frames per second ... not supported\n");
    err=1;
  }



  if (err==1){
    printf("Can't continue due to previous errors\n");
    return EXIT_FAILURE;
  }
  printf("____________________________________________________________\n\n");


  /* **************************************************************
     Track chunk
   ************************************************************** */

  // track chunk ID is always "MTrk"
  if (fread(theader,1,4,fp)!=4){
    printf("< E: %s:%d >     Can't read the track chunk ID\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }
  theader[4]=0;
  printf("Track chuck ID: %s", theader);

  if(strncmp (theader,"MTrk",4)==0){
    printf("OK\n");
  }else{
    printf("KO\n");
    err=1;
  }

  // track chunk size
  if (fread(&track_chuck_size,4,1,fp)!=1){
    printf("< E: %s:%d >     Can't read the track chunk size\n", __FILE__, __LINE__);
    return EXIT_FAILURE;
  }
  track_chuck_size=ntohl(track_chuck_size);
  printf("Track chuck size: %d\n", track_chuck_size);


  /* **************************************************************
     MIDI Event
   ************************************************************** */

  while (!feof(fp)){
    printf("-------\n");
    // Get Delta-Times
    delta_time=get_variable_len_value(fp);
    if (delta_time==-1){
      printf("< E: %s:%d >     Can't read the delta time\n", __FILE__, __LINE__);
      return EXIT_FAILURE;
    }

    // Get event type and MIDI Channel
    get_chr=fgetc(fp);

    if ((get_chr&0xF0)!=0xF0){
      // This is not a midi event
      printf("New midi event on MIDI channel %d: ", get_chr&0x0F);

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

          break;

        case 0xC0:
          printf("Program Change\n");
          param1=fgetc(fp);
          printf("  Program number: %d\n", param1);
          // param2=fgetc(fp);
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
          printf("Unknow MIDI event... Exiting\n");
          return EXIT_FAILURE;

          break;
      }




    }else{
      if(get_chr==0xFF){
        // This is a Meta event
        printf("New meta event: ");
        get_chr=fgetc(fp);
        switch (get_chr){
          case 0:
            printf("Sequence Number\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 1:
            printf("Text Event\n");
            if (disp_text_event(fp)==1) return EXIT_FAILURE;
            break;
          case 2:
            printf("Copyright Notice\n");
            if (disp_text_event(fp)==1) return EXIT_FAILURE;
            break;
          case 3:
            printf("Sequence/Track Name\n");
            if (disp_text_event(fp)==1) return EXIT_FAILURE;
            break;
          case 4:
            printf("Instrument Name\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 5:
            printf("Lyrics\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 6:
            printf("Marker\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 7:
            printf("Cue Point\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 32:
            printf("MIDI Channel Prefix\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 47:
            printf("End Of Track\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 81:
            printf("Set Tempo\n");
            if (get_tempo(fp,&tempo)==1) return EXIT_FAILURE;
            break;
          case 84:
            printf("SMPTE Offset\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          case 88:
            printf("Time Signature\n");
            if (get_time_sign(fp,&time_sign)==1) return EXIT_FAILURE;
            break;
          case 89:
            printf("Key Signature\n");
            if (get_key_sign(fp,&key_sign)==1) return EXIT_FAILURE;
            break;
          case 127:
            printf("Sequencer Specific\n");
            printf("Not implemented... Exiting\n");
            return EXIT_FAILURE;
            break;
          default:
            printf("Unknow\n");
            return EXIT_FAILURE;
            break;
        }
      }else{
        // This is a System Exclusive Event
        printf("New System Exclusive Event:\n");
        if (disp_sys_excl_event(fp)==1) return EXIT_FAILURE;
      }


    }


  }
  return EXIT_SUCCESS;
}


