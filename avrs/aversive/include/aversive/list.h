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
 *  Revision : $Id: list.h,v 1.3 2008-01-08 20:05:02 zer0 Exp $
 *
 */

/** 
 * This header file provides LISTs implemented in tables. Don't use
 * list size > 127. 
 *
 * WARNING ---------------------
 * This header file will probably be deprecated in a soon.
 * future. Consider using the 'cirbuf' module (circular buffer) instead.
 * Indeed, the full-macro implementation of this header file is not
 * the most efficient in terms of code size.... :)
 * WARNING ---------------------
 * 
 * 
 * Header
 * ------
 * 
 * struct list_hdr {
 *   u08 size; < The size of the fifo 
 *   u08 cur_size; < number of data in the fifo
 *   u08 beg_indice; < indice of the first elt
 *   u08 read_cursor; < read cursor 
 * } __attribute__ ((packed));
 * 
 * 
 * ---------------------------------------------
 * I       I       I       I       I      
 * I size  IcursizeI beg   I rcurs I    elements ...  
 * I       I       I       I       I      
 * ---------------------------------------------
 * 
 * <------------------------------->
 *          list_hdr
 * 
 * 
 * Data
 * ----
 * 
 * Data are stored in a circular buffer, beginning is specified by
 * beg_indice in header.
 * 
 * 
 * Type
 * ----
 * 
 * For example, the type of a list of u08 with 10 elements is :
 * 
 * struct list_u08_10 {
 *   struct list_hdr hdr;
 *   u08 elt[10];
 * }
 * 
 * - With this example, an empty list is :
 *   size = 10
 *   cursize = 0
 *   beg = X
 *   curs = X
 * 
 * - A full list :
 *   size = 10
 *   cursize = 10
 *   beg = X
 *   curs = X
 *  
 * 
 * Functions & Macros
 * ------------------
 * 
 * ********** Define and init
 * 
 * LIST_TYPE(typename, elttype, size) -> define type :
 * 
 *     #define LIST_TYPE(typename, elttype, size)
 * 	typedef struct typename {
 *         struct list_hdr hdr;
 *         elttype elt[size];
 *         } typename;
 * 
 * LIST_INIT(list, beginning) -> flushes the list, and set size and beginning
 * 
 * 
 * ********** Control 
 * 
 * u08 LIST_FULL(list)
 * u08 LIST_EMPTY(list)
 * 
 * u08 LIST_READ_GOTO(*elt, list, i) -> place the read cursor at position i (0 means
 *                   the beginning of the list) and set the elt if
 *                   pointer not NULL
 * 
 * u08 LIST_READ_LEFT(*elt, list, i) -> move the read cursor left by i 
 * u08 LIST_READ_RIGHT(*elt, list, i) -> move the read cursor right by i 
 * u08 LIST_READ_START(*elt, list) 
 * u08 LIST_READ_END(*elt, list)
 * 
 * Examples :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        3       2      3        X     X       A      B     C      X     
 * 
 * 
 * we do LIST_READ_LEFT(NULL, x,x, 1) :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        3       2      2        X     X       A      B     C      X     
 * 
 * 
 * we do LIST_READ_LEFT(NULL, x,x, 1), but return 1 instead of 0 because we
 * overwrapped :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        3       4      4        X     X       A      B     C      X     
 * 
 * 
 * we do LIST_READ_GOTO(NULL, x,x, 0) :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        3       4      2        X     X       A      B     C      X     
 * 
 * 
 * 
 * ********** accesses modifying the list
 * 
 * u08 LIST_PUSH_START(elt, list)   -> add at the beginning (prepend)
 * u08 LIST_PUSH_END(elt, list)     -> add at the end (append)
 * u08 LIST_PULL_START(elt *, list) -> del at the beginning
 * u08 LIST_PULL_END(elt *, list)   -> del at the end
 * 
 * u08 LIST_ARRAY_PUSH_START(*elt, list, n)   -> prepend n elts
 *                                                     from elt pointer
 * u08 LIST_ARRAY_PUSH_END(*elt, list, n)     -> append n elts
 * u08 LIST_ARRAY_PULL_START(elt *, list, n)  -> del n elts from buffer
 * u08 LIST_ARRAY_PULL_END(elt *, list, n)    -> del at the end
 * 
 * Examples :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        4       2      3        X     X      B      C      D      E     
 * 
 * 
 * we do  LIST_PUSH_START(A, l, u08) :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        5       1      3        X     A      B      C      D      E
 * 
 * 
 * we do  LIST_PUSH_END(F, l, u08) :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        6       1      3       F      A      B      C      D      E
 * 
 * we do  LIST_PUSH_END(X, l, u08) -> return -1
 * 
 * 
 * 
 * ********** Accesses NOT modifying the list
 * 
 * u08 LIST_FIRST(elt *, list)      -> Return the first elt
 * u08 LIST_LAST(elt *, list)       -> Return the last elt
 * 
 * u08 LIST_READ(elt *, list)       -> Return the elt pointed by
 *                                           the read cursor
 * 
 * u08 LIST_ARRAY_READ(elt *, list, n)  -> reads n elts from read cursor
 * 
 * u08 LIST_READ_GET_PTR(list) -> return a pointer to the read
 * cursor. Warning, perhaps you need to do LIST_ALIGN_XXXX() before
 * 
 * ********** loop functions
 * 
 * #define LIST_FOREACH(list, elt)
 *    for( u08 ret = LIST_READ_START(elt, list) ;
 *              ret == 0 ;             
 *              ret = LIST_READ_RIGHT(*elt, list, 1) )
 * 
 * 
 * ********** Alignement functions
 * 
 * these functions can by quite long to execute. If possible, try to
 * avoid using them by choosing a good place for the beg_indice when
 * calling init of list. If you need it, prefer using
 * LIST_ALIGN_CONTINUOUS if possible.
 * 
 * u08 LIST_ALIGN_LEFT(list)  
 * u08 LIST_ALIGN_RIGHT(list)
 * u08 LIST_ALIGN_CONTINUOUS(list) -> just try to put data in a 
 * 				   countinuous memory region in 
 * 				   minimum operations.
 * 
 * Example :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        4       3      4       D      X      X      A      B      C 
 * 
 * 
 * we do  LIST_ALIGN_LEFT(list) :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        4       0      1       A      B      C      D      X      X
 * 
 * we do  LIST_ALIGN_RIGHT(list) :
 * 
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        4       2      3       X      X      A      B      C      D
 * 
 * 
 * With these functions, you can easily imagine a network stack,
 * prepending headers to data, without copying the buffer multiple times.
 * 
 * Example :
 * 
 * LIST_INIT(mylist, 5)
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        0       5      5       X      X      X      X      X      X
 * 
 * LIST_ARRAY_PUSH_START("DATA", mylist, u08, strlen("DATA"))
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        4       2      5       X      X      D      A      T      A
 * 
 * LIST_PUSH_START('H', mylist, u08) (push header)
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        5       1      5       X      H      D      A      T      A
 * 
 * LIST_PUSH_START('H', mylist, u08) (push another header)
 * size | cursize | beg | cursor | elt0 | elt1 | elt2 | elt3 | elt4 | elt5 |
 *  6        6       0      5       H      H      D      A      T      A
 * 
 */


