CC = gcc

COMPOPT = -O3 -Wall

CFLAGS = $(COMPOPT)

LDFLAGS = -lm -lhighgui -lcxcore 

OBJS = algo_camera.o main.o

SOURCE = .

EXEC = test_camera

#IMAGE = mire-test.jpg
IMAGE = TEST_IMG.JPG

$(EXEC): $(OBJS)
	$(CC) $(OBJS) $(COMPOPT) $(LDFLAGS) -o $(EXEC);

%.o:$(SOURCE)/%.c $(SOURCE)/%.h
	$(CC) $(CFLAGS) $< -c -o $@

%.o:$(SOURCE)/%.c
	$(CC) $(CFLAGS) $< -c -o $@

exec: $(EXEC)
	./$(EXEC) $(IMAGE)

clean:
	rm -f $(OBJS) $(SOURCE)/*~ $(SOURCE)/\#*\# $(EXEC)

distclean:
	rm -f $(OBJS) $(SOURCE)/*~ $(SOURCE)/\#*\#

