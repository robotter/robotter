#include <stdio.h>
#include <string.h>

#include <aversive/wait.h>
#include <aversive/list.h>
#include <uart.h>


LIST_TYPEDEF(fifo_t, char, 32);
volatile fifo_t my_fifo;

#define SCANCODE_MAX_SIZE 8

#define SCANCODE_BREAK        1 /* break code */
#define SCANCODE_EXTENDED     2 /* is extended */
#define SCANCODE_HAS_NO_BREAK 4 /* no associated break code */

struct scancode {
	uint8_t buf[SCANCODE_MAX_SIZE];
	uint8_t size;
	uint8_t idx;
	uint8_t flags;
};

char tab[] = {
	/***** 0x00 */
	0,  
	0,  /* F9 */
	0,  
	0,  /* F5 */
	0,  /* F3 */
	0,  /* F1 */
	0,  /* F2 */
	0,  /* F12 */
	0, 
	0,  /* F10 */
	0,  /* F8 */
	0,  /* F6 */
	0,  /* F4 */
	0,  /* TAB */
	'E',  /* E */
	0, 

	/***** 0x10 */
	0, 
	0,  /* AltL */
	0,  /* ShiftL */
	0, 
	0,  /* CtrlL */
	'Q',  /* Q */
	'1',  /* 1 */
	0, 
	0, 
	0, 
	'Z',  /* Z */
	'S',  /* S */
	'A',  /* A */
	'W',  /* W */
	'2',  /* 2 */
	0, 

	/***** 0x20 */
	0, 
	'C',  /* C */
	'X',  /* X */
	'D',  /* D */
	'E',  /* E */
	'4',  /* 4 */
	'3',  /* 3 */
	0, 
	0, 
	0,  /* Space */
	'V',  /* V */
	'F',  /* F */
	'T',  /* T */
	'R',  /* R */
	'5',  /* 5 */
	0, 

	/***** 0x30 */
	0, 
	'N',  /* N */
	'B',  /* B */
	'H',  /* H */
	'G',  /* G */
	'Y',  /* Y */
	'6',  /* 6 */
	0, 
	0, 
	0, 
	'M',  /* M */
	'J',  /* J */
	'U',  /* U */
	'7',  /* 7 */
	'8',  /* 8 */
	0, 

	/***** 0x40 */
	0, 
	'<',  /* < */
	'K',  /* K */
	'I',  /* I */
	'O',  /* O */
	'0',  /* 0 */
	'9',  /* 9 */
	0, 
	0, 
	'>',  /* > */
	'?',  /* ? */
	'L',  /* L */
	':',  /* : */
	'P',  /* P */
	'-',  /* - */
	0, 

	/***** 0x50 */
	0, 
	0, 
	'"',  /* " */
	0, 
	'[',  /* [ */
	'a',  /* a */
	0, 
	0, 
	0,  /* CapsLk */
	0,  /* ShiftR */
	0,  /* EnterL */
	']',  /* ] */
	0, 
	'\\',  /* \\ */
	0, 
	0, 

	/***** 0x60 */
	0, 
	0,  /* Macro */
	0, 
	0, 
	0, 
	0, 
	0,  /* BS */
	0, 
	0, 
	'1',  /* 1 */
	0, 
	'4',  /* 4 */
	'7',  /* 7 */
	0, 
	0, 
	0, 

	/***** 0x70 */
	'0',  /* 0 */
	0,  /* Del */
	'2',  /* 2 */
	'5',  /* 5 */
	'6',  /* 6 */
	'8',  /* 8 */
	0,  /* Esc */
	0,  /* NumLk */
	0,  /* F11 */
	'+',  /* + */
	'3',  /* 3 */
	'-',  /* - */
	'*',  /* * */
	'9',  /* 9 */
	0,  /* ScrLk */
	0, 

	/***** 0x80 */
	0, 
	0, 
	0, 
	0,  /* F7 */
	0,  /* Alt-PRTSC */

#define SCANCODE_EXTENDED_LIST               "\x11\x14\x4A\x5A\x69\x6B\x6C\x70\x71\x72\x74\x75\x7A\x7C\x7D"
#define SCANCODE_EXTENDED_LIST_SIZE          15
#define SCANCODE_EXTENDED_LIST_OFFSET        0x85

	0, /* 0x0E11 AltR */
	0, /* 0x0E14 CtrlR */
	0, /* 0x0E4A / */
	0, /* 0x0E5A Enter */
	0, /* 0x0E69 End */
	0, /* 0x0E6B Left */
	0, /* 0x0E6C Home */
	0, /* 0x0E70 Insert */
	0, /* 0x0E71 Delete */
	0, /* 0x0E72 Down */
	0, /* 0x0E74 Right */

	/***** 0x90 */
	0, /* 0x0E75 Up */
	0, /* 0x0E7A Pgdn */
	0, /* 0x0E7C Ctrl-Prtscr */
	0, /* 0x0E7D Pgup */



	/* Exceptions */

#define SCANCODE_VAL_PAUSE                    "\xE1\x14\x77\xE1\xF0\x14\xF0\x77"
#define SCANCODE_VAL_PAUSE_SIZE               8
#define SCANCODE_VAL_PAUSE_OFFSET             0

#define SCANCODE_VAL_PRTSCR_BREAK             "\xE0\xF0\x12\xE0\xF0\x7C"
#define SCANCODE_VAL_PRTSCR_BREAK_SIZE        6
#define SCANCODE_VAL_PRTSCR_BREAK_OFFSET      1

#define SCANCODE_VAL_CTRL_PAUSE               "\xE0\x7E\xE0\xF0\x7E"
#define SCANCODE_VAL_CTRL_PAUSE_SIZE          5
#define SCANCODE_VAL_CTRL_PAUSE_OFFSET        2

#define SCANCODE_VAL_SHIFT_SLASH              "\xE0\xF0\x12\xE0\x4A"
#define SCANCODE_VAL_SHIFT_SLASH_SIZE         5
#define SCANCODE_VAL_SHIFT_SLASH_OFFSET       3

#define SCANCODE_VAL_SHIFT_SLASH_BREAK        "\xE0\xF0\x4A\xE0\x12"
#define SCANCODE_VAL_SHIFT_SLASH_BREAK_SIZE   5
#define SCANCODE_VAL_SHIFT_SLASH_BREAK_OFFSET 3

#define SCANCODE_VAL_PRTSCR                   "\xE0\x12\xE0\x7C"
#define SCANCODE_VAL_PRTSCR_SIZE              4
#define SCANCODE_VAL_PRTSCR_OFFSET            1


	0, /* E11477E1F014F077 PAUSE */
	0, /* E012E07C PRTSCR */
	0, /* E07EE0F07E CTRL_PAUSE */
	0, /* E0F012E04A SHIFT_SLASH */
	0, /* E012E07C */
};

