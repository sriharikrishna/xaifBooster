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
#include <cerrno>

#include "xaifBooster/utils/inc/CommandLineParser.hpp"

namespace xaifBooster { 

  CommandLineParser::CommandLineParser(int argc, 
				       char** argv) :
    myArgc(argc), 
    myArgv(argv),
    myParsedFlag(false) { 
  } 

  CommandLineParser::~CommandLineParser() {
  } 
  
  void
  CommandLineParser::parse(const std::string& theSwitches) {
    if (myParsedFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::parse(): cannot parse more than once!");
    myCommandLineArguments.addSwitches(theSwitches);
    // the first piece after the program name should be a
    // switch or a group of switches. 
    CommandLineSegment theSegment(myArgc, myArgv);
    while (theSegment.notDone()){
      theSegment.parse();
      myCommandLineArguments.setSegment(theSegment); 
    } // end while 
    myParsedFlag=true; 
  }
     
  void
  CommandLineParser::displayArguments() const {
    if (!myParsedFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::displayArguments parse has not been called!");
    myCommandLineArguments.dump();
  }

  const std::string& 
  CommandLineParser::argAsString(char theSwitch) const {
    if (!myParsedFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsString parse has not been called!");
    return myCommandLineArguments.getArgument(theSwitch);
  } // end CommandLineParser::displayArguments

  int
  CommandLineParser::argAsInt(char theSwitch) const {
    if (!myParsedFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsInt parse has not been called!");
    int value;
    std::string temp(myCommandLineArguments.getArgument(theSwitch));
    if (temp.empty()) { // make sure that is something
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsInt(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\"" 
				 << "has been set or has defaulted to an empty string which cannot " 
				 << "be converted to an integer!");
    } // end if 
    errno=0;
    char *remainder=NULL;
    value=(int)strtol(temp.c_str(),
		      &remainder,
		      10); // atoi does not necessarily set errno
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsInt(): "  
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" " 
				 << "which cannot be converted to an integer. "
				 << "The error returned by strtol() is: " 
				 << strerror(errno)); 
    } // end if 
    // some implementations set errno for strings that contain unconvertable 
    // substrings, others put the unconvertible rest into the remainder pointer
    // and return the part that could be converted as number, i.e. 0 if nothing 
    // in the string could be converted. Such cases we want to catch  
    if (strlen(remainder)) {
      THROW_LOGICEXCEPTION_MACRO("Error in CommandLineParser::argAsInt(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" "
				 << "which cannot be converted to an integer.");
    } // end if
    return value;
  } // end CommandLineParser::argAsInteger

  double
  CommandLineParser::argAsDouble(char theSwitch) const  {
    if (!myParsedFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsDouble parse has not been called!");
    double value;
    std::string temp(myCommandLineArguments.getArgument(theSwitch));
    if (temp.empty()) { // make sure that is something
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsDouble(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\"" 
				 << "has been set or has defaulted to an empty string which cannot " 
				 << "be converted to a double!");
    } // end if 
    errno=0;
    char *remainder=NULL;
    value=strtod(temp.c_str(),&remainder);
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsDouble(): "  
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" " 
				 << "which cannot be converted to an double. "
				 << "The error returned by strtol() is: " 
				 << strerror(errno)); 
    } // end if 
    // some implementations set errno for strings that contain unconvertable 
    // substrings, others put the unconvertible rest into the remainder pointer
    // and return the part that could be converted as number, i.e. 0 if nothing 
    // in the string could be converted. Such cases we want to catch  
    if (strlen(remainder)) {
      THROW_LOGICEXCEPTION_MACRO("Error in CommandLineParser::argAsDouble(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" "
				 << "which cannot be converted to a double.");
    } // end if 
    return value;
  } // end CommandLineParser::argAsDouble

  bool
  CommandLineParser::isSet(char theSwitch) const {
    if (!myParsedFlag)
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::isSet parse has not been called!");
    return myCommandLineArguments.isSet(theSwitch);
  } // end CommandLineParser::argAsDouble

} // end of namespace xaifBooster
