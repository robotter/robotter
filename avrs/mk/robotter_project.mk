
# No ROBOTTER_DIR? Switch with AVERSIVE_DIR.
ifeq ($(ROBOTTER_DIR),)
ifeq ($(AVERSIVE_DIR),)
$(error Neither ROBOTTER_DIR nor AVERSIVE_DIR is defined.)
endif
ROBOTTER_DIR := $(AVERSIVE_DIR)
endif

AVERSIVE_DIR := $(ROBOTTER_DIR)/aversive


# Relative path from aversive to robotter
# XXX Is there a simple way to compute it?
AVERSIVE_TO_ROBOTTER_DIR = ..


# Aversive Makefile
include $(AVERSIVE_DIR)/mk/aversive_project.mk

# Copy of aversive Makefile with RobOtter modifications.

# absolute path to avoid some editors from beeing confused with vpath when 
# searching files
ABS_ROBOTTER_DIR:=$(shell cd $(ROBOTTER_DIR) ; pwd)

EXTRAINCDIRS += $(ABS_ROBOTTER_DIR)/modules


export ROBOTTER_DIR ABS_ROBOTTER_DIR
export AVERSIVE_TO_ROBOTTER_DIR



# ------ config targets
# Use RobOtter config.in
# Run generate_robotter_config if needed

config:
	@${SHELL} -n $(ROBOTTER_DIR)/config/config.in
	@HELP_FILE=$(AVERSIVE_DIR)/config/Configure.help \
		AUTOCONF_FILE=autoconf.h \
		${SHELL} $(AVERSIVE_DIR)/config/scripts/Configure $(ROBOTTER_DIR)/config/config.in
	@${SHELL} $(ROBOTTER_DIR)/config/generate_robotter_config .config .aversive_conf

noconfig:
	@${SHELL} -n $(ROBOTTER_DIR)/config/config.in
	@HELP_FILE=$(AVERSIVE_DIR)/config/Configure.help \
		AUTOCONF_FILE=autoconf.h \
		${SHELL} $(AVERSIVE_DIR)/config/scripts/Configure -d $(ROBOTTER_DIR)/config/config.in

menuconfig:
	@${SHELL} -n $(ROBOTTER_DIR)/config/config.in
	@make -C $(AVERSIVE_DIR)/config/scripts/lxdialog all
	@HELP_FILE=$(AVERSIVE_DIR)/config/Configure.help \
		AUTOCONF_FILE=autoconf.h \
		${SHELL} $(AVERSIVE_DIR)/config/scripts/Menuconfig $(ROBOTTER_DIR)/config/config.in
	@${SHELL} $(ROBOTTER_DIR)/config/generate_robotter_config .config .aversive_conf


