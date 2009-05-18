/* Programme de test pour l'algo de la carte camera version carte ARMadeus */

#include <stdio.h>
#include <stdlib.h>
#include "algo_camera.h"
#include <sys/time.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>


#define IS_ARMADEUS 1

//OV7620 I2C constants
#define OV7620_DFL_GAIN       0x00
#define OV7620_DFL_SAT        0xc0
#define OV7620_DFL_BRIGHT     0x60
#define DFL_AUTO_GAIN            1
#define DFL_AUTO_EXP             1



int configure_algorithm(information * resultat_test){
  int i;

  // *Mets des valeurs dans les seuils*
  for (i=0;i<NB_SEUILS;i++){
    resultat_test->seuils[i].actif=0;
    resultat_test->seuils[i].utilise_zones=0;
  }
  // pour le vert
  resultat_test->seuils[0].actif=1;
  resultat_test->seuils[0].mode=SEUIL_YSHS;
  resultat_test->seuils[0].H=50;
  resultat_test->seuils[0].Y=56;
  resultat_test->seuils[0].or_avec=-1;
  resultat_test->seuils[0].and_avec=-1;
  resultat_test->seuils[0].utilise_zones=0;

  resultat_test->seuils[1].actif=1;
  resultat_test->seuils[1].mode=SEUIL_YIHI;
  resultat_test->seuils[1].H=120;
  resultat_test->seuils[1].Y=200;
  resultat_test->seuils[1].or_avec=-1;
  resultat_test->seuils[1].and_avec=0;
  resultat_test->seuils[1].utilise_zones=1;

  // pour le rouge
  resultat_test->seuils[2].actif=1;
  resultat_test->seuils[2].mode=SEUIL_YIHI;
  resultat_test->seuils[2].H=21;
  resultat_test->seuils[2].Y=200;
  resultat_test->seuils[2].or_avec=-1;
  resultat_test->seuils[2].and_avec=-1;
  resultat_test->seuils[2].utilise_zones=0;

  resultat_test->seuils[3].actif=1;
  resultat_test->seuils[3].mode=SEUIL_YIHS;
  resultat_test->seuils[3].H=235;
  resultat_test->seuils[3].Y=200;
  resultat_test->seuils[3].or_avec=2;
  resultat_test->seuils[3].and_avec=-1;
  resultat_test->seuils[3].utilise_zones=0;

  resultat_test->seuils[4].actif=1;
  resultat_test->seuils[4].mode=SEUIL_YSHS;
  resultat_test->seuils[4].H=0;
  resultat_test->seuils[4].Y=10;
  resultat_test->seuils[4].or_avec=-1;
  resultat_test->seuils[4].and_avec=3;
  resultat_test->seuils[4].utilise_zones=1;

  // * Zones *
  // Taille des zones
  resultat_test->z_larg_min=0;
  resultat_test->z_long_min=0;
  resultat_test->z_larg_max=1000;
  resultat_test->z_long_max=1000;

  // Position des zones
  resultat_test->z_x_min=0;
  resultat_test->z_y_min=0;
  resultat_test->z_x_max=1000;
  resultat_test->z_y_max=1000;

  return 1;
}

int stategy_action(information * output_algo){
  printf("De toute facon ca marchera jamais!!\n");
  return 0;
}


int init_camera_i2c();

int catch_frame(uint8_t * frame);

void print_time(const char *msg);

int main(int argc, char** argv){
  uint8_t * image;
  information resultat_test;

  // Initialisation i2c
  if (init_camera_i2c()==0){
    printf("Impossible d'initialiser la camera par I2C\n");
    return 1;
  }

  // Preparation du buffer de reception
  image=(uint8_t *)malloc(IMAGE_SIZE*3*sizeof(uint8_t));
  if (image==NULL){
    printf("Erreur lors de la création de la zone memoire pour l'image\n");
    return 1;
  }

  // Recuperation d'une image
  if (catch_frame(image)){
    printf("Erreur lors de la reception d'une image\n");
    return 1;
  }

  // Configuration 
  if (configure_algorithm(&resultat_test)==0){
    printf("Erreur de configuration de l'algorithme\n");
    return 1;
  }

  // Lancement de l'algo
  int out;
#if _DEBUG
  print_time("process_image START");
#endif
  out=process_image( image, &resultat_test);
#if _DEBUG
  print_time("process_image END");
#endif

#if VERBOSE_MODE==5
  printf("La fonction de traitement à retourné: %d \n",out);
#endif
  if (out!=1){
    printf("Erreur lors du traitement de l'image\n");
    free(image);
    return 1;
  }

  // Execute la stategie
  if (stategy_action(&resultat_test)==0){
    printf("Application de la stratégie\n");
    return 1;
  }

#if _DEBUG
  free(resultat_test.test);
#endif
  free(image);
  return 0;
}

