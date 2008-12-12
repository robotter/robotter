#!/usr/bin/python

import sys

if len(sys.argv) != 2:
    print "Bad arguments"
    print "Usage: parse_symbols.py file.sym"
    sys.exit(1)

symlist=[]
global_cpt=0

f=open(sys.argv[1])

# parse .sym file and fill a list
while True:
    l=f.readline()
    if l=='':
        break

    address, type, name = l[:-1].split(' ')
    if type != 'T':
        continue

    #    print "%x %s"%(int(address,16),name)
    symlist.append([int(address, 16), name, 0])
    
f.close()


while True:
    l=sys.stdin.readline()
    if l=='':
        break

    try:
        add=int(l, 16)*2
    except:
        print "Bad value"
        continue

    prev = None
    i=1
    while i < len(symlist):
        address, name, cpt = symlist[i]
        if add < address:
            symlist[i-1][2] += 1
            global_cpt += 1
            break
        i+=1
        
    # address cannot be in last symbols, so we
    # suppose it is not found
    if i == len(symlist):
        print "Cannot find symbol"
        break

symlist.sort(cmp=lambda x,y:x[2]<y[2] and 1 or -1)

for sym in symlist:
    address, name, cpt = sym
    if not cpt:
        continue
    print "%2.2f%% (%.3d/%.3d) %s[%.8x]"%( (float(cpt)*100.)/global_cpt, cpt,
                                           global_cpt, name, address)
