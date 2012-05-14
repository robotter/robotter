/** @file
 * @brief Include template code for uart.h.
 *
 * The N_(p,s) macro must be defined before including.
 * It is automatically undefined at the end of this file.
 */

#define uartN(s) N_(uart,s)

#include <stdbool.h>

/** @brief Receive a byte.
 * @return The received value.
 */
int uartN(_recv)(void);

/** @brief Receive a byte without blocking.
 * @return The received byte or -1.
 */
int uartN(_recv_nowait)(void);

/** @brief Send a byte.
 * @return Always 0.
 */
int uartN(_send)(uint8_t v);

/** @brief Send a byte without blocking.
 * @return 0 if data has been sent, -1 otherwise.
 */
int uartN(_send_nowait)(uint8_t v);

/** @brief Disable TX after sending the current frame.
 *
 * If \e wait is set, wait for all waiting data to be transmitted before
 * returning.
 *
 * This method should be called right after sending the last frame byte.
 * TX will be enabled on the next send.
 */
void uartN(_disable_tx)(bool wait);


/// Get function to be used with fdevopen().
int uartN(_dev_recv)(FILE *);

/// Put function to be used with fdevopen().
int uartN(_dev_send)(char c, FILE *);

/// Set the RX event handler.
void uartN(_set_rx_event)(void (*)(uint8_t));


#undef uartN
#undef N_
