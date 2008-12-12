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
 *  Revision : $Id: uart_defs.h,v 1.7 2008-04-13 16:55:30 zer0 Exp $
 *
 */

/* Olivier MATZ, Droids-corp 2004 - 2006
 * Uart specific definitions
 */

#ifndef _UART_DEFS_H_
#define _UART_DEFS_H_

#define UART_PARTITY_NONE 0
#define UART_PARTITY_ODD 1
#define UART_PARTITY_EVEN 2

#define UART_STOP_BITS_1 0
#define UART_STOP_BITS_2 1

/* For arch with only one UART, we consider that UART0 = UART */
#ifndef SIG_UART0_DATA
#define SIG_UART0_DATA SIG_UART_DATA
#endif
#ifndef SIG_UART0_RECV
#define SIG_UART0_RECV  SIG_UART_RECV
#endif
#ifndef UDR0
#define UDR0 UDR
#endif
#ifndef UCSR0A
#define UCSR0A UCSRA
#endif
#ifndef UCSR0B
#define UCSR0B UCSRB
#endif
#ifndef UCSR0C
#define UCSR0C UCSRC
#endif
#ifndef UBRR0L
#define UBRR0L UBRRL
#endif
#ifndef UBRR0H
#define UBRR0H UBRRH
#endif
#ifndef U2X 
#define U2X U2X0
#endif
#ifndef UCSZ0 
#define UCSZ0 UCSZ00
#endif
#ifndef UCSZ1 
#define UCSZ1 UCSZ01
#endif
#ifndef UCSZ2 
#define UCSZ2 UCSZ02
#endif
#ifndef UPM0 
#define UPM0 UPM00
#endif
#ifndef UPM1 
#define UPM1 UPM01
#endif
#ifndef USBS 
#define USBS USBS0
#endif
#ifndef TXEN 
#define TXEN TXEN0
#endif
#ifndef TXCIE 
#define TXCIE TXCIE0
#endif
#ifndef RXEN 
#define RXEN RXEN0
#endif
#ifndef RXCIE 
#define RXCIE RXCIE0
#endif
#ifndef TXC 
#define TXC TXC0
#endif
#ifndef RXB8
#define RXB8 RXB80
#endif
#ifndef UDRIE
#define UDRIE UDRIE0
#endif
#ifndef UDRE
#define UDRE UDRE0
#endif

/* makes functions more generic, we associate USR and UCR with UCSRA
   and UCSRB, respectively */
#if ( ! defined UCSRA ) && ( defined USR )
#define UCSRA USR
#endif

#if ( ! defined UCSRB ) && ( defined UCR )
#define UCSRB UCR
#endif

/* UBRR is UBRRL */
#ifndef UBRRL
#define UBRRL UBRR
#endif


/* URSEL is used on some uC to access to UCSRC (atm32 for example) */
#ifdef URSEL
#define SET_UCSR0C(x) UCSR0C=((1<<URSEL) & (x))
#define SET_UCSR1C(x) UCSR1C=((1<<URSEL) & (x))
#define SET_UCSR2C(x) UCSR2C=((1<<URSEL) & (x))
#define SET_UCSR3C(x) UCSR3C=((1<<URSEL) & (x))
/* following 4 macros must be called with irq locked */
#define GET_UCSR0C() ({ uint8_t ucsrc; ucsrc=UBRR0H; ucsrc=UCSR0C; ucsrc; })
#define GET_UCSR1C() ({ uint8_t ucsrc; ucsrc=UBRR1H; ucsrc=UCSR1C; ucsrc; })
#define GET_UCSR2C() ({ uint8_t ucsrc; ucsrc=UBRR2H; ucsrc=UCSR2C; ucsrc; })
#define GET_UCSR3C() ({ uint8_t ucsrc; ucsrc=UBRR3H; ucsrc=UCSR3C; ucsrc; })
#else
#define SET_UCSR0C(x) UCSR0C=(x)
#define SET_UCSR1C(x) UCSR1C=(x)
#define SET_UCSR2C(x) UCSR2C=(x)
#define SET_UCSR3C(x) UCSR3C=(x)
#define GET_UCSR0C() (UCSR0C)
#define GET_UCSR1C() (UCSR1C)
#define GET_UCSR2C() (UCSR2C)
#define GET_UCSR3C() (UCSR3C)
#endif


