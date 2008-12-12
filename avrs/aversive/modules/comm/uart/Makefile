TARGET = uart

# List C source files here. (C dependencies are automatically generated.)
ifeq ($(HOST),avr)
SRC  = uart0_dev_io.c uart0_recv_nowait.c uart1_dev_io.c uart1_recv_nowait.c 
SRC += uart2_dev_io.c uart2_recv_nowait.c uart3_dev_io.c uart3_recv_nowait.c uart.c
SRC += uart0_events.c uart0_send9.c uart1_events.c uart1_send9.c uart2_events.c 
SRC += uart2_send9.c uart3_events.c uart3_send9.c uart_host.c
SRC += uart0_getconf.c uart0_send9_nowait.c uart1_getconf.c uart1_send9_nowait.c 
SRC += uart2_getconf.c uart2_send9_nowait.c uart3_getconf.c uart3_send9_nowait.c
SRC += uart0_recv9.c uart0_send.c uart1_recv9.c uart1_send.c uart2_recv9.c 
SRC += uart2_send.c uart3_recv9.c uart3_send.c
SRC += uart0_recv9_nowait.c uart0_send_nowait.c uart1_recv9_nowait.c uart1_send_nowait.c 
SRC += uart2_recv9_nowait.c uart2_send_nowait.c uart3_recv9_nowait.c uart3_send_nowait.c
SRC += uart0_recv.c uart0_setconf.c uart1_recv.c uart1_setconf.c uart2_recv.c 
SRC += uart2_setconf.c uart3_recv.c uart3_setconf.c
else # is it ok ??
SRC = uart_host.c
endif

include $(AVERSIVE_DIR)/mk/aversive_module.mk
