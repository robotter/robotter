/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2005)
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  Revision : $Id: encoders_eirbot.c,v 1.6 2007-05-24 13:08:47 zer0 Exp $
 *
 */

/** \file encoders_eirbot.c
 *  \brief achieves acess to incremental encoderss through a xilinx interface
 *
 *  \todo nothing !
 *
 *  \test  
 *
 *  this modules reads 8 bit encoders values on an external interface.
 *  there are two necessary busses with the interface logic: 8 bit data bus and a n bits selection bus.
 *  ( see the VDHL for the xilinx program)
 *  with n bits on the selection bus, you can acess to 2^n encoderss.
 *
 *  modifié par lamygale le 10 octobre 2005. d'apres le code 2004 du codeur
 *
 */



#include <aversive.h>


#include "encoders_eirbot.h"

#include "encoders_eirbot_config.h"

#ifdef ENCODERS_MODE_XILINX
// mask for selection bits
#define ENCODERS_SELEC_MASK ((0xFF >> (8-ENCODERS_SELEC_NITS_NUM)) \
                                 << ENCODERS_SELEC_BIT0)
#define ENCODERS_DATA_MASK ((0xFF >> (8-ENCODERS_DATA_NBBITS)) \
                                 << ENCODERS_DATA_BIT0)
// bits qui ne sont pas des donnees sont a 1 (donnees sont alignees a droite)
#define DIFF_DATA_MASK ((0xFF >> ENCODERS_DATA_NBBITS) << ENCODERS_DATA_NBBITS)

volatile encoders g_codeur_valeurs[ENCODERS_NUMBER];

volatile int8_t g_codeur_preced[ENCODERS_NUMBER];



/**
 * fonction utilisée 2 fois seulement, acquiert un codeur
*/
inline int8_t get_codeur(uint8_t num)
{
  int8_t val;
  uint8_t flags;

  IRQ_LOCK(flags);

  ENCODERS_SELEC_PORT =   ( ENCODERS_SELEC_PORT & (~ENCODERS_SELEC_MASK)  ) | ( num << ENCODERS_SELEC_BIT0);

  nop(); // delay for IO & xilix delay time
  nop();

  val = (ENCODERS_PIN & ENCODERS_DATA_MASK) >> ENCODERS_DATA_BIT0;

  IRQ_UNLOCK(flags);

  return val;
}

/** Initialisation des codeurs, variables, et ports */
void encoders_init(void)
{
  uint8_t number;
  uint8_t flags;

  IRQ_LOCK(flags);

  ENCODERS_SELEC_DDR |= ENCODERS_SELEC_MASK;   // port de selection en sortie
  ENCODERS_DATA_DDR  &= (~ENCODERS_DATA_MASK); // port de donnees en entree 

  for(number = 0 ; number < ENCODERS_NUMBER; number ++)
    {
      g_codeur_valeurs[number] = 0;
      g_codeur_preced[number] = get_codeur(number);
    }
  
  IRQ_UNLOCK(flags);
}

/** mise a jour des valeurs des codeurs, a faire réguliereement minimum  a la fréquence (Fmax_codeur/127) */
void encoders_manage(void)
{
  uint8_t number;
  int8_t res, lu;
  uint8_t nombre_a_ajouter;  // pour gerer les nombres négatifs
  uint8_t flags;

  for(number = 0 ; number < ENCODERS_NUMBER; number ++)
    { 

      lu = get_codeur(number); // lecture
      res = lu - g_codeur_preced[number]; // calcul diff
      g_codeur_preced[number] = lu;  // mise a jour ancienne valeur 

      // on recopie l'etat du MSb dans les bits != donnees 
      nombre_a_ajouter = ((res >> (ENCODERS_DATA_NBBITS - 1))&1) ? DIFF_DATA_MASK : 0; // si MSb = 1, on prend mask
      res = (res & ~DIFF_DATA_MASK) + nombre_a_ajouter; // bits de poids faibles = donnees, les autres = signe

      IRQ_LOCK(flags);
      g_codeur_valeurs[number] += res;
      IRQ_UNLOCK(flags);
    }
}

/** Extraction d'une valeur de codeur */
encoders encoders_get_value(uint8_t number)
{
  encoders value;
  uint8_t flags;

  IRQ_LOCK(flags);
  value = g_codeur_valeurs[number];
  IRQ_UNLOCK(flags);

  return value;
}

#else
#error the irq version of the codeur module is not implemented yet
#endif