char * scancode_extended_list = SCANCODE_EXTENDED_LIST;




int8_t get_scancode(struct scancode *s)
{
	char * p;

	s->flags = 0;
	s->size = LIST_TO_ARRAY(my_fifo, s->buf, SCANCODE_MAX_SIZE);
	printf("%d\n", s->size);

	if (!s->size)
		return -1;
	
	/* special case for 'pause' */
	if (s->size >=  SCANCODE_VAL_PAUSE_SIZE && 
	    !memcmp(SCANCODE_VAL_PAUSE, s->buf, SCANCODE_VAL_PAUSE_SIZE)) {
		s->flags |= (SCANCODE_EXTENDED | SCANCODE_HAS_NO_BREAK);
		s->size = SCANCODE_VAL_PAUSE_SIZE;
		s->idx = SCANCODE_EXTENDED_LIST_OFFSET + SCANCODE_EXTENDED_LIST_SIZE + SCANCODE_VAL_PAUSE_OFFSET;
		return 0;
	}


	/* extended codes */
	if (s->buf[0] == 0xE0 && s->size >= 2) {
		s->flags |= SCANCODE_EXTENDED;
		
		/* special case for 'prtscr break' */
		if (s->size >=  SCANCODE_VAL_PRTSCR_BREAK_SIZE && 
		    !memcmp(SCANCODE_VAL_PRTSCR_BREAK, s->buf, SCANCODE_VAL_PRTSCR_BREAK_SIZE)) {
			s->flags |= SCANCODE_BREAK;
			s->size = SCANCODE_VAL_PRTSCR_BREAK_SIZE;
			s->idx = SCANCODE_EXTENDED_LIST_OFFSET + SCANCODE_EXTENDED_LIST_SIZE + SCANCODE_VAL_PRTSCR_BREAK_OFFSET;
			return 0;
		}

		/* special case for 'ctrl_pause' */
		if (s->size >=  SCANCODE_VAL_CTRL_PAUSE_SIZE && 
		    !memcmp(SCANCODE_VAL_CTRL_PAUSE, s->buf, SCANCODE_VAL_CTRL_PAUSE_SIZE)) {
			s->flags |= SCANCODE_HAS_NO_BREAK;
			s->size = SCANCODE_VAL_CTRL_PAUSE_SIZE;
			s->idx = SCANCODE_EXTENDED_LIST_OFFSET + SCANCODE_EXTENDED_LIST_SIZE + SCANCODE_VAL_CTRL_PAUSE_OFFSET;
			return 0;
		}

		/* special case for 'shift_slash' */
		if (s->size >=  SCANCODE_VAL_SHIFT_SLASH_SIZE && 
		    !memcmp(SCANCODE_VAL_SHIFT_SLASH, s->buf, SCANCODE_VAL_SHIFT_SLASH_SIZE)) {
			s->size = SCANCODE_VAL_SHIFT_SLASH_SIZE;
			s->idx = SCANCODE_EXTENDED_LIST_OFFSET + SCANCODE_EXTENDED_LIST_SIZE + SCANCODE_VAL_SHIFT_SLASH_OFFSET;
			return 0;
		}

		/* special case for 'shift_slash_break' */
		if (s->size >=  SCANCODE_VAL_SHIFT_SLASH_BREAK_SIZE && 
		    !memcmp(SCANCODE_VAL_SHIFT_SLASH_BREAK, s->buf, SCANCODE_VAL_SHIFT_SLASH_BREAK_SIZE)) {
			s->flags |= SCANCODE_BREAK;
			s->size = SCANCODE_VAL_SHIFT_SLASH_BREAK_SIZE;
			s->idx = SCANCODE_EXTENDED_LIST_OFFSET + SCANCODE_EXTENDED_LIST_SIZE + SCANCODE_VAL_SHIFT_SLASH_BREAK_OFFSET;
			return 0;
		}

		/* special case for 'prtscr' */
		if (s->size >=  SCANCODE_VAL_PRTSCR_SIZE && 
		    !memcmp(SCANCODE_VAL_PRTSCR, s->buf, SCANCODE_VAL_PRTSCR_SIZE)) {
			s->size = SCANCODE_VAL_PRTSCR_SIZE;
			s->idx = SCANCODE_EXTENDED_LIST_OFFSET +SCANCODE_EXTENDED_LIST_SIZE +  SCANCODE_VAL_PRTSCR_OFFSET;
			return 0;
		}

		/* break for extended codes */
		if (s->size >= 3 && s->buf[1] == 0xF0) {
			s->flags |= SCANCODE_BREAK;
			s->size = 3;
			p = strchr(scancode_extended_list, s->buf[2]);
			if (!p)
				return -1;
			s->idx = (p - scancode_extended_list) + SCANCODE_EXTENDED_LIST_OFFSET;
			return 0;
		}

		/* ext scancode, 2 bytes */
		s->size = 2;
		p = strchr(scancode_extended_list, s->buf[2]);
		if (!p)
			return -1;
		s->idx = (p - scancode_extended_list) + SCANCODE_EXTENDED_LIST_OFFSET;
		return 0;
	}

	/* break scancode (2 bytes) */
	if (s->buf[0] == 0xF0) {
		s->flags |= SCANCODE_BREAK;
		s->size = 2;
		s->idx = s->buf[1];
		if (s->idx >= SCANCODE_EXTENDED_LIST_OFFSET)
			return -1;
		return 0;
	}

	/* simple scancode, 1 byte */
	s->idx = s->buf[0];
	if (s->idx >= SCANCODE_EXTENDED_LIST_OFFSET)
		return -1;

	s->size = 1;
	return 0;
}