#ifndef _AVERSIVE_LIST_H_
#define _AVERSIVE_LIST_H_

#ifndef LIST_DEBUG
#define LIST_DEBUG 0
#endif

#include <stdio.h>

#define WOVERWRAPPED -1

#ifdef HOST_VERSION
#define CR "\n"
#else
#define CR "\r\n"
#endif

#include <aversive.h>

/**
 * This structure is the header of a list type.
 */
struct list_hdr {
  uint8_t size; /**< The size of the list (number of elements) */
  uint8_t cur_size; /**< number of data in the list */
  uint8_t beg_indice; /**< indice of the first elt */
  int8_t read_cursor; /**< read cursor */
} __attribute__ ((packed));

/**
 * This is a generic kind of list, in which we suppose that elements
 * are char 
*/
struct generic_list {
	struct list_hdr hdr; 
	char elt[0]; 
} __attribute__ ((packed));


/**
 * Define a new list type
 */
#define LIST_TYPEDEF(typename, elttype, size) \
typedef struct typename { \
	struct list_hdr hdr; \
	elttype elt[size]; \
} typename;

#define LIST_INIT(list, beginning) \
do { \
  list.hdr.size = sizeof(list.elt)/sizeof(list.elt[0]); \
  list.hdr.cur_size = 0; \
  list.hdr.beg_indice = beginning; \
  list.hdr.read_cursor = beginning; \
} while(0)


/**
 * Return 1 if the list is full
 */
#define LIST_FULL(list) (list.hdr.size == list.hdr.cur_size)

/**
 * Return 1 if the list is empty
 */
#define LIST_EMPTY(list) (list.hdr.cur_size == 0)

/**
 * return current size of the list (number of used elements)
 */
#define LIST_CURSIZE(list) (list.hdr.cur_size)

/**
 * return size of the list (used + free elements)
 */
#define LIST_SIZE(list) (list.hdr.size)

/**
 * return the number of free elts 
 */
