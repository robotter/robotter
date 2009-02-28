#include <aversive.h>

#define I2C_MASTER
#include "i2c_robotter_config.h"

#define I2C_WAIT()  { while( !( TWCR & (1<<TWINT) ) ); }
#define I2C_ACK()   { TWCR=(1<<TWEN)+(1<<TWEA)+(1<<TWINT); I2C_WAIT(); }
#define I2C_NACK()  { TWCR=(1<<TWEN)+(1<<TWINT); I2C_WAIT(); }
#define I2C_NEXT()  { TWCR=(1<<TWEN)+(1<<TWEA)+(1<<TWINT); I2C_WAIT(); }
#define I2C_START() { TWCR=(1<<TWEN)+(1<<TWSTA)+(1<<TWINT); I2C_WAIT() }
#define I2C_STOP()  { TWCR=(1<<TWEN)+(1<<TWSTO)+(1<<TWINT); }
#define I2C_SEND(d) { TWDR = (d); I2C_NEXT(); }


/// Initialize I2C, master side
void i2cm_init(void);

/** @brief Send data frame to a slave
 *
 * @param  slave_addr  slave address
 * @param  n           size to send
 * @param  data        buffer for send data
 */
void i2cm_send(uint8_t slave_addr, uint8_t n, const uint8_t* data);

/** @brief Send data frame to a slave
 *
 * @param  slave_addr  slave address
 * @param  n           size to read
 * @param  data        buffer for read data
 *
 * @retval  0  success
 * @retval -1  error (no ACK)
 */
int8_t i2cm_recv(uint8_t slave_addr, uint8_t n, uint8_t* data);

/** @brief Ask slave for data and read it is ready
 *
 * Read data from slave. If the first read byte is 0, it means that slave is
 * not ready and the function ends. Otherwise, the next \e n bytes are read.
 *
 * @param  slave_addr  slave address
 * @param  n           size to read
 * @param  data        buffer for read data
 *
 * @retval -1  error (no ACK)
 * @retval  0  data is not ready, no data read
 * @retval  1  data has been read
 */
int8_t i2cm_ask_and_recv(uint8_t slave_addr, uint8_t n, uint8_t* data);

