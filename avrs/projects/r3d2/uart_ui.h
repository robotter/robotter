#ifndef UART_UI_H
#define UART_UI_H

#include <stdbool.h>

extern bool uart_ui_enabled;

void uart_ui_enable(void);
void uart_ui_disable(void);
void uart_ui_update(void);

#endif
