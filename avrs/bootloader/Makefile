
TARGET = roblos

OBJ = roblos
CONFIG = roblos_config

-include $(CONFIG).mk


OPT = s

# Compiler and linker flags

CFLAGS += -g -O$(OPT) -std=gnu99 -Wall -Wextra -Werror -Wno-unused-function
CFLAGS += -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -mmcu=$(MCU) 


# export conf shared with C

CONFIG_VARS = QUARTZ_FREQ BOOTLOADER_ADDR ROBOTTER_ID \
							ROBLOS_BOOT_TIMEOUT ROBLOS_INIT \
							UART_NUM UART_BAUDRATE UART_USE_DOUBLE_SPEED UART_NBITS \
							UART_PARITY UART_STOP_BIT

CONFIG_FLAGS = ROBLOS_DISABLE_PROG_PAGE ROBLOS_DISABLE_EXECUTE \
							 ROBLOS_DISABLE_MEM_CRC ROBLOS_DISABLE_FUSE_READ \
							 ROBLOS_DISABLE_PROG_CRC \
							 ROBLOS_DISABLE_STRICT_CHECKS


define define_config_var
CFLAGS += -D$(1)=$($(1))
endef
define define_config_flag
ifdef $(1)
CFLAGS += -D$(1)
endif
endef
$(foreach v,$(CONFIG_VARS),$(eval $(call define_config_var,$(v))))
$(foreach v,$(CONFIG_FLAGS),$(eval $(call define_config_flag,$(v))))


LDFLAGS += -mmcu=$(MCU)
LDFLAGS += -Wl,--section-start=.text=$(BOOTLOADER_ADDR)


# Programs and commands

CC = avr-gcc
OBJCOPY = avr-objcopy


## Make rules

default: $(TARGET).hex

# compile + link
$(TARGET).elf: $(OBJ).c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

# final output file
$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

clean:
	rm -f $(TARGET).hex $(TARGET).elf


# make targets of generated files PHONY to force recompile on config change
.PHONY : default clean $(TARGET).hex $(TARGET).elf

