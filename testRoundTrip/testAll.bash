#!/bin/bash
if [ $# -gt 0 ]
then
    TESTFILES=$@
else
    TESTFILES=`ls examples`
fi
for i in `echo ${TESTFILES}`
do 
  make clean
  echo "** running $i *************************************************"
  exdir=examples/$i
  if [ -f $exdir/driver.f ] 
  then 
    ln -sf $exdir/driver.f .
  fi
  ln -sf $exdir/head.f .
  ln -sf $exdir/params.conf .
  make
  make driver
  make run
  hasDiffAD=$(diff tmpOutput/ad.out $exdir/refOutput/ad.out)
  hasDiffDD=$(diff tmpOutput/dd.out $exdir/refOutput/dd.out)
  if [ -n "$hasDiffAD" -o -n "$hasDiffDD" ] 
  then	 
    echo "diffs base (<) vs. current (>) AD:"
    diff tmpOutput/ad.out $exdir/refOutput/ad.out 
    echo "diffs base (<) vs. current (>) DD:"
    diff tmpOutput/dd.out $exdir/refOutput/dd.out 
    if [ -z "$DONT_STOP" ] 
    then
      exit -3
    fi
  else 
    echo "no diffs"
  fi
done
