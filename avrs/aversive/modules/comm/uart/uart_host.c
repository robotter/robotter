void uart_init(void) {}

#define UART_HOST(x)                                                    \
event * rx##x##_event = NULL;                                           \
event * tx##x##_event = NULL;                                           \
int8_t uart##x##_setconf(struct uart_config * u) {return 0;}            \
void uart##x##_getconf(struct uart_config * u) {}                       \
int uart##x##_recv(void) { return getchar(); }                          \
int uart##x##_send_nowait(char c) {return putchar(c);}                  \
int uart##x##_send(char c)  {return put_char(c);}                       \
void uart##x##_register_tx_event(void (*f)(char)) { tx##x##_event = f; }\
void uart##x##_register_rx_event(void (*f)(char)) { rx##x##_event = f; }

#if (defined UART0_COMPILE)
UART_HOST(0)
#endif
#if (defined UART1_COMPILE)
UART_HOST(1)
#endif
#if (defined UART2_COMPILE)
UART_HOST(2)
#endif
#if (defined UART3_COMPILE)
UART_HOST(3)
#endif

