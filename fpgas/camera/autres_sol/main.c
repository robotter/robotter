/* Programme de test pour l'algo de la carte camera */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <opencv/highgui.h>
#include <opencv/cv.h>
#include "algo_camera.h"

int main(int argc, char** argv){
  int i; // parce que l'on a toujours besoin d'un i

  IplImage* src;
  information resultat_test;
  if( (argc == 2) && ((src=cvLoadImage(argv[1], 1))!= 0))
  {
    printf("Chargement: %s\n",argv[1]);fflush(stdout);

    resultat_test.largueur=src->width;
    resultat_test.hauteur=src->height;
    printf("Dimensions: Largueur=%d, Hauteur=%d\n",resultat_test.largueur,resultat_test.hauteur);fflush(stdout);
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

    //Attention à l'alignement des colonnes

    fflush(stdout);

    int out=process_image( (uint8_t *)src->imageData, &resultat_test);
    printf("La fonction de traitement à retourné: %d ",out);
    if (out!=1){
      cvReleaseImage(&src);
      return 1;
    }

    cvNamedWindow("Image d'origine", CV_WINDOW_AUTOSIZE);
    cvShowImage("Image d'origine", src);

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

    cvWaitKey(0);

    free(resultat_test.test);
    cvReleaseImage(&dst_H);
    cvReleaseImage(&dst_Y);
    cvReleaseImage(&src);
  }
  return 0;
}
