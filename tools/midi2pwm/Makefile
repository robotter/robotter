CC = gcc

COMPOPT = -O3 -Wall -g

CFLAGS = $(COMPOPT)

ifeq ($(OS),Windows_NT)
LDFLAGS = -lwsock32
else
LDFLAGS = 
endif

OBJS = metaevent.o gpfunctions.o main.o

SOURCE = .

EXEC = midi2pwm

#FICHIER = queen-we_are_the_champions.mid
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

