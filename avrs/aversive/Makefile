# Microb Technology, Eirbot, Droids-corp 2005 - Zer0
# Makefile for generating all tests !
#

PROJECT_DIRS=\
modules/base/math/fixed_point/test\
modules/base/math/vect2/test\
modules/base/scheduler/test\
modules/crypto/test\
modules/encoding/hamming/test\
modules/encoding/base64/test\
modules/comm/uart/test\
modules/debug/diagnostic/test\
modules/ihm/menu/test\
modules/hardware/adc/test\
modules/hardware/timer/test\
modules/hardware/pwm/test\
modules/devices/ihm/lcd/test\
modules/devices/servo/multiservo/test\
modules/devices/robot/robot_system/test\
modules/devices/control_system/control_system_manager/test\
modules/devices/control_system/filters/pid/test\
modules/devices/control_system/filters/quadramp/test\
modules/debug/error/test\
projects/example1\
projects/example2

HOSTPROJECT_DIRS=\
modules/base/math/fixed_point/test\
modules/base/math/vect2/test\
modules/crypto/test\
modules/encoding/hamming/test\
modules/encoding/base64/test\
modules/ihm/menu/test\
modules/devices/control_system/control_system_manager/test\
modules/devices/control_system/filters/pid/test\
modules/devices/control_system/filters/quadramp/test

CFLAGS=-Werror
export CFLAGS


all: avrall hostall


clean: avrclean hostclean


%_config:
	@if [ \( ! -f $(@:_config=)/.aversive_conf \) -o \
	      \( ! -f $(@:_config=)/autoconf.h \) ]; then \
		echo -n Configuring $(@:_config=)... ; \
		make -C $(@:_config=) noconfig > /dev/null; \
		echo done ; \
	fi

### AVR

avrall: $(PROJECT_DIRS:=_config) $(PROJECT_DIRS:=_avrmake)


avrclean: $(PROJECT_DIRS:=_avrclean)


%_avrmake:
	@echo
	@echo "Module $(@:_avrmake=) (avr)" | sed 's,.,=,g'
	@echo "Module $(@:_avrmake=) (avr)"
	@echo "Module $(@:_avrmake=) (avr)" | sed 's,.,=,g'
	@echo
	make -C $(@:_avrmake=)


%_avrclean:
	make -C $(@:_avrclean=) clean


### HOST

hostall: $(HOSTPROJECT_DIRS:=_config) $(HOSTPROJECT_DIRS:=_hostmake)


hostclean: $(HOSTPROJECT_DIRS:=_hostclean)


%_hostmake:
	@echo
	@echo "Module $(@:_hostmake=) (host)" | sed 's,.,=,g'
	@echo "Module $(@:_hostmake=) (host)"
	@echo "Module $(@:_hostmake=) (host)" | sed 's,.,=,g'
	@echo
	make -C $(@:_hostmake=) H=1


%_hostclean:
	make -C $(@:_hostclean=) clean H=1


###

mrproper:
	find . 	-name "autoconf.h" -o -name ".aversive_conf" -o -name "*.hex" -o -name "*~" -o -name "*.eep" -o -name "*.obj" -o -name "*.elf" -o -name "*.map" -o -name "*.obj" -o -name "*.a90" -o -name "*.sym" -o -name "*.lnk" -o -name "*.lss" -o -name "*.a" -o -name "*.{avr,host}.d" -o -name "*.o" -o -name "*.avr.d.*" -o -name "*.host.d.*" -o -name "*.lst" | xargs rm -f


.PHONY : all clean avrall avrclean hostall hostclean \
 $(PROJECT_DIRS:=.avrall) $(PROJECT_DIRS:=.avrclean) \
$(HOSTPROJECT_DIRS:=.hostall) $(HOSTPROJECT_DIRS:=.hostclean)
