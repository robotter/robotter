/* Date: 03/04/2009
 * Auteur: Rémy Blanchard
 *
 * Description:
 * Ce fichier contient la description des fonctions externes de l'algorithme de détection des objets pour la carte caméra Rob'otter 2009 
 *
 * Applicable pour une image couleur
 * */

#ifndef __ALGO_CAMERA_H__

#include <stdint.h>

// Seulement pour le programmeur
#define _DEBUG 1


// Les modes de stockages pour les pixels issus de la caméra
#define IMGMODE_RPGPBP 0 // le mode: R1G1B1R2G2B2R3G3B3...
#define IMGMODE_RFGFBF 1 // le mode: R1R2...RnG1G2...GnB1B2...Bn

#define IMAGE_MODE_STORE  MODE_RPGPBP

// Espace colorimetrique d'entree
#define IMGMODE_RGB 0
#define IMGMODE_YUV 1

#define IMAGE_MODE_COLORSP MODE_RGB

// Utilisation d'un canal alpha dans l'image d'entree
#define IMG_SANS_ALPHA 3
#define IMG_AVEC_ALPHA 4

#define IMG_ALPHA IMG_SANS_ALPHA



// Gestions des bords
#define BORDURE_NONE    0 // on s'en fou, on prend les pixels suivants en RAM
#define BORDURE_CONTINU 1 // on prend le dernier pixel dans la ligne
#define BORDURE_REVERSE 2 // on recopie l'image en l'inversant

#define BORDURE_MODE BORDURE_NONE

// Types de seuils
#define SEUIL_YIHI 0 // Valeur inferieure à Y et H
#define SEUIL_YSHS 1 // Valeur superieure à Y et H
#define SEUIL_YIHS 2 // Valeur inferieure à Y et superieure à H
#define SEUIL_YSHI 3 // Valeur superieure à Y et inferieure à H

// Nombre de seuils definis
#define NB_SEUILS 8

// Nombre maximal de zones détectables
#define NB_MAX_ZONES 16

// Taille du moyennage n*n
#define MOYENNE_DIM 3

// Taille de l'erosion
#define EROSION_DIM 3


// Definition d'un seuil
typedef struct{
  // le seuil est-il actif
  uint8_t actif;
  // mode du seuil
  uint8_t mode;
  // valeurs du seuil
  uint8_t H;
  uint8_t Y;
  // ATTENTION: LES VALEURS CI DESSOUS DOIVENT ETRE 
  // INFERIEURE AU NUMERO DU SEUIL
  // faire un OR avec le seuil (-1: aucun)
  uint8_t or_avec;
  // faire un AND avec le seuil (-1: aucun)
  uint8_t and_avec;
  
} seuil;

// Definition d'une zone
typedef struct{
 // le numero du seuil qui a detecte l'objet
 uint8_t seuil;
 // position du coin superieur gauche de la zone
 uint16_t x;
 uint16_t y;
 // dimensions de la zone
 uint16_t largeur;
 uint16_t hauteur;
 // Information de forme sur la zone: densite
 float densite;
} zone;

// information d'E/S pour la fonction de process
typedef struct
{
  // ** Entrees **
  // Dimensions de l'image (en cas d'utilisation de fenetres)
  uint16_t largueur;
  uint16_t hauteur;
  // Seuils
  seuil seuils[NB_SEUILS];
  
  // ** Sorties **
  zone zones[NB_MAX_ZONES];

  #if _DEBUG
    uint8_t * test;
  #endif
} information;

/*
 * Fonction:    process_image
 *
 * Description:  Traite l'image passee en paramètre
 *
 * Entrees:
 *      uint8_t * image: un pointeur vers l'image dans le mode decrit plus haut
 *      information * es_info: les infos d'E/S
 *
 * Sortie:
 *      information * es_info: les infos d'E/S
 *
 * Valeur de retour:
 *      0: erreur
 *      1: OK
 *
 */
int process_image(uint8_t * image, information * es_info);

#define __ALGO_CAMERA_H__ 

#endif
