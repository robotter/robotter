#!/bin/sh

# bit $1 is set in $2 (8 bits)
bit_is_set() {
    return $[ $[ $2 / $[ ( 1 << $1 ) ] ] % 2 ]
                        # <<$ fix syntax coloration
}

# $1 = name
# $2 = value
disp_fuse() {
    echo -n "$1:"
    echo -n -e "\t"
    let bit=7
    while [ $bit -ge 0 ];
      do
      NAME=`cut -d ' ' -f 2- ${MCU_DESC_FILE} | grep "^$bit $1" | cut -d ' ' -f 3`
      if [ -z "$NAME" ]; then
	  echo -n "XXXX"
      else
	  bit_is_set $bit $2
	  bitval=$?
	  echo -n "$NAME=$bitval"
      fi
      echo -n " "
      let bit=$bit-1
    done
    echo
}

# $1 filename
intel2hex() {
    echo "0x`cat $1 | head -1 | cut -b10-11`" > $1.tmp
    mv $1.tmp $1
}

# $1 filename
hex2intel() {
    printf ":01000000%.2X" `cat $1` > $1.tmp
    printf "%.2X\n" $[ 0xFF - `cat $1` ] >> $1.tmp
    echo ":00000001FF" >> $1.tmp
    mv $1.tmp $1
}


# 1/ read fuse state if possible
# 2/ prompt every bit
# 3/ program 

MCU_DESC_FILE=$1

echo "----------------------------------------------------------"
echo "                   Programming fuses"
echo "----------------------------------------------------------"
echo
echo "Warning : It can bue dangerous to program your fuses: some"
echo "configurations will prevent you to program your uC. Be sure"
echo "that you have carrefully read the documentation, and that"
echo "you know what you're doing"
echo 
echo "Warning : 0 means programmed and 1 means unprogrammed (see"
echo "AVR documentation for details"
echo
echo "BIT FAT WARNING ! PLEASE CHECK THE DOCUMENTATION BEFORE"
echo "PROGRAMMING BECAUSE SOME PARTS HAVE NOT BEEN TESTED"
echo

while true
  do
  echo -n "Are you sure ? [y/n] "
  read ans
  
  case $ans in
      y|Y)
	  break
	  ;;
      n|N)
	  echo " abort..."
	  exit 0
	  ;;
      *)
	  echo " Please type 'y' or 'n'"
  esac
done

if [ ! -f ${MCU_DESC_FILE} ]; then
    echo "ERROR"
    echo "Can't find the file ${MCU_DESC_FILE}"
    echo "If `basename ${MCU_DESC_FILE}` is a valid uC, you should add it in"
    echo "AVERSIVE/config/fuses_defs directory"
    exit 1
fi

if [ -z "${PROGRAMMER}" ]; then
    echo "ERROR !"
    echo " PROGRAMMER variable is not defined, check that the script"
    echo " is launched from a 'make fuse' in project directory"
    exit 1
fi

if [ "${PROGRAMMER}" = "avrdude" -a -z "${AVRDUDE}" ]; then
    echo "ERROR !"
    echo " AVRDUDE variable is not defined, check that the script"
    echo " is launched from a 'make fuse' in project directory"
    exit 1
fi

if [ "${AVARICE}" = "avarice" -a -z "${AVARICE}" ]; then
    echo "ERROR !"
    echo " AVARICE variable is not defined, check that the script"
    echo " is launched from a 'make fuse' in project directory"
    exit 1
fi

if [ "${PROGRAMMER}" = "avarice" ]; then
    echo "ERROR !"
    echo " Sorry, AVARICE fuse programming is not implemented now"
    exit 1
fi

if [ `wc -c ${MCU_DESC_FILE} | cut -d ' ' -f 1` -eq 0 ]; then
    echo "Aborting : this uC does not have any fuse to program."
    exit 0
fi


FUSE_LIST=`cut -d ' ' -f 3 ${MCU_DESC_FILE} | sort -u`

