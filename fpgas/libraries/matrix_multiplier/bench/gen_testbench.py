#!/usr/bin/env python

import numpy
from numpy import array
import re, random

Qm = 8
Qn = 8
output = []

def float_to_Q(v):
  return int(v * (2**Qn))

def add_matrix33(matrix):
  output.append('-- LOAD MATRIX');
  for e in reversed(matrix.flatten()):
    add_matrix33_element(e)

def add_matrix33_element(value):
  # compute Q format value
  output.append("element_value_s <= to_signed(%d,16);"%float_to_Q(value))
  output.append("valid_s <= '0';")
  output.append("wait until rising_edge(clk_s);")
  output.append("valid_s <= '1';")
  output.append("wait until rising_edge(clk_s);")
  output.append("")

def compute_matrix33_mult(vector):
  output.append("compute_s <= '0';")
  output.append("wait until rising_edge(clk_s);")
  for i,s in enumerate(vector.flatten()):
    output.append("input%d_s <= to_signed(%d,16);"%(i,float_to_Q(s)))
  output.append("compute_s <= '1';")
  output.append("wait until rising_edge(done_s);")

def main():
  
  for n in range(0,5):
    output.append("report \"TESTING MATRIX %d\";"%n)

    M = numpy.zeros((3,3))
    for i in range(0,3):
      for j in range(0,3):
        M[i,j] = random.random()*2

    # declare matrix
    add_matrix33( M )
     
    for m in range(0,10):
      output.append("report \"TESTING VECTOR %d.%d\";"%(n,m))
      output.append("debug_s <= %d;"%(n*1000+m))

      V = numpy.zeros((1,3))
      for i in range(0,3):
        V[0,i] = random.random()*10
      O = numpy.dot(V,M)

      # declare input vector
      output.append("-- %s"%(repr(V)))
      compute_matrix33_mult( V )

      # declare assertions
      output.append("-- %s"%(repr(O)))
      output.append("-- "+','.join('0x%04x'%float_to_Q(s) for s in O.flatten()))
      for i,s in enumerate(O.flatten()):
        output.append("tmp_v := to_integer(output%d_s) - %d;"%(i,float_to_Q(s)))
        output.append("assert tmp_v = 0 report \"delta diff= \"&str(tmp_v);")

  # open template file
  f = file('t_multipliers.vhd','wb');
  for line in file('t_multipliers.vhd.template','rb'):
    m = re.match(r'^(\s+)<<<HERE>>>',line)
    if m:
      indent = m.group(1)
      # marker found drop lines there
      for l in output:
        f.write( indent + l + '\n' )
    else:
      f.write(line)
    
if __name__ == '__main__':
  main()
