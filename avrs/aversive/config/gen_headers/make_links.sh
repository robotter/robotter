#!/bin/sh

if [ $# -ne 3 ]; then
    echo "usage: $0 SRC_DIR DST_DIR PDF_DST_DIR"
    exit 1
fi

SRC_DIR=$1
OUT_DIR=$2
OUT2_DIR=$3

RE='^ATtiny[0-9]*\((L)\)\?$\|^ATtiny[0-9]*\(L\)\?$\|^ATtiny[0-9]*L/V$\|^ATmega[0-9]*/V$\|^ATmega[0-9]*\((L)\)\?$\|^AT90S[0-9]*\((L)\)\?$\|^AT90S/LS[0-9]*\((L)\)\?$' 

#\|^AT90PWM[0-9A-Z]*\(/[0-9A-Z]*\)*$'

for i in ${SRC_DIR}/*.txt ; do
    echo ==== $i ====
    for j in `grep -o $RE $i | sed 's,(L),,g' | sed 's,S/LS,S,g' | sed 's,L/V,,g' | sed 's,L,,g'| sed 's,/V,,g' | sed 's,V,,g' | sort -u`; do
	echo ln -s ../$i ${OUT_DIR}/$j
	ln -s ../$i ${OUT_DIR}/$j
	ln -s ../${i%txt}pdf ${OUT2_DIR}/$j.pdf
    done
done
