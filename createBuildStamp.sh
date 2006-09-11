#!/bin/sh
hg tip > /dev/null 2>&1
if [ $? -ne 0 ] 
then 
  echo "std::string buildStamp=\"$PWD hg:N/A by $USER\";" >> buildStamp.hpp.new 
else
  echo -n "std::string buildStamp=\"$PWD $(hg tip | grep changeset: | sed 's/changeset:[ ]*\(.*\):\(.*\)/hg:\1/'):$(hg id | sed 's/\([^ ].*\) \(.*\)/\1/') " > buildStamp.hpp.new
  echo " by $(hg tip | grep user: | sed 's/user:[ ]*\([^ ].*\)/\1/')\";" >> buildStamp.hpp.new  
fi
diff buildStamp.hpp.new buildStamp.hpp > /dev/null 2>&1
if [ $? -ne 0 ]
then 
  mv buildStamp.hpp.new buildStamp.hpp
else 
  rm -f buildStamp.hpp.new 
fi