/* patch for libc incomplete headers 
   for the CAN avrs, the avr/iocanxx.h is false, USART is valid, else it will not compile
   see http://savannah.nongnu.org/bugs/?18964
*/
#if defined (__AVR_AT90CAN128__) || defined (__AVR_AT90CAN64__) || defined (__AVR_AT90CAN32__)


#ifndef SIG_USART0_RECV
#define SIG_USART0_RECV SIG_UART0_RECV
#define SIG_USART1_RECV SIG_UART1_RECV
#define SIG_USART0_DATA SIG_UART0_DATA
#define SIG_USART1_DATA SIG_UART1_DATA
#define SIG_USART0_TRANS SIG_UART0_TRANS
#define SIG_USART1_TRANS SIG_UART1_TRANS
#endif

#endif




/* if the signal USART is defined, the uC has a USART. */
#if ( defined SIG_USART0_RECV ) || ( defined SIG_USART_RECV ) 
#define UART_IS_USART 1
#elif (defined USART_UDRE_vect) || (defined USART_TXC_vect) || (defined USART_RXC_vect)
#define UART_IS_USART 1
#else
#define UART_IS_USART 0
#endif

/* if the U2X macro is defined, the uC has the U2X option. */
#ifdef U2X
#define UART_HAS_U2X 1
#else
#define UART_HAS_U2X 0
#endif


/******************************************
 * UART variables
 */

#define DEFINE_VARS(x)                                        \
                                                              \
/** The emission fifo of uart ##x## */                        \
char g_tx##x##_buf[UART##x##_TX_FIFO_SIZE];          \
struct cirbuf g_tx##x##_fifo;                        \
                                                              \
/** The reception fifo of uart ##x## */                       \
char g_rx##x##_buf[UART##x##_RX_FIFO_SIZE];          \
struct cirbuf g_rx##x##_fifo;                        \
                                                              \
event * rx##x##_event = NULL;                                 \
event * tx##x##_event = NULL;


#define DECLARE_VARS(x)                                       \
                                                              \
/** The emission fifo of uart ##x## */                        \
extern char g_tx##x##_buf[UART##x##_TX_FIFO_SIZE];   \
extern struct cirbuf g_tx##x##_fifo;                 \
                                                              \
/** The reception fifo of uart ##x## */                       \
extern char g_rx##x##_buf[UART##x##_RX_FIFO_SIZE];   \
extern struct cirbuf g_rx##x##_fifo;                 \
                                                              \
extern event * rx##x##_event ;                                \
extern event * tx##x##_event ;


/******************************************
 * UART private function declarations
 */

#define DECLARE_FCTS(x)                                        \
void uart##x##_send_next_char(void);                           \
int8_t uart##x##_setconf(struct uart_config * u);



/******************************************
 * UART UDR access
 */

#define DEFINE_8BITS_UDR_FCTS(x)                    \
static inline char uart##x##_get_udr(void)          \
{                                                   \
  return UDR##x;                                    \
}                                                   \
                                                    \
static inline void uart##x##_set_udr(char c)        \
{                                                   \
  UDR##x = c;                                       \
}                                                   \

#define DEFINE_9BITS_UDR_FCTS(x)                    \
                                                    \
