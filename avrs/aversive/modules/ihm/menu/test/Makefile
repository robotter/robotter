TARGET = main

# repertoire des modules
AVERSIVE_DIR = ../../../..

# List C source files here. (C dependencies are automatically generated.)
SRC = $(TARGET).c

# List Assembler source files here.
# Make them always end in a capital .S.  Files ending in a lowercase .s
# will not be considered source files but generated files (assembler
# output from the compiler), and will be deleted upon "make clean"!
# Even though the DOS/Win* filesystem matches both .s and .S the same,
# it will preserve the spelling of the filenames, and gcc itself does
# care about how the name is spelled on its command-line.
ASRC = 

########################################

-include .aversive_conf
include $(AVERSIVE_DIR)/mk/aversive_project.mk
