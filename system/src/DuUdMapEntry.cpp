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

#include "xaifBooster/system/inc/DuUdMapEntry.hpp"

namespace xaifBooster { 

  const std::string DuUdMapEntry::ourXAIFName("xaif:DUUDSet");

  const std::string DuUdMapEntry::our_myKey_XAIFName("key");

  const std::string DuUdMapEntry::our_StatementId_XAIFName("xaif:StatementId");

  const std::string DuUdMapEntry::our_IdRef_XAIFName("idRef");

  DuUdMapEntry::DuUdMapEntry(unsigned int theKey) : 
    myKey(theKey) {} 
 
  DuUdMapEntry::~DuUdMapEntry(){}

  std::string DuUdMapEntry::debug() const {
    std::ostringstream out;
    out << "DuUdMapEntry[" << this 
	<< "]" << std::ends; 
    return out.str();
  } 
  
  void DuUdMapEntry::printXMLHierarchy(std::ostream& os) const {
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
    for(DuUdMapDefinitionResult::StatementIdList::const_iterator it=myStatementIdList.begin();
	it!=myStatementIdList.end();
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

  void DuUdMapEntry::appendToStatementIdList(const std::string& anId) { 
    myStatementIdList.push_back(anId);
  } 

  const DuUdMapUseResult DuUdMapEntry::use(const DuUdMapUseResult::StatementIdLists& idLists) const { 
    DuUdMapUseResult theResult;
    if (myStatementIdList.empty()) { 
      DBG_MACRO(DbgGroup::ERROR,"DuUdMapEntry::use: an empty StatementIdList implies dead code, the subsequent transformations may fail");
      return theResult;
    }
    unsigned int matchNumber=0;
    bool hasOutOfScope=false;
    for(DuUdMapDefinitionResult::StatementIdList::const_iterator chainI=myStatementIdList.begin();
	chainI!=myStatementIdList.end();
	++chainI) {
      // first test against the active statements
      for(DuUdMapDefinitionResult::StatementIdList::const_iterator dependentStatementIdListI=idLists.myDependentStatementIdList.begin();
	  dependentStatementIdListI!=idLists.myDependentStatementIdList.end();
	  ++dependentStatementIdListI) { 
	if (*dependentStatementIdListI=="")
	  THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::use: StatementIds in the active statement id list cannot be empty");
	if (*dependentStatementIdListI==*chainI)
	  matchNumber++;
	if (matchNumber==1) { 
	  theResult.myStatementId=*chainI;
	  theResult.myActiveUse=ActiveUseType::ACTIVEUSE;
	}
      }
      // second test against the passive statements
      for(DuUdMapDefinitionResult::StatementIdList::const_iterator passiveStatementIdListI=idLists.myPassiveStatementIdList.begin();
	  passiveStatementIdListI!=idLists.myPassiveStatementIdList.end();
	  ++passiveStatementIdListI) { 
	if (*passiveStatementIdListI=="")
	  THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::use: StatementIds in the passive statement id list cannot be empty");
	if (*passiveStatementIdListI==*chainI) { 
	  matchNumber++;
	  if (theResult.myActiveUse==ActiveUseType::ACTIVEUSE) { 
	    theResult.myActiveUse=ActiveUseType::UNDEFINEDUSE;
	  }
	}
	if (matchNumber==1) { 
	  theResult.myStatementId=*chainI;
	  theResult.myActiveUse=ActiveUseType::PASSIVEUSE;
	}
      }
      if (*chainI=="") 
	hasOutOfScope=true;
    }
    if ((matchNumber==0 
	 &&
	 (hasOutOfScope
	  || 
	  (!hasOutOfScope 
	   && 
	   myStatementIdList.size()>1))))
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_OUTSIDE;
    else if (matchNumber==0 
	     && 
	     !hasOutOfScope
	     && 
	     myStatementIdList.size()==1)
      theResult.myAnswer=DuUdMapDefinitionResult::UNIQUE_OUTSIDE;
    else if (matchNumber>0 
	     && 
	     (hasOutOfScope
	      || 
	      myStatementIdList.size()>matchNumber))
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_BOTHSIDES;
    else if (matchNumber==1 
	     && 
	     myStatementIdList.size()==1)
      theResult.myAnswer=DuUdMapDefinitionResult::UNIQUE_INSIDE;
    else if (matchNumber>1 
	     && 
	     myStatementIdList.size()==matchNumber)
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_INSIDE;
    else 
      THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::use: missing case");
    return theResult;
  }

  const DuUdMapDefinitionResult DuUdMapEntry::definition(const DuUdMapDefinitionResult::StatementIdList& anIdList) const { 
    if (myStatementIdList.empty()) 
      THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::definition: empty StatementIdList implies use of a variable that has not been defined");
    DuUdMapDefinitionResult theResult;
    unsigned int matchNumber=0;
    bool hasOutOfScope=false;
    for(DuUdMapDefinitionResult::StatementIdList::const_iterator chainI=myStatementIdList.begin();
	chainI!=myStatementIdList.end();
	++chainI) {
      for(DuUdMapDefinitionResult::StatementIdList::const_iterator it=anIdList.begin();
	  it!=anIdList.end();
	  ++it) { 
	if (*it=="")
	  THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::definition: all StatementIds in anIdList are supposed to be for regular statements and therefore cannot be empty");
	if (*it==*chainI)
	  matchNumber++;
	if (matchNumber==1)
	  theResult.myStatementId=*chainI;
      }
      if (*chainI=="") 
	hasOutOfScope=true;
    }
    if ((matchNumber==0 
	 &&
	 (hasOutOfScope
	  || 
	  (!hasOutOfScope 
	   && 
	   myStatementIdList.size()>1))))
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_OUTSIDE;
    else if (matchNumber==0 
	     && 
	     !hasOutOfScope
	     && 
	     myStatementIdList.size()==1)
      theResult.myAnswer=DuUdMapDefinitionResult::UNIQUE_OUTSIDE;
    else if (matchNumber>0 
	     && 
	     (hasOutOfScope
	      || 
	      myStatementIdList.size()>matchNumber))
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_BOTHSIDES;
    else if (matchNumber==1 
	     && 
	     myStatementIdList.size()==1)
      theResult.myAnswer=DuUdMapDefinitionResult::UNIQUE_INSIDE;
    else if (matchNumber>1 
	     && 
	     myStatementIdList.size()==matchNumber)
      theResult.myAnswer=DuUdMapDefinitionResult::AMBIGUOUS_INSIDE;
    else 
      THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::definition: missing case");
    return theResult;
  } 

  bool DuUdMapEntry::sameDefinitionAs(const DuUdMapEntry& anotherEntry) const { 
    unsigned int aSize(myStatementIdList.size());
    unsigned int anotherSize(anotherEntry.myStatementIdList.size());
    if (!aSize 
	||
	!anotherSize) { 
      THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::sameDefinitionAs: empty chain(s)");
    }
    return (aSize==1 && anotherSize==1 &&
	    !(*(myStatementIdList.begin())).empty()
	    &&
	    *(myStatementIdList.begin())==*(anotherEntry.myStatementIdList.begin()));
  } 

  bool DuUdMapEntry::disjointDefinitionFrom(const DuUdMapEntry& anotherEntry) const { 
    if (myStatementIdList.empty()
	||
	anotherEntry.myStatementIdList.empty()) { 
      THROW_LOGICEXCEPTION_MACRO("DuUdMapEntry::disjointDefinitionFrom: empty chain(s)");
    }
    for(DuUdMapDefinitionResult::StatementIdList::const_iterator chainI=myStatementIdList.begin();
	chainI!=myStatementIdList.end();
	++chainI) {
      for(DuUdMapDefinitionResult::StatementIdList::const_iterator anotherChainI=anotherEntry.myStatementIdList.begin();
	  anotherChainI!=anotherEntry.myStatementIdList.end();
	  ++anotherChainI) {
	if (*anotherChainI==*chainI) { 
	  return false; 
	}
      }
    }
    return true;
  } 

  const DuUdMapDefinitionResult::StatementIdList& DuUdMapEntry::getStatementIdList() const { 
    return myStatementIdList;
  } 

} // end of namespace  
