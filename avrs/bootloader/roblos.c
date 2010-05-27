
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
 * @note The server should not send non-number sequences with may be confused
 * with a number. This means sending fields which match
 * <tt>([0-9a-f][0-9a-f])+</tt> is strongly discouraged.
 *
 * All CRC computation use the CRC-16-CCITT.
 *
 * @todo Store the ROID in EEPROM.
 */

// Required by "util/delay.h"
#define F_CPU  ((unsigned long)QUARTZ_FREQ)

#include <avr/io.h>
#include <avr/boot.h>
#include <avr/pgmspace.h>
#include <util/crc16.h>
#include <util/delay.h>
#include <util/twi.h>

/** @brief Simple software reset.
 *
 * Registers are not initialized.
 *
 * @note Macro retrieved from Aversive.
 */
#define reset()                      \
do {				     \
  __asm__ __volatile__ ("ldi r30,0\n");  \
  __asm__ __volatile__ ("ldi r31,0\n");  \
  __asm__ __volatile__ ("ijmp\n");  \
} while(0)


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

/** @brief Type for memory addresses and sizes.
 *
 * The bootloader address is the highest possible address. (Another way could
 * be to test whether the RAMPZ register is defined.)
 */
#if BOOTLOADER_ADDR > 0x10000
// more than 64k
typedef uint32_t addr_type;
#define pgm_read_byte_bootloader pgm_read_byte_far
#else
// less than 64k
typedef uint16_t addr_type;
#define pgm_read_byte_bootloader pgm_read_byte_near
#endif


/** @name UART functions and configuration.
 *
 * Configuration definitions are compatible with \e uart_config.h fields.
 */
//@{

#ifdef ENABLE_UART

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

#if UART_PARITY == UART_PARITY_NONE
#define UART_PARITY_VAL  0
#elif UART_PARITY == UART_PARITY_ODD
#define UART_PARITY_VAL  (_BV(UPM0)|_BV(UPM1))
#elif UART_PARITY == UART_PARITY_EVEN
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

#endif

//@}


/** @name I2C functions and configuration.
 */
//@{

#define I2C_WAIT()  while( !( TWCR & _BV(TWINT) ) )
#define I2C_ACK()    do{ TWCR=_BV(TWEN)|_BV(TWINT)|_BV(TWEA) ; I2C_WAIT(); }while(0)
#define I2C_NACK()   do{ TWCR=_BV(TWEN)|_BV(TWINT);            I2C_WAIT(); }while(0)
#define I2CM_START() do{ TWCR=_BV(TWEN)|_BV(TWINT)|_BV(TWSTA); I2C_WAIT(); }while(0)
#define I2CM_STOP()  do{ TWCR=_BV(TWEN)|_BV(TWINT)|_BV(TWSTO); while( TWCR & _BV(TWSTO) ) ; }while(0)
#define I2CM_SEND(d)      do{ TWDR = (d); I2C_ACK();  }while(0)
#define I2CS_SEND(d)      do{ TWDR = (d); I2C_ACK();  }while(0)
#define I2CS_SEND_LAST(d) do{ TWDR = (d); I2C_NACK(); }while(0)


#ifdef ENABLE_I2C_SLAVE

#ifndef I2C_ADDR
#error "undefined i2c slave address"
#endif
#if (I2C_ADDR < 0x08 || I2C_ADDR > 0x77)
#error "invalid i2C slave address"
#endif


static void i2cs_send(char c)
{
  while( TW_STATUS != TW_ST_SLA_ACK && TW_STATUS != TW_ST_DATA_ACK ) {
    I2C_ACK();
  }
  I2CS_SEND(c);
}

static char i2cs_recv(void)
{
  while( TW_STATUS != TW_SR_DATA_ACK ) {
    I2C_ACK();
  }
  char c = TWDR;
  I2C_ACK();
  return c;
}

#endif

//@}


/** @name Methods used to communicate with the client.
 *
 * Depending of the configuration, it may be constant or determined at startup.
 *
 * @note When only one protocol is enabled, using function pointers produces
 * smaller binaries than using macro (which is counter-intuitive).
 */
//@{

#if (defined ENABLE_UART) && (defined ENABLE_I2C_SLAVE)

// defaults to uart, to send the first prompt
static void (*proto_send)(char) = uart_send;
static char (*proto_recv)(void) = uart_recv;

