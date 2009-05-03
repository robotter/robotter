/* Programme de test pour l'algo de la carte camera */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/time.h>
#include <unistd.h>
#include <opencv/highgui.h>
#include <opencv/cv.h>
#include "algo_camera.h"


int main(int argc, char** argv){
  int i; // parce que l'on a toujours besoin d'un i
  struct timeval start,stop;
  struct timezone tz;
  int sec,us;

  IplImage* src=NULL;
  information resultat_test;
  if( (argc == 2) && ((src=cvLoadImage(argv[1], 1))!= 0))
  {
    printf("Chargement: %s\n",argv[1]);

    resultat_test.largueur=src->width;
    resultat_test.hauteur=src->height;
    printf("Dimensions: Largueur=%d, Hauteur=%d\n",resultat_test.largueur,resultat_test.hauteur);
    printf("Information: Profondeur=");
    switch (src->depth){
      case IPL_DEPTH_8U:
        printf("IPL_DEPTH_8U (OK)");
        break;
      case IPL_DEPTH_8S:
        printf("IPL_DEPTH_8S (KO)");
        break;
      case IPL_DEPTH_16S:
        printf("IPL_DEPTH_16S (KO)");
        break;
      case IPL_DEPTH_32S:
        printf("IPL_DEPTH_32S (KO)");
        break;
      case IPL_DEPTH_32F:
        printf("IPL_DEPTH_32F (KO)");
        break;
      case IPL_DEPTH_64F:
        printf("IPL_DEPTH_64F (KO)");
        break;
      default:
        printf("INCONNU (KO)");
        break;
    }

    printf(" Nombre de canaux=%d ",src->nChannels);
    if (src->nChannels==IMG_ALPHA)
      printf("(OK)\n");
    else
      printf("(KO)\n");

    fflush(stdout);

    // On affiche l'image avant de déconner avec les pixels
    cvNamedWindow("Image d'origine", CV_WINDOW_AUTOSIZE);
    cvShowImage("Image d'origine", src);

    // Il semble que l'organisation des bits soient BGR => on swape R et B
    uint8_t swap_tmp;
    for (i=0;i<resultat_test.largueur*resultat_test.hauteur;i++){
      swap_tmp=(src->imageData)[3*i];
      (src->imageData)[3*i]=(src->imageData)[3*i+2];
      (src->imageData)[3*i+2]=swap_tmp;
    }

    // *Mets des valeurs dans les seuils*
    for (i=0;i<NB_SEUILS;i++){
      resultat_test.seuils[i].actif=0;
      resultat_test.seuils[i].utilise_zones=0;
    }
    // pour le vert
    resultat_test.seuils[0].actif=1;
    resultat_test.seuils[0].mode=SEUIL_YSHS;
    resultat_test.seuils[0].H=50;
    resultat_test.seuils[0].Y=56;
    resultat_test.seuils[0].or_avec=-1;
    resultat_test.seuils[0].and_avec=-1;
    resultat_test.seuils[0].utilise_zones=0;

    resultat_test.seuils[1].actif=1;
    resultat_test.seuils[1].mode=SEUIL_YIHI;
    resultat_test.seuils[1].H=120;
    resultat_test.seuils[1].Y=200;
    resultat_test.seuils[1].or_avec=-1;
    resultat_test.seuils[1].and_avec=0;
    resultat_test.seuils[1].utilise_zones=1;

    // pour le rouge
    resultat_test.seuils[2].actif=1;
    resultat_test.seuils[2].mode=SEUIL_YIHI;
    resultat_test.seuils[2].H=21;
    resultat_test.seuils[2].Y=200;
    resultat_test.seuils[2].or_avec=-1;
    resultat_test.seuils[2].and_avec=-1;
    resultat_test.seuils[2].utilise_zones=0;

    resultat_test.seuils[3].actif=1;
    resultat_test.seuils[3].mode=SEUIL_YIHS;
    resultat_test.seuils[3].H=235;
    resultat_test.seuils[3].Y=200;
    resultat_test.seuils[3].or_avec=2;
    resultat_test.seuils[3].and_avec=-1;
    resultat_test.seuils[3].utilise_zones=0;

    resultat_test.seuils[4].actif=1;
    resultat_test.seuils[4].mode=SEUIL_YSHS;
    resultat_test.seuils[4].H=0;
    resultat_test.seuils[4].Y=10;
    resultat_test.seuils[4].or_avec=-1;
    resultat_test.seuils[4].and_avec=3;
    resultat_test.seuils[4].utilise_zones=1;
    

    // * Zones *
    // Taille des zones
    resultat_test.z_larg_min=0;
    resultat_test.z_long_min=0;
    resultat_test.z_larg_max=1000;
    resultat_test.z_long_max=1000;

    // Position des zones
    resultat_test.z_x_min=0;
    resultat_test.z_y_min=0;
    resultat_test.z_x_max=1000;
    resultat_test.z_y_max=1000;

    // mise en place du système de mesure
    tz.tz_minuteswest=0;
    gettimeofday(&start, &tz); 
    int out=process_image( (uint8_t *)src->imageData, &resultat_test);
    gettimeofday(&stop, &tz); 
    printf("La fonction de traitement à retourné: %d \n",out);
    if (out!=1){
      cvReleaseImage(&src);
      return 1;
    }
    sec = stop.tv_sec - start.tv_sec;
    us = stop.tv_usec - start.tv_usec;
    if (us<0){sec--;us+=1000;}
    // printf ("Temps ecoule : %u.%06u secondes\n", sec, us);
    printf ("Temps ecoule : %u ms\n", us/1000); // semble plus fiable
    fflush(stdout);


    // pour l'affichage des HY(avant et après moyennage)
    /*
    IplImage* dst_H = cvCreateImage( cvGetSize(src), IPL_DEPTH_8U, 1);
    IplImage* dst_Y = cvCreateImage( cvGetSize(src), IPL_DEPTH_8U, 1);

    for (i=0;i<resultat_test.largueur*resultat_test.hauteur;i++){
      (dst_H->imageData)[i]=(char)resultat_test.test[2*i+1];
      (dst_Y->imageData)[i]=(char)resultat_test.test[2*i];
    }

    cvNamedWindow("Luminance", CV_WINDOW_AUTOSIZE);
    cvShowImage("Luminance", dst_Y);
    cvNamedWindow("Chrominance", CV_WINDOW_AUTOSIZE);
    cvShowImage("Chrominance", dst_H);
    cvReleaseImage(&dst_H);
    cvReleaseImage(&dst_Y);
    */
    // pour l'affichage des seuils
    int sel_seuil_1=1;
    int sel_seuil_2=4;

    IplImage* seuil_1 = cvCreateImage( cvGetSize(src), IPL_DEPTH_8U, 1);
    IplImage* seuil_2 = cvCreateImage( cvGetSize(src), IPL_DEPTH_8U, 1);

    for (i=0;i<resultat_test.largueur*resultat_test.hauteur;i++){
      // premier seuil et pas de t=(o)?1:2;
      if (sel_seuil_1<8)
        if (((char)resultat_test.test[2*i]&(1<<sel_seuil_1))>0)
          (seuil_1->imageData)[i]=255;
        else
          (seuil_1->imageData)[i]=0;
      else
        if (((char)resultat_test.test[2*i+1]&(1<<(sel_seuil_1-8)))>0)
          (seuil_1->imageData)[i]=255;
        else
          (seuil_1->imageData)[i]=0;

      // seuil 2
      if (sel_seuil_2<8)
        if (((char)resultat_test.test[2*i]&(1<<sel_seuil_2))>0)
          (seuil_2->imageData)[i]=255;
        else
          (seuil_2->imageData)[i]=0;
      else
        if (((char)resultat_test.test[2*i+1]&(1<<(sel_seuil_2-8)))>0)
          (seuil_2->imageData)[i]=255;
        else
          (seuil_2->imageData)[i]=0;
    }

    cvNamedWindow("Seuil 1", CV_WINDOW_AUTOSIZE);
    cvShowImage("Seuil 1", seuil_1);
    cvNamedWindow("Seuil 2", CV_WINDOW_AUTOSIZE);
    cvShowImage("Seuil 2", seuil_2);

    cvReleaseImage(&seuil_1);
    cvReleaseImage(&seuil_2);
    

    cvWaitKey(0);

    free(resultat_test.test);
    cvReleaseImage(&src);
  }else
    if(src==NULL){
      printf("Erreur de chargement\n");
      return 1;
    }


  return 0;
}
