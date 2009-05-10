/* Date: 03/04/2009
 * Auteur: Rémy Blanchard
 *
 * Description:
 * Ce fichier contient l'algorithme de détection des objets pour la carte caméra Rob'otter 2009 
 *
 * Notes:
 * On peut passer la definition de Y en utilisant les vrais coeffs plutôt que la somme
 *
 * Ameliorations:
 * Passer H vers [0,360[
 * Utilisation de l'équivalent de bloc RAM du FPGA (par des pointeurs) augmenterai significativement la vitesse du bloc segmentation
 *
 * */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "algo_camera.h"

#if NB_SEUILS>16
#error "Le nombre maximum de seuils est de 16 (stockage dans un uint16_t)"
#endif

#if MOYENNE_DIM%2==0
#if MOYENNE_DIM!=0
#error "Le carre pour la moyenne doit etre de dimension impaire"
#endif
#endif

#if EROSION_DIM%2==0
#error "Le carre pour l'erosion doit etre de dimension impaire"
#endif

#if NB_SEUILS>255
#error "Le nombre maximum de zones est de 256 (stockage dans un uint8_t)"
#endif



/*
 *
 * Declaration des fonctions internes
 *
 */
// Recupere la luminance du pixel de l'image
inline uint8_t get_pixel_Y(uint8_t * image, uint32_t pos);
// Recupere la chrominance du pixel de l'image
inline uint8_t get_pixel_H(uint8_t * image, uint32_t pos);

/*
 *
 * Definition des fonctions externes
 *
 */


