# Microb Technology, Eirbot, Droids-corp 2005 - Zer0
# Makefile for projects
# 
# Inspired by the WinAVR Sample makefile written by Eric
# B. Weddington, J÷rg Wunsch, et al.
#

MSG_COMPILING = Compiling:
MSG_PREPROC = Preprocessing:

# default HOST is avr
ifeq ($(H),)
HOST=avr
else
HOST=host
endif

OBJ = $(addprefix compiler_files/,$(SRC:.c=.$(HOST).o) $(ASRC:.S=.$(HOST).o))
LST = $(OBJ:.o=.lst)
DEPS = $(addprefix compiler_files/,$(SRC:.c=.$(HOST).d))
ifneq ($(P),)
PREPROC= $(addprefix compiler_files/,$(SRC:.c=.$(HOST).preproc))
else
PREPROC=
endif

# Default target.
all: compiler_files/$(TARGET).$(HOST).a

# Module library file
compiler_files/$(TARGET).$(HOST).a: $(PREPROC) $(OBJ)
	${AR} rs $@ $(OBJ) 2>&1

# Automatically generate C source code dependencies. 
compiler_files/%.$(HOST).d : %.c
	@echo Generating $@
	@set -e; rm -f $@; \
	$(CC) -M $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,compiler_files/\1.$(HOST).o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

compiler_files/%.$(HOST).o : %.c
	@echo $(MSG_COMPILING) $< 
	$(CC) $(CFLAGS) $< -c -o $@

compiler_files/%.$(HOST).preproc : %.c
	@echo $(MSG_PREPROC) $< 
	$(CC) $(CFLAGS) $< -E -o $@

# Compile: create assembler files from C source files.
compiler_files/%.$(HOST).s : %.c
	$(CC) -S $(CFLAGS) $< -o $@

# Assemble: create object files from assembler source files.
compiler_files/%.$(HOST).o : %.S
	$(CC) -c -Wa,-adhlns=$(@:.o=.lst) $(ASFLAGS) $< -o $@


# Remove the '-' if you want to see the dependency files generated.
ifeq (,$(findstring clean,$(MAKECMDGOALS)))
-include $(DEPS)
endif

# Clean all objects 
clean:
	$(REMOVE) compiler_files/$(TARGET).$(HOST).a
	$(REMOVE) $(OBJ) 
	$(REMOVE) $(LST)
	$(REMOVE) $(PREPROC)

depclean:
	$(REMOVE) $(DEPS)

# Listing of phony targets.
.PHONY : all clean deps
