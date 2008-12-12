TARGET = md5

-include .config

# List C source files here. (C dependencies are automatically generated.)
SRC = md5c.c 
ifeq ($(CONFIG_MODULE_MD5_HMAC),y)
SRC += hmac_md5.c
endif

include $(AVERSIVE_DIR)/mk/aversive_module.mk
