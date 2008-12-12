#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage: $0 DST_DIR"
    exit 1
fi

OUT_DIR=$1

URL_BASE=http://www.atmel.com
FAMILY_PATH=/dyn/products/datasheets.asp?family_id=607
DOC_PATH=/dyn/resources/prod_documents/

DOCS=`wget -O - ${URL_BASE}${FAMILY_PATH} | grep ${DOC_PATH} | sed 's,.*'${DOC_PATH}'\([a-zA-Z0-9\.]*pdf\).*$,\1,' | sort -u | grep ^doc`

cd ${OUT_DIR}
for i in ${DOCS}; do
    echo "Downloading $i"
    wget ${URL_BASE}${DOC_PATH}$i
done
cd -

#####################

# same with mature products

URL_BASE=http://www.atmel.com
DOC_PATH=/dyn/resources/prod_documents/

DOCS2="DOC0838.PDF DOC0839.PDF DOC1004.PDF DOC1042.PDF DOC0841.PDF DOC1041.PDF Doc0945.pdf DOC1228.PDF doc1142.pdf doc1457.pdf"

cd ${OUT_DIR}
for i in ${DOCS2}; do
    echo "Downloading $i"
    wget ${URL_BASE}${DOC_PATH}$i
done
cd -

###################

cd ${OUT_DIR}
for i in ${DOCS} ${DOCS2}; do
    mv $i `echo $i | tr [A-Z] [a-z]` 2>/dev/null
done
cd -
