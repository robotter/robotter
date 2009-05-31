/*
 *  Copyright Droids Corporation (2008)
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
 *  Revision : $Id: commands.c,v 1.2 2009-03-15 21:51:19 zer0 Exp $
 *
 *  Olivier MATZ <zer0@droids-corp.org> 
 */

#include <stdio.h>
#include <string.h>

#include <aversive/pgmspace.h>
#include <aversive/wait.h>

#include <ax12.h>
#include <parse.h>
#include <parse_num.h>
#include <parse_string.h>
#include <uart.h>


extern AX12 ax12;

uint8_t addr_from_string(const char *s)
{
	/* 16 bits */
	if (!strcmp_P(s, PSTR("cw_angle_limit")))
		return AA_CW_ANGLE_LIMIT_L;
	if (!strcmp_P(s, PSTR("ccw_angle_limit")))
		return AA_CCW_ANGLE_LIMIT_L;
	if (!strcmp_P(s, PSTR("max_torque")))
		return AA_MAX_TORQUE_L;
	if (!strcmp_P(s, PSTR("down_calibration")))
		return AA_DOWN_CALIBRATION_L;
	if (!strcmp_P(s, PSTR("up_calibration")))
		return AA_UP_CALIBRATION_L;
	if (!strcmp_P(s, PSTR("torque_limit")))
		return AA_TORQUE_LIMIT_L;
	if (!strcmp_P(s, PSTR("position")))
		return AA_PRESENT_POSITION_L;
	if (!strcmp_P(s, PSTR("speed")))
		return AA_PRESENT_SPEED_L;
	if (!strcmp_P(s, PSTR("load")))
		return AA_PRESENT_LOAD_L;
	if (!strcmp_P(s, PSTR("moving_speed")))
		return AA_MOVING_SPEED_L;
	if (!strcmp_P(s, PSTR("model")))
		return AA_MODEL_NUMBER_L;
	if (!strcmp_P(s, PSTR("goal_pos")))
		return AA_GOAL_POSITION_L;
	if (!strcmp_P(s, PSTR("punch")))
		return AA_PUNCH_L;

	/* 8 bits */
	if (!strcmp_P(s, PSTR("firmware")))
		return AA_FIRMWARE;
	if (!strcmp_P(s, PSTR("id")))
		return AA_ID;
	if (!strcmp_P(s, PSTR("baudrate")))
		return AA_BAUD_RATE;
	if (!strcmp_P(s, PSTR("delay")))
		return AA_DELAY_TIME;
	if (!strcmp_P(s, PSTR("high_lim_temp")))
		return AA_HIGHEST_LIMIT_TEMP;
	if (!strcmp_P(s, PSTR("low_lim_volt")))
		return AA_LOWEST_LIMIT_VOLTAGE;
	if (!strcmp_P(s, PSTR("high_lim_volt")))
		return AA_HIGHEST_LIMIT_VOLTAGE;
	if (!strcmp_P(s, PSTR("status_return")))
		return AA_STATUS_RETURN_LEVEL;
	if (!strcmp_P(s, PSTR("alarm_led")))
		return AA_ALARM_LED;
	if (!strcmp_P(s, PSTR("alarm_shutdown")))
		return AA_ALARM_SHUTDOWN;
	if (!strcmp_P(s, PSTR("torque_enable")))
		return AA_TORQUE_ENABLE;
	if (!strcmp_P(s, PSTR("led")))
		return AA_LED;
	if (!strcmp_P(s, PSTR("cw_comp_margin")))
		return AA_CW_COMPLIANCE_MARGIN;
	if (!strcmp_P(s, PSTR("ccw_comp_margin")))
		return AA_CCW_COMPLIANCE_MARGIN;
	if (!strcmp_P(s, PSTR("cw_comp_slope")))
		return AA_CW_COMPLIANCE_SLOPE;
	if (!strcmp_P(s, PSTR("ccw_comp_slope")))
		return AA_CCW_COMPLIANCE_SLOPE;
	if (!strcmp_P(s, PSTR("voltage")))
		return AA_PRESENT_VOLTAGE;
	if (!strcmp_P(s, PSTR("temp")))
		return AA_PRESENT_TEMP;
	if (!strcmp_P(s, PSTR("reginst")))
		return AA_PRESENT_REGINST;
	if (!strcmp_P(s, PSTR("moving")))
		return AA_MOVING;
	if (!strcmp_P(s, PSTR("lock")))
		return AA_LOCK;
	
	return 0;
}



