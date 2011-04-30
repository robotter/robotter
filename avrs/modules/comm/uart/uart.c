#include <aversive.h>
#include <avr/interrupt.h>
#include "uart.h"


/** @name Circular buffer for UART data.
 */
//@{


/** @brief Base type.
 *
 * This is a generic incomplete type which is not directly used.
 * Derived types are defined with specific data size.
 */
typedef struct {
  uint8_t *head;
  uint8_t *tail;
  uint8_t data[];
} FifoBuf;

/// Initialize a fifo buffer.
static void fifobuf_init(FifoBuf *buf)
{
  buf->head = buf->tail = buf->data;
}

/// Pointer to the end of a fifo buffer.
#define FIFOBUF_END(buf)  ( (buf)->data + sizeof((buf)->data) )

/// Check whether a fifo buffer is full.
#define FIFOBUF_ISFULL(buf) \
  ( (buf)->tail+1 == ( (buf)->head == (buf)->data ? FIFOBUF_END(buf) : (buf)->head ) )

/// Check whether a fifo buffer is empty.
#define FIFOBUF_ISEMPTY(buf)  ( (buf)->tail == (buf)->head )

/// Push a byte to the fifo buffer.
#define FIFOBUF_PUSH(buf,v) do { \
  *(buf)->tail = (v); \
  if( ++(buf)->tail == FIFOBUF_END(buf) ) { \
    (buf)->tail = (buf)->data; \
  } \
} while(0)

/// Pop a byte from the fifo buffer.
#define FIFOBUF_POP(buf,v) do { \
  (v) = *(buf)->head; \
  if( ++(buf)->head == FIFOBUF_END(buf) ) { \
    (buf)->head = (buf)->data; \
  } \
} while(0)


//@}


// Include template for each enabled UART.

#ifdef UART0_ENABLE
# define N_(p,s)  p ## 0 ## s
# include "uartn.inc.c"
#else
# define uart0_init()
#endif

#ifdef UART1_ENABLE
# define N_(p,s)  p ## 1 ## s
# include "uartn.inc.c"
#else
# define uart1_init()
#endif

#ifdef UART2_ENABLE
# define N_(p,s)  p ## 2 ## s
# include "uartn.inc.c"
#else
# define uart2_init()
#endif

#ifdef UART3_ENABLE
# define N_(p,s)  p ## 3 ## s
# include "uartn.inc.c"
#else
# define uart3_init()
#endif



void uart_init(void)
{
  uart0_init();
  uart1_init();
  uart2_init();
  uart3_init();
}

