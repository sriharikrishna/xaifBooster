#!/bin/bash
TBCFILES='dd ad'

./driver
                                                                               
for i in `echo ${TBCFILES}` 
  do
  echo "diff refOutput/"${i}".out tmpOutput/"${i}".out"
  diffs=`diff refOutput/${i}.out tmpOutput/${i}.out`
  if [ -n "$diffs" ]
  then
      echo "diffs refOutput (<) vs. tmpOutput (>):"
      diff refOutput/${i}.out tmpOutput/${i}.out
      if [ -z "$DONT_STOP" ]
      then
        exit -3
      fi
  else
      echo "no diffs"
  fi
  echo ""
done

