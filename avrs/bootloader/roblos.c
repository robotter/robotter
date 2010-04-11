
/** @file
 *  @brief Rob'Otter Bootloader, server part.
 *
 * A Generic bootloader for ATmega devices which communicates with a remote
 * client through UART.
 *
 * The device which runs the bootloader will be referred as the \e server. The
 * remote client will be referred as the \e client.
 *
 * The protocol uses one-line messages. Lines end with a CRLF sequence, however
 * the remote client is allowed to end its lines with a single LF. Fields are
 * separated by single spaces.
 *
 * First, the server sends a \c cmd prompt message and wait for input from the
 * client. If nothing has been received within (approximatively) 1 second, the
 * program is executed. Otherwise, the server parses and executes the command,
 * then prompt the client for another command, and so on.
 *
 * To avoid issues with partially sent data or buffer garbages, the server
 * sends an additional CRLF sequence before the first prompt and after the last
 * message (before booting). This would make it easier for a client to parse it.
 *
 * The server has always the initiative: the client sends messages only when
 * asked for by the server. By convention, server messages which wait for a
 * reply begin with a <tt>?</tt>.
 *
 * Here are some common messages:
 *  - \c KO status: generic reponse for command failure, the next server
 *    message will be a command prompt
 *  - \c ok status: sent to indicate the last command was successfull, this is
 *    the standard server reply when sending no additional information
 *  - when asking for client confirmation, the server will except a \c y (yes)
 *    or \c n (no) message
 *
 * @note The server can reply with a \c KO status to any request. It is
 * implicit that any command can fail at any step. \n
 * A client can go back to command prompt at any moment by sending an empty
 * message.
 *
 * All numbers are written in hexadecimal. The server accepts both lowercase and
 * uppercase digits but only sends lowercase ones. Numbers sent by the server
 * always have an even number of digits.
 * 
 * @note The server should send non-number sequences with may be confused with
 * a number. This means sending fields which match <tt>([0-9a-f][0-9a-f])+</tt>
 * is strongly discouraged.
 *
 * All CRC computation use the CRC-16-CCITT.
 *
 * @todo Store the ROID in EEPROM.
 */

#include "roblos.h"
#include <avr/io.h>
#include <avr/boot.h>
#include <avr/pgmspace.h>
#include <util/crc16.h>
#include <util/delay.h>
#include "roblos_config.h"


/** @brief Interrupt vector control register.
 *
 * Register for IVCE and IVSEL bits depend on the device.
 * For devices with a GICR it is GICR, otherwise it is MCUCR.
 */
#ifdef GICR
#define IVCR GICR
#else
#define IVCR MCUCR
#endif


/** @name UART functions and configuration
 *
 * Configuration definitions are compatible with \e uart_config.h fields.
 */
//@{

#if UART_NUM == 0

#define UCSRxA  UCSR0A
#define UCSRxB  UCSR0B
#define UCSRxC  UCSR0C
#define RXCx    RXC0
#define TXCx    TXC0
#define UDRx    UDR0
#define UDREx   UDRE0
#define U2Xx    U2X0
#define RXENx   RXEN0
#define TXENx   TXEN0
#define TXENx   TXEN0
#define UCSZx0  UCSZ00
#define UBRRxH  UBRR0H
#define UBRRxL  UBRR0L

#elif UART_NUM == 1

#define UCSRxA  UCSR1A
#define UCSRxB  UCSR1B
#define UCSRxC  UCSR1C
#define RXCx    RXC1
#define TXCx    TXC1
#define UDRx    UDR1
#define UDREx   UDRE1
#define U2Xx    U2X1
#define RXENx   RXEN1
#define TXENx   TXEN1
#define UCSZx0  UCSZ10
#define UBRRxH  UBRR1H
#define UBRRxL  UBRR1L

#elif UART_NUM == 2

#define UCSRxA  UCSR2A
#define UCSRxB  UCSR2B
#define UCSRxC  UCSR2C
#define RXCx    RXC2
#define TXCx    TXC2
#define UDRx    UDR2
#define UDREx   UDRE2
#define U2Xx    U2X2
#define RXENx   RXEN2
#define TXENx   TXEN2
#define UCSZx0  UCSZ20
#define UBRRxH  UBRR2H
#define UBRRxL  UBRR2L

#elif UART_NUM == 3

