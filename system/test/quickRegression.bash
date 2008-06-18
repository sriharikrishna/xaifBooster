#!/bin/bash
if [ -z "${XAIFSCHEMAROOT}" ] 
then 
  echo XAIFSCHEMAROOT needs to be set, e.g. /sandbox/OpenAD/xaif
  exit -1 
fi
rm -rf tmp
mkdir tmp
if [ $# -gt 0 ] 
then  
    TESTFILES=$@
else
    TESTFILES='add_mul_ex1 add_mul_ex2 add_mul_ex_duud_lineUp add_mul_ex_no_duud add_mul_ex uwe_ex_1 uwe_ex_2 uwe_ex_2_explicit uwe_ex_3 uwe_ex_4 uwe_ex_5 vecref_ex whole_box_model select_case goto_label_1 loop_continue loop_exit'
fi
for i in `echo ${TESTFILES}`
    do
    echo "executing: ./t -v -i ${XAIFSCHEMAROOT}/schema/examples/${i}.xaif -o tmp/${i}.out -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg"
    ./t -v -V -i ${XAIFSCHEMAROOT}/schema/examples/${i}.xaif -o tmp/${i}.out -c ${XAIFSCHEMAROOT}/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg
    if [ $? -ne 0 ] 
    then 
	echo "ERROR during execution!"; 
    fi
    debugLines=`wc -l tmp/${i}.dbg | awk '{ print $1}'`
    if [ $debugLines -gt 0 ] 
    then 
	echo "debug messages:"
	cat tmp/${i}.dbg
        echo -n "QUESTION: there was a problem - hit <enter> to continue "
	if [ -z "$BATCHMODE" ] 
          then 
          read answer
        fi
	continue
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
	echo -n "QUESTION: there was a difference - checkin y/[n] : "
	if [ -z "$BATCHMODE" ] 
          then 
          read answer
	  if [ "${answer}" == "y" ] 
	  then 
	    cp tmp/${i}.out testOutput/${i}.out
	  else
            echo -n "QUESTION: there was a problem - hit <enter> to continue "
 	    if [ -z "$BATCHMODE" ] 
            then 
              read answer
            fi
          fi
        fi
    fi
    echo ""
done
