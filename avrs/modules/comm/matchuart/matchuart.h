
/** @brief Initialize UART matching.
 *
 * It is not possible to watch several UARTs.
 * The previous matching handler is removed before setting a new one.
 *
 * @param num  UART to watch
 * @param pat  nul-terminated pattern string to match
 * @param cb   callback called on matching, \e NULL to disable
 */
void matchuart_init(uint8_t num, const char *pat, void (*cb)(void));