#define UCSRxA  UCSR3A
#define UCSRxB  UCSR3B
#define UCSRxC  UCSR3C
#define RXCx    RXC3
#define RXCx    RXC3
#define UDRx    UDR3
#define UDREx   UDRE3
#define U2Xx    U2X3
#define RXENx   RXEN3
#define TXENx   TXEN3
#define UCSZx0  UCSZ30
#define UBRRxH  UBRR3H
#define UBRRxL  UBRR3L

#else
#error "invalid UART number"
#endif


// compute register values

#if UART_USE_DOUBLE_SPEED == 0
#define UART_SPEED_FACTOR  16
#define UART_U2X_VAL  0
#else
#define UART_SPEED_FACTOR   8
#define UART_U2X_VAL  _BV(U2Xx)
#endif

#define UART_UBRR_VAL  (uint16_t)((float)(F_CPU) / ((UART_SPEED_FACTOR)*(UART_BAUDRATE)) - 1)

#if UART_NBITS == 9
#error "9-bit UART not supported"
#elif UART_NBITS < 5 || UART_NBITS > 8
#error "invalid UART bit number value"
#endif
#define UART_NBITS_VAL ((UART_NBITS-5)&0x03)<<UCSZx0

#if UART_PARITY == UART_PARTITY_NONE
#define UART_PARITY_VAL  0
#elif UART_PARITY == UART_PARTITY_ODD
#define UART_PARITY_VAL  (_BV(UPM0)|_BV(UPM1))
#elif UART_PARITY == UART_PARTITY_EVEN
#define UART_PARITY_VAL  _BV(UPM1)
#else
#error "invalid UART parity"
#endif

#if UART_STOP_BIT == 1
#define UART_STOP_BIT_VAL 0
#elif UART_STOP_BIT == 2
#define UART_STOP_BIT_VAL _BV(USBS)
#else
#error "invalid UART stop bit"
#endif


static void uart_send(char c)
{
  while( !(UCSRxA & (1<<UDREx)) ) ;
  UDRx = c; 
}

static char uart_recv(void) 
{ 
  while( !(UCSRxA & (1<<RXCx)) ) ; 
  return UDRx; 
}


//@}


/** @brief Buffer size for input messages.
 */
#define ROBLOS_BUF_SIZE  32


/** @name Protocol sub-routines.
 */
//@{

/** @brief Read a message line
 *
 * The line stops at the first LF.
 * After reading a CR, read bytes are not stored in the buffer.
 */
static void recv_line(char *buf)
{
  uint8_t i;
  char c;
  for( i=0; i<ROBLOS_BUF_SIZE; i++ )
  {
    c = uart_recv();
    if( c == '\r' || c == '\n' )
      break;
    buf[i] = c;
  }
  while( c != '\n' )
    c = uart_recv();
  buf[i] = '\0';
}


/** @brief Parse an hex32 number.
 *
 * @return Address of the first character following the parsed number, \e NULL
 * on error.
 */
static const char *parse_hex32(const char *p, uint32_t *val)
{
  uint32_t tmp = 0;
  uint8_t i = 0; // digit count

  for( i=0; i<8; i++ )
  {
    if( *p == ' ' || *p == '\0' )
    {
      if( i == 0 )
        return NULL;
      *val = tmp;
      return p;
    }

    tmp <<= 4;
    if( *p >= '0' && *p <= '9' )
      tmp += *p - '0';
    else if( *p >= 'a' && *p <= 'f' )
      tmp += 10 + *p - 'a';
    else if( *p >= 'A' && *p <= 'F' )
      tmp += 10 + *p - 'A';
    p++;
  }
  return NULL; // overflow
}

/** @brief Parse a confirmation response.
 *
 * @retval  0  no
 * @retval  1  yes (client confirmed)
 * @retval -1  failure
 *
 * @warning Do NOT use the result as a boolean, since \e yes and \e failure
 * will both evaluate to \e true.
 */
static int8_t recv_yesno(void)
{
  char rbuf[ROBLOS_BUF_SIZE];
  recv_line(rbuf);
  if( rbuf[1] != '\0' )
    return -1;
  if( rbuf[0] == 'y' )
    return 1;
  else if( rbuf[0] == 'n' )
    return 0;
  return -1;
}


/// Send a NUL terminated string.
static void send_str(const char *s)
{
  while( *s )
    uart_send( *s++ );
}

/// Send the EOL sequence.
static void send_eol(void)
{
  uart_send('\r');
  uart_send('\n');
}

/// Send a line ended by an EOL sequence.
#define send_msg(s) send_str(s "\r\n")

/// Send the prompt.
static void send_prompt(void)
{
  send_msg("?cmd");
}

