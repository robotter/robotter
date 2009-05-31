#!/usr/bin/python

import xml.parsers.expat
import sys, re

not_a_register=["IO_START_ADDR",
                "IO_STOP_ADDR",
                "EXT_IO_START_ADDR",
                "EXT_IO_STOP_ADDR",
                "MEM_START_ADDR",
                "MEM_STOP_ADDR",
                ]
curtree=[]
curattrtree=[]


##### timer prescalers

prescaler_timer_num = -1
prescaler_timers = {}

def prescaler_module():
    global prescaler_timer_num
    global prescaler_timers

    if curtree[-1] != "module":
        return
    if not curattrtree[-1].has_key("class"):
        return
    if not curattrtree[-1]["class"].startswith("TIMER_COUNTER"):
        return
    prescaler_timer_num = int(curattrtree[-1]["class"].replace("TIMER_COUNTER_", ""))
    prescaler_timers[prescaler_timer_num] = []

def prescaler_clk():
    global prescaler_timer_num
    global prescaler_timers

    if curtree[-3:] != ["module", "enumerator", "enum"]:
        return
    if not curattrtree[-2].has_key("name"):
        return
    if not curattrtree[-2]["name"].startswith("CLK_SEL_"):
        return
    if not curattrtree[-3].has_key("class"):
        return
    if not curattrtree[-3]["class"].startswith("TIMER_COUNTER"):
        return
    val = int(curattrtree[-1]["val"], 16)
    text = curattrtree[-1]["text"]
    if text == "No Clock Source (Stopped)":
        prescaler = 0
    elif text == "Running, No Prescaling":
        prescaler = 1
    elif text.startswith("Running, CLK/"):
        prescaler = int(text.split("/")[1])
    elif text == "Running, ExtClk Tx Falling Edge":
        prescaler = -1
    elif text == "Running, ExtClk Tx Rising Edge":
        prescaler = -2
    else:
        prescaler = -3
    prescaler_timers[prescaler_timer_num].append((val,prescaler))

def prescaler_module_end():
    global prescaler_timer_num
    global prescaler_timers
    
    if curtree[-1] != "module":
        return
    if prescaler_timer_num == -1:
        return
    prescaler_timer_num = -1

def prescaler_print():
    global prescaler_timers
    keys = prescaler_timers.keys()
    keys.sort()
    for k in keys:
        print "/* prescalers timer %d */"%(k)
        for p in prescaler_timers[k]:
            if p[1] == -1:
                txt = "FALL"
            elif p[1] == -2:
                txt = "RISE"
            else:
                txt = str(p[1])
            txt = "#define TIMER%d_PRESCALER_DIV_%s"%(k, txt)
            txt = txt.ljust(40)
            print "%s%d"%(txt, p[0])
        print
        for p in prescaler_timers[k]:
            txt = "#define TIMER%d_PRESCALER_REG_%d"%(k, p[0])
            txt = txt.ljust(40)
            print "%s%d"%(txt, p[1])
        print
    print

#####

# timer intrp 

timer_dict={}
sigtimer_OV_dict={}
sigtimer_OC_dict={}
sigtimer_IC_dict={}

def timer_intrp(data):
    if len(curtree) <= 3:
        return
    if curtree[-1] != "SOURCE":
        return
    if not curtree[-2].startswith("VECTOR"):
        return
    if not data.startswith("TIMER"):
        return
    timernum = re.sub("TIMER([0-9]).*", r"\1", data)
    subtimernum=re.sub("TIMER[0-9].*COMP([A-C])", r"\1", data)
    if len(subtimernum) != 1:
        subtimernum=""
    timerid = timernum+subtimernum
    if data.find("OVF") != -1:
        timer_dict[timerid] = 1
        sigtimer_OV_dict[timerid] = 1
    elif data.find("COMP") != -1:
        timer_dict[timerid] = 1
        sigtimer_OC_dict[timerid] = 1
    elif data.find("CAPT") != -1:
        timer_dict[timerid] = 1
        sigtimer_IC_dict[timerid] = 1

