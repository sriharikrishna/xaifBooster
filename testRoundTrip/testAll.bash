#!/bin/bash
if [ $# -gt 0 ]
then
    TESTFILES=$@
else
    TESTFILES=`ls examples`
fi
for i in `echo ${TESTFILES}`
do 
  make testAllclean
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: make testAllclean"; exit -1;
  fi
  echo "** running $i *************************************************"
  exdir=examples/$i
  if [ -f $exdir/driver.f ] 
  then 
    ln -sf $exdir/driver.f .
    if [ $? -ne 0 ] 
    then 
      echo "ERROR in: ln -sf $exdir/driver.f ."; exit -1;
    fi
  fi
  ln -sf $exdir/head.f .
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: ln -sf $exdir/head.f ."; exit -1;
  fi
  if [ -f $exdir/params.conf ]
  then  
    ln -sf $exdir/params.conf .
    if [ $? -ne 0 ] 
    then 
      echo "ERROR in: ln -sf $exdir/params.conf ."; exit -1;
    fi
  fi
  make
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: make"; exit -1;
  fi
  make driver
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: make driver"; exit -1;
  fi
  make run
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: make run"; exit -1;
  fi
  hasDiffAD=$(diff tmpOutput/ad.out $exdir/refOutput/ad.out)
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: diff tmpOutput/ad.out $exdir/refOutput/ad.out"; exit -1;
  fi
  hasDiffDD=$(diff tmpOutput/dd.out $exdir/refOutput/dd.out)
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: diff tmpOutput/dd.out $exdir/refOutput/dd.out"; exit -1;
  fi
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