/**********************************************************/
/* Reset */

/* this structure is filled when cmd_reset is parsed successfully */
struct cmd_reset_result {
	fixed_string_t arg0;
};

/* function called when cmd_reset is parsed successfully */
static void cmd_reset_parsed(void * parsed_result, void * data)
{
	reset();
}

prog_char str_reset_arg0[] = "reset";
parse_pgm_token_string_t cmd_reset_arg0 = TOKEN_STRING_INITIALIZER(struct cmd_reset_result, arg0, str_reset_arg0);

prog_char help_reset[] = "Reset the board";
parse_pgm_inst_t cmd_reset = {
	.f = cmd_reset_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_reset,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_reset_arg0, 
		NULL,
	},
};

/**********************************************************/
/* Test */

/* this structure is filled when cmd_test is parsed successfully */
struct cmd_test_result {
	fixed_string_t arg0;
};

/* function called when cmd_test is parsed successfully */
static void cmd_test_parsed(void * parsed_result, void * data)
{
	/* Set some AX12 parameters */
	AX12_write_int(&ax12,0xFE,AA_PUNCH_L,0x20);
	AX12_write_int(&ax12,0xFE,AA_TORQUE_LIMIT_L,0x3FF);
	AX12_write_int(&ax12,0xFE,AA_MOVING_SPEED_L,0x2FF);
	AX12_write_byte(&ax12,0xFE,AA_ALARM_LED,0xEF);

	AX12_set_position(&ax12,0xFE,0x1FF - 0x130);
	wait_ms(800);
	AX12_set_position(&ax12,0xFE,0x1FF + 0x130);
	wait_ms(800);
}

prog_char str_test_arg0[] = "test";
parse_pgm_token_string_t cmd_test_arg0 = TOKEN_STRING_INITIALIZER(struct cmd_test_result, arg0, str_test_arg0);

prog_char help_test[] = "Test func";
parse_pgm_inst_t cmd_test = {
	.f = cmd_test_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_test,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_test_arg0, 
		NULL,
	},
};

/**********************************************************/

/* this structure is filled when cmd_test is parsed successfully */
struct cmd_baudrate_result {
	fixed_string_t arg0;
	uint32_t arg1;
};

/* function called when cmd_baudrate is parsed successfully */
static void cmd_baudrate_parsed(void * parsed_result, void * data)
{
	struct cmd_baudrate_result *res = parsed_result;
	struct uart_config c;

	uart_getconf(1, &c);
	c.baudrate = res->arg1;
	uart_setconf(1, &c);
	printf_P(PSTR("%d %d\r\n"), UBRR1H, UBRR1L);
}

prog_char str_baudrate_arg0[] = "baudrate";
parse_pgm_token_string_t cmd_baudrate_arg0 = TOKEN_STRING_INITIALIZER(struct cmd_baudrate_result, arg0, str_baudrate_arg0);
parse_pgm_token_num_t cmd_baudrate_arg1 = TOKEN_NUM_INITIALIZER(struct cmd_baudrate_result, arg1, UINT32);

prog_char help_baudrate[] = "Change ax12 baudrate";
parse_pgm_inst_t cmd_baudrate = {
	.f = cmd_baudrate_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_baudrate,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_baudrate_arg0, 
		(prog_void *)&cmd_baudrate_arg1, 
		NULL,
	},
};

/**********************************************************/
/* Uint16 */


/* this structure is filled when cmd_uint16_read is parsed successfully */
struct cmd_uint16_result {
	fixed_string_t arg0;
	fixed_string_t arg1;
	uint8_t num;
	uint16_t val;
};

