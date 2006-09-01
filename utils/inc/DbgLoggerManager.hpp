#ifndef _DBGLOGGERMANAGER_INCLUDE_
#define _DBGLOGGERMANAGER_INCLUDE_
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
#include <fstream>
#include "xaifBooster/utils/inc/DbgLogger.hpp"
#include "xaifBooster/utils/inc/DbgGroup.hpp"
#include "xaifBooster/utils/inc/Mutex.hpp"


namespace xaifBooster { 

  /**
   * use of preprocessor defined __FILE__ and __LINE__ requires 
   * use of a macro. We have to define a strange name 
   * for local variables to avoid accidental name matching - 
   * the niceties of macros!
   * Note the enclosing {} allowing for 
   * if (...) 
   *   DBG_MACRO(...);
   * without extra brackets but the compiler will complain 
   * about 
   * if (...) { 
   *   DBG_MACRO(...);
   * } 
   * because it doesn't know what to do with the extra ';' in the end;
   * make your choice.
   * the first argument is the DbgGroup the second an argument to an 
   * ostream << operator.
   */
#ifndef DBG_MACRO  
#define DBG_MACRO(Group,StreamArgs) \
  if (DbgLoggerManager::instance()->isSelected((Group))) { \
    std::ostringstream aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy; \
    aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy << StreamArgs << std::ends; \
    DbgLoggerManager::instance()->logDebug(__FILE__,__LINE__,(Group),aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy); \
  }
#else
#error macro name for DBG_MACRO already in use
#endif

  /** 
   * the singleton class for 
   * logging debug information
   */
  class DbgLoggerManager { 

  public: 

    static DbgLoggerManager* instance();

    /** 
     * set the selection essentially as 
     * bitwise AND between the respective 
     * values from DbgGroup
     * or of course their sum.
     */
    void setSelection(unsigned int aSelection_c); 

    /** 
     * the name for a file. 
     * an empty string prompts use of std::cout
     */
    void setFile(const std::string& aFileName_c);

    /** 
     * build info of the binary using this instance 
     */
    void setBinaryBuildInfo(const std::string& aBuildInfo_c);

    unsigned int getSelection() const ; 

    std::string getFileName() const ;

    /** 
     * used in the DBG_MACRO, see there
     */
    void logDebug(const std::string aFileName_c,
		  int aLineNumber_c,
		  const DbgGroup::DbgGroup_E aGroup_c,
		  std::ostringstream& aMessage_r);

    /** 
     * is a certain category currently selected? 
     */
    bool isSelected(const DbgGroup::DbgGroup_E aGroup_c) const; 

  private: 

    DbgLoggerManager();

    virtual ~DbgLoggerManager();

    static DbgLoggerManager* ourInstance_p;

    /**
     * no def
     */
    DbgLoggerManager(const DbgLoggerManager&);

    /**
     * no def
     */
    DbgLoggerManager& operator=(const DbgLoggerManager&);

    /**
     * the mutex to protect the instance
     */
    static Mutex ourInstanceMutex;

    /**
     * the pointer to the DbgLogger
     */
    DbgLogger* myLogger_p;

    /** 
     * the holder of the file stream
     */
    std::ofstream myOutFileStream;

    /**
     * the file name
     * may be empty
     */
    std::string myDebugOutPutFileName; 

    /**
     * the build info for the binary 
     * the uses this instance
     */
    std::string myBinaryBuildInfo; 

    /**
     * the current selection
     * ERROR=0 is always on
     */
    unsigned int mySelector;

    /**
     * previous timer seconds
     */
    long myPreviousS;

    /**
     * previous timer micro seconds
     */
    long myPreviousMS;

  }; // end of class DbgLoggerManager

}

#endif
