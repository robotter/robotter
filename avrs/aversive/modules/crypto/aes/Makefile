TARGET = aes

-include .config

# List C source files here. (C dependencies are automatically generated.)
SRC = aes_core.c 
ifeq ($(CONFIG_MODULE_AES_CTR),y)
SRC += aes_ctr.c
endif

include $(AVERSIVE_DIR)/mk/aversive_module.mk
