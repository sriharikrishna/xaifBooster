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
#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/StatementIdSetMapEntry.hpp"

namespace xaifBooster { 

  const std::string StatementIdSetMapEntry::ourXAIFName("xaif:StmtIdSet");

  const std::string StatementIdSetMapEntry::our_myKey_XAIFName("key");

  const std::string StatementIdSetMapEntry::our_StatementId_XAIFName("xaif:StatementId");

  const std::string StatementIdSetMapEntry::our_IdRef_XAIFName("idRef");

  StatementIdSetMapEntry::StatementIdSetMapEntry(unsigned int theKey) : 
    myKey(theKey) {} 
 
  StatementIdSetMapEntry::~StatementIdSetMapEntry(){}

  std::string StatementIdSetMapEntry::debug() const {
    std::ostringstream out;
    out << "StatementIdSetMapEntry[" << this 
	<< "]" << std::ends; 
    return out.str();
  } 
  
  void StatementIdSetMapEntry::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName.c_str() 
       << " "
       << our_myKey_XAIFName.c_str()
       << "=\""
       << myKey
       << "\""
       << ">" 
       << std::endl; 
    for(StatementIdSet::const_iterator it=myStatementIdSet.begin();
	it!=myStatementIdSet.end();
	it++) { 
      os << pm.indent(2) 
	 << "<" 
	 << our_StatementId_XAIFName.c_str()
	 << " "
	 << our_IdRef_XAIFName.c_str()
	 << "=\""
	 << (*it).c_str()
	 << "\""
	 << "/>"
	 << std::endl; 
    } 
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } 

  void StatementIdSetMapEntry::insert(const std::string& anId) { 
    myStatementIdSet.insert(anId);
  } 

  const StatementIdSet& StatementIdSetMapEntry::getStatementIdSet() const { 
    return myStatementIdSet;
  } 

} // end of namespace  
