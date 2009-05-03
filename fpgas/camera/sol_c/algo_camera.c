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
#error "Le carre pour la moyenne doit etre de dimension impaire"
#endif

#if MOYENNE_DIM%2==0
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
uint8_t get_pixel_Y(uint8_t * image,uint16_t no_ligne, uint16_t no_colonne, uint16_t hauteur,uint16_t largueur);
// Recupere la chrominance du pixel de l'image
uint8_t get_pixel_H(uint8_t * image,uint16_t no_ligne, uint16_t no_colonne, uint16_t hauteur,uint16_t largueur);

/*
 *
 * Definition des fonctions externes
 *
 */


int process_image(uint8_t * image, information * es_info){
  // ** Declarations **
  // on suppose que le processeur a une MMU => utilisation de malloc
  uint16_t i,j,k,l;
  int16_t x,y;

  // ** Recuperation de H et Y **
  uint8_t* img_HY=(uint8_t *)malloc(es_info->hauteur*es_info->largueur*2*sizeof(uint8_t));
  if (img_HY==NULL) return 0;

  for (i=0; i<es_info->hauteur;i++){
    for (j=0; j<es_info->largueur;j++){
      img_HY[(i*es_info->largueur+j)*2]=get_pixel_Y(image,i,j,es_info->hauteur,es_info->largueur);
      img_HY[(i*es_info->largueur+j)*2+1]=get_pixel_H(image,i,j,es_info->hauteur,es_info->largueur);
    }
  }
  // ** Moyennage de l'image **
  // Mise en place de l'image des seuils
  uint8_t* img_moyenne=(uint8_t *)malloc(es_info->hauteur*es_info->largueur*2*sizeof(uint8_t));
  if (img_moyenne==NULL) {free(img_HY); return 0;}

  float sum_Y;
  // variables pour le calcul de la mediane de H
  float mean_H, dist_H, min_dist_H, med_H=0.0f;
  // on parcourt l'image
  for (i=0; i<es_info->hauteur;i++){
    for (j=0; j<es_info->largueur;j++){
      sum_Y=0.0;
      mean_H=0.0;
      for (x=-(MOYENNE_DIM-1)/2; x<=(MOYENNE_DIM-1)/2;x++){
        for (y=-(MOYENNE_DIM-1)/2; y<=(MOYENNE_DIM-1)/2;y++){
#if BORDURE_MODE==BORDURE_NONE
          sum_Y+=(float)img_HY[((i+y)*es_info->largueur+j+x)*2];
          mean_H+=(float)img_HY[((i+y)*es_info->largueur+j+x)*2+1];
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
          sum_Y+=(float)img_HY[(k*es_info->largueur+l)*2];
          mean_H+=(float)img_HY[(k*es_info->largueur+l)*2+1];
#endif
        }
      }

      // Faire une seconde passe pour H, normalement on devrait prendre la mediane là on va prendre la valeur la plus proche de la moyenne (pour ne pas avoir à faire un tri - trop lent)
      mean_H/=(float)(MOYENNE_DIM*MOYENNE_DIM);
      min_dist_H=512.0f;
      for (x=-(MOYENNE_DIM-1)/2; x<=(MOYENNE_DIM-1)/2;x++){
        for (y=-(MOYENNE_DIM-1)/2; y<=(MOYENNE_DIM-1)/2;y++){
#if BORDURE_MODE==BORDURE_NONE
          dist_H=fabs(mean_H-(float)img_HY[((i+y)*es_info->largueur+j+x)*2+1]);
          if (dist_H<min_dist_H){
            min_dist_H=dist_H;
            med_H=(float)img_HY[((i+y)*es_info->largueur+j+x)*2+1];
          }
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
          dist_H=fabs(mean_H-(float)img_HY[(k*es_info->largueur+l)*2+1]);
          if (dist_H<min_dist_H){
            min_dist_H=dist_H;
            med_H=(float)img_HY[(k*es_info->largueur+l)*2+1];
          }
#endif
        }
      }

      img_moyenne[(i*es_info->largueur+j)*2]=(uint8_t)(sum_Y/(float)(MOYENNE_DIM*MOYENNE_DIM));
      img_moyenne[(i*es_info->largueur+j)*2+1]=med_H;

    }
  }
  free(img_HY);

  // ** Seuille l'images selon les paramètres **
  // Mise en place de l'image des seuils
  uint16_t* img_seuils=(uint16_t *)malloc(es_info->hauteur*es_info->largueur*sizeof(uint16_t));
  if (img_seuils==NULL) {free(img_moyenne); return 0;}

  int out_seuil=0;
  // on parcourt et applique les seuils, s'ils sont actifs
  for (k=0; k<NB_SEUILS ;k++){
    if (es_info->seuils[k].actif==1){
      for (i=0; i<es_info->hauteur;i++){
        for (j=0; j<es_info->largueur;j++){
          switch(es_info->seuils[k].mode){
            case SEUIL_YIHI:
              out_seuil=(img_moyenne[(i*es_info->largueur+j)*2]<=es_info->seuils[k].Y)&(img_moyenne[(i*es_info->largueur+j)*2+1]<=es_info->seuils[k].H);
              break;
            case SEUIL_YSHS:
              out_seuil=(img_moyenne[(i*es_info->largueur+j)*2]>=es_info->seuils[k].Y)&(img_moyenne[(i*es_info->largueur+j)*2+1]>=es_info->seuils[k].H);
              break;
            case SEUIL_YIHS:
              out_seuil=(img_moyenne[(i*es_info->largueur+j)*2]<=es_info->seuils[k].Y)&(img_moyenne[(i*es_info->largueur+j)*2+1]>=es_info->seuils[k].H);
              break;
            case SEUIL_YSHI:
              out_seuil=(img_moyenne[(i*es_info->largueur+j)*2]>=es_info->seuils[k].Y)&(img_moyenne[(i*es_info->largueur+j)*2+1]<=es_info->seuils[k].H);
              break;
            default:
              out_seuil=0;
              break;
          }
          // application des fonctions AND et OR
          if (es_info->seuils[k].or_avec>=0)
            out_seuil=out_seuil||((img_seuils[i*es_info->largueur+j]&(1<<es_info->seuils[k].or_avec))>>es_info->seuils[k].or_avec);
          if (es_info->seuils[k].and_avec>=0)
            out_seuil=out_seuil&&((img_seuils[i*es_info->largueur+j]&(1<<es_info->seuils[k].and_avec))>>es_info->seuils[k].and_avec);
          img_seuils[i*es_info->largueur+j]=img_seuils[i*es_info->largueur+j]|(out_seuil<<k);
        }
      }
    }
  }
  free(img_moyenne);


  // ** Erosion de l'image **
  uint16_t* img_erode=(uint16_t *)malloc(es_info->hauteur*es_info->largueur*sizeof(uint16_t));
  if (img_erode==NULL) {free(img_seuils); return 0;}

  uint16_t erode;
  // on parcourt l'image
  for (i=0; i<es_info->hauteur;i++){
    for (j=0; j<es_info->largueur;j++){
      erode=65535;
      for (x=-(EROSION_DIM-1)/2; x<=(EROSION_DIM-1)/2;x++){
        for (y=-(EROSION_DIM-1)/2; y<=(EROSION_DIM-1)/2;y++){
#if BORDURE_MODE==BORDURE_NONE
          erode=erode&img_seuils[(i+y)*es_info->largueur+j+x];
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
          erode=erode&img_seuils[k*es_info->largueur+l];
#endif
        }
      }
      img_erode[i*es_info->largueur+j]=erode;
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
  uint8_t active_zones[NB_MAX_ZONES];
  uint8_t * last_label;
  uint8_t * new_label;

  last_label=malloc(es_info->largueur*sizeof(uint8_t));
  new_label=malloc(es_info->largueur*sizeof(uint8_t));

  for (j=0;j<=es_info->largueur;j++) last_label[j]=0;


  l=-1;
  // pour chaque seuil actif
  for (k=0;k<NB_SEUILS;k++){
    if (es_info->zone[k].utilise_zones==1){
      // on parcourt l'image
      for (i=0;i<=es_info->hauteur;i++){
        for (j=0;j<=es_info->largueur;j++){
          // si on tombe sur un pixel actif
          if ( img_erode[i*es_info->largueur+j]&(1<<k) != 0) {
            // on commence une nouvelle zone
            l++;
            es_info->seuils[l].x=j;
            es_info->seuils[l].y=j;
            // on détermine la largeur
            // on determine les limites des pixels en dessous
            // on efface la ligne en cour.









        // pour chaque pixel
          // on regarde si le pixel est actif
            // si le pixel precedent est aussi actif, il prend son label, sinon on ouvre un nouveau label
            if ((img_erode[i*es_info->largueur+j-1]&(1<<k) != 0)&&(k>0)) {
                

            }else{

            }

          }








        // si non on ouvre une nouvelle zone
          // s'il y un seuil actif
          l=0;
          if ( img_erode[i*es_info->largueur+j]&es_info->mask_z_s != 0) {
            // on fait la labélisation sur une ligne
            if (img_erode[i*es_info->largueur+j-1]==0)&&(j>0)

          }
        }
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
uint8_t get_pixel_Y(uint8_t * image, uint16_t no_ligne, uint16_t no_colonne, uint16_t hauteur,uint16_t largueur){
  uint32_t pos=no_ligne*largueur+no_colonne;
#if IMAGE_MODE_COLORSP==IMGMODE_RGB
  // pour le mode RGB application de la transformation.

  float sum;
#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  sum=0.299f*(float)image[pos*IMG_ALPHA]+0.587f*(float)image[pos*IMG_ALPHA+1]+0.114f*(float)image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  uint32_t dim_img=largueur*hauteur;
  sum=0.299f*(float)image[pos]+0.587f*(float)image[dim_img+pos]+0.114f*(float)image[dim_img*2+pos];
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
uint8_t get_pixel_H(uint8_t * image, uint16_t no_ligne, uint16_t no_colonne, uint16_t hauteur,uint16_t largueur){
  uint32_t pos=no_ligne*largueur+no_colonne;
#if IMAGE_MODE_COLORSP==IMGMODE_YUV
  // En mode YUV on commence par passer en RGB
#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  float Y=(float)image[pos*IMG_ALPHA];
  float U=(float)image[pos*IMG_ALPHA+1];
  float V=(float)image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  uint16_t dim_img=largueur*hauteur;
  float Y=(float)image[pos];
  float U=(float)image[pos+dim_img];
  float V=(float)image[pos+dim_img*2];
#endif /* IMAGE_MODE_STORE==MODE_RFGFBF */
  /* TODO: trouver s'il faut normaliser */
  float R,G,B;
  R=Y+1.14f*V;
  G=Y-0.395f*U-0.581f*V;
  B=Y+2.032f*U;

#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */


#if IMAGE_MODE_COLORSP==IMGMODE_RGB
  // pour le mode RGB application de la transformation.

#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  float R=(float)image[pos*IMG_ALPHA];
  float G=(float)image[pos*IMG_ALPHA+1];
  float B=(float)image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  uint32_t dim_img=largueur*hauteur;
  float R=(float)image[pos];
  float G=(float)image[pos+dim_img];
  float B=(float)image[pos+dim_img*2];

#endif /* IMAGE_MODE_STORE==MODE_RFGFBF */
#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */

  float H, min, max;

  // détermanation du max
  max=(R>G)?R:G;
  max=(max>B)?max:B;

  // détermination du min
  min=(R>G)?G:R;
  min=(min>B)?B:min;

  if (min==max) H=0.0f; else
    if ((max==R)&&(G>B))  H=60.0f*(G-B)/(max-min); else
      if (max==R)  H=(60.0f*(G-B)/(max-min))+360.0f; else
        if (max==G)  H=(60.0f*(B-R)/(max-min))+120.0f; else
          if (max==B)  H=(60.0f*(R-G)/(max-min))+240.0f; else
            H=0.0f;

  return (uint8_t)(H*256.0f/360.0f);

}



