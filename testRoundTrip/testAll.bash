#!/bin/bash
for i in `ls examples`
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
  hasDiff=$(diff tmpOutput $exdir/refOutput)
  if [ -n "$hasDiff" ] 
  then	 
    echo "di	ffs base (<) vs. current (>):"
    diff tmpOutput $exdir/refOutput
    if [ -z "$DONT_STOP" ] 
    then
      exit -3
    fi
  else 
    echo "no diffs"
  fi
done