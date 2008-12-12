#ifndef AES_CTR_H
#define AES_CTR_H


typedef struct _aes_ctr_ctx
{
  AES_KEY key;
  unsigned char counter[AES_BLOCK_SIZE];
  unsigned char ecount_buf[AES_BLOCK_SIZE];
  unsigned int num;
} aes_ctr_ctx;

void AES_ctr128_inc(unsigned char *counter);

void AES_ctr128_encrypt(const unsigned char *in, unsigned char *out,
			const unsigned long length, const AES_KEY *key,
			unsigned char counter[AES_BLOCK_SIZE],
			unsigned char ecount_buf[AES_BLOCK_SIZE],
			unsigned int *num) ;


#endif
