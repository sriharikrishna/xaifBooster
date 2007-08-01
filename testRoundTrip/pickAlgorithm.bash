#!/bin/bash
subMode=$1
echo "pick one of the following algorithms"
count=1
for i in `echo ../algorithms/*/test/t | sort`
do 
  name=${i##../algorithms/}  
  echo $count : ${name%%/test/t}
  if [ \( "$subMode" == "joint" -o "$subMode" == "split" \) -a "${name%%/test/t}" == "BasicBlockPreaccumulationReverse" ] 
  then 
    recommended=$count
  fi
  if [ "$subMode" == "none" -a "${name%%/test/t}" == "BasicBlockPreaccumulation" ] 
  then 
    recommended=$count
  fi
  let count=count+1
done 
echo -n "pick a number [$recommended]: "
read answer
if [ "$recommended$answer" == "$recommended" ] 
then 
  answer=$recommended
fi
count=1
for i in `echo ../algorithms/*/test/t | sort`
do
  if [ $count -eq $answer ] 
  then 
    ln -sf $i xaifBooster
    exit 0 
  fi
  let count=count+1
done
echo "Error: $answer is not a valid pick from the list"
exit -1
