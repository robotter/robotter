
/** @file
 * @brief UART configuration.
 *
 * UART numbers must between 0 and UART_NUM_MAX inclusive.
 *
 * Each UART-specific configuration variable a default value can be define.
 * If \e UART<N>_X is undefined, \e UART_X will be used instead.
 */


/** @brief Default UART.
 *
 * Main UART is used to define aliases without UART number in their name.
 * Use of these aliases should be preferred since it allows to easily switch
 * UART number only be modifying the value of UART_NUM.
 *
 * \e UART<N>_ENABLE is automatically defined for the default UART.
 */
#define UART_NUM 0

/// Buffer size for received data.
#define UART_RX_BUF_SIZE  32
/// Buffer size for sent data.
#define UART_TX_BUF_SIZE  32

/// Baudrate
#define UART_BAUDRATE  38400
/// Use double speed, double maximum baudrate in exchange for precision.
#define UART_DOUBLE_SPEED  0


// UART1 for AX12
#define UART1_ENABLE
#define UART1_BAUDRATE 19200

