
TARGET = roblos
COPTARGET = $(TARGET).cop

ROBLOS = roblos
ROBLOCOP = roblocop
CONFIG = roblos_config

-include $(CONFIG).mk

# Programs and commands

CC = avr-gcc
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size



OPT = s

# Compiler, assembler and linker flags

CFLAGS += -g -O$(OPT) -std=gnu99 -Wall -Wextra -Werror -Wno-unused-function
CFLAGS += -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -mmcu=$(MCU) 
ASFLAGS += -mmcu=$(MCU)


# export conf shared with C

CONFIG_VARS = QUARTZ_FREQ BOOTLOADER_ADDR ROID \
							BOOT_TIMEOUT INIT_CODE BOOT_CODE \
							UART_NUM UART_BAUDRATE UART_USE_DOUBLE_SPEED UART_NBITS \
							UART_PARITY UART_STOP_BIT \
							I2C_ADDR I2C_BITRATE I2C_PRESCALER

CONFIG_FLAGS = DISABLE_PROG_PAGE DISABLE_EXECUTE DISABLE_MEM_CRC \
							 DISABLE_PROG_CRC DISABLE_FUSE_READ DISABLE_COPY_PAGES \
							 DISABLE_STRICT_CHECKS \
							 ENABLE_UART ENABLE_I2C_SLAVE ENABLE_I2C_MASTER


define define_config_var
ifdef $(1)
CFLAGS += -D$(1)=$($(1))
endif
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


## Make rules

default: $(TARGET).hex

# compile + link
ifdef DISABLE_COPY_PAGES
$(TARGET).elf: $(ROBLOS).c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
else
$(TARGET).elf: $(ROBLOS).c $(COPTARGET).o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) \
		-Wl,--section-start=.roblocop=$(firstword $(shell $(OBJDUMP) -t $(COPTARGET).o|grep '\<roblocop_address\>'))
endif

$(COPTARGET).o: $(ROBLOCOP).S
	$(CC) $(ASFLAGS) -o $@ -c $<

$(TARGET).E: $(ROBLOS).c
	$(CC) -E $(CFLAGS) -o $@ $<


# final output file
$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

$(COPTARGET).hex: $(COPTARGET).elf
	$(OBJCOPY) -O ihex $< $@

clean:
	rm -f $(TARGET).hex $(TARGET).elf $(COPTARGET).hex $(COPTARGET).o

size:
	$(SIZE) $(TARGET).hex


# make targets of generated files PHONY to force recompile on config change
.PHONY : default clean size $(TARGET).hex $(TARGET).elf

.INTERMEDIATE : $(COPTARGET).o

