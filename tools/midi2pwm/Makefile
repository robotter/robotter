CC = gcc

COMPOPT = -O3 -Wall

CFLAGS = $(COMPOPT)

LDFLAGS = 

OBJS = metaevent.o gpfunctions.o main.o

SOURCE = .

EXEC = midi2pwm

FICHIER = ringtone2.mid


$(EXEC): $(OBJS)
	$(CC) $(OBJS) $(COMPOPT) $(LDFLAGS) -o $(EXEC);

%.o:$(SOURCE)/%.c $(SOURCE)/%.h
	$(CC) $(CFLAGS) $< -c -o $@

%.o:$(SOURCE)/%.c
	$(CC) $(CFLAGS) $< -c -o $@

exec: $(EXEC)
	./$(EXEC) $(FICHIER)

clean:
	rm -f $(OBJS) $(SOURCE)/*~ $(SOURCE)/\#*\# $(EXEC)

distclean:
	rm -f $(OBJS) $(SOURCE)/*~ $(SOURCE)/\#*\#