/// Send ok status.
static void send_status_ok(void)
{
  send_msg("ok");
}

/// Send KO status.
static void send_status_ko(void)
{
  send_msg("KO");
}

/** @brief Send an hexadecimal digit.
 * @note Since the server must send digits by pairs this method is for internal
 * use only. Use send_hex8() instead.
 */
static void send_digit_(uint8_t x)
{
  uart_send( x + ( x < 10 ? '0' : 'a'-10 ) );
  // optimization, equivalent to
  // uart_send( x < 10 ? x + '0' : x-10 + 'a' );
}

/// Send a 8-bit value.
static void send_hex8(uint8_t x)
{
  send_digit_( x >> 4 );
  send_digit_( x & 0xf );
}

/// Send an 16-bit value.
static void send_hex16(uint16_t x)
{
  send_hex8( x >> 8 );
  send_hex8( x & 0xff );
}


//@}


/** @name Protocol Commands
 *
 * Commands return 0 on success, -1 on error and take as paramter a pointer to
 * the first character following the command name.
 */
//@{


/** @brief Dump general infos
 *
 * The server replies with supported commands, its Rob'Otter ID and the value
 * of \e SPM_PAGESIZE.
 *
 * Example:
@verbatim
  C -> S   i
  C <- S   inf ipxc 42 80
@endverbatim
 */
static int8_t cmd_infos(const char *p)
{
  if( *p != '\0' ) return -1;
  send_str("info i"  // the 'i' command cannot be disabled
#ifndef ROBLOS_DISABLE_EXECUTE
      "x"
#endif
#ifndef ROBLOS_DISABLE_PROG_PAGE
      "p"
#endif
#ifndef ROBLOS_DISABLE_MEM_CRC
      "c"
#endif
#ifndef ROBLOS_DISABLE_FUSE_READ
      "f"
#endif
      " ");
  send_hex8(ROBOTTER_ID);
  uart_send(' ');
  send_hex16(SPM_PAGESIZE);
  send_eol();
  return 0;
}


/** @brief Program a page.
 *
 * Command dataflow:
 *  1. the client asks to write a page at a given address
 *  2. the server replies <tt>?data</tt>
 *  3. the client sends the page data (without EOL sequence)
 *  4. the server replies with a CRC of the read data and asks for confirmation
 *  5. the client confirms or cancel the writing
 *  6. if the client confirmed, the server writes the page and replies \c ok
 *
 * @note The address page must be a valid aligned address.
 *
 * Example:
@verbatim
  C -> S   p 1500
  C <- S   ?data
  C -> S   ... page data ...
  C <- S   ?crc 02e6
  C -> S   y
  C <- S   ok
@endverbatim
 */
static int8_t cmd_prog_page(const char *p)
{
  uint32_t addr;
  uint8_t buf[SPM_PAGESIZE]; // data buffer
  uint16_t crc = 0xffff;
  char c;
  int i;

  // Read and check address
  if( *p != ' ' ) return -1;
  if( (p = parse_hex32(p+1, &addr)) == NULL ) return -1;
  if( *p != '\0' ) return -1;
  if( (addr & ((uint32_t)SPM_PAGESIZE-1)) != 0 ) return -1;
  if( addr > BOOTLOADER_ADDR ) return -1;
  send_msg("?data");

  // Read data from UART and compute CRC
  for( i=0; i<SPM_PAGESIZE; i++ )
  {
    c = uart_recv();
    crc = _crc_ccitt_update(crc, c);
    buf[i] = c;
  }

  // Send CRC and ask for confirmation
  send_str("?crc ");
  send_hex16(crc);
  send_eol();
  if( recv_yesno() != 1 ) return -1;

  // Erase page
  eeprom_busy_wait();
  boot_page_erase(addr);
  boot_spm_busy_wait();

  // Fill temporary page buffer
  for( i=0; i<SPM_PAGESIZE; i+=2 )
  {
    // Set up little-endian word
    uint16_t w = buf[i] + ((uint16_t)(buf[i+1])<<8);
    boot_page_fill(addr+i, w);
  }

  // Write the page
  boot_page_write(addr);
  boot_spm_busy_wait();

  // Reenable RWW section
  boot_rww_enable();

  send_status_ok();
  return 0;
}


/** @brief Run the application.
 */
static void boot(void)
{
  // extra CRLF to make sure the boot message is properly sent
  send_msg("boot\r\n");
  // wait for the last byte
  while( !(UCSRxA & ((1<<UDREx)|(1<<TXCx))) ) ;

  IVCR = (1<<IVCE);
  IVCR = (0<<IVSEL);
  reset();
}

