#!/bin/bash
if [ -z "${XAIFSCHEMAROOT}" ] 
then 
  echo XAIFSCHEMAROOT needs to be set, e.g. /sandbox/BitKeep/xaif-1.0
  exit -1 
fi
rm -rf tmp
mkdir tmp
if [ $# -gt 0 ] 
then  
    TESTFILES=$@
else
    TESTFILES='add_mul_ex1 add_mul_ex2 add_mul_ex uwe_ex_1 uwe_ex_2 uwe_ex_3 uwe_ex_4 uwe_ex_5 whole_box_model'
fi
for i in `echo ${TESTFILES}`
    do
    echo "executing: ./t -i ${XAIFSCHEMAROOT}/schema/examples/${i}.xaif -o tmp/${i}.out -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg"
    ./t -i ${XAIFSCHEMAROOT}/schema/examples/${i}.xaif -o tmp/${i}.out -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg
    debugLines=`wc -l tmp/${i}.dbg | awk '{ print $1}'`
    if [ $debugLines -gt 0 ] 
    then 
	echo "debug messages:"
	cat tmp/${i}.dbg
	exit -2
    else
	echo "no debug messages"
    fi
    diffs=`diff testOutput/${i}.out tmp/${i}.out`
    if [ -n "$diffs" ] 
    then 
	echo "diffs base (<) vs. current (>):"
	diff testOutput/${i}.out tmp/${i}.out
	if [ -z "$DONT_STOP" ] 
	then
	  exit -3
	fi
    else 
	echo "no diffs"
    fi
    echo ""
done
