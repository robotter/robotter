#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage: $0 DST_DIR"
    exit 1
fi

OUT_DIR=$1

cd ${OUT_DIR}

for i in *.pdf; do
    echo Converting $i
    pdftotext $i
done

