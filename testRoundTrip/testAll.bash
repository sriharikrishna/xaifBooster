#!/bin/bash
CP="cp -f"
MAKE="gmake"

# extend the lib path 
pathExt=${RICETOOLROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f
libInPath=$(echo ${LD_LIBRARY_PATH} | grep ${pathExt} )
if [ -z "${libInPath}" ]
then
  export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${pathExt}
fi

function copyDefaultBeforeExample { 
  exampleDir=$1
  fileName=$2
  targetFileName=$3  
  ${CP} simple.$fileName $targetFileName 
  if [ $? -ne 0 ] 
    then 
      echo "ERROR in: ${CP} simple.$fileName $targetFileName"; exit -1;
    fi
  if [ -f $exampleDir/$fileName ] 
  then 
    ${CP} $exampleDir/$fileName $targetFileName
    if [ $? -ne 0 ] 
    then 
      echo "ERROR in: ${CP} $exampleDir/$fileName $targetFileName"; exit -1;
    fi
  fi
} 
askAll="n"
mode="none"
SUB_MODE="none"
if [ -f .lastRun ] 
then 
  read mode SUB_MODE < .lastRun 
  echo -n "reuse last settings (${mode} ${SUB_MODE})? [y]/n "
  read answer
  if [ "$answer" == "n" ]
  then
    ${MAKE} clean 
    askAll="y"
    SUB_MODE="none"
  else 
    if [ "$mode" == "adm" ] 
    then 
      export REVERSE_MODE=y
    fi
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
    SUB_MODE="split"
    echo -n "use SUB_MODE [split]/joint "
    read answer
    if [ "$answer" == "joint" ]
    then
	SUB_MODE="$answer"
    fi
  else
    mode="tlm"
  fi
fi 
allOkSoFar="true"
echo $mode $SUB_MODE > .lastRun
export SUB_MODE
if [ $# -gt 0 ]
then
    TESTFILES=$@
else
    TESTFILES=`ls examples`
fi
for i in `echo ${TESTFILES}`
do 
  if [ "$allOkSoFar" == "false" ] 
  then
    echo -n "QUESTION: There was problem with the last example, kill the script or hit enter to continue with $i ?" 
    read answer
    allOkSoFar="true"
  fi
  if [ ! -d "examples/$i" ] 
  then 
    echo "ERROR: no such test : $i "; allOkSoFar="false"; continue;
  fi
  export TARGET=head
  ${MAKE} testAllclean
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: ${MAKE} testAllclean"; allOkSoFar="false"; continue;
  fi
  echo "** running $i *************************************************"
  TARGET_DRIVER=driver_${mode}
  if [ "$REVERSE_MODE" == "y" ] 
  then 
    TARGET_DRIVER=${TARGET_DRIVER}_${SUB_MODE}
  fi
  exdir=examples/$i
  copyDefaultBeforeExample $exdir ${TARGET_DRIVER}.f90 driver.f90
  copyDefaultBeforeExample $exdir params.conf params.conf
  copyDefaultBeforeExample $exdir head.f head.f
  copyDefaultBeforeExample $exdir all_globals_mod.f all_globals_mod.f
  if [ "$REVERSE_MODE" == "y" ] 
  then 
    copyDefaultBeforeExample $exdir all_globals_cp_mod.f90 all_globals_cp_mod.f90
    copyDefaultBeforeExample $exdir ad_template_${SUB_MODE}.f ad_template.f
  fi  
    
### transform head_sf
  ${MAKE} 
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: ${MAKE} "; allOkSoFar="false"; continue;
  fi
### this is temporary until we got rid of the RETURNs
  if [ "$REVERSE_MODE" == "y" ] 
  then 
    sed 's/RETURN//' head.xb.x2w.w2f.pp.f >| head.xb.x2w.w2f.pp.f.1
    mv head.xb.x2w.w2f.pp.f.1 head.xb.x2w.w2f.pp.f
  fi
### end of temporary fix

### now we compile all the transformed bits 
  ${MAKE} driver
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: ${MAKE} driver"; allOkSoFar="false"; continue;
  fi
  ${MAKE} run
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: ${MAKE} run"; allOkSoFar="false"; continue;
  fi
  hasDiffAD=$(diff tmpOutput/ad.out $exdir/refOutput/ad.out)
  if [ $? -eq 2 ] 
  then 
    echo "ERROR in: diff tmpOutput/ad.out $exdir/refOutput/ad.out"; allOkSoFar="false"; continue;
  fi
  hasDiffDD=$(diff tmpOutput/dd.out $exdir/refOutput/dd.out)
  if [ $? -eq 2 ] 
  then 
    echo "ERROR in: diff tmpOutput/dd.out $exdir/refOutput/dd.out"; allOkSoFar="false"; continue;
  fi
  if [ -n "$hasDiffAD" -o -n "$hasDiffDD" ] 
  then	 
    echo "diffs current test (<) vs. reference (>) AD:"
    diff tmpOutput/ad.out $exdir/refOutput/ad.out 
#    echo "diffs current test (<) vs. reference (>) DD:"
#    diff tmpOutput/dd.out $exdir/refOutput/dd.out 
    if [ -z "$DONT_STOP" ] 
    then
      allOkSoFar="false"; continue;
    fi
  else 
    echo "no diffs"
  fi
done

