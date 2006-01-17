// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights reserved.
//
// Redistribution and use in source and binary forms, 
// with or without modification, are permitted provided that the following conditions are met:
//
//    - Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//    - Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//    - Neither the name of The University of Chicago nor the names of its contributors 
//      may be used to endorse or promote products derived from this software without 
//      specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// General Information:
// xaifBooster is intended for the transformation of 
// numerical programs represented as xml files according 
// to the XAIF schema. It is part of the OpenAD framework. 
// The main application is automatic 
// differentiation, i.e. the generation of code for 
// the computation of derivatives. 
// The following people are the principal authors of the 
// current version: 
// 	Uwe Naumann
//	Jean Utke
// Additional contributors are: 
//	Andrew Lyons
//	Peter Fine
//
// For more details about xaifBooster and its use in OpenAD please visit:
//   http://www.mcs.anl.gov/openad
//
// This work is partially supported by:
// 	NSF-ITR grant OCE-0205590
// ========== end copyright notice ==============
#include "xaifBooster/utils/inc/CommandLineArguments.hpp"

namespace xaifBooster { 

  CommandLineArguments::CommandLineSwitchArgument::CommandLineSwitchArgument() : 
    mySetFlag(false) { 
  } // end of CommandLineArguments::CommandLineSwitchArgument::CommandLineSwitchArgument

  void CommandLineArguments::CommandLineSwitchArgument::setArgument(const std::string& theArgument) { 
    if (mySetFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineArguments::CommandLineSwitchArgument::setArgument: argument already set");
    mySetFlag=true;
    myArgument=theArgument;
  } 

  const std::string& CommandLineArguments::CommandLineSwitchArgument::getArgument() const { 
    if (!mySetFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineArguments::CommandLineSwitchArgument::getArgument: not set");
    return myArgument;
  } 

  bool CommandLineArguments::CommandLineSwitchArgument::isSet() const { 
    return mySetFlag;
  } 

  CommandLineArguments::CommandLineArguments() { 
  } 
 
  CommandLineArguments::~CommandLineArguments() {
  }

  void
  CommandLineArguments::addSwitches(const std::string& theSwitches){
    for (std::string::const_iterator i=theSwitches.begin();
	 i!=theSwitches.end();
	 ++i) { 
      checkAllowedAsSwitch(*i);
      mySwitchArgumentMap.insert(std::pair<const char,CommandLineSwitchArgument>(*i,CommandLineSwitchArgument()));
    } // endfor 
  }  

  void 
  CommandLineArguments::checkAllowedAsSwitch(char a){
    if ( (a < 'A') || (a > 'z' ) || ((a > 'Z') && (a < 'a'))) 
      THROW_LOGICEXCEPTION_MACRO("CommandLineSegment::checkAllowedAsSwitch: \""
				 << a 
				 << "\" is not allowed as switch character");
  } // end CommandLineArguments::checkAllowedAsSwitch

  void
  CommandLineArguments::setSegment(const CommandLineSegment& theSegment){
    std::string theSwitches(theSegment.getSwitches());
    for(unsigned int i=0;
	i<theSwitches.length()-1;
	++i) { 
      SwitchArgumentMap::iterator mapI=
	mySwitchArgumentMap.find(theSwitches[i]);
      if (mapI==mySwitchArgumentMap.end()) 
	THROW_LOGICEXCEPTION_MACRO("CommandLineArguments::setSegment: character \""
				   << theSwitches[i]
				   << "\" is not in the set of defined switches");
      if (i+1==theSwitches.length()-1) 
	// only the last switch has the 
	// argument as its value
	(*mapI).second.setArgument(theSegment.getArgument());
      else
	// all the switches except for the last are set to ""
	(*mapI).second.setArgument("");
    } // end for 
  } // end addArgument 
  
  const std::string&
  CommandLineArguments::getArgument(char theSwitch) const {
    SwitchArgumentMap::const_iterator mapI=
      mySwitchArgumentMap.find(theSwitch);
    if (mapI==mySwitchArgumentMap.end()) 
      THROW_LOGICEXCEPTION_MACRO("CommandLineArguments::getArgument: character \""
				 << theSwitch
				 << "\" is not in the set of defined switches");
    if (!(*mapI).second.isSet())
      THROW_LOGICEXCEPTION_MACRO("CommandLineArguments::getArgument: \""
				 << theSwitch
				 << "\" was not set");
    return ((*mapI).second.getArgument());
  } // end getArgument 
    
  bool
  CommandLineArguments::isSet(char theSwitch) const {
    SwitchArgumentMap::const_iterator mapI=
      mySwitchArgumentMap.find(theSwitch);
    if (mapI==mySwitchArgumentMap.end()) 
      THROW_LOGICEXCEPTION_MACRO("CommandLineArguments::isSet: character \""
				 << theSwitch
				 << "\" is not in the set of defined switches");
    return (*mapI).second.isSet();
  } // end isSet 

  std::string CommandLineArguments::dump() const { 
    std::string returnString;
    for(SwitchArgumentMap::const_iterator mapI=
	  mySwitchArgumentMap.begin();
	mapI!=mySwitchArgumentMap.end();
	++mapI) { 
      returnString+="[";
      returnString+=(*mapI).first;
      returnString+="][";
      if ((*mapI).second.isSet()) 
	returnString+="+]["+(*mapI).second.getArgument()+"]";
      else 
	returnString+="-][]";
    }
    return returnString;
  }  

} // end of namespace xaifBooster
