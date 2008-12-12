
// For slaves only
#ifdef I2C_SLAVE
#define I2C_BUF_SIZE    8
#endif

#define I2C_BITRATE   1 // divider for i2c baudrate, see TWBR in doc 
#define I2C_PRESCALER 3 // prescaler config, rate = 2^(n*2)