/* function called when cmd_uint16_read is parsed successfully */
static void cmd_uint16_read_parsed(void * parsed_result, void * data)
{
	struct cmd_uint16_result *res = parsed_result;
	uint8_t ret;
	uint16_t val;
	uint8_t addr = addr_from_string(res->arg1);
	ret = AX12_read_int(&ax12, res->num, addr, &val);
	if (ret)
		printf_P(PSTR("AX12 error %.2x!\r\n"), ret);
	printf_P(PSTR("%s: %d [0x%.4x]\r\n"), res->arg1, val, val);
}

prog_char str_uint16_arg0[] = "read";
parse_pgm_token_string_t cmd_uint16_arg0 = TOKEN_STRING_INITIALIZER(struct cmd_uint16_result, arg0, str_uint16_arg0);
prog_char str_uint16_arg1[] = "moving_speed#model#goal_pos#cw_angle_limit#ccw_angle_limit#"
		"max_torque#down_calibration#up_calibration#torque_limit#"
		"position#speed#load#punch";
parse_pgm_token_string_t cmd_uint16_arg1 = TOKEN_STRING_INITIALIZER(struct cmd_uint16_result, arg1, str_uint16_arg1);
parse_pgm_token_num_t cmd_uint16_num = TOKEN_NUM_INITIALIZER(struct cmd_uint16_result, num, UINT8);

prog_char help_uint16_read[] = "Read uint16 value (type, num)";
parse_pgm_inst_t cmd_uint16_read = {
	.f = cmd_uint16_read_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_uint16_read,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_uint16_arg0,
		(prog_void *)&cmd_uint16_arg1,
		(prog_void *)&cmd_uint16_num,
		NULL,
	},
};

/* function called when cmd_uint16_write is parsed successfully */
static void cmd_uint16_write_parsed(void * parsed_result, void * data)
{
	struct cmd_uint16_result *res = parsed_result;
	uint8_t ret;
	uint8_t addr = addr_from_string(res->arg1);
	printf_P(PSTR("writing %s: %d [0x%.4x]\r\n"), res->arg1,
		 res->val, res->val);
	ret = AX12_write_int(&ax12, res->num, addr, res->val);
	if (ret)
		printf_P(PSTR("AX12 error %.2x!\r\n"), ret);
}

prog_char str_uint16_arg0_w[] = "write";
parse_pgm_token_string_t cmd_uint16_arg0_w = TOKEN_STRING_INITIALIZER(struct cmd_uint16_result, arg0, str_uint16_arg0_w);
prog_char str_uint16_arg1_w[] = "moving_speed#goal_pos#cw_angle_limit#ccw_angle_limit#"
		"max_torque#torque_limit#punch";
parse_pgm_token_string_t cmd_uint16_arg1_w = TOKEN_STRING_INITIALIZER(struct cmd_uint16_result, arg1, str_uint16_arg1_w);
parse_pgm_token_num_t cmd_uint16_val = TOKEN_NUM_INITIALIZER(struct cmd_uint16_result, val, UINT16);

prog_char help_uint16_write[] = "Write uint16 value (write, num, val)";
parse_pgm_inst_t cmd_uint16_write = {
	.f = cmd_uint16_write_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_uint16_write,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_uint16_arg0_w,
		(prog_void *)&cmd_uint16_arg1_w,
		(prog_void *)&cmd_uint16_num,
		(prog_void *)&cmd_uint16_val,
		NULL,
	},
};

/**********************************************************/
/* Uint8 */


/* this structure is filled when cmd_uint8_read is parsed successfully */
struct cmd_uint8_result {
	fixed_string_t arg0;
	fixed_string_t arg1;
	uint8_t num;
	uint8_t val;
};

/* function called when cmd_uint8_read is parsed successfully */
static void cmd_uint8_read_parsed(void * parsed_result, void * data)
{
	struct cmd_uint8_result *res = parsed_result;
	uint8_t ret;
	uint8_t val;
	uint8_t addr = addr_from_string(res->arg1);

	ret = AX12_read_byte(&ax12, res->num, addr, &val);
	if (ret)
		printf_P(PSTR("AX12 error %.2x!\r\n"), ret);
	printf_P(PSTR("%s: %d [0x%.2x]\r\n"), res->arg1, val, val);
}

