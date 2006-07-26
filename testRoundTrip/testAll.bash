#!/bin/bash
CP="cp -f"
MAKE="gmake"

# extend the lib path 
pathExt=${OPENADROOT}/Open64/osprey1.0/targ_ia32_ia64_linux/whirl2f
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

function fileCompare { 
  fcexampleDir=$1
  fcfileName=$2
  fcmode=$3
  ignoreString=$4
    #  echo "in fileCompare $1 $2 $3 $4"
  referenceFile=${fcmode}${fcfileName}
  if [ ! -f $fcexampleDir/refOutput/$referenceFile ] 
  then 
    echo -n "$fcexampleDir/refOutput/$referenceFile not available, copy and hg add it? [y]/n "
    read answer
    if [ "$answer" == "n" ]
      then 
    echo " cannot verify ${fcfileName}"; exit 0;
    else
      ${CP} $fcfileName $fcexampleDir/refOutput/$referenceFile
      if [ $? -ne 0 ] 
        then 
        echo "ERROR in: ${CP} $fcfileName $fcexampleDir/refOutput/$referenceFile"; exit -1;
      fi
      hg add $fcexampleDir/refOutput/$referenceFile
      if [ $? -ne 0 ] 
        then 
        echo "ERROR in: hg add $fcexampleDir/refOutput/$referenceFile"; exit -1;
      fi
    fi
  fi
  hasDiff=$(diff -I "$ignoreString" $fcfileName $fcexampleDir/refOutput/$referenceFile)
  if [ $? -eq 2 ] 
    then 
    echo "ERROR in: $(diff -I "$ignoreString" $fcfileName $fcexampleDir/refOutput/$referenceFile)"; exit -1;
  fi
  if [ -n "$hasDiff" ] 
    then 
    echo  "Transformation difference in $fcfileName:"
    diff -I "$ignoreString" $fcfileName $fcexampleDir/refOutput/$referenceFile
    echo  "accept/copy new $fcfileName to $fcexampleDir/refOutput/$referenceFile ? y/[n] "
    read answer
    if [ "$answer" == "y" ] 
      then 
      ${CP} $fcfileName $fcexampleDir/refOutput/$referenceFile
      if [ $? -ne 0 ] 
        then 
        echo "ERROR in: ${CP} $fcfileName $fcexampleDir/refOutput/$referenceFile"; exit -1;
      fi
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
if [ $# -eq 0 ] 
then 
  echo "pick from: "
  ls examples
  echo -n "enter one ore more here or 'all': " 
  read answer
  if [ "$answer" == "all" ] 
  then 
    TESTFILES=`ls examples`
  else 
    TESTFILES=$answer
  fi
else
  if [ $# -eq 1 -a "$1" == "all" ]
  then 
    TESTFILES=`ls examples`
  else 
    TESTFILES=$@
  fi
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

### compare all the transformation results:
  for tfile in "head_sf.xaif" "head_sf.xb.xaif" "head_sf.xb.x2w.w2f.f" "head_sf.xb.x2w.w2f.pp.f" "head.xb.x2w.w2f.pp.f"
  do 
    fileCompare $exdir $tfile ${mode}${SUB_MODE} 'file translated from' 
  done

  ${MAKE} run
  if [ $? -ne 0 ] 
  then 
    echo "ERROR in: ${MAKE} run"; allOkSoFar="false"; continue;
  fi

  echo -n "numerical comparison ... "  
  echo "\"tmpOutput/dd.out\" \"$exdir/refOutput/dd.out\" \"tmpOutput/ad.out\" \"$exdir/refOutput/ad.out\"" | ./numericalComparison

  if [ $? -eq 0 ] 
  then 
    echo "no significant differences"
  else
    echo " ERROR in: ./numericalComparison for $i"; allOkSoFar="false"; continue;
  fi

done

