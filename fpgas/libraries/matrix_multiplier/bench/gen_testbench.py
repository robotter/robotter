#!/usr/bin/env python

import numpy
from numpy import array
import re, random

Qm = 8
Qn = 8
output = []

def float_to_Q(v):
  return int(v * (2**Qn))

def add_matrix(t, matrix):
  output.append('-- LOAD MATRIX');
  for e in reversed(matrix.flatten()):
    add_matrix_element(t,e)

def add_matrix_element(t, value):
  # compute Q format value
  output.append("element_value_s <= to_signed(%d,%d);"%(float_to_Q(value),
                                                        Qn+Qm))
  output.append("valid%s_s <= '0';"%t)
  output.append("wait until rising_edge(clk_s);")
  output.append("valid%s_s <= '1';"%t)
  output.append("wait until rising_edge(clk_s);")
  output.append("")

def compute_matrix_mult(t, vector):
  output.append("compute%s_s <= '0';"%t)
  output.append("wait until rising_edge(clk_s);")
  for i,s in enumerate(vector.flatten()):
    output.append("input%s_s(%d) <= to_signed(%d,%d);"%(t,i,
                                                    float_to_Q(s),
                                                    Qn+Qm))
  output.append("compute%s_s <= '1';"%t)
  output.append("wait until rising_edge(done%s_s);"%t)

def main():
  
  for t in ['A','B','C']:
    if t == 'A':
      dim = 3
    elif t == 'B':
      dim = 6
    elif t == 'C':
      dim = 9

    for n in range(0,2):
      output.append("report \"TESTING MATRIX %s.%d\";"%(t,n))

      M = numpy.ones((dim,3))
      #for i in range(0,dim):
      #  for j in range(0,3):
      #    M[i,j] = random.random()*2

      # declare matrix
      add_matrix(t,M)
       
      for m in range(0,5):
        output.append("report \"TESTING VECTOR %s.%d.%d\";"%(t,n,m))
        output.append("debug_s <= %d;"%(n*1000+m))

        V = numpy.zeros((1,dim))
        for i in range(0,dim):
          V[0,i] = random.random()*10
        O = numpy.dot(V,M)

        # declare input vector
        compute_matrix_mult(t,V)

        # declare assertions
        for i,s in enumerate(O.flatten()):
          output.append("tmp_v := to_integer(output%s_s(%d)) - %d;"%(t,i,float_to_Q(s)))
          output.append("assert tmp_v = 0 report \"delta diff= \"&str(tmp_v);")

  # open template file
  f = file('t_multipliers.vhd','wb');
  for line in file('t_multipliers.vhd.template','rb'):
    m = re.match(r'^(\s+)<<<([A-Z]+)>>>',line)
    if m and m.group(2) == 'HERE':
      indent = m.group(1)
      # marker found drop lines there
      for l in output:
        f.write( indent + l + '\n' )
    elif m and m.group(2) == 'CONSTANTS':
      indent = m.group(1)
      f.write(indent + 'constant int_size_c:natural:=%d;\n'%(Qn+Qm))
      f.write(indent + 'constant frac_size_c:natural:=%d;\n'%(Qn))
    else:
      f.write(line)
    
if __name__ == '__main__':
  main()
