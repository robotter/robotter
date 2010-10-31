
## Configuration

HOST ?= avr
src_dir ?= .
obj_dir ?= compiler_files

# Internal variables
TARGET_OBJ = $(obj_dir)/$(TARGET).$(HOST).a
COBJS = $(SRC:%.c=$(obj_dir)/%.$(HOST).o)
AOBJS = $(ASRC:%.S=$(obj_dir)/%.$(HOST).o)
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

$(COBJS): $(obj_dir)/%.$(HOST).o: $(src_dir)/%.c
	@mkdir -p $(obj_dir)
	$(CC) $(CFLAGS) -MD -MF $(@:.o=.d) -c $< -o $@

$(AOBJS): $(obj_dir)/%.$(HOST).o: $(src_dir)/%.S
	@mkdir -p $(obj_dir)
	$(CC) $(ASFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET_OBJ) $(OBJS) $(DEPS)
	@-rmdir -p $(obj_dir) 2>/dev/null


.PHONY : clean

