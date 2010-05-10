import re
import numpy
from numpy         import dot as dot

f = open('./mesures.csv', 'r')
E = []
S = []
for line in f.readlines():
    groups = re.search('([0-9.-]*), *([0-9.-]*), *([0-9.-]*), *([0-9.-]*), *([0-9.-]*), *([0-9.-]*), *([0-9.-]*), *([0-9.-]*), *([0-9.-]*)', line).groups()
    mesure = map(float, groups)
    E.append(mesure[:3])
    S.append(mesure[3:])

E = numpy.array(E).T
S = numpy.array(S).T

M =  numpy.linalg.lstsq(S.T, E.T)[0].T

print """
double hrobot_adnsMatrix[3][6] = {
{%f,%f,%f,%f,%f,%f},
{%f,%f,%f,%f,%f,%f},
{%f,%f,%f,%f,%f,%f}
};
""" % tuple(M.reshape((1,18))[0])

f.close()