int process_image(uint8_t * image, information * es_info){
  // ** Declarations **
  // on suppose que le processeur a une MMU => utilisation de malloc
  int16_t i,j;
  int16_t k,l;
  int16_t x,y;
  uint32_t pos;


#if VERBOSE_MODE>=5  
  printf("** Recuperation de H et Y **\n");
  fflush(stdout);
#endif
#if VERBOSE_MODE==6  
  printf("    -> Allocation mémoire\n");
  fflush(stdout);
#endif
  // ** Recuperation de H et Y **
  uint8_t* img_HY=(uint8_t *)malloc(IMAGE_SIZE*2*sizeof(uint8_t));
  if (img_HY==NULL) return 0;
#if VERBOSE_MODE==6  
  printf("    -> Parcourt de l'image\n");
  fflush(stdout);
#endif

  // Conversion H/Y
  for( pos=0; pos<IMAGE_SIZE; pos++ ) {
    img_HY[pos*2]   = get_pixel_Y(image, pos);
    img_HY[pos*2+1] = get_pixel_H(image, pos);
  }

#if VERBOSE_MODE>=5  
  printf("** Moyennage de l'image **\n");
  fflush(stdout);
#endif
#if VERBOSE_MODE==6  
  printf("    -> Allocation mémoire\n");
  fflush(stdout);
#endif
// ** Moyennage de l'image **
uint8_t* img_moyenne;
#if MOYENNE_DIM==0
  img_moyenne=img_HY;
#else
  // Mise en place de l'image des seuils
  img_moyenne=(uint8_t *)malloc(IMAGE_SIZE*2*sizeof(uint8_t));
  if (img_moyenne==NULL) {free(img_HY); return 0;}

#if VERBOSE_MODE==6  
  printf("    -> Parcourt de l'image\n");
  fflush(stdout);
#endif

  float sum_Y;
  // variables pour le calcul de la mediane de H
  float mean_H, dist_H, min_dist_H, med_H=0.0f;
  // on parcourt l'image
  for (i=0; i<IMAGE_HEIGHT;i++){
    for (j=0; j<IMAGE_WIDTH;j++){
      sum_Y=0.0;
      mean_H=0.0;
      for (x=-(MOYENNE_DIM-1)/2; x<=(MOYENNE_DIM-1)/2;x++){
        for (y=-(MOYENNE_DIM-1)/2; y<=(MOYENNE_DIM-1)/2;y++){
#if BORDURE_MODE==BORDURE_NONE
          sum_Y+=(float)img_HY[((i+y)*IMAGE_WIDTH+j+x)*2];
          mean_H+=(float)img_HY[((i+y)*IMAGE_WIDTH+j+x)*2+1];
#endif
#if BORDURE_MODE!=BORDURE_NONE
          k=i+y;
          l=j+x;
#if BORDURE_MODE==BORDURE_CONTINU
          if (k<0) k=0;
          if (l<0) l=0;
#endif
#if BORDURE_MODE==BORDURE_REVERSE
          k=abs(k);
          l=abs(l);
#endif
          sum_Y+=(float)img_HY[(k*IMAGE_WIDTH+l)*2];
          mean_H+=(float)img_HY[(k*IMAGE_WIDTH+l)*2+1];
#endif
        }
      }

      // Faire une seconde passe pour H, normalement on devrait prendre la
      // mediane là on va prendre la valeur la plus proche de la moyenne (pour
      // ne pas avoir à faire un tri - trop lent)
      mean_H/=(float)(MOYENNE_DIM*MOYENNE_DIM);
      min_dist_H=512.0f;
      for (x=-(MOYENNE_DIM-1)/2; x<=(MOYENNE_DIM-1)/2;x++){
        for (y=-(MOYENNE_DIM-1)/2; y<=(MOYENNE_DIM-1)/2;y++){
#if BORDURE_MODE==BORDURE_NONE
          dist_H=fabs(mean_H-(float)img_HY[((i+y)*IMAGE_WIDTH+j+x)*2+1]);
          if (dist_H<min_dist_H){
            min_dist_H=dist_H;
            med_H=(float)img_HY[((i+y)*IMAGE_WIDTH+j+x)*2+1];
          }
#else
          k=i+y;
          l=j+x;
#if BORDURE_MODE==BORDURE_CONTINU
          if (k<0) k=0;
          if (l<0) l=0;
#endif
#if BORDURE_MODE==BORDURE_REVERSE
          k=abs(k);
          l=abs(l);
#endif
          dist_H=fabs(mean_H-(float)img_HY[(k*IMAGE_WIDTH+l)*2+1]);
          if (dist_H<min_dist_H){
            min_dist_H=dist_H;
            med_H=(float)img_HY[(k*IMAGE_WIDTH+l)*2+1];
          }
#endif
        }
      }

      img_moyenne[(i*IMAGE_WIDTH+j)*2]=(uint8_t)(sum_Y/(float)(MOYENNE_DIM*MOYENNE_DIM));
      img_moyenne[(i*IMAGE_WIDTH+j)*2+1]=med_H;

    }
  }
  free(img_HY);

#endif


#if VERBOSE_MODE>=5  
  printf("** Seuille l'images selon les paramètres **\n");
  fflush(stdout);
#endif
#if VERBOSE_MODE==6  
  printf("    -> Allocation mémoire\n");
  fflush(stdout);
#endif 

  // ** Seuille l'images selon les paramètres **
  // Mise en place de l'image des seuils
  uint16_t* img_seuils=(uint16_t *)malloc(IMAGE_SIZE*sizeof(uint16_t));
  if (img_seuils==NULL) {free(img_moyenne); return 0;}

#if VERBOSE_MODE==6  
  printf("    -> Parcourt de l'image\n");
  fflush(stdout);
#endif
  // on parcourt et applique les seuils, s'ils sont actifs
  for( pos=0; pos<IMAGE_SIZE; pos++ ) {
    uint16_t y = img_moyenne[pos*2];
    uint16_t h = img_moyenne[pos*2+1];
    unsigned int bits_seuil = 0;
    for( k=0; k<NB_SEUILS; k++ ) {
      seuil *s = &es_info->seuils[k];
      if( s->actif != 1 )
        continue;
      char out_seuil;
      switch( s->mode ) {
        case SEUIL_YIHI: out_seuil = (y <= s->Y) && (h <= s->H); break;
        case SEUIL_YSHS: out_seuil = (y >= s->Y) && (h >= s->H); break;
        case SEUIL_YIHS: out_seuil = (y <= s->Y) && (h >= s->H); break;
        case SEUIL_YSHI: out_seuil = (y >= s->Y) && (h <= s->H); break;
        default: out_seuil = 0; break;
      }
      // application des fonctions AND et OR
      // on suppose qu'on n'utilise pas de bits pas encore calculés
      if( s->or_avec >= 0 )
        out_seuil = out_seuil || ((bits_seuil & (1<<(s->or_avec))) != 0);
      else if( s->and_avec >= 0 )
        out_seuil = out_seuil && ((bits_seuil & (1<<(s->and_avec))) != 0);

      if( out_seuil )
        bits_seuil |= (1<<k);
    }
    img_seuils[pos] = bits_seuil;
  }
  free(img_moyenne);

#if VERBOSE_MODE>=5 
  printf("** Erosion de l'image **\n");
  fflush(stdout);
#endif
#if VERBOSE_MODE==6  
  printf("    -> Allocation mémoire\n");
  fflush(stdout);
#endif

  // ** Erosion de l'image **
  uint16_t* img_erode=(uint16_t *)malloc(IMAGE_SIZE*sizeof(uint16_t));
  if (img_erode==NULL) {free(img_seuils); return 0;}

#if VERBOSE_MODE==6  
  printf("    -> Parcourt de l'image\n");
  fflush(stdout);
#endif
  // on parcourt l'image
  for (i=0; i<IMAGE_HEIGHT;i++){
    for (j=0; j<IMAGE_WIDTH;j++){
      uint16_t erode = 0xffff;
      for( x=-(EROSION_DIM-1)/2; erode!=0 && x<=(EROSION_DIM-1)/2; x++ ) {
        for( y=-(EROSION_DIM-1)/2; erode!=0 && y<=(EROSION_DIM-1)/2; y++ ) {
          k=i+y;
          l=j+x;
#if BORDURE_MODE==BORDURE_NONE
          if( k < 0 || l < 0 )
            continue;
#else
#if BORDURE_MODE==BORDURE_CONTINU
          if (k<0) k=0;
          if (l<0) l=0;
#else
#if BORDURE_MODE==BORDURE_REVERSE
          k=abs(k);
          l=abs(l);
#endif
#endif
#endif
          erode &= img_seuils[k*IMAGE_WIDTH+l];
        }
      }
      img_erode[i*IMAGE_WIDTH+j] = erode;
    }
  }
  free(img_seuils);
#if _DEBUG
  es_info->test=(uint8_t*)img_erode;
  return 1;
#endif

  // ** Reconnaissance de zones **

  l=0;
  l++;

  // Algorithme inspiré du travail de Mehdi Darouich
  //
  // Une zone est définié par le cadre qui l'entoure et le filtre qui l'a généré.
  // Le cadre est défini par le coin supérieur gauche et sa largueur et hauteur
  //
  // L'algo est le suivant:
  // - pour chaque ligne on prend les pixels connexes
  // - on regarde s'ils correspondent à des pixels de la lignes précedente
  //         ex:
  //            AAAAAAAAAAAAAAAAAAA                                               AAAAAAAA
  //                BBBBBBBBBBBBBBBBBBBB                            BBBBBBBBB
  //             les deux lignes correspondent                       les deux lignes ne correspondent pas
  //      - si les deux lignes correspondent on associe la ligne du bas à la zone au dessus
  //      - si les deux lignes ne correspondent pas on commence une nouvelle zone
  // - une fois la ligne terminée on regarde si tous les blocs de pixels de la ligne précédente ont trouvé un
  //     correspondant ceux qui n'en ont pas forment une "fin de zone"
  // - pour chaque "fin de zone", on regarde si la zone est intéressante ou non
  //
  // dans chaque zone on calcule la densité des pixels

  // intialisation des variables
  int m,n;
  int z_largueur,z_hauteur,z_active_pix;

  l=-1;
  // on parcourt l'image
  for( i=0; i<IMAGE_HEIGHT; i++ ) {
    for( j=0; j<IMAGE_WIDTH; j++ ) {
      // pour chaque seuil actif
      for (k=0;k<NB_SEUILS;k++){
        seuil *s = &es_info->seuils[k];
        if( s->utilise_zones != 1 )
          continue;
        // si on tombe sur un pixel actif
        if( (img_erode[i*IMAGE_WIDTH+j]&(1<<k)) != 0 ) {
          // on commence une nouvelle zone
          l++;
          es_info->zones[l].x=j;
          es_info->zones[l].y=j;
          img_erode[i*IMAGE_WIDTH+j]=img_erode[i*IMAGE_WIDTH+j]&(~(1<<k));
          z_active_pix=1;
          z_largueur++;
          es_info->zones[l].largueur=1;
          es_info->zones[l].hauteur=1;
          m=i;
          n=j;
          n++;
          // on détermine la largeur
          // on efface la ligne en cour.
          while(((img_erode[m*IMAGE_WIDTH+n]&(1<<k))!= 0)&&(n<IMAGE_WIDTH)){
            z_largueur++;
            img_erode[m*IMAGE_WIDTH+n]=img_erode[m*IMAGE_WIDTH+n]&(~(1<<k));
            z_active_pix++;
            n++;
          }
          // on determine les limites des pixels en dessous
        }

        es_info->zones[l].largueur = z_largueur;
        es_info->zones[l].hauteur  = z_hauteur;
        es_info->zones[l].densite  = (float)z_active_pix/(float)(z_largueur*z_hauteur);
      }
    }
  }

  return 1;
}


