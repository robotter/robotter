## Configuration

HOST ?= avr
OBJ_DIR ?= compiler_files
export HOST OBJ_DIR
export MCU

# Autodetect dirs if needed.
ifeq ($(ROBOTTER_DIR),)
ifeq ($(AVERSIVE_DIR),)
# try to guess ROBOTTER_DIR from current Makefile path
ROBOTTER_DIR := $(dir $(lastword $(MAKEFILE_LIST)))..
else
# for backward compatibility
ROBOTTER_DIR := $(AVERSIVE_DIR)
AVERSIVE_DIR :=
endif
endif
ifeq ($(AVERSIVE_DIR),)
AVERSIVE_DIR := $(ROBOTTER_DIR)/aversive
endif

ifeq ($(filter .aversive_conf,$(MAKEFILE_LIST)),)
-include .aversive_conf
endif

# Relative path from aversive to robotter.
# Required by generate_robotter_config.
AVERSIVE_TO_ROBOTTER_DIR = ..

# Use absolute paths, may help editors.
ABS_AVERSIVE_DIR := $(abspath $(AVERSIVE_DIR))
ABS_ROBOTTER_DIR := $(abspath $(ROBOTTER_DIR))

export AVERSIVE_DIR
export ROBOTTER_DIR
export AVERSIVE_TO_ROBOTTER_DIR

INCLUDE_DIRS += . $(ABS_AVERSIVE_DIR)/include $(ABS_AVERSIVE_DIR)/modules 
INCLUDE_DIRS += $(ABS_ROBOTTER_DIR)/modules
INCLUDE_DIRS += $(addprefix $(ABS_AVERSIVE_DIR)/modules/,$(MODULES))


## C flags

CFLAGS += -O$(OPT)
CFLAGS += -Wall -Wextra -Wno-unused-parameter -Wstrict-prototypes
CFLAGS += $(addprefix -I,$(INCLUDE_DIRS))
export CFLAGS

ifeq ($(HOST),avr)
CFLAGS += -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums
CFLAGS += -mmcu=$(MCU) 
else
CFLAGS += -DHOST_VERSION
endif

## Assembler flags

ASFLAGS +=
export ASFLAGS

ifeq ($(HOST),avr)
ASFLAGS += -mmcu=$(MCU)
ASFLAGS += $(addprefix -I,$(INCLUDE_DIRS))
ASFLAGS += -Wa,-gstabs
else
ASFLAGS +=
endif


## Linker flags

LDFLAGS += $(MATH_LIB)

ifeq ($(HOST),avr)
LDFLAGS += -mmcu=$(MCU)
LDFLAGS += $(PRINTF_LDFLAGS)
else
LDFLAGS += 
endif


## Programs and commands

ifeq ($(HOST),avr)
CC = avr-gcc
AS = avr-as
AR = avr-ar
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size
NM = avr-nm
TARGET_OBJ = $(TARGET).elf 
OUTPUTS = $(TARGET).$(FORMAT_EXTENSION) $(TARGET).eep
else
CC = gcc
AS = as
AR = ar
OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size --format=Berkeley
NM = nm
TARGET_OBJ = $(TARGET)
OUTPUTS = $(TARGET_OBJ)
endif
AVRDUDE ?= avrdude
AVARICE ?= avarice
export CC AS AR
# for lxdialog compilation
HOSTCC ?= gcc 
export HOSTCC
# for menuconfig
SHELL = bash
export SHELL


## Programmers

# AVRDUDE does not know the ATMEGA1281 for now, consider it a 128.
ifeq ($(MCU),atmega1281)
AVRDUDE_MCU = atmega128
else
AVRDUDE_MCU = $(MCU)
endif

AVRDUDE_WRITE_FLASH = -U flash:w:$(TARGET).$(FORMAT_EXTENSION)
AVRDUDE_WRITE_EEPROM = -U eeprom:w:$(TARGET).eep

AVRDUDE_FLAGS += -p $(AVRDUDE_MCU) -P $(AVRDUDE_PORT) -c $(AVRDUDE_PROGRAMMER)
ifneq ($(AVRDUDE_DELAY),)
AVRDUDE_FLAGS += -i $(AVRDUDE_DELAY)
endif
export AVRDUDE_FLAGS


AVARICE_WRITE_FLASH = --erase --program --file $(TARGET).$(FORMAT_EXTENSION)
AVARICE_WRITE_ALL = --erase --program --file $(TARGET_OBJ)

AVARICE_FLAGS += -P $(MCU) --jtag $(AVARICE_PORT) --$(AVARICE_PROGRAMMER)
export AVARICE_FLAGS


## Internal variables

COBJS = $(SRC:%.c=$(OBJ_DIR)/%.$(HOST).o)
AOBJS = $(ASRC:%.S=$(OBJ_DIR)/%.$(HOST).o)
OBJS = $(COBJS) $(AOBJS)
DEPS = $(COBJS:.o=.d)
MODULES_LIBS = $(addprefix $(OBJ_DIR)/,$(notdir $(MODULES:=.$(HOST).a)))


## Checks / goal handling

config_rules := config noconfig menuconfig
clean_rules := clean clean-project clean-modules

