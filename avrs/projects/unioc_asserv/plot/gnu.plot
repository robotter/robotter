#set terminal png
#set output 'out.png'

plot "/tmp/plotfile" using 1 with lines title 'cons x', \
     "/tmp/plotfile" using 2 with lines title 'filt x', \
     "/tmp/plotfile" using 3 with lines title 'fbck x', \
     "/tmp/plotfile" using 4 with lines title 'out x', \
     "/tmp/plotfile" using 5 with lines title 'cons y', \
     "/tmp/plotfile" using 6 with lines title 'filt y', \
     "/tmp/plotfile" using 7 with lines title 'fbck y', \
     "/tmp/plotfile" using 8 with lines title 'out y', \
     "/tmp/plotfile" using 9 with lines title 'cons a', \
     "/tmp/plotfile" using 10 with lines title 'filt a', \
     "/tmp/plotfile" using 11 with lines title 'fbck a', \
     "/tmp/plotfile" using 12 with lines title 'out a'\

pause -1