#elif (defined ENABLE_UART)

static void (*const proto_send)(char) = uart_send;
static char (*const proto_recv)(void) = uart_recv;

#elif (defined ENABLE_I2C_SLAVE)

static void (*const proto_send)(char) = i2cs_send;
static char (*const proto_recv)(void) = i2cs_recv;

#else
#error "no communication protocol enabled"
#endif


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
    c = proto_recv();
    if( c == '\r' || c == '\n' )
      break;
    buf[i] = c;
  }
  while( c != '\n' )
    c = proto_recv();
  buf[i] = '\0';
}


/** @brief Parse an hexadecimal number.
 *
 * This method is currently used to parse addresses, sizes or smaller data.
 * Thus it uses the minimal appropriate type for val.
 *
 * @return Address of the first character following the parsed number, \e NULL
 * on error.
 *
 * @todo Try to use a dedicated parse_hex8() which may be more optimized.
 */
static const char *parse_hex(const char *p, addr_type *val)
{
  addr_type tmp = 0;
#ifndef DISABLE_STRICT_CHECKS
  uint8_t i; // digit count
  for( i=0; i<2*sizeof(tmp); i++ )
#else
  for(;;)
#endif
  {
    if( *p == ' ' || *p == '\0' )
    {
#ifndef DISABLE_STRICT_CHECKS
      if( i == 0 )
        return NULL;
#endif
      *val = tmp;
      return p;
    }

#ifndef DISABLE_STRICT_CHECKS
    tmp <<= 4;
    if( *p >= '0' && *p <= '9' )
      tmp += *p - '0';
    else if( *p >= 'a' && *p <= 'f' )
      tmp += 10 + *p - 'a';
    else if( *p >= 'A' && *p <= 'F' )
      tmp += 10 + *p - 'A';
    else
      return NULL; // invalid digit
#else
    tmp <<= 4;
    if( *p <= '9' )
      tmp += *p - '0';
    else
      tmp += (*p|' ') - 'a';
#endif
    p++;
  }
  return NULL; // overflow, only when strict checks enabled
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
#ifndef DISABLE_STRICT_CHECKS
  if( rbuf[1] != '\0' )
    return -1;
#endif
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
    proto_send( *s++ );
}

/// Send the EOL sequence.
static void send_eol(void)
{
  proto_send('\r');
  proto_send('\n');
}

/// Send a line ended by an EOL sequence.
#define send_msg(s) do{ send_str(s); send_eol(); }while(0)

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
  proto_send( x < 10 ? x+'0' : x-10 + 'a' );
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
#ifndef DISABLE_STRICT_CHECKS
  if( *p != '\0' ) return -1;
#else
  (void)p;
#endif
  send_str("info i"  // the 'i' command cannot be disabled
#ifndef DISABLE_EXECUTE
      "x"
#endif
#ifndef DISABLE_PROG_PAGE
      "p"
#endif
#ifndef DISABLE_MEM_CRC
      "c"
#endif
#ifndef DISABLE_FUSE_READ
      "f"
#endif
      " ");
  send_hex8(ROID);
  proto_send(' ');
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
 * @note When DISABLE_PROG_CRC is defined, steps 4. and 5. are skipped.
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
  addr_type addr;
#ifndef DISABLE_PROG_CRC
  uint8_t buf[SPM_PAGESIZE]; // data buffer
  uint16_t crc = 0xffff;
#endif
  uint16_t i;

  // Read and check address
#ifndef DISABLE_STRICT_CHECKS
  if( *p != ' ' ) return -1;
  if( (p = parse_hex(p+1, &addr)) == NULL ) return -1;
  if( *p != '\0' ) return -1;
  if( (addr & ((addr_type)SPM_PAGESIZE-1)) != 0 ) return -1;
  if( addr > BOOTLOADER_ADDR ) return -1;
#else
  p = parse_hex(p+1, &addr);
#endif
  send_msg("?data");

