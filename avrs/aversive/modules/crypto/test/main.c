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
 *  Revision : $Id: main.c,v 1.4 2007-05-24 13:08:47 zer0 Exp $
 *
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

#include <aversive/pgmspace.h>
#include <uart.h>
#include <aversive.h>
#include <aversive/wait.h>

#include "md5.h"
#include "aes_locl.h"
#include "aes.h"
#include "hmac_md5.h"

#include <rc4.h>
#include <stdio.h>
#include <string.h>

#define SKEY_BINKEY_SIZE	8

    


/*test crypto*/
unsigned char text_in[] = "666Doyourecognizethisnumber?Thisisthenumberofthebeast4567890abcd";
unsigned char text_im[64];
unsigned char text_out[64];
unsigned char my_key[] = "ThisIsMySecret!!AndTheRestOfdata";


unsigned char test_hmac_md5_key[] = "\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b";
unsigned char test_hmac_md5_data[] = "Hi There";

unsigned char test_aes_ctr_key[] = "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";
unsigned char test_aes_counterblock[] = "\x00\x00\x00\x00\x00\x00\x00\x00";
unsigned char test_aes_text[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789aa";
unsigned long test_aes_Nonce = 0x30;


   

/*
 * ARC4 tests vectors from OpenSSL (crypto/rc4/rc4test.c)
 */

void rc4_crypt(unsigned char *data, int length )
{
  int i;

  for (i=0 ; i<length ; i++)
    data[i] = rc4_crypt_char(data[i]);
}


static unsigned char rc4_keys[7][30]={
        {8,0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef},
        {8,0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef},
        {8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},
        {4,0xef,0x01,0x23,0x45},
        {8,0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef},
        {4,0xef,0x01,0x23,0x45},
        };

static unsigned char rc4_data_len[7]={8,8,8,20,28,10};
static unsigned char rc4_data[7][30]={
        {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xff},
        {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff},
        {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff},
        {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
           0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
           0x00,0x00,0x00,0x00,0xff},
        {0x12,0x34,0x56,0x78,0x9A,0xBC,0xDE,0xF0,
           0x12,0x34,0x56,0x78,0x9A,0xBC,0xDE,0xF0,
           0x12,0x34,0x56,0x78,0x9A,0xBC,0xDE,0xF0,
           0x12,0x34,0x56,0x78,0xff},
        {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff},
        {0},
        };

static unsigned char rc4_output[7][30]={
        {0x75,0xb7,0x87,0x80,0x99,0xe0,0xc5,0x96,0x00},
        {0x74,0x94,0xc2,0xe7,0x10,0x4b,0x08,0x79,0x00},
        {0xde,0x18,0x89,0x41,0xa3,0x37,0x5d,0x3a,0x00},
        {0xd6,0xa1,0x41,0xa7,0xec,0x3c,0x38,0xdf,
         0xbd,0x61,0x5a,0x11,0x62,0xe1,0xc7,0xba,
         0x36,0xb6,0x78,0x58,0x00},
        {0x66,0xa0,0x94,0x9f,0x8a,0xf7,0xd6,0x89,
         0x1f,0x7f,0x83,0x2b,0xa8,0x33,0xc0,0x0c,
         0x89,0x2e,0xbe,0x30,0x14,0x3c,0xe2,0x87,
         0x40,0x01,0x1e,0xcf,0x00},
        {0xd6,0xa1,0x41,0xa7,0xec,0x3c,0x38,0xdf,0xbd,0x61,0x00},
        {0},
        };

#if 0
void dump_hex(unsigned char* in, unsigned int len)
{
	unsigned int i;
	printf("[__\n");
	for (i=0;i<len;i++) {
		if (i && !(i%16))
			printf("\n");
		printf("%.2X ", in[i]&0xFF);
	}    
	printf("\n__]\n");
}    
#endif

int key_len = 128;
int main(void)
{
	MD5_CTX h1;
	unsigned char out[32];
	unsigned char text[16];
	AES_KEY key;

	unsigned char counter[AES_BLOCK_SIZE] = {0};
	unsigned char ecount_buf[AES_BLOCK_SIZE] = {0};
	unsigned int	 num = 0;
	int i;

	uint8_t rc4_buffer[30];

#ifndef HOST_VERSION
	/* UART */
	uart_init();
	fdevopen(uart0_dev_send, uart0_dev_recv);

	sei();
#endif

	/************ TEST RC4 */

    for( i = 0; i < 6; i++ ) {
		printf( " Test %d ", i + 1 );

        memcpy( rc4_buffer, rc4_data[i], rc4_data_len[i] );

        rc4_init( &rc4_keys[i][1], rc4_keys[i][0] );
        rc4_crypt( rc4_buffer, rc4_data_len[i] );

        if( memcmp( rc4_buffer, rc4_output[i], rc4_data_len[i] ) ) {
			printf( "RC4 failed!\n" );
		}
		else {
			printf( "RC4 test passed.\n" );
		}
	}
	

	memset(my_key, 0, 16);
	strcpy((char*)my_key, "toto");

	

	/*TEST HASH MD5*/
	MD5Init(&h1);
	MD5Update(&h1, text_in, 64);
	MD5Update(&h1, my_key, 32);
	MD5Final(out, &h1);
	
	if (memcmp(out,"\xB8\x65\xA8\x46\xFC\x9F\x81\xFC\x4B\x98\x73\x4B\xAB\x1D\x4E\x65",16))
		printf( "Hash MD5 failed!\n" );
	else
		printf( "Hash MD5 passed\n" );




    
	/*TEST AES ENCRYPT*/
	AES_set_encrypt_key(my_key, key_len, &key);
	AES_encrypt(text_in, out, &key);
	if (memcmp(out,"\x7F\xA0\x88\xA5\xDB\x57\xE8\x63\x44\x35\xF6\xF5\x7F\xE6\x4A\xA1",16))
		printf( "AES encrypt failed!\n" );
	else
		printf( "AES encrypt passed\n" );


	/*TEST AES DECRYPT*/
	AES_set_decrypt_key(my_key, key_len, &key);
	AES_decrypt(out, text, &key);
	if (memcmp(text,"\x36\x36\x36\x44\x6F\x79\x6F\x75\x72\x65\x63\x6F\x67\x6E\x69\x7A",16))
		printf( "AES decrypt failed!\n" );
	else
		printf( "AES decrypt passed\n" );



	/*TEST AES MODE CTR ENCRYPT*/
	memset(counter, 0, AES_BLOCK_SIZE);
	memset(ecount_buf, 0, AES_BLOCK_SIZE);
	num = 0;
	AES_set_encrypt_key(test_aes_ctr_key, key_len, &key);
	for (i=0;i<sizeof(test_aes_text)-1;i++)
		AES_ctr128_encrypt(&test_aes_text[i], &text_im[i], 1, &key,counter,ecount_buf,&num);
	if (memcmp(text_im, "\x07\x8B\x28\xB0\x8A\xEC\x4B\x53\xE1\x26\x91\x35\xA7\x5A\x44\x5E"
		   "\x09\xF9\xBE\x65\x6B\xB9\x04\xAC\x9E\xF7\x6F\x63\xFD\xB1\x11\x26"
		   "\xF2\xF8\x7D\x6B\x95\xC7\xF2\xB2\x01\xFD\xBD\x24\x20\x6D\xFC\xEB"
		   "\xCD\x38\xEC\x77\xBC\xCA\x84\xB5\x63\x4E\x4E\x82\x1E\x9E\x72\x77", 64))
		printf( "AES counter encrypt failed!\n" );
	else
		printf( "AES counter encrypt passed\n" );


	/*TEST AES MODE CTR DECRYPT*/
	memset(counter, 0, AES_BLOCK_SIZE);
	memset(ecount_buf, 0, AES_BLOCK_SIZE);
	num=0;
	AES_set_encrypt_key(test_aes_ctr_key, key_len, &key);
	for (i=0;i<64;i++)
		AES_ctr128_encrypt(&text_im[i], &text_out[i], 1, &key,counter,ecount_buf,&num);
	if (memcmp(text_out, test_aes_text, 64))
		printf( "AES counter encrypt failed!\n" );
	else
		printf( "AES counter encrypt passed\n" );


	/*TEST HASH MAC MD5 rfc2104*/
	/*RESULT 0x9294727a3638bb1c13f48ef8158bfc9d*/
	HMAC_MD5(out, test_hmac_md5_data, test_hmac_md5_key, 8, 16);
	if (memcmp(out,"\x92\x94\x72\x7A\x36\x38\xBB\x1C\x13\xF4\x8E\xF8\x15\x8B\xFC\x9D", 16))
		printf( "AES counter encrypt failed!\n" );
	else
		printf( "AES counter encrypt passed\n" );
	
	printf( "End\n");
	while(1);

	return 0;
}

