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
 *  Revision : $Id: main.c,v 1.6 2007-06-14 16:34:03 zer0 Exp $
 *
 */

#include <stdio.h>
#include <math.h>

#include <uart.h>
#include <f64.h>
#include <f32.h>
#include <f16.h>

#define A 6.25
#define B -4.684
#define C 0.0566

int f64_test(void)
{
    f64 a,b,c;

    a = f64_from_double(A);
    b = f64_from_double(B);
    c = f64_from_double(C);

    printf("************ F64\n\n");

    printf("*** ADD\n\n");
    printf("Result is        ");
    f64_print(f64_add(a,b));
    printf("\nResult should be %f\n\n", A+B);
    printf("Result is        ");
    f64_print(f64_add(b,c));
    printf("\nResult should be %f\n\n", B+C);
    printf("Result is        ");
    f64_print(f64_add(c,a));
    printf("\nResult should be %f\n\n", C+A);

    printf("*** SUB\n\n");
    printf("Result is        ");
    f64_print(f64_sub(a,b));
    printf("\nResult should be %f\n\n", A-B);
    printf("Result is        ");
    f64_print(f64_sub(b,c));
    printf("\nResult should be %f\n\n", B-C);
    printf("Result is        ");
    f64_print(f64_sub(c,a));
    printf("\nResult should be %f\n\n", C-A);

    printf("*** INV\n\n");
    printf("Result is        ");
    f64_print(f64_inv(a));
    printf("\nResult should be %f\n\n", 1.0/A);
    printf("Result is        ");
    f64_print(f64_inv(b));
    printf("\nResult should be %f\n\n", 1.0/B);
    printf("Result is        ");
    f64_print(f64_inv(c));
    printf("\nResult should be %f\n\n", 1.0/C);

    printf("*** MUL\n\n");
    printf("Result is        ");
    f64_print(f64_mul(a,b));
    printf("\nResult should be %f\n\n", A*B);
    printf("Result is        ");
    f64_print(f64_mul(b,c));
    printf("\nResult should be %f\n\n", B*C);
    printf("Result is        ");
    f64_print(f64_mul(c,a));
    printf("\nResult should be %f\n\n", C*A);

    printf("*** DIV\n\n");
    printf("Result is        ");
    f64_print(f64_div(a,b));
    printf("\nResult should be %f\n\n", A/B);
    printf("Result is        ");
    f64_print(f64_div(b,c));
    printf("\nResult should be %f\n\n", B/C);
    printf("Result is        ");
    f64_print(f64_div(c,a));
    printf("\nResult should be %f\n\n", C/A);

    printf("*** SQRT\n\n");
    printf("Result is        ");
    f64_print(f64_sqrt(a));
    f64_sqrt(a);
    printf("\nResult should be %f\n\n", sqrt(A));
    printf("Result is        ");
    f64_print(f64_sqrt(b));
    printf("\nResult should be %f\n\n", sqrt(B));
    printf("Result is        ");
    f64_print(f64_sqrt(c));
    printf("\nResult should be %f\n\n", sqrt(C));


    return 0;
}


