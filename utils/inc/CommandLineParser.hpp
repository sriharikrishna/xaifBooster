#ifndef _COMMANDLINEPARSER_INCLUDE_
#define _COMMANDLINEPARSER_INCLUDE_
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

  /**
   * Command line format assumed for this parser:
   * - a switch is a single letter in [A..Z,a..z] prepended by a dash (-), 
   *   e.g.   -a
   * - switches can be grouped together as a sequences of letters prepended 
   *   by a dash, e.g.  -abc
   * - (groups of) switches can be followed by zero or one argument which is 
   *   separated by at least one space from the (last) switch
   * - the argument is only associated with the respective last switch
   * - arguments are character sequences delimited by spaces and beginning with 
   *   a character other than a dash
   * - an argument that should contain spaces or start with a dash 
   *   must be enclosed in single quotes in the first and the last position 
   *   of the character sqequence. The quotes will be stripped.
   * - an argument can contain any character except single quotes which are 
   *   used as delimiters
   * - to pass a single quote as part of the argument it must be written as 
   *   an escape sequence \', the backslashes will be stripped
   * - onversion to numerical values requires the whole argument to be
   *   convertible, not just a leading convertible substring
   */ 
  class CommandLineParser {
  public: 

    /**
     * instantiate parser with
     * \parm argc from main
     * \parm argv from main
     */ 
    CommandLineParser(int argc, 
		      char** argv); 
    
    virtual ~CommandLineParser();
    
    /**
     *  instantiate the parser, it is implemented as a singleton 
     */ 
    static CommandLineParser* instance(); 

    /** 
     * do the parsing in a step separate from construction
     * \paran theSwitches allowed for this transformation
     */
    void parse(const std::string& theSwitches);

    /** 
     * display all the arguments that have been found on the command line 
     */ 
    void displayArguments() const ;               

    /**
     * extract the argument associated with theSwitch as string.
     */ 
    const std::string& argAsString(char theSwitch) const ; 

    /**
     * extract the argument associated with theSwitch as integer.
     */
    int argAsInt(char theSwitch) const;

    /** 
     * extract the argument associated with theSwitch as double.
     */
    double argAsDouble(char theSwitch) const; 

    /**
     * returns true if theSwitch occured at the command line, 
     * otherwise false 
     */
    bool isSet(char theSwitch) const ;

  private:

    CommandLineParser();

    /** 
     * here we keep the parsed information
     */
    CommandLineArguments myCommandLineArguments;

  protected: 

    /** 
     * copy of argc
     */
    int myArgc; 

    /**
     * pointer to argv
     */
    char** myArgv;

    /** 
     * has parse been called? 
     */
    bool myParsedFlag;

  }; // end of class CommandLineParser
   
} // end of namespace xaifBooster

#endif