#define LIST_FREESIZE(list) (list.hdr.size-list.hdr.cur_size)



#define LIST_READ_START(list, elt_p) ({ \
 uint8_t __ret=0; \
 list.hdr.read_cursor = 0 ; \
 *elt_p = list.elt[list.hdr.beg_indice] ;  \
 if(LIST_DEBUG) \
   printf("LIST_READ_START(%s, %s) -> ret %d"CR,#list, #elt_p, __ret); \
 __ret; \
}) 

#define LIST_READ_END(list, elt_p) ({ \
 uint8_t __ret=0; \
 list.hdr.read_cursor = list.hdr.cur_size-1; \
 *elt_p = list.elt[(list.hdr.beg_indice-1+list.hdr.cur_size) % list.hdr.size] ;  \
 if(LIST_DEBUG) \
   printf("LIST_READ_END(%s, %s) -> ret %d"CR,#list, #elt_p, __ret); \
 __ret; \
}) 


#define LIST_READ_GOTO(list, elt_p, i) ({ \
 uint8_t __ret=0; \
 if( (i<0) || (i>=list.hdr.cur_size) ) \
	 __ret = EINVAL; \
 else { \
	list.hdr.read_cursor = i; \
	*elt_p = list.elt[(list.hdr.beg_indice+i) % list.hdr.size] ;  \
 } \
 if(LIST_DEBUG) \
   printf("LIST_READ_GOTO(%s, %s, %d) -> ret %d"CR,#list, #elt_p, i, __ret); \
 __ret; \
}) 

#define LIST_READ_MOVE(list, elt_p, i)  ({\
uint8_t __ret=0;  \
 if (i<0) { \
	if( (-i) > list.hdr.read_cursor ) \
		 __ret = WOVERWRAPPED ; \
	list.hdr.read_cursor -= ((-i) % list.hdr.cur_size) ; \
	if (list.hdr.read_cursor < 0)  \
		list.hdr.read_cursor += list.hdr.cur_size ;  \
 } \
 else {  \
	 if( i >= list.hdr.cur_size - list.hdr.read_cursor )  \
		 __ret = WOVERWRAPPED ; \
	 list.hdr.read_cursor += (i % list.hdr.cur_size) ; \
	 if (list.hdr.read_cursor >= list.hdr.cur_size) \
		 list.hdr.read_cursor -= list.hdr.cur_size ; \
 } \
 if(LIST_DEBUG) \
   printf("LIST_READ_MOVE(%s, %s, %d) -> ret %d"CR,#list, #elt_p, i, __ret); \
 *elt_p = list.elt[(list.hdr.beg_indice+list.hdr.read_cursor) % list.hdr.size] ;  \
 __ret;  \
}) 

#define LIST_READ(list, elt_p)  ({\
 *elt_p = list.elt[(list.hdr.beg_indice+list.hdr.read_cursor) % list.hdr.size] ;  \
 0;  \
}) 

#define LIST_PUSH_START(list, e) ({ \
 uint8_t __ret=0; \
 if( LIST_FULL(list) ) \
	 __ret=EINVAL; \
 else { \
	 list.hdr.beg_indice = (list.hdr.beg_indice-1+list.hdr.size) % list.hdr.size; \
	 list.elt [ list.hdr.beg_indice ] = e ; \
	 list.hdr.cur_size ++ ; \
 } \
if(LIST_DEBUG) \
 printf("LIST_PUSH_START(%s, %s) -> ret %d"CR,#list, #e, __ret); \
 __ret; \
})

#define LIST_PUSH_END(list, e) ({ \
 uint8_t __ret=0; \
 if( LIST_FULL(list) ) \
	 __ret=EINVAL; \
 else { \
	 list.elt [ (list.hdr.beg_indice+list.hdr.cur_size) % list.hdr.size ] = e ; \
	 list.hdr.cur_size ++ ; \
 } \
if(LIST_DEBUG) \
 printf("LIST_PUSH_END(%s, %s) -> ret %d"CR,#list, #e, __ret); \
 __ret; \
})

#define LIST_PULL_START(list, elt_p) ({ \
 uint8_t __ret=0; \
 if( LIST_EMPTY(list) ) \
	 __ret=EINVAL; \
 else { \
	 *elt_p = list.elt [ list.hdr.beg_indice ] ; \
	 list.hdr.beg_indice = (list.hdr.beg_indice+1) % list.hdr.size; \
	 list.hdr.cur_size -- ; \
 } \
if(LIST_DEBUG) \
 printf("LIST_PULL_START(%s, %s) -> ret %d"CR,#list, #elt_p, __ret); \
 __ret; \
})