static inline int uart##x##_get_udr_9bits(void)     \
{                                                   \
  int val = UDR##x;                                 \
  val |= ( UCSR##x##B & ( 1 << RXB8) ? 0x100 : 0 ); \
  return val;                                       \
}                                                   \
                                                    \
static inline void uart##x##_set_udr_9bits(int c)   \
{                                                   \
  if( c & 0x100 )                                   \
    sbi(UCSR##x##B,RXB8);                           \
  else                                              \
    cbi(UCSR##x##B,RXB8);                           \
  UDR##x = c;                                       \
}


/******************************************
 * UART TX Interrupt
 */

#define DEFINE_TRANS_INTRPT(x)                                     \
                                                                   \
/** emit next char of fifo if any, and call the event function *   \
 * this function is executed with intr locked                  */  \
void uart##x##_send_next_char(void)                                \
{                                                                  \
                                                                   \
  if (uart##x##_getconf_nbits() == 9) {                            \
    int elt = 0;                                                   \
                                                                   \
    /* for 9 bits, it uses 2 places in the fifo */                 \
    if(CIRBUF_GET_LEN(&g_tx##x##_fifo) < 2) {                      \
      cbi(UCSR##x##B, UDRIE);                                      \
      return;                                                      \
    }                                                              \
                                                                   \
    cirbuf_get_buf_tail(&g_tx##x##_fifo, (char *)&elt, 2);         \
    cirbuf_del_buf_tail(&g_tx##x##_fifo, 2);                       \
                                                                   \
    uart##x##_set_udr_9bits(elt);                                  \
    sbi(UCSR##x##B, UDRIE);                                        \
                                                                   \
    /* tx event function. We suppose interrupts are already */     \
    /* locked, so no pb with tx##x##_event pointer */              \
    if(tx##x##_event)                                              \
      ((event_9bits *)tx##x##_event)(elt);                         \
                                                                   \
  }                                                                \
  else { /* 5, 6, 7 or 8 bits */                                   \
    char elt = 0;                                                  \
                                                                   \
    if(CIRBUF_IS_EMPTY(&g_tx##x##_fifo)) {                         \
      cbi(UCSR##x##B, UDRIE);                                      \
      return;                                                      \
    }                                                              \
                                                                   \
    elt = cirbuf_get_tail(&g_tx##x##_fifo);                        \
    cirbuf_del_tail(&g_tx##x##_fifo);                              \
    uart##x##_set_udr(elt);                                        \
    sbi(UCSR##x##B, UDRIE);                                        \
                                                                   \
    /* tx event function. We suppose interrupts are already */     \
    /* locked, so no pb with tx##x##_event pointer */              \
    if(tx##x##_event)                                              \
      tx##x##_event(elt);                                          \
  }                                                                \
}                                                                  \
                                                                   \
/* if the transmission of the byte is finished, send next char */  \
/* of fifo */                                                      \
SIGNAL(SIG_UART##x##_DATA)                                         \
{                                                                  \
  uart##x##_send_next_char();                                      \
}


/******************************************
 * UART RX Interrupt
 */

#define DEFINE_RECV_INTRPT(x)                                      \
                                                                   \
SIGNAL(SIG_UART##x##_RECV)                                         \
{                                                                  \
  if (uart##x##_getconf_nbits() == 9) {                            \
    int elt = 0;                                                   \
                                                                   \
    elt = uart##x##_get_udr_9bits();                               \
    if ( CIRBUF_GET_FREELEN(&g_rx##x##_fifo) >= 2 ) {              \
      cirbuf_add_buf_head(&g_rx##x##_fifo, (char *)&elt, 2);       \
    }                                                              \
                                                                   \
    /* rx event function. We suppose interrupts are already */     \
    /* locked, so no pb with rx##x##_event pointer */              \
    if(rx##x##_event)                                              \
      ((event_9bits *)rx##x##_event)(elt);                         \
  }                                                                \
  else {                                                           \
    char elt = 0;                                                  \
                                                                   \
    elt = uart##x##_get_udr();                                     \
    if ( ! CIRBUF_IS_FULL(&g_rx##x##_fifo) ) {                     \
      cirbuf_add_head(&g_rx##x##_fifo, elt);                       \
    }                                                              \
                                                                   \
    /* rx event function. We suppose interrupts are already */     \
    /* locked, so no pb with rx##x##_event pointer */              \
    if(rx##x##_event)                                              \
      rx##x##_event(elt);                                          \
  }                                                                \
}

/******************************************
 * UART USER SEND/RECV
 */

#define DEFINE_SEND_NOWAIT(x)                                               \
                                                                            \
/* send a char, or put it in the fifo if uart is not ready.  */             \
/* Return -1 if fifo is full */                                             \
int uart##x##_send_nowait(char c)                                           \
{                                                                           \
  uint8_t flags;                                                            \
                                                                            \
  IRQ_LOCK(flags);                                                          \
                                                                            \
  /* if uart intrp mode is disabled (note that we look rx */                \
  /* intrp -- RXCIE is 0) */                                                \
  if ( ! ( UCSR##x##B & ( 1 << RXCIE ) ) ) {                                \
      /* we have to poll the status register before xmit */                 \
      if( UCSR##x##A & (1<<UDRE) ) {                                        \
        uart##x##_set_udr(c);                                               \
        IRQ_UNLOCK(flags);                                                  \
        return (int)c;                                                      \
      }                                                                     \
      else {                                                                \
        IRQ_UNLOCK(flags);                                                  \
        return -1;                                                          \
      }                                                                     \
  }                                                                         \
                                                                            \
  if( CIRBUF_IS_FULL(&g_tx##x##_fifo) ) {                                    \
    /* exit */                                                              \
    IRQ_UNLOCK(flags);                                                      \
    return -1;                                                              \
  }                                                                         \
                                                                            \
  /* uart is ready to send */                                               \
  if( CIRBUF_IS_EMPTY(&g_tx##x##_fifo) && UCSR##x##A & (1<<UDRE) ) {        \
    uart##x##_set_udr(c);                                                   \
    sbi( UCSR##x##B, UDRIE ) ;                                              \
  }                                                                         \
  else { /* not ready, put char in fifo */                                  \
    cirbuf_add_head(&g_tx##x##_fifo, c);                                    \
  }                                                                         \
                                                                            \
  IRQ_UNLOCK(flags);                                                        \
  return (int)c;                                                            \
}

#define DEFINE_SEND(x)                                                      \
                                                                            \
int uart##x##_send(char c)                                                  \
{                                                                           \
  /* if cannot send the char */                                             \
  if (uart##x##_send_nowait(c) == -1) {                                     \
                                                                            \
  /* if irq lock are masked and interrupt mode is on, we have to poll */    \
  /* the status register */                                                 \
    if( GLOBAL_IRQ_ARE_MASKED() && ( UCSR##x##B & (1 << RXCIE) ) ) {        \
      while( !(UCSR##x##A & (1<<UDRE)) );                                   \
      /* send the next char in the fifo to free a place */                  \
      uart##x##_send_next_char();                                           \
      cirbuf_add_head(&g_tx##x##_fifo, c);                                  \
    }                                                                       \
    else {                                                                  \
      /* if irq are not locked, we can loop to emit */                      \
      while(uart##x##_send_nowait(c) == -1);                                \
    }                                                                       \
  }                                                                         \
  return c;                                                                 \
}

#define DEFINE_SEND9_NOWAIT(x)                                              \
int uart##x##_send_9bits_nowait(int c)                                      \
{                                                                           \
  uint8_t flags;                                                            \
  IRQ_LOCK(flags);                                                          \
                                                                            \
  /* if tx intrp are disabled (RXCIE is 0) */                               \
  if ( ! ( UCSR##x##B & ( 1 << RXCIE ) ) ) {                                \
      /* we have to poll the status register before xmit */                 \
      if( (UCSR##x##A & (1<<UDRE)) ) {                                      \
        uart##x##_set_udr_9bits(c);                                         \
        IRQ_UNLOCK(flags);                                                  \
        return c;                                                           \
      }                                                                     \
      else {                                                                \
        IRQ_UNLOCK(flags);                                                  \
        return -1;                                                          \
      }                                                                     \
  }                                                                         \
                                                                            \
  /* the fifo must have 2 free places */                                    \
  if( CIRBUF_GET_FREELEN(&g_tx##x##_fifo) < 2) {                            \
    /* exit */                                                              \
    IRQ_UNLOCK(flags);                                                      \
    return -1;                                                              \
  }                                                                         \
                                                                            \
  /* uart is ready to send */                                               \
  if( CIRBUF_IS_EMPTY(&g_tx##x##_fifo) && UCSR##x##A & (1<<UDRE) ) {        \
    uart##x##_set_udr_9bits(c);                                             \
    sbi( UCSR##x##B, UDRIE ) ;                                              \
  }                                                                         \
  else { /* not ready, put char in fifo */                                  \
    cirbuf_add_buf_head(&g_tx##x##_fifo, (char *)&c, 2);                    \
  }                                                                         \
                                                                            \
  IRQ_UNLOCK(flags);                                                        \
  return (int)c;                                                            \
}

#define DEFINE_SEND9(x)                                                     \
int uart##x##_send_9bits(int c)                                             \
{                                                                           \
  /* if cannot send the char */                                             \
  if (uart##x##_send_9bits_nowait(c) == -1) {                               \
                                                                            \
  /* if irq lock are masked and interrupt mode is on, we have to poll */    \
  /* the status register */                                                 \
    if( GLOBAL_IRQ_ARE_MASKED() && ( UCSR##x##B & (1 << RXCIE) ) ) {        \
      while( !(UCSR##x##A & (1<<UDRE)) );                                   \
      /* send the next char in the fifo to free two places */               \
      uart##x##_send_next_char();                                           \
      cirbuf_add_buf_head(&g_tx##x##_fifo, (char *)&c, 2);                  \
    }                                                                       \
    else {                                                                  \
      /* if irq are not locked, we can loop to emit */                      \
      while(uart##x##_send_9bits_nowait(c) == -1);                          \
    }                                                                       \
  }                                                                         \
  return c;                                                                 \
}

#define DEFINE_RECV_NOWAIT(x)                                               \
/* get a char from the receive fifo */                                      \
int uart##x##_recv_nowait(void)                                             \
{                                                                           \
  char elt=0;                                                               \
  uint8_t flags;                                                            \
                                                                            \
  IRQ_LOCK(flags);                                                          \
  if( ! CIRBUF_IS_EMPTY(&g_rx##x##_fifo) ) {                                \
    elt = cirbuf_get_tail(&g_rx##x##_fifo);                                 \
    cirbuf_del_tail(&g_rx##x##_fifo);                                       \
    IRQ_UNLOCK(flags);                                                      \
    return (int)elt;                                                        \
  }                                                                         \
  IRQ_UNLOCK(flags);                                                        \
  return (-1);                                                              \
}

#define DEFINE_RECV(x)                                                      \
/* get a char from the receive fifo */                                      \
int uart##x##_recv(void)                                                    \
{                                                                           \
  int elt=0;                                                                \
  while ( (elt = uart##x##_recv_nowait()) == -1 );                          \
  return elt;                                                               \
}

#define DEFINE_RECV9_NOWAIT(x)                                              \
/* get a char from the receive fifo */                                      \
int uart##x##_9bits_recv_nowait(void)                                       \
{                                                                           \
  char elt=0;                                                               \
  uint8_t flags;                                                            \
                                                                            \
  IRQ_LOCK(flags);                                                          \
  if( CIRBUF_GET_LEN(&g_rx##x##_fifo) >= 2) {                                   \
    cirbuf_get_buf_tail(&g_rx##x##_fifo, (char *)&elt, 2);                  \
    cirbuf_del_buf_tail(&g_tx##x##_fifo, 2);                                \
    IRQ_UNLOCK(flags);                                                      \
    return (int)elt;                                                        \
  }                                                                         \
  IRQ_UNLOCK(flags);                                                        \
  return (-1);                                                              \
}

#define DEFINE_RECV9(x)                                                     \
/* get a char from the receive fifo */                                      \
int uart##x##_9bits_recv(void)                                              \
{                                                                           \
  int elt=0;                                                                \
  while ( (elt = uart##x##_9bits_recv_nowait()) == -1 );                    \
  return elt;                                                               \
}

#define DEFINE_DEV_IO(x)                                                    \
int uart##x##_dev_send_nowait(char c, FILE* f)                              \
{                                                                           \
  return uart##x##_send_nowait(c);                                          \
}                                                                           \
                                                                            \
int uart##x##_dev_send(char c, FILE* f)                                     \
{                                                                           \
  return uart##x##_send(c);                                                 \
}                                                                           \
                                                                            \
int uart##x##_dev_recv_nowait(FILE* f)                                      \
{                                                                           \
  return uart##x##_recv_nowait();                                           \
}                                                                           \
                                                                            \
int uart##x##_dev_recv(FILE* f)                                             \
{                                                                           \
  return uart##x##_recv();                                                  \
}                                                                            

/******************************************
 * UART set conf
 */

#if UART_IS_USART
#define DEFINE_SET_NBITS_PARITY(x)                                      \
                                                                        \
static inline int8_t uart##x##_set_nbits_parity(struct uart_config * u) \
{                                                                       \
    uint8_t ucsrc##x = 0;                                               \
                                                                        \
    /* number of bit in the frame */                                    \
    if((u->nbits < 5) || (u->nbits > 9)) {                              \
      return ENOTSUP;                                                   \
    }                                                                   \
    ucsrc##x |= ( ((u->nbits - 5) & 0x03) << UCSZ0 ) ;                  \
    if ( u->nbits == 9 )                                                \
      UCSR##x##B |= ( 1 << UCSZ2 );                                     \
    else                                                                \
      UCSR##x##B &= ( 0xFE << UCSZ2 );                                  \
                                                                        \
    /* parity */                                                        \
    if(u->parity == UART_PARTITY_ODD)                                   \
      ucsrc##x |= ( ( 1 << UPM0 ) | ( 1 << UPM1 ) ) ;                   \
    else if(u->parity == UART_PARTITY_EVEN)                             \
      ucsrc##x |= ( 1 << UPM1 ) ;                                       \
    else if(u->parity != UART_PARTITY_NONE) {                           \
        return EINVAL;                                                  \
    }                                                                   \
                                                                        \
    /* nb of stop bits */                                               \
    if(u->stop_bits == UART_STOP_BITS_2)                                \
        ucsrc##x |= ( 1 << USBS ) ;                                     \
    else if (u->stop_bits != UART_STOP_BITS_1)  {                       \
        return EINVAL;                                                  \
    }                                                                   \
                                                                        \
    /* here we use a macro because some uC use a special bit */         \
    /* URSEL to access to UCSRC */                                      \
    SET_UCSR##x##C(ucsrc##x);                                           \
                                                                        \
    return ESUCCESS;                                                    \
}

#else
#define DEFINE_SET_NBITS_PARITY(x)                                      \
                                                                        \
static inline int8_t uart##x##_set_nbits_parity(struct uart_config * u) \
{                                                                       \
    /* number of bit in the frame */                                    \
    if(u->nbits == 8)                                                   \
      UCSR##x##B &= (uint8_t)(0xFE << CHR9);                            \
    else {                                                              \
      UCSR##x##B |= (uint8_t)(1 << CHR9);                               \
      return ENOTSUP;                                                   \
    }                                                                   \
                                                                        \
    /* parity and stop */                                               \
    if( (u->parity != UART_PARTITY_NONE) ||                             \
	(u->stop_bits != UART_STOP_BITS_1) ) {                          \
      return ENOTSUP;                                                   \
    }                                                                   \
                                                                        \
    return ESUCCESS;                                                    \
}
#endif


#if UART_IS_USART
#define DEFINE_SET_BAUDREG(x)                                      \
                                                                   \
static inline int8_t uart##x##_set_baudreg(uint16_t baudreg)       \
{                                                                  \
  uint8_t lo,hi;                                                   \
                                                                   \
  /* set msb bit of hi to 0 (useful fot uC with URSEL, and */      \
  /* not important for the others because the baudreg */           \
  /* will never be as big */                                       \
  lo=(uint8_t)baudreg;                                             \
  hi=(uint8_t)(baudreg>>8) & 0x7F;                                 \
                                                                   \
  UBRR##x##H=hi;                                                   \
  UBRR##x##L=lo;                                                   \
                                                                   \
  return ESUCCESS;                                                 \
}

#else

#define DEFINE_SET_BAUDREG(x)                                      \
                                                                   \
static inline int8_t uart##x##_set_baudreg(uint16_t baudreg)       \
{                                                                  \
  uint8_t lo ,hi;                                                  \
                                                                   \
  lo=(uint8_t)baudreg;                                             \
  hi=(uint8_t)(baudreg>>8);                                        \
                                                                   \
  if(hi != 0) {                                                    \
      return EINVAL;                                               \
  }                                                                \
  UBRR##x##L=lo;                                                   \
                                                                   \
  return ESUCCESS;                                                 \
}
#endif


#define DEFINE_SET_CONF(x)                                      \
                                                                \
int8_t uart##x##_setconf(struct uart_config * u)                \
{                                                               \
  uint8_t ret = ESUCCESS;                                       \
  uint16_t baudrate_reg;                                        \
  struct uart_config static_conf;                               \
  uint8_t flags;                                                \
                                                                \
  IRQ_LOCK(flags);                                              \
                                                                \
  /* static configuration */                                    \
  if (!u) {                                                     \
    u = &static_conf;                                           \
    u->enabled = UART##x##_ENABLED ;                            \
    u->intr_enabled = UART##x##_INTERRUPT_ENABLED ;             \
    u->use_double_speed = UART##x##_USE_DOUBLE_SPEED ;          \
    u->parity =  UART##x##_PARITY ;                             \
    u->stop_bits = UART##x##_STOP_BIT ;                         \
    u->nbits = UART##x##_NBITS ;                                \
    u->baudrate = UART##x##_BAUDRATE ;                          \
  }                                                             \
                                                                \
  /* wait xmit finished (UDRE = 1) */                           \
  while(! (UCSR##x##A & (1<<UDRE)) );                           \
                                                                \
  cirbuf_init(&g_tx##x##_fifo, g_tx##x##_buf,                   \
              0, UART##x##_TX_FIFO_SIZE);                       \
  cirbuf_init(&g_rx##x##_fifo, g_rx##x##_buf,                   \
              0, UART##x##_RX_FIFO_SIZE);                       \
                                                                \
  UCSR##x##A=0;                                                 \
                                                                \
  if(u->enabled)                                                \
    UCSR##x##B = (( 1 << TXEN  ) | ( 1 << RXEN ));              \
  else {                                                        \
    UCSR##x##B = 0;                                             \
    goto out; /* no more conf */                                \
  }                                                             \
                                                                \
  /* we only enable recv interrupt, the xmit intrpt will be */  \
  /* enabled in the xmit function */                            \
  if(u->intr_enabled)                                           \
    UCSR##x##B |= ( 1 << RXCIE );                               \
                                                                \
  if(UART_HAS_U2X) { /* if u2x is supported */                  \
    if(u->use_double_speed) /* u2x is enabled */                \
      UCSR##x##A |= ( 1 << U2X );                               \
    else                                                        \
      UCSR##x##A &= ( 0xFE << U2X );                            \
  }                                                             \
  else if(u->use_double_speed) {                                \
    ret = ENOTSUP;                                              \
    goto out;                                                   \
  }                                                             \
                                                                \
  uart##x##_set_nbits_parity(u);                                \
                                                                \
  /* baudrate */                                                \
  if(u->use_double_speed)                                       \
      baudrate_reg = (F_CPU / (u->baudrate*8l))-1;              \
  else                                                          \
      baudrate_reg = (F_CPU / (u->baudrate*16l))-1;             \
                                                                \
  uart##x##_set_baudreg(baudrate_reg);                          \
                                                                \
  /* exit */                                                    \
 out:                                                           \
  IRQ_UNLOCK(flags);                                            \
  return ret;                                                   \
}


/******************************************
 * UART get conf
 */

#if UART_IS_USART
#define DEFINE_GET_NBITS(x)                                     \
                                                                \
/* return number of bits in current conf */                     \
static inline uint8_t uart##x##_getconf_nbits(void)             \
{                                                               \
  uint8_t nbits;                                                \
                                                                \
  nbits = (GET_UCSR##x##C() >> UCSZ0) & 0x03 ;                  \
  if ( UCSR##x##B & ( 1 << UCSZ2 ) )                            \
      nbits += 4;                                               \
  nbits += 5 ;                                                  \
                                                                \
  return nbits;                                                 \
}

#else

#define DEFINE_GET_NBITS(x)                                     \
                                                                \
/* return number of bits in current conf */                     \
static inline uint8_t uart##x##_getconf_nbits(void)             \
{                                                               \
  if ( UCSR##x##B & (uint8_t)(1 << CHR9) )                      \
      return 8;                                                 \
  else                                                          \
      return 9;                                                 \
}
#endif


#if UART_IS_USART
#define DEFINE_GET_BAUDREG(x)                                    \
                                                                 \
/* return number of bits in current conf */                      \
static inline uint16_t uart##x##_get_baudreg(void)               \
{                                                                \
  return ((uint16_t)UBRR##x##H)<<8 | (uint16_t)UBRR##x##L;       \
}

#else

#define DEFINE_GET_BAUDREG(x)                                    \
                                                                 \
/* return number of bits in current conf */                      \
static inline uint16_t uart##x##_get_baudreg(void)               \
{                                                                \
  return UBRR##x##L;                                             \
}
#endif


#define DEFINE_GET_CONF(x)                                                     \
                                                                               \
/* get the running uart configurtion */                                        \
void uart##x##_getconf(struct uart_config * u)                                 \
{                                                                              \
  uint8_t tmp;                                                                 \
  uint8_t flags;                                                               \
                                                                               \
  IRQ_LOCK(flags);                                                             \
                                                                               \
  /* enabled if RXEN is set */                                                 \
  if ( UCSR##x##B & (1 << RXEN ))                                              \
    u->enabled = 1;                                                            \
  else                                                                         \
    u->enabled = 0;                                                            \
                                                                               \
  /* intrp enabled if RXCIE is set */                                          \
  if ( UCSR##x##B & (1 << RXCIE ))                                             \
    u->intr_enabled = 1;                                                       \
  else                                                                         \
    u->intr_enabled = 0;                                                       \
                                                                               \
  /* use double speed */                                                       \
  if(UART_HAS_U2X && (UCSR##x##A & ( 1 << U2X ) ) )                            \
    u->use_double_speed = 1;                                                   \
  else                                                                         \
    u->use_double_speed = 0;                                                   \
                                                                               \
                                                                               \
  /* parity */                                                                 \
  if (UART_IS_USART) {                                                         \
    tmp = GET_UCSR##x##C() & ( ( 1 << UPM1 ) | ( 1 << UPM0 ) ) ;               \
    if ( tmp == (( 1 << UPM1 ) | ( 1 << UPM0 )) )                              \
      u->parity = UART_PARTITY_ODD;                                            \
    else if ( tmp == ( 1 << UPM1 ) )                                           \
      u->parity = UART_PARTITY_EVEN;                                           \
    else                                                                       \
      u->parity = UART_PARTITY_NONE;                                           \
  }                                                                            \
  else {                                                                       \
    u->parity = UART_PARTITY_NONE;                                             \
  }                                                                            \
                                                                               \
  /* stop_bits */                                                              \
  if  (UART_IS_USART && (GET_UCSR##x##C() & ( 1 << USBS ) ) ) {                \
    u->stop_bits = UART_STOP_BITS_2;                                           \
  }                                                                            \
  else {                                                                       \
    u->stop_bits = UART_STOP_BITS_1;                                           \
  }                                                                            \
                                                                               \
  /* nbits */                                                                  \
  u->nbits = uart##x##_getconf_nbits();                                        \
                                                                               \
  u->baudrate = ( F_CPU / ((uart##x##_get_baudreg()+1) * 16) ) ;               \
                                                                               \
  IRQ_UNLOCK(flags);                                                           \
}


/******************************************
 * UART  EVENTS
 */

#define DEFINE_EVENTS(x)                                                 \
                                                                         \
/* This function is used to register another function which will be */   \
/* executed at each byte transmission. */                                \
void uart##x##_register_tx_event(void (*f)(char))                        \
{                                                                        \
  uint8_t flags;                                                         \
  IRQ_LOCK(flags);                                                       \
  tx##x##_event = f;                                                     \
  IRQ_UNLOCK(flags);                                                     \
}                                                                        \
                                                                         \
/* This function is used to register another function which will be */   \
/* executed at each byte reception */                                    \
void uart##x##_register_rx_event(void (*f)(char))                        \
{                                                                        \
  uint8_t flags;                                                         \
  IRQ_LOCK(flags);                                                       \
  rx##x##_event = f;                                                     \
  IRQ_UNLOCK(flags);                                                     \
}




#endif //_UART_DEFS_H_
