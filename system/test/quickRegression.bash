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
    TESTFILES='add_mul_ex1 add_mul_ex2 add_mul_ex uwe_ex_1 uwe_ex_2 uwe_ex_3 uwe_ex_4 uwe_ex_5 whole_box_model goto_label_1 loop_continue loop_exit select_case'
fi
for i in `echo ${TESTFILES}`
    do
    echo "executing: ./t -i ${XAIFSCHEMAROOT}/schema/examples/${i}.xaif -o tmp/${i}.out -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg"
    ./t -i ${XAIFSCHEMAROOT}/schema/examples/${i}.xaif -o tmp/${i}.out -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg
    if [ $? -ne 0 ] 
    then 
	echo "ERROR during execution!"; exit -1;
    fi
    debugLines=`wc -l tmp/${i}.dbg | awk '{ print $1}'`
    if [ $debugLines -gt 0 ] 
    then 
	echo "debug messages:"
	cat tmp/${i}.dbg
	if [ -z "$DONT_STOP" ] 
        then
	  exit -2
        fi
    fi
    diffs=`diff testOutput/${i}.out tmp/${i}.out`
    if [ $? -eq 2 ] 
    then 
      echo "ERROR in: diff testOutput/${i}.out tmp/${i}.out"; exit -1;
    fi
    if [ -n "$diffs" ] 
    then 
	echo "diffs base (<) vs. current (>):"
	diff testOutput/${i}.out tmp/${i}.out
	if [ -z "$DONT_STOP" ] 
	then
	  exit -3
	fi
    fi
    echo ""
done
