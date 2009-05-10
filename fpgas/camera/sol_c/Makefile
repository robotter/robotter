#CC = gcc
CC="/opt/ARMadeus/armadeus/buildroot/build_armv4t/staging_dir/usr/bin/arm-linux-gcc"

INSTALL_DIR="/opt/ARMadeus/armadeus/buildroot/project_build_arm/armadeus/root/usr/bin/"

COMPOPT = -O3 -Wall

CFLAGS = $(COMPOPT)

LDFLAGS = 

OBJS = algo_camera.o main.armadeus.o

SOURCE = .

EXEC = test_camera.Armadeus

#IMAGE = TEST_IMG.JPG

$(EXEC): $(OBJS)
	$(CC) $(OBJS) $(COMPOPT) $(LDFLAGS) -o $(EXEC);

%.o:$(SOURCE)/%.c $(SOURCE)/%.h
	$(CC) $(CFLAGS) $< -c -o $@

%.o:$(SOURCE)/%.c
	$(CC) $(CFLAGS) $< -c -o $@

#exec: $(EXEC)
#	./$(EXEC) $(IMAGE)

install: $(EXEC)
	cp $(EXEC)  $(INSTALL_DIR)

clean:
	rm -f $(OBJS) $(SOURCE)/*~ $(SOURCE)/\#*\# $(EXEC)

distclean:
	rm -f $(OBJS) $(SOURCE)/*~ $(SOURCE)/\#*\#