echo "Reading current fuse state"

if [ ! -z "${AVRDUDE_DELAY}" ]; then
    DELAY="-i ${AVRDUDE_DELAY}"
else
    DELAY=""
fi

CANNOT_READ=0

for f in ${FUSE_LIST}
  do
  rm -f $f 2> /dev/null
  echo 0x00 > ${f}_new
  ${AVRDUDE} ${DELAY} -p ${MCU} -P `echo ${AVRDUDE_PORT} | sed 's,",,g'` -c ${AVRDUDE_PROGRAMMER} -U ${f}:r:${f}:i
  if [ ! -f $f ]; then
      CANNOT_READ=1
  fi
done

echo
echo

if [ $CANNOT_READ -eq 1 ]; then
    echo -n "Problem during reading fuse. Continue anyway with writing ? [y/N] "
    read ans
    case $ans in
	y|Y)
	    echo " ok"
	    echo
	    echo

	    ;;
	*|n|N)
	    echo " abort..."
	    exit 1
    esac
else
    for f in ${FUSE_LIST}; do
	intel2hex $f
	disp_fuse $f `cat $f`
    done
    echo
    echo
fi

echo "Now please enter the new value for each fuse. The default one"
echo "is the value that has been read, or factory default if read failed"
echo
echo

NB_LINE=`wc -l ${MCU_DESC_FILE} | cut -d ' ' -f 1`
SEQ_END=$[ ${NB_LINE} - 1 ]

for i in `seq 0 ${SEQ_END}`
  do
  LINE=`grep "^${i} " ${MCU_DESC_FILE}`
  BIT=`echo ${LINE} | cut -d ' ' -f 2`
  FUSE=`echo ${LINE} | cut -d ' ' -f 3`
  NAME=`echo ${LINE} | cut -d ' ' -f 4`
  FACTORY=`echo ${LINE} | cut -d ' ' -f 5`
  DEFAULT=${FACTORY}
  CURRENT=x
  HELP=`echo ${LINE} | cut -d ' ' -f 6-`
  if [ -f ${FUSE} ]; then
      BIN_FUSE=`cat $FUSE`
      bit_is_set $BIT `printf "%d" $BIN_FUSE`
      CURRENT=$?
      DEFAULT=${CURRENT}
  fi

  echo -n "[$FUSE:${BIT}] ${NAME} <${HELP}> (factory=${DEFAULT}) (current=${CURRENT}) [${DEFAULT}] ? "
  read ans

  if [ -z "$ans" ] ; then
      ans=${DEFAULT}
  fi

  case $ans in
      1)
	  printf "0x%x\n" $[ $[ ( 1 << $BIT ) ] + `cat ${FUSE}_new` ] > ${FUSE}_new
                        # <<$ fix syntax coloration
	  echo "    get 1 (unprogrammed)"
	  ;;
      0)      
	  echo "    get 0 (programmed)"
	  ;;
      *)
	  echo "Bad answer, aborting..."
	  exit 1
  esac
  
done

echo
echo "Summary of new values :"
echo

for f in ${FUSE_LIST}; do
    if [ ! -f ${f}_new ]; then
	echo "ERROR: cannot find ${f}_new, aborting"
	exit 1
    fi
    disp_fuse $f `cat ${f}_new`
done

echo


while true
  do
  echo -n "Are you sure ? [y/n] "
  read ans
  
  case $ans in
      y|Y)
	  for f in ${FUSE_LIST}; do
	      hex2intel ${f}_new
	      ${AVRDUDE} -p ${MCU} -P `echo ${AVRDUDE_PORT} | sed 's,",,g'` -c ${AVRDUDE_PROGRAMMER} -U ${f}:w:${f}_new:i ${DELAY}
	  done
	  exit 0
	  ;;
      n|N)
	  echo " abort..."
	  exit 0
	  ;;
      *)
	  echo " Please type 'y' or 'n'"
  esac
done