ifeq ($(filter $(config_rules) $(clean_rules),$(MAKECMDGOALS)),)
ifeq ($(wildcard .config),)
$(error You need to call make config or make menuconfig first)
endif
ifeq ($(wildcard autoconf.h),)
$(error Missing autoconf.h -- You need to call make noconfig)
endif
ifeq ($(wildcard .aversive_conf),)
$(error Missing .aversive_conf -- You need to call make noconfig)
endif
# include deps files only for build rules
export use_deps := yes
else
ifneq (1,$(words $(MAKECMDGOALS)))
$(error Config and clean targets must be called alone.)
endif
endif


## Rules

default: all

ifneq ($(use_deps),)
-include $(DEPS)
endif


all: $(OUTPUTS)


# Project outputs

$(TARGET_OBJ): $(OBJS) $(MODULES)
	$(CC) $(OBJS) $(MODULES_LIBS) -o $@ $(LDFLAGS)

# .hex and .eep from ELF
%.$(FORMAT_EXTENSION): %.elf
	$(OBJCOPY) -O $(FORMAT) -R .eeprom $< $@

size:
	@$(SIZE) $(TARGET_OBJ)


# Modules

modules: $(MODULES)

# Hack for compatibility with Makefile of Aversive modules.
# AVERSIVE_DIR is set to ROBOTTER_DIR in submake and a fake aversive_module.mk
# is used.
$(MODULES):
	$(MAKE) VPATH=$(ABS_AVERSIVE_DIR)/modules/$@ AVERSIVE_DIR=$(ROBOTTER_DIR) \
		-f $(AVERSIVE_DIR)/modules/$@/Makefile


# Usual object files

$(COBJS): $(OBJ_DIR)/%.$(HOST).o: %.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -MD -MF $(@:.o=.d) -c $< -o $@

$(AOBJS): $(OBJ_DIR)/%.$(HOST).o: %.S
	@mkdir -p $(OBJ_DIR)
	$(CC) $(ASFLAGS) -c $< -o $@

# Other (final) outputs (.hex, .eep) from ELF

%.$(FORMAT_EXTENSION): %.elf
	$(OBJCOPY) -O $(FORMAT) -R .eeprom $< $@

# ignore error if eeprom is not used
%.eep: %.elf
	$(OBJCOPY) -j .eeprom --set-section-flags=.eeprom="alloc,load" \
		--change-section-lma .eeprom=0 --no-change-warnings \
		-O $(FORMAT) $< $@


# Project configuration

config:
	@HELP_FILE=$(AVERSIVE_DIR)/config/Configure.help \
		AUTOCONF_FILE=autoconf.h \
		$(SHELL) $(AVERSIVE_DIR)/config/scripts/Configure $(ROBOTTER_DIR)/config/config.in
	@$(SHELL) $(ROBOTTER_DIR)/config/generate_robotter_config .config .aversive_conf

noconfig:
	@HELP_FILE=$(AVERSIVE_DIR)/config/Configure.help \
		AUTOCONF_FILE=autoconf.h \
		$(SHELL) $(AVERSIVE_DIR)/config/scripts/Configure -d $(ROBOTTER_DIR)/config/config.in

menuconfig:
	@make -C $(AVERSIVE_DIR)/config/scripts/lxdialog all
	@HELP_FILE=$(AVERSIVE_DIR)/config/Configure.help \
		AUTOCONF_FILE=autoconf.h \
		$(SHELL) $(AVERSIVE_DIR)/config/scripts/Menuconfig $(ROBOTTER_DIR)/config/config.in
	@$(SHELL) $(ROBOTTER_DIR)/config/generate_robotter_config .config .aversive_conf


# Programming
# By default, program only the flash, not the EEPROM
#XXX other commands may be supported (erase, reset, ...)

program: program-flash

# default: not supported
program-%:
	$(error not supported for selected programmer ($(PROGRAMMER)))

ifeq ($(PROGRAMMER),avrdude)

program-all: $(TARGET).$(FORMAT_EXTENSION) $(TARGET).eep
	$(AVRDUDE) -e $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH)

program-flash: $(TARGET).$(FORMAT_EXTENSION)
	$(AVRDUDE) -e $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH) $(AVRDUDE_WRITE_EEPROM)

program-eeprom: $(TARGET).eep
	$(AVRDUDE) -e $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_EEPROM)

endif
ifeq ($(PROGRAMMER),avarice)

program-all: $(TARGET_OBJ)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_ALL)

program-flash: $(TARGET).$(FORMAT_EXTENSION)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH)

endif


# Cleaning

clean: clean-project clean-modules
	-rmdir $(OBJ_DIR) 2>/dev/null

clean-project:
	rm -f $(TARGET_OBJ) $(OUTPUTS) $(OBJS) $(DEPS)

clean_modules_rules = $(addprefix clean-,$(MODULES))

clean-modules: $(clean_modules_rules)

# note: see '$(MODULES):' rules for the AVERSIVE_DIR hack
$(clean_modules_rules): clean-%:
	@$(MAKE) VPATH=$(ABS_AVERSIVE_DIR)/modules/$* \
		AVERSIVE_DIR=$(ROBOTTER_DIR) \
		-f $(AVERSIVE_DIR)/modules/$*/Makefile clean



.PHONY : $(clean_rules) $(clean_modules_rules) $(config_rules) \
	size \
	$(MODULES)

