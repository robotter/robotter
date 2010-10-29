
## Configuration

HOST ?= avr
OBJ_DIR ?= compiler_files

# Internal variables
TARGET_OBJ = $(OBJ_DIR)/$(TARGET).$(HOST).a
COBJS = $(SRC:%.c=$(OBJ_DIR)/%.$(HOST).o)
AOBJS = $(ASRC:%.S=$(OBJ_DIR)/%.$(HOST).o)
OBJS = $(COBJS) $(AOBJS)
DEPS = $(COBJS:.o=.d)


## Rules

default: all

ifneq ($(use_deps),)
-include $(DEPS)
endif

all: $(TARGET_OBJ)

# Module library file
$(TARGET_OBJ): $(OBJS)
	$(AR) rs $@ $(COBJS) 2>/dev/null

$(COBJS): $(OBJ_DIR)/%.$(HOST).o: %.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -MD -MF $(@:.o=.d) -c $< -o $@

$(AOBJS): $(OBJ_DIR)/%.$(HOST).o: %.S
	@mkdir -p $(OBJ_DIR)
	$(CC) $(ASFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET_OBJ) $(OBJS) $(DEPS)


.PHONY : clean

