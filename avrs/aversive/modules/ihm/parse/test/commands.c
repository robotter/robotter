#include <math.h>
#include <stdio.h>
#include <string.h>

#include <aversive/pgmspace.h>
#include <aversive/wait.h>

#include <parse.h>
#include <parse_num.h>
#include <parse_string.h>



/**********************************************************/
/* operations on float */

/* this structure is filled when cmd_float is parsed successfully */
struct cmd_float_result {
	float a;
	fixed_string_t op;
	float b;
};

/* function called when cmd_float is parsed successfully */
static void cmd_float_parsed(void * parsed_result, void * data)
{
	struct cmd_float_result * cmd = (struct cmd_float_result *) parsed_result;
	float res=0.;

	switch(cmd->op[0]) {
	case '+': res = cmd->a + cmd->b; break;
	case '-': res = cmd->a - cmd->b; break;
	case '*': res = cmd->a * cmd->b; break;
	case '/': res = cmd->a / cmd->b; break;
	default: break;
	}
	printf_P(PSTR("%f\n"), res);
}

parse_pgm_token_num_t cmd_float_a = TOKEN_NUM_INITIALIZER(struct cmd_float_result, a, FLOAT);
prog_char str_float_op[] = "+#-#*#/";
parse_pgm_token_string_t cmd_float_op = TOKEN_STRING_INITIALIZER(struct cmd_float_result, op, str_float_op);
parse_pgm_token_num_t cmd_float_b = TOKEN_NUM_INITIALIZER(struct cmd_float_result, b, FLOAT);

prog_char help_float[] = "Operation on float (ex: '2 + 5.4')";
parse_pgm_inst_t cmd_float = {
	.f = cmd_float_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_float,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_float_a, 
		(prog_void *)&cmd_float_op, 
		(prog_void *)&cmd_float_b, 
		NULL,
	},
};


/**********************************************************/
/* operations on trigo */

/* this structure is filled when cmd_trigo is parsed successfully */
struct cmd_trigo_result {
	fixed_string_t op;
	float a;
};

/* function called when cmd_trigo is parsed successfully */
static void cmd_trigo_parsed(void * parsed_result, void * data)
{
	struct cmd_trigo_result * cmd = (struct cmd_trigo_result *) parsed_result;
	float res=0.;
	
	if (!strcmp_P(cmd->op, PSTR("sin"))) {
		res = sin(cmd->a);
	}

	else if (!strcmp_P(cmd->op, PSTR("cos"))) {
		res = cos(cmd->a);
	}

	else if (!strcmp_P(cmd->op, PSTR("tan"))) {
		res = tan(cmd->a);
	}

	printf_P(PSTR("%f\n"), res);
}

prog_char str_trigo_op[] = "sin#tan#cos";
parse_pgm_token_string_t cmd_trigo_op = TOKEN_STRING_INITIALIZER(struct cmd_trigo_result, op, str_trigo_op);
parse_pgm_token_num_t cmd_trigo_a = TOKEN_NUM_INITIALIZER(struct cmd_trigo_result, a, FLOAT);

prog_char help_trigo[] = "Trigonometric operations (ex: 'sin 2.03')";
parse_pgm_inst_t cmd_trigo = {
	.f = cmd_trigo_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_trigo,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_trigo_op, 
		(prog_void *)&cmd_trigo_a, 
		NULL,
	},
};


/**********************************************************/
/* Help */

/* this structure is filled when cmd_help is parsed successfully */
struct cmd_help_result {
	fixed_string_t arg0;
};

/* function called when cmd_help is parsed successfully */
static void cmd_help_parsed(void * parsed_result, void * data)
{
	printf_P(PSTR("== Simple calculator program ==\n"
		      "You can do simple operations on floats, like '1 + 3'\n"
		      "or '4.4 * 2.' (space is important).\n"
		      "Some trigonometric operations are available, like\n"
		      "'sin 4.5'.\n"));
}

prog_char str_help_arg0[] = "help";
parse_pgm_token_string_t cmd_help_arg0 = TOKEN_STRING_INITIALIZER(struct cmd_help_result, arg0, str_help_arg0);

prog_char help_help[] = "Display help";
parse_pgm_inst_t cmd_help = {
	.f = cmd_help_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_help,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_help_arg0, 
		NULL,
	},
};




/**********************************************************/
/**********************************************************/
/****** CONTEXT (list of instruction) */

/* in progmem */
parse_pgm_ctx_t main_ctx[] = {
	(parse_pgm_inst_t *)&cmd_float, 
	(parse_pgm_inst_t *)&cmd_trigo, 
	(parse_pgm_inst_t *)&cmd_help, 
	NULL,
};

