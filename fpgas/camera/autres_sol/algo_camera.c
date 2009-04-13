/* Date: 03/04/2009
 * Auteur: Rémy Blanchard
 *
 * Description:
 * Ce fichier contient l'algorithme de détection des objets pour la carte caméra Rob'otter 2009 
 *
 * Notes:
 * On peut passer la definition de Y en utilisant les vrais coeffs plutôt que la somme
 *
 * */

#include <stdio.h>
#include <stdlib.h>
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
  uint16_t i,j;

  // ** Recuperation de H et Y **
  uint8_t* img_HY=(uint8_t *)malloc(es_info->hauteur*es_info->largueur*2*sizeof(uint8_t));
  if (img_HY==NULL) return 0;

  for (i=0; i<es_info->hauteur;i++){
    for (j=0; j<es_info->largueur;j++){
      img_HY[(i*es_info->largueur+j)*2]=get_pixel_Y(image,i,j,es_info->hauteur,es_info->largueur);
      img_HY[(i*es_info->largueur+j)*2+1]=get_pixel_H(image,i,j,es_info->hauteur,es_info->largueur);
    }
  }
  #if _DEBUG
    es_info->test=img_HY;
    return 1;
  #endif

  // ** Moyennage de l'image **
  // Mise en place de l'image des seuils
  uint8_t* img_moyenne=(uint8_t *)malloc(es_info->hauteur*es_info->largueur*2*sizeof(uint8_t));
  if (img_moyenne==NULL) {free(img_HY); return 0;}

  // on parcourt l'image
  for (i=0; i<es_info->hauteur;i++){
    for (j=0; j<es_info->largueur;j++){
      // ici on stocke l'image en IMGMODE_RPGPBP pour la suite du travail
      //img_moyenne[]=get_pixel_R
    }
  }
  free(img_HY);


  // ** Seuille l'images selon les paramètres **
  // Mise en place de l'image des seuils
  uint16_t* img_seuils=(uint16_t *)malloc(es_info->hauteur*es_info->largueur*sizeof(uint16_t));
  if (img_seuils==NULL) {free(img_moyenne); return 0;}

  // on parcourt et applique les seuils
  for (i=0; i<NB_SEUILS ;i++){



  }
  free(img_moyenne);

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
  uint16_t pos=no_ligne*largueur+no_colonne;
#if IMAGE_MODE_COLORSP==IMGMODE_RGB
  // pour le mode RGB application de la transformation.

  double sum;
#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  sum=0.299f*(double)image[pos*IMG_ALPHA]+0.587f*(double)image[pos*IMG_ALPHA+1]+0.114f*(double)image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  uint16_t dim_img=largueur*hauteur;
  sum=0.299f*(double)image[pos]+0.587f*(double)image[dim_img+pos]+0.114f*(double)image[dim_img*2+pos];
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
  uint16_t pos=no_ligne*largueur+no_colonne;
#if IMAGE_MODE_COLORSP==IMGMODE_YUV
  // En mode YUV on commence par passer en RGB
 #if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  double Y=(double)image[pos*IMG_ALPHA];
  double U=(double)image[pos*IMG_ALPHA+1];
  double V=(double)image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  uint16_t dim_img=largueur*hauteur;
  double Y=(double)image[pos];
  double U=(double)image[pos+dim_img];
  double V=(double)image[pos+dim_img*2];
#endif /* IMAGE_MODE_STORE==MODE_RFGFBF */
  /* TODO: trouver s'il faut normaliser */
  double R,G,B;
  R=Y+1.14f*V;
  G=Y-0.395f*U-0.581f*V;
  B=Y+2.032f*U;

#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */


#if IMAGE_MODE_COLORSP==IMGMODE_RGB
  // pour le mode RGB application de la transformation.

#if IMAGE_MODE_STORE==IMGMODE_RPGPBP 
  //mode RGB regroupés
  double R=(double)image[pos*IMG_ALPHA];
  double G=(double)image[pos*IMG_ALPHA+1];
  double B=(double)image[pos*IMG_ALPHA+2];
#endif /* IMAGE_MODE_STORE==MODE_RPGPBP */

#if IMAGE_MODE_STORE==IMGMODE_RFGFBF
  //mode RGB divisé en 3
  uint16_t dim_img=largueur*hauteur;
  double R=(double)image[pos];
  double G=(double)image[pos+dim_img];
  double B=(double)image[pos+dim_img*2];

#endif /* IMAGE_MODE_STORE==MODE_RFGFBF */
#endif /* IMAGE_MODE_COLORSP==IMGMODE_RGB */

  double H, min, max;
  
  // détermanation du max
  max=(R>G)?R:G;
  max=(max>B)?max:B;

  // détermination du min
  min=(R>G)?G:R;
  min=(min>B)?B:min;

/*
  if (min==max) H=0.0f; else
  if ((max==R)&&(G>B))  H=0.0; else
  if (max==R)  H=0.0f; else
  if (max==G)  H=0.0f; else
  if (max==B)  H=0.0f; else
  H=0.0f;
*/

  if (min==max) H=0.0f; else
  if ((max==R)&&(G>B))  H=60*(G-B)/(max-min); else
  if (max==R)  H=(60.0f*(G-B)/(max-min))+360.0f; else
  if (max==G)  H=(60.0f*(B-R)/(max-min))+120.0f; else
  if (max==B)  H=(60.0f*(R-G)/(max-min))+240.0f; else
  H=0.0f;

  return (uint8_t)(H*256.0f/360.0f);

}



