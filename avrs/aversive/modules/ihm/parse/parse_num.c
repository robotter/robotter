#include <stdio.h>
#include <inttypes.h>
#include <ctype.h>
#include <string.h>

#include "parse.h"
#include "parse_num.h"

//#define debug_printf(args...) printf(args)
#define debug_printf(args...) do {} while(0)

/* XXX to remove ?? */
#define U08_MIN 0x00
#define U08_MAX 0xFF
#define U16_MIN 0x0000
#define U16_MAX 0xFFFF
#define U32_MIN 0x00000000
#define U32_MAX 0xFFFFFFFF
#define S08_MIN 0x80
#define S08_MAX 0x7F
#define S16_MIN 0x8000
#define S16_MAX 0x7FFF
#define S32_MIN 0x80000000
#define S32_MAX 0x7FFFFFFF


struct token_ops token_num_ops = {
	.parse = parse_num,
	.complete_get_nb = NULL,
	.complete_get_elt = NULL,
	.get_help = get_help_num,
};


enum num_parse_state_t {
	START,
	DEC_NEG,
	BIN,
	HEX,
	FLOAT_POS,
	FLOAT_NEG,
	ERROR,

	FIRST_OK, /* not used */
	ZERO_OK,
	HEX_OK,
	OCTAL_OK,
	BIN_OK,
	DEC_NEG_OK,
	DEC_POS_OK,
	FLOAT_POS_OK,
	FLOAT_NEG_OK,
};

/* Keep it sync with enum in .h */
static const prog_char help1[] = "UINT8";
static const prog_char help2[] = "UINT16";
static const prog_char help3[] = "UINT32";
static const prog_char help4[] = "INT8";
static const prog_char help5[] = "INT16";
static const prog_char help6[] = "INT32";
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
static const prog_char help7[] = "FLOAT";
#endif
static const prog_char * num_help[] = {
	help1, help2, help3, help4,
	help5, help6,
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
	help7,
#endif
};

static inline int8_t 
add_to_res(uint8_t c, uint32_t * res, uint8_t base)
{
	/* overflow */
	if ( (U32_MAX - c) / base < *res ) {
		return -1;
	}

	*res = *res * base + c ;
	return 0;
}


/* parse an int or a float */
int8_t 
parse_num(parse_pgm_token_hdr_t * tk, const char * srcbuf, void * res)
{
	struct token_num_data nd;
	enum num_parse_state_t st = START;
	const char * buf = srcbuf;
	char c = *buf;
	uint32_t res1=0, res2=0, res3=1;

	memcpy_P(&nd, &((struct token_num *)tk)->num_data, sizeof(nd));

	while ( st != ERROR && c && ! isendoftoken(c) ) {
		debug_printf("%c %x -> ", c, c);
		switch (st) {
		case START:
			if (c == '-') {
				st = DEC_NEG;
			}
			else if (c == '0') {
				st = ZERO_OK;
			}
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
			else if (c == '.') {
				st = FLOAT_POS;
				res1 = 0;
			}
#endif
			else if (c >= '1' && c <= '9') {
				if (add_to_res(c - '0', &res1, 10) < 0)
					st = ERROR;
				else
					st = DEC_POS_OK;
			}
			else  {
				st = ERROR;
			}
			break;

		case ZERO_OK:
			if (c == 'x') {
				st = HEX;
			}
			else if (c == 'b') {
				st = BIN;
			}
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
			else if (c == '.') {
				st = FLOAT_POS;
				res1 = 0;
			}
#endif
			else if (c >= '0' && c <= '7') {
				if (add_to_res(c - '0', &res1, 10) < 0)
					st = ERROR;
				else
					st = OCTAL_OK;
			}			
			else  {
				st = ERROR;
			}
			break;

		case DEC_NEG:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res1, 10) < 0)
					st = ERROR;
				else
					st = DEC_NEG_OK;
			}
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
			else if (c == '.') {
				res1 = 0;
				st = FLOAT_NEG;
			}
#endif
			else {
				st = ERROR;
			}
			break;

		case DEC_NEG_OK:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res1, 10) < 0)
					st = ERROR;
			}
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
			else if (c == '.') {
				st = FLOAT_NEG;
			}
#endif
			else {
				st = ERROR;
			}
			break;

		case DEC_POS_OK:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res1, 10) < 0)
					st = ERROR;
			}
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
			else if (c == '.') {
				st = FLOAT_POS;
			}
#endif
			else {
				st = ERROR;
			}
			break;

		case HEX:
			st = HEX_OK;
			/* no break */
		case HEX_OK:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res1, 16) < 0)
					st = ERROR;
			}
			else if (c >= 'a' && c <= 'f') {
				if (add_to_res(c - 'a' + 10, &res1, 16) < 0)
					st = ERROR;
			}
			else if (c >= 'A' && c <= 'F') {
				if (add_to_res(c - 'A' + 10, &res1, 16) < 0)
					st = ERROR;
			}
			else {
				st = ERROR;
			}
			break;


		case OCTAL_OK:
			if (c >= '0' && c <= '7') {
				if (add_to_res(c - '0', &res1, 8) < 0)
					st = ERROR;
			}
			else {
				st = ERROR;
			}
			break;

		case BIN:
			st = BIN_OK; 
			/* no break */
		case BIN_OK:
			if (c >= '0' && c <= '1') {
				if (add_to_res(c - '0', &res1, 2) < 0)
					st = ERROR;
			}
			else {
				st = ERROR;
			}
			break;

