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
 *  Revision : $Id: hmac_md5.c,v 1.2 2006-10-30 22:35:57 zer0 Exp $
 *
 */

#include <string.h>
#include "md5.h"

void HMAC_MD5 (unsigned char *output, const unsigned char *input, 
	       unsigned char *key, unsigned int inputLen, unsigned int keyLen)
{
	unsigned int i;
	MD5_CTX context;
	unsigned char key_tmp[64];	
	
	for (i=0;i<64;i++)
		key_tmp[i] = (i<keyLen)?key[i]^0x36:0x36;

	MD5Init(&context);
	MD5Update(&context, key_tmp, 64);
	MD5Update(&context, input, inputLen);
	MD5Final(output, &context);

	for (i=0;i<64;i++)
		key_tmp[i] = (i<keyLen)?key[i]^0x5c:0x5c;


	MD5Init(&context);
	MD5Update(&context, key_tmp, 64);
	MD5Update(&context, output, 16);
	MD5Final(output, &context);
}

