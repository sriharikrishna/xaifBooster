#!/bin/bash
echo "pick one of the following algorithms"
count=1
for i in `echo ../algorithms/*/test/t`
do 
  echo $count : $i
  let count=count+1
done 
read answer
count=1
for i in `echo ../algorithms/*/test/t`
do
  if [ $count -eq $answer ] 
  then 
    ln -sf $i xaifBooster
    exit 0 
  fi
  let count=count+1
done
exit -1
