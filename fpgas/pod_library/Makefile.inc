#
# Generic VHDL project Makefile
#

GHDL ?= ghdl
WORK ?= work
BUILD_DIR ?= build
OBJ_CF ?= $(BUILD_DIR)/$(WORK)-obj93.cf

GHDL_FLAGS ?= --work=$(WORK) --workdir=$(BUILD_DIR)
SIMU_FLAGS ?= --assert-level=failure


# Module names (not filenames)
OBJS ?= 
BENCHS ?= 
# Extra source files (eg. packages)
SRC_EXTRA ?=

# VHDL source files
SRC ?= $(addsuffix .vhd,$(addprefix hdl/,$(OBJS)) $(addprefix bench/,$(BENCHS))) $(SRC_EXTRA)


# ISE configuration ($XILINX must be set)
ifneq ($(XILINX),)
ISE_DIR ?= ise
ISE_PATH ?= $(XILINX)
ifeq ($(OS),Windows_NT)
ISE_PLATFORM = nt
else
ISE_PLATFORM = lin
endif
ISE_PART ?= xc3s50-5-pq208
ISE_OPTS ?= -ifmt VHDL -opt_mode Speed -opt_level 1 \
					 -use_clock_enable Yes -use_sync_reset Yes -use_sync_set Yes \
					 -max_fanout 500
ISE_VARS ?= PATH=$(ISE_PATH)/bin/$(ISE_PLATFORM):$$PATH \
					 LD_LIBRARY_FLAGS=$(ISE_PATH)/lib/$(ISE_PLATFORM)
endif


default: help


$(OBJ_CF): $(SRC)
	@mkdir -p $(BUILD_DIR)
	$(GHDL) -i $(GHDL_FLAGS) $^

$(OBJS) $(BENCHS): $(OBJ_CF)
ifneq ($(OS),Windows_NT)
	$(GHDL) -m $(GHDL_FLAGS) -o $@ $@
else
	$(GHDL) -m $(GHDL_FLAGS) $@
endif

%.vcd: %
	$(GHDL) -r $(GHDL_FLAGS) $< --vcd=$@ $(SIMU_FLAGS)


## Special rules

help:
	@echo
	@echo "Modules: $(OBJS)"
	@echo
	@echo	"  TARGET      make TARGET"
	@echo	"  TARGET.vcd  simulate TARGET"
	@echo	"  run-MODULE  run MODULE test bench simulation (force)"
	@echo "  all         make all modules and test benchs"
	@echo "  all-run     run all test bench simulations (no force)"
	@echo
ifneq ($(XILINX),)
	@echo "ISE rules  (arch: $(ISE_PART))"
	@echo "  ise-syn-MODULE    synthesize MODULE"
	@echo "  ise-usage-MODULE  cell usage for MODULE"
else
	@echo "ISE rules not available (\$$XILINX not set)"
endif
	@echo

all: $(OBJS) $(BENCHS)

RUN_MODULES = $(addprefix run-,$(OBJS))
$(RUN_MODULES): run-%: force-t_%.vcd t_%.vcd

ALL_RUN_DEP = $(addsuffix .vcd,$(BENCHS))
all-run: $(ALL_RUN_DEP)

# Force by removing
force-%:
	rm -f $*

clean:
	ghdl --clean $(GHDL_FLAGS)
	rm -f $(OBJ_CF) $(addsuffix .vcd, $(OBJS) $(BENCHS))
ifneq ($(ISE_PATH),)
	rm -fr $(BUILD_DIR)/ise $(ISE_DIR)
endif


## ISE rules

ifneq ($(ISE_PATH),)

ISE_SYN_MODULES = $(addprefix ise-syn-,$(OBJS))
$(ISE_SYN_MODULES): ise-syn-%: $(ISE_DIR)/%.ngc

ISE_USAGE_MODULES = $(addprefix ise-usage-,$(OBJS))
$(ISE_USAGE_MODULES): ise-usage-%: $(ISE_DIR)/%_xst.xrpt
	@sed -e " \
	1,/<section stringID=.XST_CELL_USAGE/d; \
	/<.section>/Q; /<.item>/d; \
	s/^\s*<item dataType=.\w*. stringID=.XST_\(\w*\). value=.\(\w*\).>/\1: \2/; \
	s/^\s*<item dataType=.\w*. stringID=.XST_\(\w*\). value=.\(\w*\)..>/  \1: \2/; \
	" < $< | tr '_[A-Z]' ' [a-z]'

ISE_XRPTS = $(patsubst %,$(ISE_DIR)/%_xst.xrpt,$(OBJS))
$(ISE_XRPTS): $(ISE_DIR)/%_xst.xrpt: $(ISE_DIR)/%.ngc

$(BUILD_DIR)/ise/%.prj: $(OBJ_CF)
	@mkdir -p $(BUILD_DIR)/ise
	@$(GHDL) --gen-makefile $(GHDL_FLAGS) $* \
		| sed -e '/: hdl\/\w*.vhd/!d; s_^\S* _../../_' > $@

$(ISE_DIR)/%.ngc: $(BUILD_DIR)/ise/%.prj
	@mkdir -p $(ISE_DIR) $(BUILD_DIR)/ise
	@echo "ISE synthesis: $*"
	-@echo " \
		set -xsthdpdir \"$(BUILD_DIR)/ise/xst\" \n\
		run -ifn \"$(BUILD_DIR)/ise/$*.prj\" -ofn $(ISE_DIR)/$* \
			-p $(ISE_PART) $(ISE_OPTS) \n\
		" | $(ISE_VARS) xst -ofn $(ISE_DIR)/$*.log
	@rm -fr xlnx_auto_0_xdb xlnx_auto_0.ise

else

ise-%:
	@echo "Set \$$XILINX to use ISE rules" && [ ]

endif