#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
		case FLOAT_POS:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res2, 10) < 0)
					st = ERROR;
				else 
					st = FLOAT_POS_OK;
				res3 = 10;
			}
			else {
				st = ERROR;
			}
			break;

		case FLOAT_NEG:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res2, 10) < 0)
					st = ERROR;
				else 
					st = FLOAT_NEG_OK;
				res3 = 10;
			}
			else {
				st = ERROR;
			}
			break;

		case FLOAT_POS_OK:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res2, 10) < 0)
					st = ERROR;
				if (add_to_res(0, &res3, 10) < 0)
					st = ERROR;
			}
			else {
				st = ERROR;
			}
			break;

		case FLOAT_NEG_OK:
			if (c >= '0' && c <= '9') {
				if (add_to_res(c - '0', &res2, 10) < 0)
					st = ERROR;
				if (add_to_res(0, &res3, 10) < 0)
					st = ERROR;
			}
			else {
				st = ERROR;
			}
			break;
#endif

		default:
			debug_printf("not impl ");
			
		}

		/* XXX uint32_t et %d */
		debug_printf("(%d)  (%d)  (%d)\n", res1, res2, res3);

		buf ++;
		c = *buf;

		/* token too long */
		if (buf-srcbuf > 127)
			return -1;
	}
	
	switch (st) {
	case ZERO_OK:
	case DEC_POS_OK:
	case HEX_OK:
	case OCTAL_OK:
	case BIN_OK:
		if ( nd.type == INT8 && res1 <= S08_MAX ) {
			if (res)
				*(int8_t *)res = (int8_t) res1;
			return (buf-srcbuf);
		}
		else if ( nd.type == INT16 && res1 <= S16_MAX ) {
			if (res)
				*(int16_t *)res = (int16_t) res1;
			return (buf-srcbuf);
		}
		else if ( nd.type == INT32 && res1 <= S32_MAX ) {
			if (res)
				*(int32_t *)res = (int32_t) res1;
			return (buf-srcbuf);
		}
		else if ( nd.type == UINT8 && res1 <= U08_MAX ) {
			if (res)
				*(uint8_t *)res = (uint8_t) res1;
			return (buf-srcbuf);
		}
		else if (nd.type == UINT16  && res1 <= U16_MAX ) {
			if (res)
				*(uint16_t *)res = (uint16_t) res1;
			return (buf-srcbuf);
		}
		else if ( nd.type == UINT32 ) {
			if (res)
				*(uint32_t *)res = (uint32_t) res1;
			return (buf-srcbuf);
		}
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
		else if ( nd.type == FLOAT ) {
			if (res)
				*(float *)res = (float)res1;
			return (buf-srcbuf);
		}
#endif
		else {
			return -1;
		}
		break;

	case DEC_NEG_OK:
		if ( nd.type == INT8 && res1 <= S08_MAX + 1 ) {
			if (res)
				*(int8_t *)res = - (int8_t) res1;
			return (buf-srcbuf);
		}
		else if ( nd.type == INT16 && res1 <= (uint16_t)S16_MAX + 1 ) {
			if (res)
				*(int16_t *)res = - (int16_t) res1;
			return (buf-srcbuf);
		}
		else if ( nd.type == INT32 && res1 <= (uint32_t)S32_MAX + 1 ) {
			if (res)
				*(int32_t *)res = - (int32_t) res1;
			return (buf-srcbuf);
		}
#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
		else if ( nd.type == FLOAT ) {
			if (res)
				*(float *)res = - (float)res1;
			return (buf-srcbuf);
		}
#endif
		else {
			return -1;
		}
		break;

#ifndef CONFIG_MODULE_PARSE_NO_FLOAT
	case FLOAT_POS:
	case FLOAT_POS_OK:
		if ( nd.type == FLOAT ) {
			if (res)
				*(float *)res = (float)res1 + ((float)res2 / (float)res3);
			return (buf-srcbuf);
			
		}
		else {
			return -1;
		}
		break;

	case FLOAT_NEG:
	case FLOAT_NEG_OK:
		if ( nd.type == FLOAT ) {
			if (res)
				*(float *)res = - ((float)res1 + ((float)res2 / (float)res3));
			return (buf-srcbuf);
			
		}
		else {
			return -1;
		}
		break;
#endif
	default:
		debug_printf("error\n");
		return -1;
	}
	return -1;
}


/* parse an int or a float */
int8_t 
get_help_num(parse_pgm_token_hdr_t * tk, char * dstbuf, uint8_t size)
{
	struct token_num_data nd;

	memcpy_P(&nd, &((struct token_num *)tk)->num_data, sizeof(nd));
	
	/* should not happen.... don't so this test */
/* 	if (nd.type >= (sizeof(num_help)/sizeof(const char *))) */
/* 		return -1; */

	strncpy_P(dstbuf, num_help[nd.type], size);
	dstbuf[size-1] = '\0';
	return 0;
}
