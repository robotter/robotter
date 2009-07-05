#set terminal png
#set output 'out.png'

plot "/tmp/plotfile" using 1 with lines title 'adns', \
     "/tmp/plotfile" using 2 with lines title 'compass', \
     "/tmp/plotfile" using 3 with lines title 'output'

pause -1
