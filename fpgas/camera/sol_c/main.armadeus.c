/* Programme de test pour l'algo de la carte camera version carte ARMadeus */

#include <stdio.h>
#include <stdlib.h>
#include "algo_camera.h"
#include <sys/time.h>

void print_time(const char *msg)
{
  static struct timeval tp;
  gettimeofday(&tp, NULL);
  fprintf(stderr, "%ld.%06ld  %s\n", tp.tv_sec, tp.tv_usec, msg);
}



#define IS_ARMADEUS 1

int main(int argc, char** argv){
  int i;
  uint8_t * image;

  information resultat_test;

  resultat_test.largueur=332;
  resultat_test.hauteur=246;

  FILE * pFile;
  pFile=fopen("image.modif","r");
  if (pFile==NULL)
  {
    printf("Impossible d'ouvrir le fichier");
    return 1;
  }

  printf("Verbose mode: %d\n", VERBOSE_MODE);

  image=(uint8_t *)malloc(resultat_test.largueur*resultat_test.hauteur*3*sizeof(uint8_t));
  if (image==NULL){
    printf("Erreur de malloc\n");
    return 1;
  }

  for (i=0; i<resultat_test.largueur*resultat_test.hauteur*3;i++){
    image[i]=(uint8_t)getc (pFile);
  }
  fclose(pFile);


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



  printf("Lunch algo\n");
  fflush(stdout);
  int out;
  print_time("process_image START");
  for (i=0;i<100;i++) {
    out=process_image( image, &resultat_test);
  }
  print_time("process_image END");

  printf("Stop algo\n");
  fflush(stdout);
  printf("La fonction de traitement à retourné: %d \n",out);
  if (out!=1){
    free(image);
    return 1;
  }
  free(resultat_test.test);
  free(image);
  return 0;
}