#define LIST_PULL_END(list, elt_p) ({ \
 uint8_t __ret=0; \
 if( LIST_EMPTY(list) ) \
	 __ret=EINVAL; \
 else { \
	 *elt_p = list.elt [ (list.hdr.beg_indice-1+list.hdr.cur_size) % list.hdr.size ] ; \
	 list.hdr.cur_size -- ; \
 } \
if(LIST_DEBUG) \
 printf("LIST_PULL_END(%s, %s) -> ret %d"CR,#list, #elt_p, __ret); \
 __ret; \
})

/* start by the last elt */
#define LIST_ARRAY_PUSH_START(list, array, nb) ({\
 uint8_t __ret=0; \
 int8_t __i; \
 for(__i=nb-1 ; (__i>=0) && (!__ret) ; __i--) { \
    __ret=LIST_PUSH_START(list, array[__i]); \
 } \
 if(LIST_DEBUG) \
   printf("LIST_ARRAY_PUSH_START(%s, %s, %d) -> ret %d"CR,#list, #array, nb, __ret); \
 __ret; \
})

#define LIST_ARRAY_PUSH_END(list, array, nb) ({\
 uint8_t __ret=0, __i; \
 for(__i=0 ; (__i<nb) && (!__ret) ; __i++) { \
    __ret=LIST_PUSH_END(list, array[__i]); \
 } \
 if(LIST_DEBUG) \
   printf("LIST_ARRAY_PUSH_END(%s, %s, %d) -> ret %d"CR,#list, #array, nb, __ret); \
 __ret; \
})

#define LIST_ARRAY_PULL_START(list, array, nb) ({\
 uint8_t __ret=0, __i; \
 for(__i=0 ; (__i<nb) && (!__ret) ; __i++) { \
    __ret=LIST_PULL_START(list, (array+__i)); \
 } \
 if(LIST_DEBUG) \
   printf("LIST_ARRAY_PULL_START(%s, %s, %d) -> ret %d"CR,#list, #array, nb, __ret); \
 __ret; \
})

#define LIST_ARRAY_PULL_END(list, array, nb) ({\
 uint8_t __ret=0; \
 int8_t __i; \
 for(__i=nb-1 ; (__i>=0) && (!__ret) ; __i--) { \
    __ret=LIST_PULL_END(list, (array+__i)); \
 } \
 if(LIST_DEBUG) \
   printf("LIST_ARRAY_PULL_END(%s, %s, %d) -> ret %d"CR,#list, #array, nb, __ret); \
 __ret; \
})


/* convert a list to an array, copy nb elts or less
 * if list is too small, return number of copied elts */
#define LIST_TO_ARRAY(list, array, nb) ({\
 int8_t __i; \
 for(__i=0 ; __i<nb && __i<list.hdr.cur_size ; __i++) { \
    array[__i] = list.elt[(__i+list.hdr.beg_indice) % list.hdr.size]; \
 } \
 if(LIST_DEBUG) \
   printf("LIST_TO_ARRAY(%s, %s, %d) -> ret %d"CR,#list, #array, nb, __i); \
 __i; \
})


#define LIST_ALIGN_LEFT(list) ({ \
uint8_t __ret=0, __i; \
if(list.hdr.beg_indice != 0) { \
	if(list.hdr.beg_indice+list.hdr.cur_size <= list.hdr.size) { \
		for(__i=0 ; __i<list.hdr.cur_size ; __i++) { \
			list.elt[__i] = list.elt[__i+list.hdr.beg_indice]; \
		} \
	} \
	else { \
          uint8_t buffer_size=(list.hdr.size - list.hdr.beg_indice < (list.hdr.cur_size + list.hdr.beg_indice)%list.hdr.size) ? \
                           (list.hdr.size - list.hdr.beg_indice) * sizeof(list.elt[0]) : \
	                      ((list.hdr.cur_size + list.hdr.beg_indice)%list.hdr.size) * sizeof(list.elt[0]); \
		     { \
				uint8_t buffer[buffer_size]; \
				memcpy(buffer, list.elt, buffer_size); \
				for(__i=0 ; __i<(list.hdr.cur_size - buffer_size/sizeof(list.elt[0])) ; __i++) { \
					list.elt[__i] = list.elt[__i+list.hdr.beg_indice]; \
				} \
				memcpy(&list.elt[list.hdr.cur_size - buffer_size/sizeof(list.elt[0])], buffer, buffer_size); \
		} \
	} \
 list.hdr.beg_indice=0; \
} \
 if(LIST_DEBUG) \
   printf("LIST_ALIGN_LEFT()"CR); \
 __ret; \
})

#endif /* _AVERSIVE_LIST_H_ */
