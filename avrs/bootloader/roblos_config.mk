
#
# Bootloader Makefile configuration variables
# (some of these are shared with C)
#

MCU = atmega128

QUARTZ_FREQ = 8000000

# Bootloader address (in bytes)
# WARNING: in the datasheet, bootloader addresses are given in words
BOOTLOADER_ADDR = 0x1F800


