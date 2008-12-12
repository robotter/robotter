#!/usr/bin/python

import os, sys, re

def replace(s):
#    print s+" ---  "+ re.sub(".*/([0-9]*) .*",r"\1",s)
    return re.sub(".*/([0-9]*).*",r"\1",s.split("\n")[0])

 
def get_clocks(s):
    timer=re.sub("CS([0-3n])0.*",r"\1",s.split("\n")[0])

    cut=re.search("CS[^%s]"%timer, s)
    if cut!= None:
        s=s[:cut.start()]
#        print s
    
    separators=[" CK", "PCK", "clkI/O", "clkT0S", "clkT2S"]
    separators=map(lambda x:(s.count(x),x), separators)
    separators.sort(cmp=lambda x,y:cmp(x[0],y[0]))
    sep=separators[-1][1]
#    print "---> " + sep

    l=s.split(sep)
    newlist=[timer, 0, 1]
    prev_x=0
    
    for i in l:
        try:
            x=int(replace(i))
        except:
            continue

        if x<prev_x: newlist=[timer, 0, 1] # reinit

        if x!=1:newlist.append(x)
        prev_x=x

    if re.match(".*[fF]alling.*[rR]ising.*", s):
        newlist.append(-1)
        newlist.append(-2)
        
    return newlist

def get_defs(l):
    out=""
    for l in clks:
        n=l[0]
        l=l[1:]
        out+="/* prescalers timer %s */\n"%n
    
        i=0
        for d in l:
            if d>=0:
                line="#define TIMER%s_PRESCALER_DIV_%d"%(n,d)
                out+="%s%s%d\n"%(line, (35-len(line))*" ", i)
            elif d==-1:
                line="#define TIMER%s_PRESCALER_EXT_FALL"%(n)
                out+="%s%s%d\n"%(line, (35-len(line))*" ", i)
            elif d==-2:
                line="#define TIMER%s_PRESCALER_EXT_RISE"%(n)
                out+="%s%s%d\n"%(line, (35-len(line))*" ", i)
            i+=1
        out+="\n"

        i=0
        for d in l:
            out+="#define TIMER%s_PRESCALER_REG_%d     %d\n"%(n,i,d)
            i+=1
        out+="\n"
        out+="\n"
    return out



if len(sys.argv) != 3:
    print "bad args. usage: parse_doc.py DOC_DIR DST_DIR"
    sys.exit(1)

for name in os.listdir(sys.argv[1]):
    f=open(os.path.join(sys.argv[1],name))
    list=[]
    s=f.read()
    list+=(re.findall('CS00.*topped.' + '.*\n'*15, s))
    list+=(re.findall('CS10.*topped.' + '.*\n'*15, s))
    list+=(re.findall('CS20.*topped.' + '.*\n'*15, s))
    list+=(re.findall('CS30.*topped.' + '.*\n'*15, s))
    list+=(re.findall('CSn0.*topped.' + '.*\n'*15, s))
    print "---- %s ----"%name
#    print list
    g=open(os.path.join(sys.argv[2],name),"w")
    clks=[]
    for i in list:
        elt=get_clocks(i)
        if elt[0]=='n':
            elt[0]='1'
            clks.append(elt[:])
            elt[0]='3'
            clks.append(elt)
        else:
            clks.append(elt)

    clks.sort(cmp=lambda x,y:cmp(int(x[0]),int(y[0])))
    defines=get_defs(clks)
    g.write("%s\n"%defines)
    g.close()
