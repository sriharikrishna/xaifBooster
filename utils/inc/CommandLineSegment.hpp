#ifndef _COMMANDLINESEGMENT_INCLUDE_
#define _COMMANDLINESEGMENT_INCLUDE_
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

#include <string>

namespace xaifBooster { 

  /** 
   * class parses the command line into one pair of 
   * switch(es) followed by an argument(block)
   * each step is a parse after 
   * which the respective switch/argument pair
   * can be retrieved
   */
  class CommandLineSegment {

  public: 

    /** 
     * argc/argv are the arguments from 'main'
     */
    CommandLineSegment(int argc, char** argv);

    ~CommandLineSegment(); 

    /**
     * parse the next switch/argument pair
     */ 
    void parse();
  
    /** 
     * is there something left to parse
     */
    bool notDone() const;

    /** 
     * get the switch(es) 
     * with the leading '-'
     */
    const std::string& getSwitches() const;

    /** 
     * get the argumen(block) 
     * without escape characters
     */
    const std::string& getArgument() const;

  private:

    /**
     * no def
     */
    CommandLineSegment();

    /**
     * resets for the next pair
     */
    void reset(); 

    /** 
     * parses switch(es)
     */
    void parseSwitch();
  
    /** 
     * parses a single argument
     */
    void parseArgument();

    /** 
     * parses a block of arguments, 
     * i.e. arguments delimited by single quotes
     */
    void parseArgumentBlock();

    /** 
     * the switches found in the current 
     * context
     */
    std::string mySwitches;

    /** 
     * the arguments found in the current 
     * context
     */
    std::string myArgument;

    /** 
     * my copy of argv;
     * not a deep copy
     */
    char** myArgv;

    /** 
     * my copy of argc
     */
    const int myArgc;

    /** 
     * my current index into argv
     */
    int myArgvIndex;

    /**
     * while parsing we find escapes '\' 
     * that need to be dropped
     */
    std::string copyDroppingEscapes(char* argument,int numberOfEscapes);

    /** 
     * the current parsing context
     */
    enum Context {SWITCH_BLOCK,
		  ARG_BLOCK, 
		  DONE} myContext;

  }; // end class CommandLineSegment
   
} // end of namespace xaifBooster

#endif








