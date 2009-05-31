TARGET = uart

# List C source files here. (C dependencies are automatically generated.)
ifeq ($(HOST),avr)
SRC  = uart_setconf.c uart_dev_io.c
SRC += uart_getconf.c uart_events.c
SRC += uart.c

SRC += uart_send.c uart_send_nowait.c
SRC += uart_recv.c uart_recv_nowait.c

ifeq ($(CONFIG_MODULE_UART_9BITS),y)
SRC += uart_send9.c uart_send9_nowait.c
SRC += uart_recv9.c uart_recv9_nowait.c
endif

else # is it ok ??
SRC = uart_host.c
endif

include $(AVERSIVE_DIR)/mk/aversive_module.mk
