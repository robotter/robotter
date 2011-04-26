
#
# Bootloader configuration variables.
# (Used by the Makefile and shared with C.)
#
# This is a default configuration file which can be used as template.
# A custom my-config.mk can be used by running:
#   make CONFIG=my-config
#
# Flags are set when having a non empty value.
#

MCU = atmega128

QUARTZ_FREQ = 8000000

# Bootloader address (in bytes).
# Warning: in the datasheet, bootloader addresses are given in words.
BOOTLOADER_ADDR = 0x1F800

# Device's ROID
ROID = 0


# Rough timeout before booting at startup, in ms.
# Actual precision is about 262144/freq (33ms at 8Mhz).
BOOT_TIMEOUT = 1000

# Additional code executed at startup.
INIT_CODE =

# Additional code executed before booting the application.
BOOT_CODE = 


### General features.

DISABLE_PROG_PAGE =
DISABLE_EXECUTE =
DISABLE_MEM_CRC =
DISABLE_FUSE_READ =
DISABLE_COPY_PAGES =
# Disable CRC check while programming a page.
DISABLE_PROG_CRC =


## Disable strict checking.
# When strict checking is disabled, input commands are assumed to be
# well-formed and arguments valid.
# Some checks are skipped, thus producing a smaller binary file.
DISABLE_STRICT_CHECKS =


### UART configuration.

ENABLE_UART = y

UART_NUM = 1
UART_BAUDRATE = 38400
UART_USE_DOUBLE_SPEED = 0  # 1
UART_NBITS = 8  # 5 6 7
UART_PARITY = UART_PARITY_NONE  # UART_PARITY_ODD UART_PARITY_EVEN
UART_STOP_BIT = 1  # 2


### I2C configuration

ENABLE_I2C_SLAVE = 
ENABLE_I2C_MASTER = 

# slave address
I2C_ADDR = $(ROID)  # slave address

# bus frequency (only required for master)
# f_i2c = f_cpu / ( 16 + 2 * bitrate * 4^prescaler )
I2C_BITRATE = 1
I2C_PRESCALER = 2

