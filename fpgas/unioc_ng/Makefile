GHDL = ghdl
WORK = work
BUILD_DIR = build
OBJ_CF = $(BUILD_DIR)/$(WORK)-obj93.cf

GHDL_FLAGS = --work=$(WORK) --workdir=$(BUILD_DIR)
SIMU_FLAGS = --assert-level=failure

# Module names (not filenames)
OBJS = adns6010_spi adns6010_controlunit
BENCHS = $(addprefix t_, $(OBJS))

# VHDL source files
SRC = $(addsuffix .vhd,$(addprefix src/,$(OBJS)) $(addprefix bench/,$(BENCHS)))


default: help


$(OBJ_CF): $(SRC)
	@mkdir -p $(BUILD_DIR)
	$(GHDL) -i $(GHDL_FLAGS) $^

$(OBJS) $(BENCHS): $(OBJ_CF)
	$(GHDL) -m $(GHDL_FLAGS) -o $@ $@

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

