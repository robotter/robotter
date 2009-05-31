#ifndef _PARSE_NUM_H_
#define _PARSE_NUM_H_

#include "parse.h"

enum numtype {
	UINT8 = 0,
	UINT16,
	UINT32,
	INT8,
	INT16,
	INT32,
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
	FLOAT,
#endif
};

struct token_num_data {
	enum numtype type;
};

struct token_num {
	struct token_hdr hdr;
	struct token_num_data num_data;
};
typedef struct token_num parse_token_num_t;
struct token_num_pgm {
	struct token_hdr hdr;
	struct token_num_data num_data;
} PROGMEM;
typedef struct token_num_pgm parse_pgm_token_num_t;

extern struct token_ops token_num_ops;

int8_t parse_num(parse_pgm_token_hdr_t * tk, 
		 const char * srcbuf, void * res);
int8_t get_help_num(parse_pgm_token_hdr_t * tk, 
		    char * dstbuf, uint8_t size);

#define TOKEN_NUM_INITIALIZER(structure, field, numtype)   \
{							   \
	.hdr = {					   \
		.ops = &token_num_ops,			   \
		.offset = offsetof(structure, field),	   \
	},						   \
	.num_data = {					   \
		.type = numtype,			   \
	},						   \
}

#endif /* _PARSE_NUM_H_ */