int f32_test(void)
{
    f32 a,b,c;

    a = f32_from_double(A);
    b = f32_from_double(B);
    c = f32_from_double(C);

    printf("************ F32\n\n");

    printf("*** ADD\n\n");
    printf("Result is        ");
    f32_print(f32_add(a,b));
    printf("\nResult should be %f\n\n", A+B);
    printf("Result is        ");
    f32_print(f32_add(b,c));
    printf("\nResult should be %f\n\n", B+C);
    printf("Result is        ");
    f32_print(f32_add(c,a));
    printf("\nResult should be %f\n\n", C+A);

    printf("*** SUB\n\n");
    printf("Result is        ");
    f32_print(f32_sub(a,b));
    printf("\nResult should be %f\n\n", A-B);
    printf("Result is        ");
    f32_print(f32_sub(b,c));
    printf("\nResult should be %f\n\n", B-C);
    printf("Result is        ");
    f32_print(f32_sub(c,a));
    printf("\nResult should be %f\n\n", C-A);

    printf("*** INV\n\n");
    printf("Result is        ");
    f32_print(f32_inv(a));
    printf("\nResult should be %f\n\n", 1.0/A);
    printf("Result is        ");
    f32_print(f32_inv(b));
    printf("\nResult should be %f\n\n", 1.0/B);
    printf("Result is        ");
    f32_print(f32_inv(c));
    printf("\nResult should be %f\n\n", 1.0/C);

    printf("*** MUL\n\n");
    printf("Result is        ");
    f32_print(f32_mul(a,b));
    printf("\nResult should be %f\n\n", A*B);
    printf("Result is        ");
    f32_print(f32_mul(b,c));
    printf("\nResult should be %f\n\n", B*C);
    printf("Result is        ");
    f32_print(f32_mul(c,a));
    printf("\nResult should be %f\n\n", C*A);

    printf("*** DIV\n\n");
    printf("Result is        ");
    f32_print(f32_div(a,b));
    printf("\nResult should be %f\n\n", A/B);
    printf("Result is        ");
    f32_print(f32_div(b,c));
    printf("\nResult should be %f\n\n", B/C);
    printf("Result is        ");
    f32_print(f32_div(c,a));
    printf("\nResult should be %f\n\n", C/A);

    printf("*** SQRT\n\n");
    printf("Result is        ");
    f32_print(f32_sqrt(a));
    printf("\nResult should be %f\n\n", sqrt(A));
    printf("Result is        ");
    f32_print(f32_sqrt(b));
    printf("\nResult should be %f\n\n", sqrt(B));
    printf("Result is        ");
    f32_print(f32_sqrt(c));
    printf("\nResult should be %f\n\n", sqrt(C));


    return 0;
}

int f16_test(void)
{
    f16 a,b,c;

    a = f16_from_double(A);
    b = f16_from_double(B);
    c = f16_from_double(C);

    printf("************ F16\n\n");

    printf("*** ADD\n\n");
    printf("Result is        ");
    f16_print(f16_add(a,b));
    printf("\nResult should be %f\n\n", A+B);
    printf("Result is        ");
    f16_print(f16_add(b,c));
    printf("\nResult should be %f\n\n", B+C);
    printf("Result is        ");
    f16_print(f16_add(c,a));
    printf("\nResult should be %f\n\n", C+A);

    printf("*** SUB\n\n");
    printf("Result is        ");
    f16_print(f16_sub(a,b));
    printf("\nResult should be %f\n\n", A-B);
    printf("Result is        ");
    f16_print(f16_sub(b,c));
    printf("\nResult should be %f\n\n", B-C);
    printf("Result is        ");
    f16_print(f16_sub(c,a));
    printf("\nResult should be %f\n\n", C-A);

    printf("*** INV\n\n");
    printf("Result is        ");
    f16_print(f16_inv(a));
    printf("\nResult should be %f\n\n", 1.0/A);
    printf("Result is        ");
    f16_print(f16_inv(b));
    printf("\nResult should be %f\n\n", 1.0/B);
    printf("Result is        ");
    f16_print(f16_inv(c));
    printf("\nResult should be %f\n\n", 1.0/C);

    printf("*** MUL\n\n");
    printf("Result is        ");
    f16_print(f16_mul(a,b));
    printf("\nResult should be %f\n\n", A*B);
    printf("Result is        ");
    f16_print(f16_mul(b,c));
    printf("\nResult should be %f\n\n", B*C);
    printf("Result is        ");
    f16_print(f16_mul(c,a));
    printf("\nResult should be %f\n\n", C*A);

    printf("*** DIV\n\n");
    printf("Result is        ");
    f16_print(f16_div(a,b));
    printf("\nResult should be %f\n\n", A/B);
    printf("Result is        ");
    f16_print(f16_div(b,c));
    printf("\nResult should be %f\n\n", B/C);
    printf("Result is        ");
    f16_print(f16_div(c,a));
    printf("\nResult should be %f\n\n", C/A);

    printf("*** SQRT\n\n");
    printf("Result is        ");
    f16_print(f16_sqrt(a));
    printf("\nResult should be %f\n\n", sqrt(A));
    printf("Result is        ");
    f16_print(f16_sqrt(b));
    printf("\nResult should be %f\n\n", sqrt(B));
    printf("Result is        ");
    f16_print(f16_sqrt(c));
    printf("\nResult should be %f\n\n", sqrt(C));


    return 0;
}

int main(void)
{
#ifndef HOST_VERSION
    uart_init();
    fdevopen((void*)uart0_dev_send, (void*)uart0_dev_recv);
    
    sei();
#endif

    f64_test();
    f32_test();
    f16_test();
    return 0;
}
