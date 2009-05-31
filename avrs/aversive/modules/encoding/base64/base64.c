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
 *  Revision : $Id: base64.c,v 1.3 2009-03-15 21:51:19 zer0 Exp $
 *
 */

#include <string.h>

char my_base64[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

/* return -1 if out buffer is too small */
/* else return number of written bytes in out buffer */
int  base64_to_raw(char * in, int len_in, char * out, int len_out)
{
	int n_in;
	int counter=0;
	int n_out=0;
	char* c;
	unsigned int buf=0;
	for (n_in=0 ; n_in<len_in && n_out<len_out ; n_in++)	{
		/* this is the end as it is padding */
		if (in[n_in] == '=')
			break;

		c = strchr(my_base64, in[n_in]);
		
		/* ignore bad chars */
		if (c == NULL)
			continue;

		buf <<= 6;
		buf += (int)(c-my_base64);
		counter+=6;

		if (counter < 8)
			continue;

		if (n_out >= len_out)
			return -1;

		out[n_out++] = (buf>>(counter-8)) & 0xFF;
		counter -= 8;
	}

	/* no padding at the end, ok */
	if (counter == 0 && (n_in+1 >= len_in || in[n_in] != '=')) {
		return n_out;
	}

	/* one '=' padding, ok  */
	if (counter == 2 && (in[n_in] == '=') && 
	    (n_in+1 >= len_in || in[n_in] != '=')) {
		return n_out;
	}

	/* two '=' padding, ok  */
	if (counter == 4 && (in[n_in] == '=') && 
	    n_in+1 < len_in && in[n_in+1] == '=') {
		return n_out;
	}

	/* bad padding */
	return -1;
}


/* return -1 if out buffer is too small */
/* else return number of written bytes in out buffer */
int raw_to_base64(char *in, int len_in, char * out, int len_out)
{
	int n_in;
	int counter=0;
	int n_out=0;
	unsigned int buf=0;

	for (n_in=0 ; n_in<len_in && n_out<len_out ; n_in++)	{
		buf <<= 8;
		buf += (unsigned char)(in[n_in]);
		counter+=8;
		
		while(counter>=6) {
			if (n_out>=len_out)
				return -1;
			out[n_out++] = my_base64[(buf>>(counter-6)) & 0x3F];
			counter-=6;
		}
	}

	/* should we add padding ? */
	if (counter) {
		if (n_out >= len_out)
			return -1;

		out[n_out++] =  my_base64[(buf<<(6-counter)) & 0x3F];
		
		if (n_out >= len_out)
			return -1;

		/* one '=' if counter==4 (counter can be 4 or 2) */
		out[n_out++] = '=';

		if (n_out >= len_out)
			return -1;

		/* two '=' if cpt==2 */
		if (counter==2) {
			out[n_out++] = '=';
		}
	}
	
	return n_out;
}