/** @brief Terminate the connection and run the application.
 *
 * The server replies to acknowledge, then resets.
 *
 * Example:
@verbatim
  C -> S   x
  C <- S   boot
@endverbatim
 */
static int8_t cmd_execute(const char *p)
{
  if( *p != '\0' ) return -1;
  boot();
  return -1; // never happens
}


/** @brief Compute the CRC of a given memory range.
 *
 * The client asks for a CRC, providing an address and a size, and the server
 * replies with the computed CRC.
 *
 * Example:
@verbatim
  C -> S   c 1234 42
  C <- S   crc 1af3
@endverbatim
 */
static int8_t cmd_mem_crc(const char *p)
{
  uint32_t start, size;
  uint16_t crc = 0xffff;

  // Read and check address and size
  if( *p != ' ' ) return -1;
  if( (p = parse_hex32(p+1, &start)) == NULL ) return -1;
  if( *p != ' ' ) return -1;
  if( (p = parse_hex32(p+1, &size)) == NULL ) return -1;
  if( *p != '\0' ) return -1;
  if( start+size > BOOTLOADER_ADDR ) return -1;

  // Compute CRC
  uint32_t addr;
  uint8_t c;
  for( addr=start; addr<start+size; addr++ )
  {
		c = pgm_read_byte_far(addr);
    crc = _crc_ccitt_update(crc, c);
  }

  // Reply
  send_str("crc ");
  send_hex16(crc);
  send_eol();
  return 0;
}


/** @brief Dump fuse values
 *
 * The server replies with the low, high and extended fuse bytes.
 *
 * Example:
@verbatim
  C -> S   f
  C <- S   fuse 24 d9 ff
@endverbatim
 */
static int8_t cmd_fuse_read(const char *p)
{
  if( *p != '\0' ) return -1;
  send_str("fuse ");
  send_hex8(boot_lock_fuse_bits_get(GET_LOW_FUSE_BITS));
  uart_send(' ');
  send_hex8(boot_lock_fuse_bits_get(GET_HIGH_FUSE_BITS));
  uart_send(' ');
  send_hex8(boot_lock_fuse_bits_get(GET_EXTENDED_FUSE_BITS));
  send_eol();
  return 0;
}


//@}


/** @brief Main loop.
 */
int main(void)
{
#ifdef ROBLOS_INIT
  do{ ROBLOS_INIT }while(0);
#endif

  // UART init (all values have been already computed)
  UBRRxH = (uint8_t)(UART_UBRR_VAL>>8);
  UBRRxL = (uint8_t)UART_UBRR_VAL;
  UCSRxA = UART_U2X_VAL;
  UCSRxB = (1<<RXENx) | (1<<TXENx);
  UCSRxC = UART_NBITS_VAL | UART_PARITY_VAL | UART_STOP_BIT_VAL;

  // move interrupt vector in bootloader section
  IVCR = (1<<IVCE);
  IVCR = (1<<IVSEL);

  sei();

  // first prompt, timeout before booting
  send_eol();
  send_prompt();
  uint8_t i = (ROBLOS_BOOT_TIMEOUT)*F_CPU/(65536*4*1000);
  while( !(UCSRxA & (1<<RXCx)) )
  {
    if( i == 0 )
      boot();
    i--;
    _delay_loop_2(0); // 65536*4 cycles
  }


  char rbuf[ROBLOS_BUF_SIZE];
  while(1)
  {
    recv_line(rbuf);
    if( *rbuf != '\0' )
    {
      int8_t ret;
      if( *rbuf == 'i' )
        ret = cmd_infos(rbuf+1);
#ifndef ROBLOS_DISABLE_EXECUTE
      else if( *rbuf == 'x' )
        ret = cmd_execute(rbuf+1);
#endif
#ifndef ROBLOS_DISABLE_PROG_PAGE
      else if( *rbuf == 'p' )
        ret = cmd_prog_page(rbuf+1);
#endif
#ifndef ROBLOS_DISABLE_MEM_CRC
      else if( *rbuf == 'c' )
        ret = cmd_mem_crc(rbuf+1);
#endif
#ifndef ROBLOS_DISABLE_FUSE_READ
      else if( *rbuf == 'f' )
        ret = cmd_fuse_read(rbuf+1);
#endif
      else
        ret = -1;
      if( ret != 0 )
        send_status_ko();
    }
    send_prompt();
  }

  return 1;
}

