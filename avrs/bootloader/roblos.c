/** @file
 *  @brief Rob'Otter Bootloader, server part.
 *
 * A Generic bootloader for ATmega devices which communicates with a remote
 * client through UART.
 *
 * The device which runs the bootloader will be referred as the \e server. The
 * remote client will be referred as the \e client.
 *
 * All CRC computations use the CRC-16-CCITT.
 */

// Required by "util/delay.h"
#define F_CPU  ((unsigned long)QUARTZ_FREQ)

#include <avr/io.h>
#include <avr/boot.h>
#include <avr/pgmspace.h>
#include <util/crc16.h>
#include <util/delay.h>
#include <util/twi.h>

/** @brief Run the application.
 * @note Registers are not initialized.
 */
#define run_app()                        \
do {				                             \
  __asm__ __volatile__ ("ldi r30,0\n");  \
  __asm__ __volatile__ ("ldi r31,0\n");  \
  __asm__ __volatile__ ("ijmp\n");       \
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


// Check bootloader address.
#if BOOTLOADER_ADDR < FLASHEND/2
#error "Suspicious bootloader address; it should be given in bytes, not words."
#endif


/** @brief Type for memory addresses and sizes.
 *
 * The bootloader address is the highest possible address. (Another way could
 * be to test whether the RAMPZ register is defined.)
 *
 * \e ADDR_SIZE_LARGE is (un)defined accordingly.
 */
#if FLASHEND >= 0x10000
// more than 64k
typedef uint32_t addr_type;
#define pgm_read_byte_bootloader pgm_read_byte_far
#define ADDR_SIZE_LARGE
#else
// less than 64k
typedef uint16_t addr_type;
#define pgm_read_byte_bootloader pgm_read_byte_near
#undef ADDR_SIZE_LARGE
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
#define I2C_SEND(d)      do{ TWDR = (d); I2C_ACK();  }while(0)
#define I2C_SEND_LAST(d) do{ TWDR = (d); I2C_NACK(); }while(0)


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
  I2C_SEND(c);
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


/** @name General protocol definitions.
 */
//@{

#define STATUS_NONE             0x00
#define STATUS_SUCCESS          0x01
#define STATUS_BOOTLOADER_MSG   0x0a // LF
#define STATUS_I2C_WAIT_FRAME   0x20
#define STATUS_I2C_READ         0x21
#define STATUS_FAILURE          0xff
#define STATUS_UNKNOWN_COMMAND  0x81
#define STATUS_NOT_SUPPORTED    0x82
#define STATUS_BAD_FORMAT       0x83
#define STATUS_BAD_VALUE        0x84
#define STATUS_CRC_MISMATCH     0x90
#define STATUS_I2C_ERROR        0xa0
#define STATUS_I2C_BAD_FRAME    0xa1


/// Send a reply with given status and field size.
static void reply(uint8_t st, uint8_t size)
{
  proto_send(size+1);
  proto_send(st);
}

/// Prepare a success reply with a given field size.
static void reply_success(uint8_t size)
{
  reply(STATUS_SUCCESS, size);
}

/// Send a failure reply with no fields.
static void reply_failure(void)
{
  reply(STATUS_FAILURE, 0);
}

/// Send a custom error reply with no fields.
static void reply_error(uint8_t st)
{
  reply(st, 0);
}

/** @brief Send a human-readable reply.
 *
 * This method is intended for messages sent by the bootloader which may not be
 * handled by a client (eg. enter/exit messages).
 *
 * \e msg must be 10 character long.
 * The resulting message will be \e msg surrounded by CRLF sequences, and still
 * be a valid protocol reply.
 *
 * @note This method is not relevant when using I2C.
 */
#define SEND_MESSAGE(msg) send_str("\r\n" msg "\r\n")

static void send_u8(uint8_t v)
{
  proto_send(v);
}

static void send_u16(uint16_t v)
{
  proto_send(v&0xff);
  proto_send((v>>8)&0xff);
}

/// Send a NUL terminated string (without the NUL character)
static void send_str(const char *s)
{
  while( *s )
    proto_send( *s++ );
}

static uint16_t recv_u16(void)
{
  uint16_t ret = proto_recv();
  ret += proto_recv()<<8;
  return ret;
}

static uint32_t recv_u32(void)
{
  uint32_t ret = proto_recv();
  ret += proto_recv()*0x100U;
  ret += proto_recv()*0x10000U;
  ret += proto_recv()*0x1000000U;
  return ret;
}

/// Receive an address value.
static addr_type recv_addr(void)
{
#ifdef ADDR_SIZE_LARGE
  return recv_u32();
#else
  addr_type ret = recv_u16();
  // drop high bits
  proto_recv();
  proto_recv();
  return ret;
#endif
}

//@}


/** @brief Run the application.
 */
static void boot(void)
{
#ifdef ENABLE_UART
  // extra null bytes to make sure the status is properly sent
  proto_send(0);
  proto_send(0);
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
  run_app();
}


/** @name Protocol commands
 *
 * Commands format is:
 *  - a command (u8);
 *  - parameters.
 *
 * Reply format is:
 *  - reply size (u8), not counting the size byte itself;
 *  - a status code (u8);
 *  - reply fields.
 *
 * @note The reply size is never 0 since it includes at least the status code.
 * This is used by the I2C slave sessions, for read frames.
 *
 * \e SZ designates a null-terminated string. Addresses provided an u32.
 * However, they may be internally used as u16 for devices with less than 64kB
 * of memory.
 *
 * @todo Review command names.
 */
//@{

/** @brief Dump general infos
 *
 * Reply fields:
 *  - ROID (u8)
 *  - SPM_PAGESIZE value (u16)
 *  - supported features (SZ)
 *  - supported commands (SZ)
 *
 * Supported features are:
 *  - \c U if UART is enabled
 *  - \c S if I2C (as slave) is enabled
 *  - \c C if CRC check while programming is enabled
 *
 * @todo Return bitmasks, not strings.
 */
static void cmd_infos(void)
{
  static const char features[] = ""
#ifndef DISABLE_PROG_CRC
      "C"
#endif
#ifdef ENABLE_UART
      "U"
#endif
#ifdef ENABLE_I2C_SLAVE
      "S"
#endif
      ;
  static const char commands[] =
      "i\xffm"  // commands which cannot be disabled
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
#ifndef DISABLE_COPY_PAGES
      "y"
#endif
#ifdef ENABLE_I2C_MASTER
      "s"
#endif
      ;
  reply_success(1+2+sizeof(features)+sizeof(commands));
  send_u8(ROID);
  send_u16(SPM_PAGESIZE);
  send_str(features);
  proto_send(0);
  send_str(commands);
  proto_send(0);
}


/** @brief Read a byte and send it back.
 */
static void cmd_mirror(void)
{
  const char c = proto_recv();
  reply_success(1);
  send_u8(c);
}

/** @brief Terminate the connection and run the application.
 *
 * The server replies to acknowledge, then resets.
 */
static void cmd_execute(void)
{
  reply_success(0);
  boot();
}


/** @brief Program a page.
 *
 * When using CRC check, the page is now written on mismatch.
 *
 * Parameters:
 *  - page address (u32), must be aligned
 *  - CRC (u16), ignored if CRC check is not available
 *  - page data
 */
static void cmd_prog_page(void)
{
  const addr_type addr = recv_addr();
#ifndef DISABLE_STRICT_CHECKS
  // addr aligned on SPM_PAGESIZE and not in the bootloader area
  // writing the last page is allowed (to update roblocop)
  if( (addr & ((addr_type)SPM_PAGESIZE-1)) != 0 ||
#ifndef DISABLE_COPY_PAGES
     (addr > BOOTLOADER_ADDR && addr <= FLASHEND-SPM_PAGESIZE)
#else
     addr > BOOTLOADER_ADDR
#endif
    ) {
    reply_error(STATUS_BAD_VALUE);
    return;
  }
#endif

  eeprom_busy_wait();

#ifdef DISABLE_PROG_CRC
  recv_u16(); // eat the crc
  uint16_t i;
  // Read data and fill temporary page buffer
  for( i=0; i<SPM_PAGESIZE; i+=2 ) {
    boot_page_fill(addr+i, recv_u16());
  }
#else
  const uint16_t crc_expected = recv_u16();
  uint16_t crc = 0xffff;
  uint16_t i;

  // Read data, fill temporary page buffer, compute CRC
  for( i=0; i<SPM_PAGESIZE; i+=2 ) {
    char c1 = proto_recv();
    char c2 = proto_recv();
    crc = _crc_ccitt_update(crc, c1);
    crc = _crc_ccitt_update(crc, c2);
    uint16_t w = c1 + (c2<<8); // little endian word
    boot_page_fill(addr+i, w);
  }

  // check CRC
  if( crc != crc_expected ) {
    boot_rww_enable();
    reply_error(STATUS_CRC_MISMATCH);
    return;
  }
#endif

  // Erase page
  boot_page_erase(addr);
  boot_spm_busy_wait();
  // Write the page buffer to the page
  boot_page_write(addr);
  boot_spm_busy_wait();
  // Reenable RWW section
  boot_rww_enable();

  reply_success(0);
}


/** @brief Compute the CRC of a given memory range.
 *
 * The client asks for a CRC, providing an address and a size, and the server
 * replies with the computed CRC.
 *
 * Parameters:
 *  - start address (u32)
 *  - size (u32)
 *
 * Reply: computed CRC (u16)
 */
static void cmd_mem_crc(void)
{
  const addr_type start = recv_addr();
  const addr_type size = recv_addr();

#ifndef DISABLE_STRICT_CHECKS
  if( start + size > FLASHEND+1 ) {
    reply_error(STATUS_BAD_VALUE);
    return;
  }
#endif

  // Compute CRC
  uint16_t crc = 0xffff;
  addr_type addr;
  uint8_t c;
  for( addr=start; addr<start+size; addr++ ) {
		c = pgm_read_byte_bootloader(addr);
    crc = _crc_ccitt_update(crc, c);
  }

  reply_success(2);
  send_u16(crc);
}


/** @brief Dump fuse values
 *
 * Reply fields: low, high, extended fuse bytes (u8s)
 */
static void cmd_fuse_read(void)
{
  reply_success(3);
  send_u8(boot_lock_fuse_bits_get(GET_LOW_FUSE_BITS));
  send_u8(boot_lock_fuse_bits_get(GET_HIGH_FUSE_BITS));
  send_u8(boot_lock_fuse_bits_get(GET_EXTENDED_FUSE_BITS));
}


#ifndef DISABLE_COPY_PAGES

/** @brief Page copy method.
 *
 * Code must be located in the last page of the flash.
 *
 * @note Function pointers values are addresses in words.
 */
extern void roblocop_pgm_copy(uint16_t dest, uint16_t src, uint8_t n);

/** @brief Copy pages then do a (true) software reset.
 *
 * When using CRC check, the page is now written on mismatch.
 *
 * Parameters:
 *  - dest page address (u32), must be aligned and in high 64KB (if relevant)
 *  - source page address (u32), must be aligned and in low 64KB (if relevant)
 *  - page count (u8), must be not null
 */
static void cmd_copy_pages(void)
{
  const addr_type dest = recv_addr();
  const addr_type src  = recv_addr();
  const uint8_t n = proto_recv();

#ifndef DISABLE_STRICT_CHECKS
  if(
      // note: overflows in computations are not handled
      n == 0 ||
      ((dest|src) & ((addr_type)SPM_PAGESIZE-1)) != 0 ||
#ifdef ADDR_SIZE_LARGE
      dest < 0x10000 || src >= 0x10000 ||
#else
      src + n*SPM_PAGESIZE > FLASHEND ||
#endif
      dest + n*SPM_PAGESIZE > FLASHEND-SPM_PAGESIZE
    ) {
    reply_error(STATUS_BAD_VALUE);
    return;
  }
#endif

  reply_success(0);
  eeprom_busy_wait();
  roblocop_pgm_copy(dest, src, n);
}

#endif


#ifdef ENABLE_I2C_MASTER
/** @brief Run a session with an I2C slave.
 *
 * A session consists of several read or write frames.
 *
 * Parameters for the 's' command:
 *  - I2C slave address (u8)
 *
 * After the 's' command the client is expected to send one of the following
 * subcommands:
 *  - '<': read data from the slave
 *  - '>': send data to the slave
 *  - '-': ends the slave session
 *
 * Parameters for the '<' command:
 *  - data size (u8) or 0
 *
 * If the data size is 0, the value is read from the first data byte and is the
 * number of bytes to read after this first one. This is used to read protocol
 * replies from the slave.
 *
 * Parameters for the '>' command:
 *  - data size (u16)
 *  - data to send
 *
 * After each subcommand, the server reply with an appropriated status.
 * The SUCCESS status is only used when successfully ending the session.
 * An error status abort the session.
 *
 * The slave part is intended to be minimalistic. Therefore, it has a (very)
 * lazy handling of I2C states. Especially, the master should not except NACK
 * from it.
 */
static void cmd_slave_session(void)
{
#ifdef ENABLE_I2C_SLAVE
#ifndef DISABLE_STRICT_CHECKS
  // command allowed in UART mode only
  if( proto_send != uart_send ) {
    reply_failure();
    return;
  }
#endif
#endif
  uint8_t addr = proto_recv(); // slave addr
#ifndef DISABLE_STRICT_CHECKS
  if( addr < 0x08 || addr >= 0x78 ) {
    reply_error(STATUS_BAD_VALUE);
    return;
  }
#endif

  // configure I2C
  //XXX move it elswhere(?)
  TWBR = I2C_BITRATE;
  TWCR = _BV(TWEN)|_BV(TWINT);
  if(I2C_PRESCALER & 1) TWSR |= _BV(TWPS0);
  if(I2C_PRESCALER & 2) TWSR |= _BV(TWPS1);

  // poll the slave
  do I2CM_START(); while( TW_STATUS != TW_START );
  I2C_SEND(addr<<1); // write
  I2CM_STOP();

  for(;;) {
    proto_send(STATUS_I2C_WAIT_FRAME);
    char c = proto_recv();
    if( c == 0 ) {
      continue; // null command: ignore
    } else if( c == '-' ) {
      // end of session
      reply_success(0);
      return;

    } else if( c == '>' ) {
      // write frame
      uint16_t size = recv_u16();
#ifndef DISABLE_STRICT_CHECKS
      if( size == 0 ) {
        reply_error(STATUS_BAD_VALUE);
        return;
      }
#endif
      I2CM_START();
#ifndef DISABLE_STRICT_CHECKS
      if( TW_STATUS != TW_START ) {
        goto slave_i2c_error;
      }
#endif
      // slave address + Write bit (0)
      I2C_SEND(addr<<1);
#ifndef DISABLE_STRICT_CHECKS
      if( TW_STATUS == TW_MT_SLA_NACK ) {
        I2CM_STOP();
        goto slave_i2c_error;
      }
      if( TW_STATUS != TW_MT_SLA_ACK ) {
        goto slave_i2c_error;
      }
#endif
      // transfer data
      while( size-- != 1 ) {
        I2C_SEND( proto_recv() );
#ifndef DISABLE_STRICT_CHECKS
        if( TW_STATUS != TW_MT_DATA_ACK ) {
          I2CM_STOP();
          goto slave_i2c_error;
        }
#endif
      }
      I2C_SEND_LAST( proto_recv() );
#ifndef DISABLE_STRICT_CHECKS
      if( TW_STATUS != TW_MT_DATA_ACK && TW_STATUS != TW_MT_DATA_NACK ) {
        I2CM_STOP();
        goto slave_i2c_error;
      }
      I2CM_STOP();
#endif

    } else if( c == '<' ) {
      uint8_t size = proto_recv();
      // read frame
      I2CM_START();
#ifndef DISABLE_STRICT_CHECKS
      if( TW_STATUS != TW_START ) {
        goto slave_i2c_error;
      }
#endif
      // slave address + Read bit (1)
      I2C_SEND((addr<<1)+1);
#ifndef DISABLE_STRICT_CHECKS
      if( TW_STATUS != TW_MR_SLA_ACK && TW_STATUS != TW_MR_SLA_NACK ) {
        I2CM_STOP();
        goto slave_i2c_error;
      }
#endif
      if( size == 0 ) {
        // read the size in the first byte
        I2C_ACK();
        size = TWDR;
        reply(STATUS_I2C_READ, size+1);
        proto_send(size);
      } else {
        reply(STATUS_I2C_READ, size);
      }
      while( size-- != 1 ) {
        I2C_ACK();
        char c = TWDR;
        proto_send(c);
      }
      I2C_NACK();
      proto_send( TWDR );
      I2CM_STOP();
    } else {
      reply_error(STATUS_I2C_BAD_FRAME);
      return;
    }
  }
  return;
#ifndef DISABLE_STRICT_CHECKS
slave_i2c_error:
  reply_error(STATUS_I2C_ERROR);
  return;
#endif
}
//@}
#endif


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
  SEND_MESSAGE("boot ENTER");
#endif
  // timeout before booting
  uint8_t i = (BOOT_TIMEOUT)*F_CPU/(65536*4*1000);
  for(;;) {
    // detect activity from client
    // set the proto_* method if needed

    // from UART
#ifdef ENABLE_UART
    if( (UCSRxA & (1<<RXCx)) ) {
      // UART is the default for proto_*
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

  for(;;) {
    char c = proto_recv();
    if( c == 0x00 ) {
      continue; // null command: ignore
    } else if( c == 0xff ) {
      // failure command
      reply_failure();
    } else if( c == 'i' ) {
      cmd_infos();
    }
    else if( c == 'm' ) cmd_mirror();
#ifndef DISABLE_EXECUTE
    else if( c == 'x' ) cmd_execute();
#endif
#ifndef DISABLE_PROG_PAGE
    else if( c == 'p' ) cmd_prog_page();
#endif
#ifndef DISABLE_MEM_CRC
    else if( c == 'c' ) cmd_mem_crc();
#endif
#ifndef DISABLE_FUSE_READ
    else if( c == 'f' ) cmd_fuse_read();
#endif
#ifndef DISABLE_COPY_PAGES
    else if( c == 'y' ) cmd_copy_pages();
#endif
#ifdef ENABLE_I2C_MASTER
    else if( c == 's' ) cmd_slave_session();
#endif
    else {
      reply_error(STATUS_UNKNOWN_COMMAND);
    }
  }

  return 1;
}