/*
 *
 * Definition des fonctions internes
 *
 */
/*
 * Recupere la luminance du pixel de l'image
 */
inline uint8_t get_pixel_Y(uint8_t * image, uint32_t pos){
#if IMAGE_MODE_COLORSP==IMGMODE_RGB
  // pour le mode RGB application de la transformation.

  float sum;
#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  sum=0.299f*(float)image[pos*IMG_ALPHA]+0.587f*(float)image[pos*IMG_ALPHA+1]+0.114f*(float)image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  sum=0.299f*(float)image[pos]+0.587f*(float)image[IMAGE_SIZE+pos]+0.114f*(float)image[IMAGE_SIZE*2+pos];
#endif /* IMAGE_MODE_STORE==MODE_RFGFBF */
  return (uint8_t)sum;

#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */


#if IMAGE_MODE_COLORSP==IMGMODE_YUV
  // pour le mode YUV application de la transformation.
#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  return image[pos*IMG_ALPHA];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */

}

/*
 * Recupere la chrominance du pixel de l'image
 */
inline uint8_t get_pixel_H(uint8_t * image, uint32_t pos){
#if IMAGE_MODE_COLORSP==IMGMODE_YUV
  // En mode YUV on commence par passer en RGB
#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  float Y = image[pos*IMG_ALPHA];
  float U = image[pos*IMG_ALPHA+1];
  float V = image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  float Y = image[pos];
  float U = image[pos+IMAGE_SIZE];
  float V = image[pos+IMAGE_SIZE*2];
#endif /* IMAGE_MODE_STORE==MODE_RFGFBF */
  /* TODO: trouver s'il faut normaliser */
  // TODO: modifier les coefficients pour être tout de suite sur [0;256[ au
  // lieu de passer par [0;360[
  float R,G,B;
  R=Y+1.14f*V;
  G=Y-0.395f*U-0.581f*V;
  B=Y+2.032f*U;

  float H;
  if( max == min )
    H = 0.0f;
  else {
    float f = 60.0f / (max-min);
    if( max == R )
      H = f * (G-B);
    else if( max == G )
      H = f * (B-R) + 120.0f;
    else if( max == B )
      H = f * (R-G) + 240.0f;
    else
      H = 0.0f;
  }

  return (uint8_t)(H*256.0f/360.0f);

#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */


#if IMAGE_MODE_COLORSP==IMGMODE_RGB
  // pour le mode RGB application de la transformation.

#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  uint8_t R = image[pos*IMG_ALPHA];
  uint8_t G = image[pos*IMG_ALPHA+1];
  uint8_t B = image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  uint8_t R = image[pos];
  uint8_t G = image[pos+IMAGE_SIZE];
  uint8_t B = image[pos+IMAGE_SIZE*2];
#endif /* IMAGE_MODE_STORE==MODE_RFGFBF */

  int min, max;
  max=(R>G)?R:G;
  max=(max>B)?max:B;
  min=(R>G)?G:R;
  min=(min>B)?B:min;

  if( max == min )
    return 0;
  else {
    // Optimisations pour calculs en entiers
    if( max == R )
      return 256 * (G-B) / (6*(max-min));
    else if( max == G )
      return 256 * (B-R) / (6*(max-min)) + 256/3;
    else if( max == B )
      return 256 * (R-G) / (6*(max-min)) + 256*2/3;
    else
      return 0;
  }

#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */

}



