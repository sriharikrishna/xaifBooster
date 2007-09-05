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

#include "xaifBooster/system/inc/DuUdMap.hpp"
#include "xaifBooster/system/inc/DuUdMapKey.hpp"

namespace xaifBooster { 

  const std::string DuUdMap::ourXAIFName("xaif:DUUDSetList");

  DuUdMap::~DuUdMap() {
    for(DuUdMapEntryPVector::iterator it=myDuUdMapEntryPVector.begin();
	it!=myDuUdMapEntryPVector.end();
	it++)
      if (*it)
	delete (*it);
  } 

  std::string DuUdMap::debug() const {
    std::ostringstream out;
    out << "DuUdMap[" << this 
	<< "]" << std::ends; 
    return out.str();
  }

  void DuUdMap::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(DuUdMapEntryPVector::const_iterator it=myDuUdMapEntryPVector.begin();
	it!=myDuUdMapEntryPVector.end();
	it++)
      if (*it)
	(*it)->printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } // end of  DuUdMap::printXMLHierarchy

  DuUdMapEntry& DuUdMap::addDuUdMapEntry(unsigned int theKey) { 
    if (theKey>=myDuUdMapEntryPVector.size())
      // resize and initialize to 0
      myDuUdMapEntryPVector.resize(theKey>myDuUdMapEntryPVector.size()+256?theKey:myDuUdMapEntryPVector.size()+256,0);
    DuUdMapEntry* aNewDuUdMapEntry_p=new DuUdMapEntry(theKey);
    myDuUdMapEntryPVector[theKey]=aNewDuUdMapEntry_p;
    return (*aNewDuUdMapEntry_p);
  } 

  const DuUdMapEntry& DuUdMap::getEntry(const DuUdMapKey& aKey) const { 
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR)
      // obviously because the map doesn't contain any info on temporaries, 
      // the calling context should figure it out itself
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::getDuUdMapEntry: not supported for temporaries");
    if (aKey.getKind()==DuUdMapKey::NO_INFO) 
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::getDuUdMapEntry: no duud information");
    if (aKey.getKey()<0 
	|| 
	aKey.getKey()>=myDuUdMapEntryPVector.size())  
      // have an explicit check here rather than using 'at' which 
      // wouldn't hint where the problem is...
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::getDuUdMapEntry: key >" 
				 << aKey.getKey() 
				 << "< out of range");
    if (!myDuUdMapEntryPVector[aKey.getKey()])
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::getDuUdMapEntry: null pointer for key >" 
				 << aKey.getKey() 
				 << "<");
    return *myDuUdMapEntryPVector[aKey.getKey()];
  }

  const DuUdMapDefinitionResult DuUdMap::definition(const DuUdMapKey& aKey,
						    const ObjectWithId::Id& statementId,
						    const DuUdMapDefinitionResult::StatementIdList& anIdList) const {
    DuUdMapDefinitionResult theResult;
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR)
      // obviously because the map doesn't contain any info on temporaries, 
      // the calling context should figure it out itself
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::definition: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO) { 
      // we get the entry:
      if (aKey.getKey()<0 
	  || 
	  aKey.getKey()>=myDuUdMapEntryPVector.size())  
	// have an explicit check here rather than using 'at' which 
	// wouldn't hint where the problem is...
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::definition: key >" 
				   << aKey.getKey() 
				   << "< out of range");
      if (myDuUdMapEntryPVector[aKey.getKey()])
	return myDuUdMapEntryPVector[aKey.getKey()]->definition(statementId,
								anIdList);
      else 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::definition: key >" 
				   << aKey.getKey() 
				   << "< has no entry");
    } // end if
    return theResult;
  } 

  const DuUdMapUseResult DuUdMap::use(const DuUdMapKey& aKey,
				      const ObjectWithId::Id& statementId,
				      const DuUdMapUseResult::StatementIdLists& idLists) const {
    DuUdMapUseResult theResult;
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR)
      // obviously because the map doesn't contain any info on temporaries, 
      // the calling context should figure it out itself
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::use: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO) { 
      // we get the entry:
      if (aKey.getKey()<0 
	  || 
	  aKey.getKey()>=myDuUdMapEntryPVector.size())  
	// have an explicit check here rather than using 'at' which 
	// wouldn't hint where the problem is...
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::use: key >" 
				   << aKey.getKey() 
				   << "< out of range");
      if (myDuUdMapEntryPVector[aKey.getKey()])
	return myDuUdMapEntryPVector[aKey.getKey()]->use(statementId,
							 idLists);
      else 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::use: key >" 
				   << aKey.getKey() 
				   << "< has no entry");
    } // end if
    return theResult;
  } 

  bool DuUdMap::sameDefinition(const DuUdMapKey& aKey,
			       const DuUdMapKey& anotherKey) const {
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR
	|| 
	anotherKey.getKind()==DuUdMapKey::TEMP_VAR)
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO
	&&
	anotherKey.getKind()!=DuUdMapKey::NO_INFO) { 
      if (aKey.getKey()<0 
	  || 
	  aKey.getKey()>=myDuUdMapEntryPVector.size()
	  ||
	  anotherKey.getKey()<0 
	  || 
	  anotherKey.getKey()>=myDuUdMapEntryPVector.size()) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< out of range");
      }
      if (!myDuUdMapEntryPVector[aKey.getKey()] && 
	  !myDuUdMapEntryPVector[anotherKey.getKey()]) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< have null pointer map entry");
      }
      return (myDuUdMapEntryPVector[aKey.getKey()]->sameDefinitionAs(*(myDuUdMapEntryPVector[anotherKey.getKey()])));
    }
    return false;
  } 

  bool DuUdMap::disjointDefinition(const DuUdMapKey& aKey,
				   const DuUdMapKey& anotherKey) const {
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR
	|| 
	anotherKey.getKind()==DuUdMapKey::TEMP_VAR)
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::disjointDefinition: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO
	&&
	anotherKey.getKind()!=DuUdMapKey::NO_INFO) { 
      if (aKey.getKey()<0 
	  || 
	  aKey.getKey()>=myDuUdMapEntryPVector.size()
	  ||
	  anotherKey.getKey()<0 
	  || 
	  anotherKey.getKey()>=myDuUdMapEntryPVector.size()) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< out of range");
      }
      if (!myDuUdMapEntryPVector[aKey.getKey()] && 
	  !myDuUdMapEntryPVector[anotherKey.getKey()]) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< have null pointer map entry");
      }
      return (myDuUdMapEntryPVector[aKey.getKey()]->disjointDefinitionFrom(*(myDuUdMapEntryPVector[anotherKey.getKey()])));
    }
    return false;
  } 

} // end of namespace  
