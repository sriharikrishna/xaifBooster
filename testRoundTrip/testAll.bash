#!/bin/bash
CP="cp -f"

function copyDefaultBeforeExample { 
  exampleDir=$1
  fileName=$2
  ${CP} simple.$fileName $fileName 
  if [ $? -ne 0 ] 
    then 
      echo "ERROR in: ${CP} simple.$fileName $fileName"; exit -1;
    fi
  if [ -f $exampleDir/$fileName ] 
  then 
    ${CP} $exampleDir/$fileName .
    if [ $? -ne 0 ] 
    then 
      echo "ERROR in: ${CP} $exampleDir/$fileName"; exit -1;
    fi
  fi
} 
askAll="n"
mode="none"
submode="none"
if [ -f .lastRun ] 
then 
  read mode submode < .lastRun 
  echo -n "reuse last settings (${mode} ${submode})? [y]/n "
  read answer
  if [ "$answer" == "n" ]
  then
    askAll="y"
  fi 
else
  askAll="y"
fi
if [ "$askAll" == "y" ] 
then 
  echo -n "use reverse mode y/[n] "
  read answer
  if [ "$answer" == "y" ]
  then
    export REVERSE_MODE=y
    mode="adm"
    echo -n "use submode [split]/joint"
    read answer
    if [ "$answer" == "split" ]
    then
	submode="$answer"
    else 
      if [ "$answer" == "joint" ]
      then
	submode="$answer"
      else 
        echo "type split or joint"
        exit -1
      fi
    fi
  else
    mode="tlm"
  fi
fi 
echo $mode $submode > .lastRun
if [ $# -gt 0 ]
then
    TESTFILES=$@
else
    TESTFILES=`ls examples`
fi
for i in `echo ${TESTFILES}`
do 
  export TARGET=head
  make testAllclean
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: make testAllclean"; exit -1;
  fi
  echo "** running $i *************************************************"
  TARGET_DRIVER=driver_${mode}
  if [ "$REVERSE_MODE" == "y" ] 
  then 
    TARGET_DRIVER=${TARGET_DRIVER}_${submode}
  fi
  exdir=examples/$i
  copyDefaultBeforeExample $exdir ${TARGET_DRIVER}.f90
  copyDefaultBeforeExample $exdir params.conf
  copyDefaultBeforeExample $exdir all_globals_mod.f
  copyDefaultBeforeExample $exdir all_globals_cp_mod.f
  copyDefaultBeforeExample $exdir ad_template.f
  copyDefaultBeforeExample $exdir head.f
  export TARGET=all_globals_mod
  make
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: make for all_globals_mod"; exit -1;
  fi
  ${CP}  all_globals_mod.prh.xb.x2w.w2f.urh.pp.f all_globals_mod.f
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: ${CP}  all_globals_mod.prh.xb.x2w.w2f.urh.pp.f all_globals_mod.f"; exit -1;
  fi
  export TARGET=head
  make
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: make for head"; exit -1;
  fi
### this is temporary until we got rid of the RETURNs
  if [ "$REVERSE_MODE" == "y" ] 
  then 
    sed 's/RETURN//' head.prh.xb.x2w.w2f.urh.pp.f >| head.prh.xb.x2w.w2f.urh.pp.f.1
    mv head.prh.xb.x2w.w2f.urh.pp.f.1 head.prh.xb.x2w.w2f.urh.pp.f
  fi
### end of temporary fix
  export TARGET_DRIVER
  make $TARGET_DRIVER
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
  if [ $? -eq 2 ] 
  then 
    echo "ERROR in: diff tmpOutput/ad.out $exdir/refOutput/ad.out"; exit -1;
  fi
  hasDiffDD=$(diff tmpOutput/dd.out $exdir/refOutput/dd.out)
  if [ $? -eq 2 ] 
  then 
    echo "ERROR in: diff tmpOutput/dd.out $exdir/refOutput/dd.out"; exit -1;
  fi
  if [ -n "$hasDiffAD" -o -n "$hasDiffDD" ] 
  then	 
    echo "diffs current test (<) vs. reference (>) AD:"
    diff tmpOutput/ad.out $exdir/refOutput/ad.out 
    echo "diffs current test (<) vs. reference (>) DD:"
    diff tmpOutput/dd.out $exdir/refOutput/dd.out 
    if [ -z "$DONT_STOP" ] 
    then
      exit -3
    fi
  else 
    echo "no diffs"
  fi
done