def timer_intrp_print():
    l=timer_dict.keys()
    l.sort()
    print "/* available timers */"
    for k in l:
        print "#define TIMER%s_AVAILABLE"%k
    print

    l=sigtimer_OV_dict.keys()
    l.sort()
    i=0
    print "/* overflow interrupt number */"
    for k in l:
        print "#define SIG_OVERFLOW%s_NUM %d"%(k,i)
        i+=1
    print "#define SIG_OVERFLOW_TOTAL_NUM %d"%i
    print
    
    l=sigtimer_OC_dict.keys()
    l.sort()
    i=0
    print "/* output compare interrupt number */"
    for k in l:
        print "#define SIG_OUTPUT_COMPARE%s_NUM %d"%(k,i)
        i+=1
    print "#define SIG_OUTPUT_COMPARE_TOTAL_NUM %d"%i
    print
    
    i=0
    print "/* Pwm nums */"
    for k in l:
        print "#define PWM%s_NUM %d"%(k,i)
        i+=1
    print "#define PWM_TOTAL_NUM %d"%i
    print
    
    l=sigtimer_IC_dict.keys()
    l.sort()
    i=0
    print "/* input capture interrupt number */"
    for k in l:
        print "#define SIG_INPUT_CAPTURE%s_NUM %d"%(k,i)
        i+=1
    print "#define SIG_INPUT_CAPTURE_TOTAL_NUM %d"%i
    print


#####

# regs
bits={}
regs={}

def regs_parse():
    if len(curtree) <= 3:
        return 
    if curtree[-1].find("_MASK") == -1:
        return
    if curtree[-3] != "IO_MEMORY":
        return
    bitname = curtree[-1].replace("_MASK", "_REG")
    bitname = bitname.replace("-", "_")

    if bits.has_key(bitname) == False:
        bits[bitname]=[]
    bits[bitname].append(curtree[-2])

    if regs.has_key(curtree[-2])==False:
        regs[curtree[-2]]=[]
    regs[curtree[-2]].append(bitname)

def regs_print():
    for r in regs.keys():
        print 
        print "/* %s */"%r
        for b in regs[r]:
            if len(bits[b]) != 1:
                reglist = bits[b][:]
                reglist.remove(r)
                regliststr = reduce(lambda x, y: x+", "+y, reglist)
                print "/* #define %s %s%s */ /* dup in %s */"%(b, " "*(20-len(b)), r, regliststr)
            else:
                print "#define %s %s%s"%(b, " "*(20-len(b)), r)
    print
    
#####

# pins

alt_name = None
pin_name = None
pins_dict = {}

def pins_parse(data):
    global alt_name, pin_name

    if len(curtree) < 4:
        return
    if curtree[-1] not in [ "NAME", "ALT_NAME", "PIN_NAME" ]:
        return
    if not curtree[-2].startswith("PIN"):
        return
    if curtree[-4] != "PACKAGE":
        return
    pins = data[1:-1].split(":")
    if curtree[-1] == "NAME":
        alt_name = pins[0]
        pin_name = pins[1:]
    elif curtree[-1] == "ALT_NAME":
        alt_name = pins[0]
    elif curtree[-1] == "PIN_NAME":
        pin_name = pins

def pins_end():
    global alt_name, pin_name

    if len(curtree) < 3:
        return
    if not curtree[-1].startswith("PIN"):
        return
    if curtree[-3] != "PACKAGE":
        return
    if alt_name != None and re.match("P[A-Z][0-7]", alt_name):
        pins_dict[alt_name[1:]] = pin_name
    alt_name = None
    pin_name = None

def pins_print():
    keys = pins_dict.keys()
    keys.sort()
    print "/* pins mapping */"
    for k in keys:
        for p in pins_dict[k]:
            p = p.replace("'", "")
            print "#define %s_PORT PORT%s"%(p, k[0])
            print "#define %s_BIT %s"%(p, k[1])
        print
    print

#####

def start_element(name, attrs):
    global state, curtree, sigtimer_list, not_a_register, bits, regs

    curtree.append(name)
    curattrtree.append(attrs)

    prescaler_module()
    prescaler_clk()

    regs_parse()
    
        
def end_element(name):
    global state, curtree, sigtimer_list, not_a_register

    prescaler_module_end()
    pins_end()

    curtree.pop()
    curattrtree.pop()


def char_data(data):
    timer_intrp(data)
    pins_parse(data)


print """/*  
 *  Copyright Droids Corporation, Microb Technology, Eirbot (2009)
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  Revision : $Id $
 *
 */

/* WARNING : this file is automatically generated by scripts.
 * You should not edit it. If you find something wrong in it,
 * write to zer0@droids-corp.org */

"""

p = xml.parsers.expat.ParserCreate()

p.StartElementHandler = start_element
p.EndElementHandler = end_element
p.CharacterDataHandler = char_data

f=open(sys.argv[1])
p.Parse(f.read(), 1)

prescaler_print()
timer_intrp_print()
regs_print()
pins_print()

f.close()
