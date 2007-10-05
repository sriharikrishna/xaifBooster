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
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/system/inc/StatementIdSetMap.hpp"
#include "xaifBooster/system/inc/StatementIdSetMapKey.hpp"

namespace xaifBooster { 

  StatementIdSetMap::~StatementIdSetMap() {
    for(StatementIdSetMapEntryPVector::iterator it=myStatementIdSetMapEntryPVector.begin();
	it!=myStatementIdSetMapEntryPVector.end();
	it++)
      if (*it)
	delete (*it);
  } 

  std::string StatementIdSetMap::debug() const {
    std::ostringstream out;
    out << "StatementIdSetMap[" << this 
	<< "]" << std::ends; 
    return out.str();
  }

  StatementIdSetMapEntry& StatementIdSetMap::addEntry(unsigned int theKey) { 
    if (theKey>=myStatementIdSetMapEntryPVector.size())
      // resize and initialize to 0
      myStatementIdSetMapEntryPVector.resize(theKey>myStatementIdSetMapEntryPVector.size()+256?theKey:myStatementIdSetMapEntryPVector.size()+256,0);
    StatementIdSetMapEntry* aNewStatementIdSetMapEntry_p=new StatementIdSetMapEntry(theKey);
    myStatementIdSetMapEntryPVector[theKey]=aNewStatementIdSetMapEntry_p;
    return (*aNewStatementIdSetMapEntry_p);
  } 

  const StatementIdSetMapEntry& StatementIdSetMap::getEntry(const StatementIdSetMapKey& aKey) const { 
    if (aKey.getKind()==StatementIdSetMapKey::TEMP_VAR)
      // obviously because the map doesn't contain any info on temporaries, 
      // the calling context should figure it out itself
      THROW_LOGICEXCEPTION_MACRO("StatementIdSetMap::getStatementIdSetMapEntry: not supported for temporaries");
    if (aKey.getKind()==StatementIdSetMapKey::NO_INFO) 
      THROW_LOGICEXCEPTION_MACRO("StatementIdSetMap::getStatementIdSetMapEntry: no Do information");
    if (aKey.getKey()<0 
	|| 
	aKey.getKey()>=myStatementIdSetMapEntryPVector.size())  
      // have an explicit check here rather than using 'at' which 
      // wouldn't hint where the problem is...
      THROW_LOGICEXCEPTION_MACRO("StatementIdSetMap::getStatementIdSetMapEntry: key >" 
				 << aKey.getKey() 
				 << "< out of range");
    if (!myStatementIdSetMapEntryPVector[aKey.getKey()])
      THROW_LOGICEXCEPTION_MACRO("StatementIdSetMap::getStatementIdSetMapEntry: null pointer for key >" 
				 << aKey.getKey() 
				 << "<");
    return *myStatementIdSetMapEntryPVector[aKey.getKey()];
  }

  const StatementIdSetMap::StatementIdSetMapEntryPVector& StatementIdSetMap::getEntries() const { 
    return myStatementIdSetMapEntryPVector;
  }

} // end of namespace  