void print_scancode(struct scancode *s)
{
	uint8_t i;
	printf("[ ");
	for (i=0 ; i<s->size ; i++)
		printf("%.2x ", s->buf[i]);
	printf("] '%c' ", tab[s->idx]);
	if (s->flags & SCANCODE_BREAK)
		printf("BREAK ");
	if (s->flags & SCANCODE_EXTENDED)
		printf("EXTENDED ");
	if (s->flags & SCANCODE_HAS_NO_BREAK)
		printf("HAS_NO_BREAK ");
	printf("idx=%d\r\n", s->idx);
}

int main(void)
{
	struct scancode s;
	char c;

	LIST_INIT(my_fifo, 0);

	LIST_PUSH_END(my_fifo, 0x35);
	LIST_PUSH_END(my_fifo, 0xF0);
	LIST_PUSH_END(my_fifo, 0x35);

	LIST_PUSH_END(my_fifo, 0xE1);
	LIST_PUSH_END(my_fifo, 0x14);
	LIST_PUSH_END(my_fifo, 0x77);
	LIST_PUSH_END(my_fifo, 0xE1);
	LIST_PUSH_END(my_fifo, 0xF0);
	LIST_PUSH_END(my_fifo, 0x14);
	LIST_PUSH_END(my_fifo, 0xF0);
	LIST_PUSH_END(my_fifo, 0x77);

	LIST_PUSH_END(my_fifo, 0xE0);
	LIST_PUSH_END(my_fifo, 0xF0);
	LIST_PUSH_END(my_fifo, 0x12);
	LIST_PUSH_END(my_fifo, 0xE0);
	LIST_PUSH_END(my_fifo, 0x4A);

	LIST_PUSH_END(my_fifo, 0xE0);
	LIST_PUSH_END(my_fifo, 0xF0);
	LIST_PUSH_END(my_fifo, 0x11);



	while(get_scancode(&s) >= 0) {
		print_scancode(&s);
		while(s.size--)
			LIST_PULL_START(my_fifo, &c);	
	}
	
	return 0;
}