#ifndef DISABLE_PROG_CRC

  // Read data from UART and compute CRC
  for( i=0; i<SPM_PAGESIZE; i++ )
  {
    char c = proto_recv();
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

#else

  // Erase page
  eeprom_busy_wait();
  boot_page_erase(addr);
  boot_spm_busy_wait();

  // Read data from UART and compute CRC
  for( i=0; i<SPM_PAGESIZE; i+=2 )
  {
    char c1 = proto_recv();
    char c2 = proto_recv();
    // Set up little-endian word
    uint16_t w = c1 | (((uint16_t)c2)<<8);
    boot_page_fill(addr+i, w);
  }

#endif

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
#ifdef ENABLE_UART
  // extra CRLF to make sure the boot message is properly sent
  send_msg("boot\r\n");
  // wait for the last byte
  while( !(UCSRxA & ((1<<UDREx)|(1<<TXCx))) ) ;
  UCSRxB = 0; // disable
#endif
#ifdef ENABLE_I2C_SLAVE
  TWCR = 0;
  TWAR = 0;
#endif

  /* interruptions not used, moving interrupt vector not needed
  IVCR = (1<<IVCE);
  IVCR = (0<<IVSEL);
   */

#ifdef BOOT_CODE
  do{ BOOT_CODE }while(0);
#endif
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
#ifndef DISABLE_STRICT_CHECKS
  if( *p != '\0' ) return -1;
#else
  (void)p;
#endif
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
  addr_type start, size;
  uint16_t crc = 0xffff;

  // Read and check address and size
#ifndef DISABLE_STRICT_CHECKS
  if( *p != ' ' ) return -1;
  if( (p = parse_hex(p+1, &start)) == NULL ) return -1;
  if( *p != ' ' ) return -1;
  if( (p = parse_hex(p+1, &size)) == NULL ) return -1;
  if( *p != '\0' ) return -1;
  if( start+size > BOOTLOADER_ADDR ) return -1;
#else
  p = parse_hex(p+1, &start);
  p = parse_hex(p+1, &size);
#endif

  // Compute CRC
  addr_type addr;
  uint8_t c;
  for( addr=start; addr<start+size; addr++ )
  {
		c = pgm_read_byte_bootloader(addr);
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
#ifndef DISABLE_STRICT_CHECKS
  if( *p != '\0' ) return -1;
#else
  (void)p;
#endif
  send_str("fuse ");
  send_hex8(boot_lock_fuse_bits_get(GET_LOW_FUSE_BITS));
  proto_send(' ');
  send_hex8(boot_lock_fuse_bits_get(GET_HIGH_FUSE_BITS));
  proto_send(' ');
  send_hex8(boot_lock_fuse_bits_get(GET_EXTENDED_FUSE_BITS));
  send_eol();
  return 0;
}


#ifdef ENABLE_I2C_MASTER
/** @brief Send a message to an I2C slave.
 *
 * @todo Doc/specs.
 */
static int8_t cmd_slave_msg(const char *p)
{
  uint8_t addr; // slave addr
  //TODO parse uint16_t, not addr_type
  addr_type addr16; // variable for parsing
  addr_type size;

#ifndef DISABLE_STRICT_CHECKS
  if( *p != ' ' ) return -1;
  if( (p = parse_hex(p+1, &addr16)) == NULL ) return -1;
  if( *p != ' ' ) return -1;
  if( (p = parse_hex(p+1, &size)) == NULL ) return -1;
  if( *p != '\0' ) return -1;
  if( addr16 < 0x08 || addr16 >= 0x78 ) return -1; // check address range
#else
  p = parse_hex(p+1, &addr16);
  p = parse_hex(p+1, &size);
#endif
  addr = addr16;

  //XXX move it elswhere(?)
  TWBR = I2C_BITRATE;
  TWCR = _BV(TWEN)|_BV(TWINT);
  if(I2C_PRESCALER & 1)
    TWSR |= _BV(TWPS0);
  if(I2C_PRESCALER & 2)
    TWSR |= _BV(TWPS1);

  // poll slave
  for(;;) {
    //TODO abort on uart input, or timeout
    I2CM_START();
#ifndef DISABLE_STRICT_CHECKS
    if( TW_STATUS != TW_START )
      return -1;
#endif
    // slave address + Write bit (0)
    I2CM_SEND(addr<<1);
    if( TW_STATUS == TW_MT_SLA_ACK )
      break;
#ifndef DISABLE_STRICT_CHECKS
    if( TW_STATUS != TW_MT_SLA_NACK )
      return -1;
#endif
    I2CM_STOP();
  }

  send_msg("?msg");

  // send msg
  uint16_t i;
  for( i=0; i<size-1; i++ ) {
    I2CM_SEND( proto_recv() );
#ifndef DISABLE_STRICT_CHECKS
    if( TW_STATUS != TW_MT_DATA_ACK ) {
      I2CM_STOP();
      return -1;
    }
#endif
  }
  I2CM_SEND( proto_recv() );
#ifndef DISABLE_STRICT_CHECKS
  if( TW_STATUS != TW_MT_DATA_NACK ) {
    I2CM_STOP();
    return -1;
  }
#endif

  I2CM_STOP();

  // request transmitted, shall we process a response?
  int8_t yn = recv_yesno();
  if( yn == 0 ) {
    send_status_ok();
    return 0;
  } else if( yn != 1 ) {
    return -1;
  }

  // receive response
  I2CM_START();
#ifndef DISABLE_STRICT_CHECKS
  if( TW_STATUS != TW_START )
    return -1;
#endif
  // slave address + Read bit (1)
  I2CM_SEND((addr<<1)+1);
#ifndef DISABLE_STRICT_CHECKS
  if( TW_STATUS == TW_MR_SLA_NACK ) {
    I2CM_STOP();
    return -1;
  }
  if( TW_STATUS != TW_MR_SLA_ACK )
    return -1;
#endif
  for(;;) {
    I2C_ACK();
    char c = TWDR;
    if( c == 0xff )
      break;
    proto_send(c);
  }
  I2C_NACK();
  I2CM_STOP();
  send_eol();

  return 0;
}
#endif


//@}


/** @brief Main loop.
 */
int main(void)
{
#ifdef INIT_CODE
  do{ INIT_CODE }while(0);
#endif

  /* interruptions not used, moving interrupt vector not needed
  IVCR = (1<<IVCE);
  IVCR = (1<<IVSEL);
   */

#ifdef ENABLE_UART
  // UART init (all values have been already computed)
  UBRRxH = (uint8_t)(UART_UBRR_VAL>>8);
  UBRRxL = (uint8_t)UART_UBRR_VAL;
  UCSRxA = UART_U2X_VAL;
  UCSRxB = (1<<RXENx) | (1<<TXENx);
  UCSRxC = UART_NBITS_VAL | UART_PARITY_VAL | UART_STOP_BIT_VAL;
#endif
#ifdef ENABLE_I2C_SLAVE
  // I2C init
  TWAR = I2C_ADDR << 1;
  TWCR = (1<<TWIE)|(1<<TWEN)|(1<<TWINT)|(1<<TWEA);
#endif

#ifdef ENABLE_UART
  // first prompt
  send_eol();
  send_prompt();
#endif
  // timeout before booting
  uint8_t i = (BOOT_TIMEOUT)*F_CPU/(65536*4*1000);
  for(;;) {
    // detect activity from client
    // set the proto_* method if needed

    // from UART
#ifdef ENABLE_UART
    if( (UCSRxA & (1<<RXCx)) ) {
      // uart is the default for proto_*
      break;
    }
#endif

    // from I2C
#ifdef ENABLE_I2C_SLAVE
    if( (TWCR & (1<<TWINT)) ) {
#ifdef ENABLE_UART
      proto_send = i2cs_send;
      proto_recv = i2cs_recv;
#endif
      break;
    }
#endif

    if( i == 0 )
      boot(); // timeout
    i--;
    _delay_loop_2(0); // 65536*4 cycles
  }


  char rbuf[ROBLOS_BUF_SIZE];
  for(;;) {
    recv_line(rbuf);
    if( *rbuf != '\0' ) {
      int8_t ret;
      if( *rbuf == 'i' )
        ret = cmd_infos(rbuf+1);
#ifndef DISABLE_EXECUTE
      else if( *rbuf == 'x' )
        ret = cmd_execute(rbuf+1);
#endif
#ifndef DISABLE_PROG_PAGE
      else if( *rbuf == 'p' )
        ret = cmd_prog_page(rbuf+1);
#endif
#ifndef DISABLE_MEM_CRC
      else if( *rbuf == 'c' )
        ret = cmd_mem_crc(rbuf+1);
#endif
#ifndef DISABLE_FUSE_READ
      else if( *rbuf == 'f' )
        ret = cmd_fuse_read(rbuf+1);
#endif
#ifdef ENABLE_I2C_MASTER
      else if( *rbuf == 's' )
        ret = cmd_slave_msg(rbuf+1);
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

