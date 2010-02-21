
#define ROBOTTER_ID  0

/** @brief Rough timeout before booting at startup, in ms.
 * Actual precision is about 262144/freq (33ms at 8Mhz).
 */
#define ROBLOS_BOOT_TIMEOUT   1000

/// Code executed at startup.
#define ROBLOS_INIT

/** @name Disabled commands.
 */
//@{
//#define ROBLOS_DISABLE_PROG_PAGE
//#define ROBLOS_DISABLE_EXECUTE
//#define ROBLOS_DISABLE_MEM_CRC
//#define ROBLOS_DISABLE_FUSE_READ
//@}


/** @name UART configuration.
 */
//@{

#define UART_NUM  1

#define UART_BAUDRATE  38400
#define UART_USE_DOUBLE_SPEED  0
//#define UART_USE_DOUBLE_SPEED  1

//#define UART_NBITS  5
//#define UART_NBITS  6
//#define UART_NBITS  7
#define UART_NBITS  8

#define UART_PARITY  UART_PARTITY_NONE
//#define UART_PARITY  UART_PARTITY_ODD
//#define UART_PARITY  UART_PARTITY_EVEN

#define UART_STOP_BIT  1
//#define UART1_STOP_BIT  2

//@}

