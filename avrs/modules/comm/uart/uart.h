#ifndef UART_H__
#define UART_H__

#include <stdint.h>
#include <stdio.h>

#define UART_NUM_MAX  3

#include "uart_config.h"


/// Initialize UARTs.
void uart_init(void);

// See uartn.inc.h for methods defined for each UART.
// Aliases without the \c N are available for UART_NUM, if defined.


// From here, there is only preprocessor stuff.
// You don't have (nor want) to go through it to use this module.


/** @name Configuration processing.
 */
//@{

// Enable default UART
#if UART_NUM == 0
#define UART0_ENABLE
#elif UART_NUM == 1
#define UART1_ENABLE
#elif UART_NUM == 2
#define UART2_ENABLE
#elif UART_NUM == 3
#define UART3_ENABLE
#elif defined UART_NUM
#error "Invalid UART_NUM"
#endif


/// Apply default configuration values.

#ifdef UART0_ENABLE
# ifndef UART0_RX_BUF_SIZE
# define UART0_RX_BUF_SIZE  UART_RX_BUF_SIZE
# endif
# ifndef UART0_TX_BUF_SIZE
# define UART0_TX_BUF_SIZE  UART_TX_BUF_SIZE
# endif
# ifndef UART0_BAUDRATE
# define UART0_BAUDRATE  UART_BAUDRATE
# endif
# ifndef UART0_DOUBLE_SPEED
# define UART0_DOUBLE_SPEED  UART_DOUBLE_SPEED
# endif
#endif

#ifdef UART1_ENABLE
# ifndef UART1_RX_BUF_SIZE
# define UART1_RX_BUF_SIZE  UART_RX_BUF_SIZE
# endif
# ifndef UART1_TX_BUF_SIZE
# define UART1_TX_BUF_SIZE  UART_TX_BUF_SIZE
# endif
# ifndef UART1_BAUDRATE
# define UART1_BAUDRATE  UART_BAUDRATE
# endif
# ifndef UART1_DOUBLE_SPEED
# define UART1_DOUBLE_SPEED  UART_DOUBLE_SPEED
# endif
#endif

#ifdef UART2_ENABLE
# ifndef UART2_RX_BUF_SIZE
# define UART2_RX_BUF_SIZE  UART_RX_BUF_SIZE
# endif
# ifndef UART2_TX_BUF_SIZE
# define UART2_TX_BUF_SIZE  UART_TX_BUF_SIZE
# endif
# ifndef UART2_BAUDRATE
# define UART2_BAUDRATE  UART_BAUDRATE
# endif
# ifndef UART2_DOUBLE_SPEED
# define UART2_DOUBLE_SPEED  UART_DOUBLE_SPEED
# endif
#endif

#ifdef UART3_ENABLE
# ifndef UART3_RX_BUF_SIZE
# define UART3_RX_BUF_SIZE  UART_RX_BUF_SIZE
# endif
# ifndef UART3_TX_BUF_SIZE
# define UART3_TX_BUF_SIZE  UART_TX_BUF_SIZE
# endif
# ifndef UART3_BAUDRATE
# define UART3_BAUDRATE  UART_BAUDRATE
# endif
# ifndef UART3_DOUBLE_SPEED
# define UART3_DOUBLE_SPEED  UART_DOUBLE_SPEED
# endif
#endif


//@}



// Include template for each enabled UART, see uartn.inc.h.
#ifdef UART0_ENABLE
# define N_(p,s)  p ## 0 ## s
# include "uartn.inc.h"
#endif
#ifdef UART1_ENABLE
# define N_(p,s)  p ## 1 ## s
# include "uartn.inc.h"
#endif
#ifdef UART2_ENABLE
# define N_(p,s)  p ## 2 ## s
# include "uartn.inc.h"
#endif
#ifdef UART3_ENABLE
# define N_(p,s)  p ## 3 ## s
# include "uartn.inc.h"
#endif


/** @name Aliases for default UART.
 */
//@{

#if UART_NUM == 0
#define UART_NUM_ALIAS(s)  uart0_ ## s
#elif UART_NUM == 1
#define UART_NUM_ALIAS(s)  uart1_ ## s
#elif UART_NUM == 2
#define UART_NUM_ALIAS(s)  uart2_ ## s
#elif UART_NUM == 3
#define UART_NUM_ALIAS(s)  uart3_ ## s
#endif

#ifdef UART_NUM_ALIAS

#define uart_recv         UART_NUM_ALIAS(recv)
#define uart_recv_nowait  UART_NUM_ALIAS(recv_nowait)
#define uart_send         UART_NUM_ALIAS(send)
#define uart_send_nowait  UART_NUM_ALIAS(send_nowait)
#define uart_disable_tx   UART_NUM_ALIAS(disable_tx)
#define uart_dev_recv     UART_NUM_ALIAS(dev_recv)
#define uart_dev_send     UART_NUM_ALIAS(dev_send)
#define uart_set_rx_event UART_NUM_ALIAS(set_rx_event)

#endif

//@}


#endif
