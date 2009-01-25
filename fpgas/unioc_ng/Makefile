# À refondre par la suite quand les autres modules arriveront

all: adns6010_controlunit.vcd

adns6010_controlunit.vcd: adns6010_controlunit.o t_adns6010_controlunit.o
	ghdl -e t_adns6010_controlunit
	ghdl -r t_adns6010_controlunit --vcd=adns6010_controlunit.vcd

t_adns6010_controlunit.o: bench/t_adns6010_controlunit.vhd adns6010_controlunit.o
	ghdl -a bench/t_adns6010_controlunit.vhd 

%.o: src/%.vhd
	ghdl -a $<


clean:
	rm -f *.o *.cf *.vcd t_adns6010_controlunit
