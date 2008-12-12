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
 *  Revision : $Id: control_system_manager.h,v 1.11 2008-04-13 16:55:30 zer0 Exp $
 *
 */

/* Droids-corp, Eirbot, Microb Techology 2005
 * Implementation for the control_system manager
 */

/** \file control_system_manager.h
 * \brief Interface for the control_system manager module.
 *
 * \todo Test the module on a real system.
 *
 * \test No test for the moment, only correct compilation.
 *
 * This module provide functions to control and regulate a system.
 */
    
#ifndef _CONTROL_SYSTEM_MANAGER_
#define _CONTROL_SYSTEM_MANAGER_

#include <aversive.h>

/** The data structure used by the control_system_manager module */
struct cs {
        
        int32_t (*consign_filter)(void *, int32_t);
        void* consign_filter_params;

        int32_t (*correct_filter)(void*, int32_t);
        void* correct_filter_params;

        int32_t (*feedback_filter)(void*, int32_t);
        void* feedback_filter_params;

        int32_t (*process_out)(void*);
        void* process_out_params;

        void (*process_in)(void*, int32_t);
        void* process_in_params;

        int32_t consign_value;
        int32_t filtered_feedback_value;
        int32_t filtered_consign_value;
        int32_t error_value;
        int32_t out_value;
};

/******* - Prototyping - *******/

/** Initiate the control_system structure by setting all fields to NULL */
void cs_init(struct cs* cs);

/** Set the cs consign_filter fields in the cs structure */
void cs_set_consign_filter(struct cs* cs,
                                  int32_t (*consign_filter)(void*, int32_t),
                                  void* consign_filter_params);

/** Set the cs correct_filter fields in the cs structure */
void  cs_set_correct_filter(struct cs* cs,
                                   int32_t (*correct_filter)(void*, int32_t),
                                   void* correct_filer_params);

/** Set the cs feedback_filter fields in the cs structure */
void  cs_set_feedback_filter(struct cs* cs,
                                    int32_t (*feedback_filter)(void*, int32_t),
                                    void* feedback_filer_params);

/** Set the cs process_in fields in the cs structure */
void cs_set_process_in(struct cs* cs,
                              void (*process_in)(void*, int32_t),
                              void* process_in_params);

/** Set the cs process_out fields in the cs structure */
void cs_set_process_out(struct cs* cs,
                               int32_t (*process_out)(void*),
                               void* process_out_params);


/** \brief This function do the main loop of the control system process.
 *
 * - Save the consign in the structure.
 * - Apply the consign filter to the consign.
 * - Read the process out
 * - Apply the feedback filter to the process out
 * - Substract filtered consign to filtered process out.
 * - Save the result in error_value and apply the correct filter.
 * - Save the filtered result and send it to process_in().
 * - Return this result.
 * 
 */
int32_t cs_do_process(struct cs* cs, int32_t consign);

/** Apply cs_do_process() to the structure cs 
 * \param cs should be a (struct cs*)
 */
void cs_manage(void * cs);

/** Return the last output sent to process */
int32_t cs_get_out(struct cs* cs);

/** Return the last calculated error */
int32_t cs_get_error(struct cs* cs);

/** Return the current consign */
int32_t cs_get_consign(struct cs* cs);

/** Return the current consign, after filter */
int32_t cs_get_filtered_consign(struct cs* cs);

/** Return the last feedback value, after filter */
int32_t cs_get_filtered_feedback(struct cs* cs);

/** Change the consign without calculating control system */
void cs_set_consign(struct cs* cs, int32_t v);


#endif /* #ifndef _CONTROL_SYSTEM_MANAGER_ */
