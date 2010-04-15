#include <aversive.h>

#define I2C_SLAVE
#include "i2c_robotter_config.h"

/** @file
 * @brief I2C, slave side.
 *
 * On W frames (master send, slave receive), \c i2cs_recv_buf is filled with
 * received data. \c i2cs_recv_size is reset to 0 when the frame starts and set
 * to the size of received data when it ends.
 *
 * On R frames (master receive, slave send), if \c i2cs_send_size is 0, a
 * single byte with the value of \c I2CS_SEND_NONE_BYTE is sent, followed by a
 * NACK; otherwise the \c i2cs_send_size first bytes of \c i2cs_send_buf are
 * sent (or less if the master sends a NACK/STOP earlier) and \e i2cs_send_size
 * is reset to 0.
 *
 * Buffer overflows are prevented:
 *  - \c i2cs_send_size is adjusted if larger \c I2CS_RECV_BUF_SIZE;
 *  - a NACK is sent after sending the last byte to send;
 *  - 0xFF bytes are sent after sending the last byte of \c i2cs_send_buf.
 *
 * @note <tt>i2cs_*_size</tt> are volatile globals, which imply "costly"
 * accesses. Their values should be stored in temporary local variables,
 * especially when iterating through \c i2c_recv_buf buffer with e \c for.
 */


extern volatile uint8_t i2cs_recv_buf[I2CS_RECV_BUF_SIZE];
extern volatile uint8_t i2cs_recv_size;

extern volatile uint8_t i2cs_send_buf[I2CS_SEND_BUF_SIZE];
extern volatile uint8_t i2cs_send_size;


/** @brief Initialize I2C, slave side.
 *
 * Buffers are filled with 0 and state is set to \c I2C_NONE.
 */
void i2cs_init(uint8_t slave_addr);

