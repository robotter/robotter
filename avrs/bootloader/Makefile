
TARGET = roblos

OBJ = roblos
OBJ_CONFIG = roblos_config
AVERSIVE_DIR = ../aversive

-include $(OBJ_CONFIG).mk


OPT = s

# Compiler and linker flags

CFLAGS += -g -O$(OPT) -Wall -Wstrict-prototypes -std=gnu99
CFLAGS += -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -mmcu=$(MCU) 
CFLAGS += -I$(AVERSIVE_DIR)/include

# export conf shared with C
CFLAGS += -DQUARTZ_FREQ=$(QUARTZ_FREQ) \
					-DBOOTLOADER_ADDR=$(BOOTLOADER_ADDR)

LDFLAGS += -mmcu=$(MCU)
LDFLAGS += -Wl,--section-start=.text=$(BOOTLOADER_ADDR)


# Programs and commands

CC = avr-gcc
OBJCOPY = avr-objcopy


## Make rules

all: $(TARGET).hex

# compile
$(OBJ).o: $(OBJ).c $(OBJ_CONFIG).h $(OBJ_CONFIG).mk
	$(CC) -c $(CFLAGS) -o $@ $<

# link
$(TARGET).elf: $(OBJ).o
	$(CC) -o $@ $< $(LDFLAGS)

# final output file
$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O ihex -R .eeprom $< $@


clean:
	rm -f $(TARGET).hex $(TARGET).elf $(OBJ).o


.PHONY : all clean

