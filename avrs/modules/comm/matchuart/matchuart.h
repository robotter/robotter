#ifndef MATCHUART_H__
#define MATCHUART_H__

/** @brief Initialize UART matching.
 *
 * The default UART is used (defined by UART_NUM).
 * It is not possible to watch several UARTs.
 * The previous matching handler is removed before setting a new one.
 *
 * @param pat  nul-terminated pattern string to match
 * @param cb   callback called on matching, \e NULL to disable
 */
void matchuart_init(const char *pat, void (*cb)(void));

#endif
