#!/bin/bash
echo "pick one of the following algorithms"
count=1
for i in `echo ../algorithms/*/test/t`
do 
  echo $count : $i
  let count=count+1
done 
echo -n "pick a number: "
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
echo "Error: $answer is not a valid pick from the list"
exit -1
