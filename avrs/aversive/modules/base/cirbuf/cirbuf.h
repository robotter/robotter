/*  
 *  Copyright Droids Corporation (2007)
 *  Olivier MATZ <zer0@droids-corp.org>
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
 *  Revision : $Id: cirbuf.h,v 1.2 2008-01-08 20:05:02 zer0 Exp $
 *
 *
 */

/** 
 * Circular buffer implementation. You should not use a circular buffer
 * size > 127.
 *
 * Funcs are not atomic, so if * necessary, each call should be
 * protected by IRQ_LOCKs.
 */


#ifndef _CIRBUF_H_
#define _CIRBUF_H_

#include <aversive.h>
#include <stdio.h>

#ifdef CONFIG_MODULE_CIRBUF_LARGE
typedef signed int cirbuf_int;
typedef unsigned int cirbuf_uint;
#else
typedef signed char cirbuf_int;
typedef unsigned char cirbuf_uint;
#endif

/**
 * This structure is the header of a cirbuf type.
 */
struct cirbuf {
	cirbuf_uint maxlen;     /**< total len of the fifo (number of elements) */
	cirbuf_uint start;      /**< indice of the first elt */
	cirbuf_uint end;        /**< indice of the last elt */
	cirbuf_uint len;        /**< current len of fifo */
	char *  buf;
};

/* #define CIRBUF_DEBUG */

#ifdef CIRBUF_DEBUG
#define dprintf(fmt, ...) printf("line %3.3d - " fmt, __LINE__, ##__VA_ARGS__)
#else
#define dprintf(args...) do {} while(0)
#endif


/**
 * Init the circular buffer
 */
void cirbuf_init(struct cirbuf * cbuf, char * buf, cirbuf_uint start, cirbuf_uint maxlen);


/**
 * Return 1 if the circular buffer is full
 */
#define CIRBUF_IS_FULL(cirbuf) ((cirbuf)->maxlen == (cirbuf)->len)

/**
 * Return 1 if the circular buffer is empty
 */
#define CIRBUF_IS_EMPTY(cirbuf) ((cirbuf)->len == 0)

/**
 * return current size of the circular buffer (number of used elements)
 */
#define CIRBUF_GET_LEN(cirbuf) ((cirbuf)->len)

/**
 * return size of the circular buffer (used + free elements)
 */
#define CIRBUF_GET_MAXLEN(cirbuf) ((cirbuf)->maxlen)

/**
 * return the number of free elts 
 */
#define CIRBUF_GET_FREELEN(cirbuf) ((cirbuf)->maxlen - (cirbuf)->len)

/**
 * Iterator for a circular buffer
 *   c: struct cirbuf pointer
 *   i: an integer type (cirbuf_uint is enough) internally used in the macro
 *   e: char that takes the value for each iteration
 */
#define CIRBUF_FOREACH(c, i, e)                                 \
	for ( i=0, e=(c)->buf[(c)->start] ;                     \
	      i<((c)->len) ;                                    \
              i ++,  e=(c)->buf[((c)->start+i)%((c)->maxlen)])


/** 
 * Add a character at head of the circular buffer. Return 0 on success, or
 * a negative value on error.
 */
cirbuf_int cirbuf_add_head_safe(struct cirbuf * cbuf, char c);

/** 
 * Add a character at head of the circular buffer. You _must_ check that you
 * have enough free space in the buffer before calling this func.
 */
void cirbuf_add_head(struct cirbuf * cbuf, char c);

/** 
 * Add a character at tail of the circular buffer. Return 0 on success, or
 * a negative value on error.
 */
cirbuf_int cirbuf_add_tail_safe(struct cirbuf * cbuf, char c);

/** 
 * Add a character at tail of the circular buffer. You _must_ check that you
 * have enough free space in the buffer before calling this func.
 */
void cirbuf_add_tail(struct cirbuf * cbuf, char c);

/** 
 * Remove a char at the head of the circular buffer. Return 0 on
 * success, or a negative value on error.
 */
cirbuf_int cirbuf_del_head_safe(struct cirbuf * cbuf);

/** 
 * Remove a char at the head of the circular buffer. You _must_ check
 * that buffer is not empty before calling the function.
 */
void cirbuf_del_head(struct cirbuf * cbuf);

/** 
 * Remove a char at the tail of the circular buffer. Return 0 on
 * success, or a negative value on error.
 */
cirbuf_int cirbuf_del_tail_safe(struct cirbuf * cbuf);

/** 
 * Remove a char at the tail of the circular buffer. You _must_ check
 * that buffer is not empty before calling the function.
 */
void cirbuf_del_tail(struct cirbuf * cbuf);

/**
 * Return the head of the circular buffer. You _must_ check that
 * buffer is not empty before calling the function.
 */
char cirbuf_get_head(struct cirbuf * cbuf);

/**
 * Return the tail of the circular buffer. You _must_ check that
 * buffer is not empty before calling the function.
 */
char cirbuf_get_tail(struct cirbuf * cbuf);



/** 
 * Add a buffer at head of the circular buffer. 'c' is a pointer to a
 * buffer, and n is the number of char to add. Return the number of
 * copied bytes on success, or a negative value on error.
 */
cirbuf_int cirbuf_add_buf_head(struct cirbuf * cbuf, const char * c, cirbuf_uint n);

/** 
 * Add a buffer at tail of the circular buffer. 'c' is a pointer to a
 * buffer, and n is the number of char to add. Return the number of
 * copied bytes on success, or a negative value on error.
 */
cirbuf_int cirbuf_add_buf_tail(struct cirbuf * cbuf, const char * c, cirbuf_uint n);

/** 
 * Remove chars at the head of the circular buffer. Return 0 on
 * success, or a negative value on error.
 */
cirbuf_int cirbuf_del_buf_head(struct cirbuf * cbuf, cirbuf_uint size);

/** 
 * Remove chars at the tail of the circular buffer. Return 0 on
 * success, or a negative value on error.
 */
cirbuf_int cirbuf_del_buf_tail(struct cirbuf * cbuf, cirbuf_uint size);

/** 
 * Copy a maximum of 'size' characters from the head of the circular
 * buffer to a flat one pointed by 'c'. Return the number of copied
 * chars.
 */
cirbuf_int cirbuf_get_buf_head(struct cirbuf * cbuf, char * c, cirbuf_uint size);

/** 
 * Copy a maximum of 'size' characters from the tail of the circular
 * buffer to a flat one pointed by 'c'. Return the number of copied
 * chars.
 */
cirbuf_int cirbuf_get_buf_tail(struct cirbuf * cbuf, char * c, cirbuf_uint size);


/** 
 * Set the start of the data to the index 0 of the internal buffer.
 */
void cirbuf_align_left(struct cirbuf * cbuf);

/** 
 * Set the end of the data to the last index of the internal buffer.
 */
void cirbuf_align_right(struct cirbuf * cbuf);

#endif /* _CIRBUF_H_ */