prog_char str_uint8_arg0[] = "read";
parse_pgm_token_string_t cmd_uint8_arg0 = TOKEN_STRING_INITIALIZER(struct cmd_uint8_result, arg0, str_uint8_arg0);
prog_char str_uint8_arg1[] = "id#firmware#baudrate#delay#high_lim_temp#"
		"low_lim_volt#high_lim_volt#status_return#alarm_led#"
		"alarm_shutdown#torque_enable#led#cw_comp_margin#"
		"ccw_comp_margin#cw_comp_slope#ccw_comp_slope#"
		"voltage#temp#reginst#moving#lock";
parse_pgm_token_string_t cmd_uint8_arg1 = TOKEN_STRING_INITIALIZER(struct cmd_uint8_result, arg1, str_uint8_arg1);
parse_pgm_token_num_t cmd_uint8_num = TOKEN_NUM_INITIALIZER(struct cmd_uint8_result, num, UINT8);

prog_char help_uint8_read[] = "Read uint8 value (type, num)";
parse_pgm_inst_t cmd_uint8_read = {
	.f = cmd_uint8_read_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_uint8_read,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_uint8_arg0,
		(prog_void *)&cmd_uint8_arg1,
		(prog_void *)&cmd_uint8_num,
		NULL,
	},
};

/* function called when cmd_uint8_write is parsed successfully */
static void cmd_uint8_write_parsed(void * parsed_result, void * data)
{
	struct cmd_uint8_result *res = parsed_result;
	uint8_t addr = addr_from_string(res->arg1);
	uint8_t ret;
	printf_P(PSTR("writing %s: %d [0x%.2x]\r\n"), res->arg1, 
		 res->val, res->val);
	ret = AX12_write_byte(&ax12, res->num, addr, res->val);
	if (ret)
		printf_P(PSTR("AX12 error %.2x!\r\n"), ret);
}

prog_char str_uint8_arg0_w[] = "write";
parse_pgm_token_string_t cmd_uint8_arg0_w = TOKEN_STRING_INITIALIZER(struct cmd_uint8_result, arg0, str_uint8_arg0_w);
prog_char str_uint8_arg1_w[] = "id#baudrate#delay#high_lim_temp#"
		"low_lim_volt#high_lim_volt#status_return#alarm_led#"
		"alarm_shutdown#torque_enable#led#cw_comp_margin#"
		"ccw_comp_margin#cw_comp_slope#ccw_comp_slope#"
		"reginst#lock";
parse_pgm_token_string_t cmd_uint8_arg1_w = TOKEN_STRING_INITIALIZER(struct cmd_uint8_result, arg1, str_uint8_arg1_w);
parse_pgm_token_num_t cmd_uint8_val = TOKEN_NUM_INITIALIZER(struct cmd_uint8_result, val, UINT8);

prog_char help_uint8_write[] = "Write uint8 value (write, num, val)";
parse_pgm_inst_t cmd_uint8_write = {
	.f = cmd_uint8_write_parsed,  /* function to call */
	.data = NULL,      /* 2nd arg of func */
	.help_str = help_uint8_write,
	.tokens = {        /* token list, NULL terminated */
		(prog_void *)&cmd_uint8_arg0_w,
		(prog_void *)&cmd_uint8_arg1_w,
		(prog_void *)&cmd_uint8_num,
		(prog_void *)&cmd_uint8_val,
		NULL,
	},
};


/* in progmem */
parse_pgm_ctx_t main_ctx[] = {
	(parse_pgm_inst_t *)&cmd_reset,
	(parse_pgm_inst_t *)&cmd_test,
	(parse_pgm_inst_t *)&cmd_baudrate,
	(parse_pgm_inst_t *)&cmd_uint16_read,
	(parse_pgm_inst_t *)&cmd_uint16_write,
	(parse_pgm_inst_t *)&cmd_uint8_read,
	(parse_pgm_inst_t *)&cmd_uint8_write,
	NULL,
};
