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
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListIndAct.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationListIndAct::VertexIdentificationListIndAct() { 
  } 

  bool 
  VertexIdentificationListIndAct::overwrittenBy(const Variable& theLHSVariable,
						const ObjectWithId::Id& aStatementId,
						const BasicBlock& theBasicBlock) const { 
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "xaifBoosterBasicBlockPreaccumulation::VertexIdentificationListIndAct::overwrittenBy called for: "
	      << theLHSVariable.debug().c_str()
	      << " in statement "
	      << aStatementId.c_str()
	      << " in "
	      << theBasicBlock.debug().c_str()
	      << " on list "
	      << debug().c_str());
    // have to rely on alias information:
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    AliasMap::AliasMapKeyPList anAliasMapKeyPList;
    getAliasMapKeyPList(anAliasMapKeyPList);
    if (!anAliasMapKeyPList.empty()) 
      return theAliasMap.subSet(theLHSVariable.getAliasMapKey(),
				anAliasMapKeyPList); 
    return false;
  } 

  void VertexIdentificationListIndAct::addElement(const Variable& theVariable,
						  const ObjectWithId::Id& aStatementId) { 
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "xaifBoosterBasicBlockPreaccumulation::VertexIdentificationListIndAct::addElement called for: "
	      << theVariable.debug().c_str()
	      << " in statement "
	      << aStatementId.c_str());
    if (theVariable.hasArrayAccess()) {
      if (theVariable.getDuUdMapKey().getKind()!=InfoMapKey::NO_INFO) 
 	// if we ever encounter a usefull piece of duud information:
 	baseOnDuUdMap();
      const ArrayAccess::IndexTripletListType itl(theVariable.getArrayAccess().getIndexTripletList()); 
      for (ArrayAccess::IndexTripletListType::const_iterator itlIt=itl.begin();
	   itlIt!=itl.end();
	   ++itlIt) { 
	for (IndexTriplet::IndexPairList::const_iterator iplIt=(*itlIt)->getIndexPairList().begin();
	     iplIt!=(*itlIt)->getIndexPairList().end();
	     ++iplIt) { 
	  Expression::CArgumentPList cargpl;
	  (*iplIt).second->appendArguments(cargpl);
	  for(Expression::CArgumentPList::const_iterator cargplIt=cargpl.begin();
	      cargplIt!=cargpl.end();
	      ++cargplIt) { 
	    addElement((*cargplIt)->getVariable(),
		       aStatementId); // recursive descent
	    // see if we have this definition already 
	    ListItemPList::const_iterator vilIt=myList.begin();
	    for(;
		vilIt!=myList.end();
		++vilIt) { 
	      if (ConceptuallyStaticInstances::instance()->
		  getCallGraph().getDuUdMap().sameDefinition((*cargplIt)->getVariable().getDuUdMapKey(),
							     (*vilIt)->getDuUdMapKey()))
		break;
	    }
	    if (vilIt==myList.end()) { 
	      DBG_MACRO(DbgGroup::DATA,
			"xaifBoosterBasicBlockPreaccumulation::VertexIdentificationListIndAct::addElement adding: "
			<< (*cargplIt)->getVariable().debug().c_str()
			<< " to "
			<< debug().c_str());
	      myList.push_back(new ListItem((*cargplIt)->getVariable().getAliasMapKey(),
					    (*cargplIt)->getVariable().getDuUdMapKey()));
	    }
	  }
	}
      } 
    }
  } 

  std::string VertexIdentificationListIndAct::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationListIndAct[" 
	<< this 
	<< VertexIdentificationList::debug().c_str()
	<< "]"
	<< std::ends;
    return out.str();
  } 

} // end of namespace 