void print_time(const char *msg)
{
  static struct timeval tp;
  gettimeofday(&tp, NULL);
  fprintf(stderr, "%ld.%06ld  %s\n", tp.tv_sec, tp.tv_usec, msg);
}


struct ovcamchip_regvals {
  unsigned char reg;
  unsigned char val;
};


int init_camera_i2c(){
  // initialize OV7620
  int i;

  // sequence de message à envoyer
  struct ovcamchip_regvals i2c_regvals[]= {
    { 0x12, 0x80 }, /* reset */
    { 0x00, OV7620_DFL_GAIN },
    { 0x01, 0x80 },
    { 0x02, 0x80 },
    { 0x03, OV7620_DFL_SAT },
    { 0x06, OV7620_DFL_BRIGHT },
    { 0x07, 0x00 },
    { 0x0c, 0x24 },
    { 0x0c, 0x24 },
    { 0x0d, 0x24 },
    { 0x11, 0x01 },
    { 0x12, 0x24 },
    { 0x13, DFL_AUTO_GAIN?0x01:0x00 },
    { 0x14, 0x84 },
    { 0x15, 0x01 },
    { 0x16, 0x03 },
    { 0x17, 0x2f },
    { 0x18, 0xcf },
    { 0x19, 0x06 },
    { 0x1a, 0xf5 },
    { 0x1b, 0x00 },
    { 0x20, 0x18 },
    { 0x21, 0x80 },
    { 0x22, 0x80 },
    { 0x23, 0x00 },
    { 0x26, 0xa2 },
    { 0x27, 0xea },
    { 0x28, 0x20 },
    { 0x29, DFL_AUTO_EXP?0x00:0x80 },
    { 0x2a, 0x10 },
    { 0x2b, 0x00 },
    { 0x2c, 0x88 },
    { 0x2d, 0x91 },
    { 0x2e, 0x80 },
    { 0x2f, 0x44 },
    { 0x60, 0x27 },
    { 0x61, 0x02 },
    { 0x62, 0x5f },
    { 0x63, 0xd5 },
    { 0x64, 0x57 },
    { 0x65, 0x83 },
    { 0x66, 0x55 },
    { 0x67, 0x92 },
    { 0x68, 0xcf },
    { 0x69, 0x76 },
    { 0x6a, 0x22 },
    { 0x6b, 0x00 },
    { 0x6c, 0x02 },
    { 0x6d, 0x44 },
    { 0x6e, 0x80 },
    { 0x6f, 0x1d },
    { 0x70, 0x8b },
    { 0x71, 0x00 },
    { 0x72, 0x14 },
    { 0x73, 0x54 },
    { 0x74, 0x00 },
    { 0x75, 0x8e },
    { 0x76, 0x00 },
    { 0x77, 0xff },
    { 0x78, 0x80 },
    { 0x79, 0x80 },
    { 0x7a, 0x80 },
    { 0x7b, 0xe2 },
    { 0x7c, 0x00 },
    { 0xff, 0xff },	/* END MARKER */
  };

  // on ouvre le lien vers l'I2C
  FILE * fd;
  fd=fopen("/dev/i2c-0","w");
  if (fd==NULL){
    printf("Impossible d'ouvrir le fichier I2C\n");
    return 0;
  }

  // on écrit sur l'I2C
  for (i=0;i<sizeof(i2c_regvals);i++){
    struct i2c_msg msg={0x60, 0, sizeof(i2c_regvals[i]), (uint8_t *)&i2c_regvals[i]};
    struct i2c_rdwr_ioctl_data rdwr={ &msg,1 };

    if (ioctl((int)fd, I2C_RDWR, &rdwr)<0){
      printf("Impossible d'ecrire 0x%02X à la ref 0x%02X sur l'I2C\n", i2c_regvals[i].val, i2c_regvals[i].reg);
      return 0;
    }
  }
  return 1;
}

// Fonction to catch a frame from camera
int catch_frame(uint8_t * frame){
  int i;
  FILE * pFile;
  pFile=fopen("image.modif","r");
  if (pFile==NULL)
  {
    printf("Impossible d'ouvrir le fichier");
    return 0;
  }

  for (i=0; i<IMAGE_SIZE*3;i++){
    frame[i]=(uint8_t)getc (pFile);
  }
  fclose(pFile);
  return 1;
}

