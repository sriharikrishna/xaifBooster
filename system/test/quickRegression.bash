#!/bin/bash
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
    theCommand="./t -i ../../../xaif-1.0/schema/examples/${i}.xaif -o tmp/${i}.out -c ../../../xaif-1.0/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg"
    echo executing ./t -i ../../../xaif-1.0/schema/examples/${i}.xaif -o tmp/${i}.out -c ../../../xaif-1.0/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg
    ./t -i ../../../xaif-1.0/schema/examples/${i}.xaif -o tmp/${i}.out -c ../../../xaif-1.0/schema/examples/inlinable_intrinsics.xaif -d tmp/${i}.dbg
    echo "debug messages:"
    cat tmp/${i}.dbg
    echo "diffs base (<) vs. current (>):"
    diff testOutput/${i}.out tmp/${i}.out
    echo ""
done
