/** @file
 * @brief Include template code for uart.c.
 *
 * The N_(p,s) macro must be defined before including.
 * It is automatically undefined at the end of this file.
 */

#define UARTN(s) N_(UART,s)
#define uartN(s) N_(uart,s)
#if defined(SIG_USART0_RECV)
#define SIG_UARTN(s)  N_(SIG_USART,_##s)
#elif defined(SIG_UART0_RECV)
#define SIG_UARTN(s)  N_(SIG_UART,_##s)
#else
#define SIG_UARTN(s)  SIG_USART_##s
#endif

#ifndef UBRR0H
#define UBRR0H UBRRH
#define UBRR0L UBRRL
#define UCSR0A UCSRA
#define UCSR0B UCSRB
#define UCSR0C UCSRC
#define UCSR0C UCSRC
#define U2X0   U2X
#define UCSZ00 UCSZ0
#define RXEN0  RXEN
#define TXEN0  TXEN
#define UDRE0  UDRE
#define RXCIE0 RXCIE
#define TXCIE0 TXCIE
#define UDRIE0 UDRIE
#define UDR0 UDR
#endif



typedef struct {
  uint8_t *head;
  uint8_t *tail;
  uint8_t data[UARTN(_RX_BUF_SIZE)];
} UARTN(RxBuf);

typedef struct {
  uint8_t *head;
  uint8_t *tail;
  uint8_t data[UARTN(_TX_BUF_SIZE)];
} UARTN(TxBuf);

/// Fifo for received data.
static UARTN(RxBuf) uartN(_rx_buf);
/// Fifo for sent data.
static UARTN(TxBuf) uartN(_tx_buf);

/// Handler called for each received byte.
static void (*uartN(_rx_event))(uint8_t) = NULL;


/// Initialize the UART.
static void uartN(_init)(void)
{
  fifobuf_init((FifoBuf *)&uartN(_rx_buf));
  fifobuf_init((FifoBuf *)&uartN(_tx_buf));

#define UART_UBRR_VAL \
  (uint16_t)((float)(F_CPU) / (( (UARTN(_DOUBLE_SPEED)) ? 8 : 16 )*(UARTN(_BAUDRATE))) - 1 )
  N_(UBRR,H) = UART_UBRR_VAL>>8;
  N_(UBRR,L) = UART_UBRR_VAL;
#undef UART_UBRR_VAL
  N_(UCSR,A) = (UARTN(_DOUBLE_SPEED)) ? (1<<N_(U2X,)) : 0;
  N_(UCSR,B) = (1<<N_(RXEN,)) | (1<<N_(TXEN,)) | (1<<N_(RXCIE,));
  N_(UCSR,C) = (3<<N_(UCSZ,0));
}


/** @brief Send next waiting char, if any.
 * @note Must be called with IRQ locked.
 */
static void uartN(_send_fifo_char)(void)
{
  if( FIFOBUF_ISEMPTY( &uartN(_tx_buf) ) ) {
    N_(UCSR,B) &= ~(1<<N_(UDRIE,));
  } else {
    FIFOBUF_POP( &uartN(_tx_buf), N_(UDR,) );
    N_(UCSR,B) |= (1<<N_(UDRIE,));
  }
}



int uartN(_recv)(void)
{
  int ret;
  while( (ret = uartN(_recv_nowait)()) < 0 ) ;
  return ret;
}


int uartN(_recv_nowait)(void)
{
  uint8_t flags;
  IRQ_LOCK(flags);

  int ret;
  if( FIFOBUF_ISEMPTY( &uartN(_rx_buf) ) ) {
    ret = -1;
  } else {
    FIFOBUF_POP( &uartN(_rx_buf), ret );
  }

  IRQ_UNLOCK(flags);
  return ret;
}


int uartN(_send)(uint8_t v)
{
  while( uartN(_send_nowait)(v) < 0 ) {
    if( GLOBAL_IRQ_ARE_MASKED() ) {
      while( !(N_(UCSR,A) & (1<<N_(UDRE,))) ) ;
      // pop one byte from the buffer, should be the last iteration
      uartN(_send_fifo_char)();
    }
  }
  return 0;
}


int uartN(_send_nowait)(uint8_t v)
{
  uint8_t flags;
  IRQ_LOCK(flags);

  int ret;
  if( FIFOBUF_ISFULL( &uartN(_tx_buf) ) ) {
    ret = -1;
  } else {
    ret = 0;
    FIFOBUF_PUSH( &uartN(_tx_buf), v );
    N_(UCSR,B) |= (1<<N_(UDRIE,)) | (1<<N_(TXEN,));  // TXEN may have been disabled
  }

  IRQ_UNLOCK(flags);
  return ret;
}


void uartN(_disable_tx)(void)
{
  N_(UCSR,B) |= (1<<N_(TXCIE,));
}


int uartN(_dev_recv)(FILE *fp)
{
  (void)fp; // not used
  return uartN(_recv)();
}

int uartN(_dev_send)(char c, FILE *fp)
{
  (void)fp; // not used
  return uartN(_send)(c);
}

void uartN(_set_rx_event)(void (*f)(uint8_t))
{
  // no need to lock as value is only read on interruption
  uartN(_rx_event) = f;
}


/// Interruption handler for received data.
SIGNAL(SIG_UARTN(RECV))
{
  uint8_t v = N_(UDR,);
  if( !FIFOBUF_ISFULL( &uartN(_rx_buf) ) ) {
    FIFOBUF_PUSH( &uartN(_rx_buf), v);
  }
  if( uartN(_rx_event) != NULL ) {
    uartN(_rx_event)(v);
  }
}


/// Interruption handler for sent data.
SIGNAL(SIG_UARTN(DATA))
{
  uartN(_send_fifo_char)();
}


/// Interruption handler to disable TX after sending a frame.
SIGNAL(SIG_UARTN(TRANS))
{
  N_(UCSR,B) &= ~(1<<N_(TXEN,));
}



#undef UARTN
#undef uartN
#undef SIG_UARTN
#undef N_
