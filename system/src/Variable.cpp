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
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"

namespace xaifBooster { 

  const std::string Variable::our_myAliasMapKey_XAIFName("alias");
  const std::string Variable::our_myDuUdMapKey_XAIFName("du_ud");
  const std::string Variable::our_myDerivFlag_XAIFName("deriv");
  const std::string Variable::our_myConstantUseFlag_XAIFName("constant");

  Variable::Variable() : 
    myDerivFlag(false),
    myActiveUseType(ActiveUseType::UNDEFINEDUSE),
    myActiveUseTypeSetFlag(false),
    myConstantUseFlag(false) { 
  } 

  void 
  Variable::copyMyselfInto(Variable& theTarget) const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator beginIt(p.first),endIt(p.second);
    typedef std::pair<const VariableVertex*, const VariableVertex*> PointerPair;
    typedef std::list<PointerPair> PointerPairList;
    PointerPairList theList; // first original, second copy
    for (;beginIt!=endIt ;++beginIt) {
      VariableVertex& theCopy((*beginIt).createCopyOfMyself());
      theTarget.supplyAndAddVertexInstance(theCopy);
      theList.push_back(PointerPair(&(*beginIt),&theCopy));
    }
    Variable::ConstEdgeIteratorPair pe=edges();
    Variable::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) { 
      const VariableVertex 
	*theOriginalSource_p(&(getSourceOf(*beginIte))), 
	*theOriginalTarget_p(&(getTargetOf(*beginIte)));
      const VariableVertex 
	*theCopySource_p(0), 
	*theCopyTarget_p(0);
      for (PointerPairList::const_iterator li=theList.begin();
	   li!=theList.end() 
	     && 
	     !(theCopySource_p && theCopyTarget_p);
	   ++li) { 
	if (!theCopySource_p && (*li).first==theOriginalSource_p)
	  theCopySource_p=(*li).second;
	if (!theCopyTarget_p && (*li).first==theOriginalTarget_p)
	  theCopyTarget_p=(*li).second;
      } // end for 
      if (!theCopySource_p || !theCopyTarget_p) 
	THROW_LOGICEXCEPTION_MACRO("Variable::copyMyselfInto: couldn't find source or target");
      VariableEdge& theEdge(theTarget.addEdge(*theCopySource_p,
					      *theCopyTarget_p));
      theEdge.setId((*beginIte).getId());
    } // end for 
    if (myAliasMapKey.getKind()==AliasMapKey::NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("Variable::copyMyselfInto: myAliasMapKey not initialized for " 
				 << debug().c_str());
    // just use the default assignment which should be good enough
    theTarget.myAliasMapKey=myAliasMapKey;
    if (myDuUdMapKey.getKind()==InfoMapKey::NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("Variable::copyMyselfInto: myDuUdMapKey not initialized for " 
				 << debug().c_str());
    // just use the default assignment which should be good enough
    theTarget.myDuUdMapKey=myDuUdMapKey;
  } // end of Variable::copyMyselfInto

  bool 
  Variable::equivalentTo(const Variable& rhs) const { 
    if (numEdges()!=rhs.numEdges() ||
	numVertices()!=rhs.numVertices()) 
      // shortcut
      return false;
    return (equivalenceSignature()==rhs.equivalenceSignature());
  } 

  std::string 
  Variable::equivalenceSignature() const { 
    // JU: incomplete
    std::ostringstream theSignature;
    if (numEdges()>0 ||
	numVertices()!=1) { 
      // for now ensure uniqueness by appending the address
      theSignature << "Complex_" << this << "_";
      ConstVertexIteratorPair vIP=vertices();
      ConstVertexIterator vI(vIP.first), vIe(vIP.second);
      for (;vI!=vIe;++vI) 
	// for the real thing we would have to order this somehow
	theSignature << (*vI).equivalenceSignature().c_str() << "_";
    } 
    else { 
      ConstVertexIteratorPair this_pair=vertices();
      const VariableVertex& this_Vertex(*(this_pair.first));
      theSignature << this_Vertex.equivalenceSignature().c_str();
    } 
    theSignature << std::ends;
    return theSignature.str();
  } 

  void 
  Variable::printVariableReferenceXMLAttributes(std::ostream& os) const { 
    os << ActiveUseType::our_attribute_XAIFName.c_str() 
       << "=\"" 
       << ActiveUseType::toString(getActiveUseType()).c_str()
       << "\"";
    if (PrintManager::isVerbose() && getAliasMapKey().getKind()==AliasMapKey::SET) { 
      os << " "
	 << our_myAliasMapKey_XAIFName.c_str()
	 << "=\""
	 << getAliasMapKey().getKey()
	 << "\"";
    }
    if (PrintManager::isVerbose() && getDuUdMapKey().getKind()==InfoMapKey::SET) { 
      os << " "
	 << our_myDuUdMapKey_XAIFName.c_str()
	 << "=\""
	 << getDuUdMapKey().getKey()
	 << "\"";
    }
    os << " " 
       << our_myDerivFlag_XAIFName.c_str() 
       << "=\"" 
       << getDerivFlag()
       << "\"";
    os << " " 
       << our_myConstantUseFlag_XAIFName.c_str() 
       << "=\"" 
       << getConstantUseFlag()
       << "\"";
  } 

  void
  Variable::printXMLHierarchy(std::ostream& os) const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    Variable::ConstEdgeIteratorPair pe=edges();
    Variable::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,*this);
  } // end of Variable::printXMLHierarchy

  std::string Variable::debug () const { 
    std::ostringstream out;
    out << "Variable[" << this 
	<< " " << equivalenceSignature().c_str() 
	<< ",myDerivFlag=" << myDerivFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of Variable::debug

  AliasMapKey& Variable::getAliasMapKey() { 
    return myAliasMapKey;
  } 

  const AliasMapKey& Variable::getAliasMapKey() const { 
    return myAliasMapKey;
  }

  StatementIdSetMapKey& Variable::getDuUdMapKey() { 
    return myDuUdMapKey;
  } 

  const StatementIdSetMapKey& Variable::getDuUdMapKey() const { 
    return myDuUdMapKey;
  }

  const SymbolType::SymbolType_E& Variable::getType() const { 
    return getVariableSymbolReference().getSymbol().getSymbolType();
  }

  const SymbolShape::SymbolShape_E Variable::getShape() const { 
    unsigned short numDerefs=0;
    if (hasArrayAccess()) { 
      const ArrayAccess::IndexTripletListType& theIndexTripletList(getArrayAccess().getIndexTripletList());
      for(ArrayAccess::IndexTripletListType::const_iterator it=theIndexTripletList.begin();
	  it!=theIndexTripletList.end();
	  ++it) { 
	if ((*it)->isDeref())
	  ++numDerefs;
      }
    } 
    return SymbolShape::lesserShape(getVariableSymbolReference().getSymbol().getSymbolShape(),
				    numDerefs);
  } 

  bool Variable::getActiveType() const { 
    return getVariableSymbolReference().getSymbol().getActiveTypeFlag();
  }

  const VariableSymbolReference& Variable::getVariableSymbolReference() const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt ;++it) {
      if ((*it).isSymbol()) { 
	try { 
	  return dynamic_cast<const VariableSymbolReference&>(*it);
	}
	catch(std::bad_cast& e) { 
	  THROW_LOGICEXCEPTION_MACRO("Variable::getVariableSymbolReference: invalid cast of "
				     << (*it).debug().c_str() 
				     << " into a VariableSymbolReference");
	} // end catch
      } 
    }
    THROW_LOGICEXCEPTION_MACRO("Variable::getVariableSymbolReference: no symbol reference available");
  } 

  const ArrayAccess& Variable::getArrayAccess() const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt ;++it) {
      if (!(*it).isSymbol()) { 
	try { 
	  return dynamic_cast<const ArrayAccess&>(*it);
	}
	catch(std::bad_cast& e) { 
	  THROW_LOGICEXCEPTION_MACRO("Variable::getArrayAccess: invalid cast of "
				     << (*it).debug().c_str() 
				     << " into a ArrayAccess");
	} // end catch
      } 
    }
    THROW_LOGICEXCEPTION_MACRO("Variable::getArrayAccess: nothing there");
  } 

  ArrayAccess& Variable::getArrayAccess() { 
    Variable::VertexIteratorPair p(vertices());
    Variable::VertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt ;++it) {
      if (!(*it).isSymbol()) { 
	try { 
	  return dynamic_cast<ArrayAccess&>(*it);
	}
	catch(std::bad_cast& e) { 
	  THROW_LOGICEXCEPTION_MACRO("Variable::getArrayAccess: invalid cast of "
				     << (*it).debug().c_str() 
				     << " into a ArrayAccess");
	} // end catch
      } 
    }
    THROW_LOGICEXCEPTION_MACRO("Variable::getArrayAccess: nothing there");
  } 

  bool Variable::hasArrayAccess() const { 
    Variable::ConstVertexIteratorPair p(vertices());
    Variable::ConstVertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt ;++it) {
      if (!(*it).isSymbol()) { 
	try { 
	  dynamic_cast<const ArrayAccess&>(*it);
	  return true;
	}
	catch(std::bad_cast& e) { 
	  THROW_LOGICEXCEPTION_MACRO("Variable::getArrayAccess: invalid cast of "
				     << (*it).debug().c_str() 
				     << " into a ArrayAccess");
	} // end catch
      } 
    }
    return false;
  } 

  void Variable::setDerivFlag() { 
    myDerivFlag=true;
  } 

  bool Variable::getDerivFlag() const { 
    return myDerivFlag;
  } 

  void Variable::setActiveUseType(ActiveUseType::ActiveUseType_E anActiveUseType) { 
    if (myActiveUseTypeSetFlag)
      THROW_LOGICEXCEPTION_MACRO("Variable::setActiveUseType: already set, cannot reset");
    myActiveUseType=anActiveUseType;
    myActiveUseTypeSetFlag=true;
  } 

  bool Variable::getActiveFlag() const { 
    bool theAnswer;
    switch (myActiveUseType) {
    case ActiveUseType::ACTIVEUSE: 
      theAnswer=true;
      break;
    case ActiveUseType::PASSIVEUSE:
      theAnswer=false;
      break;
    case ActiveUseType::UNDEFINEDUSE:
      { 
	if (theAnswer=getActiveType())
	  myActiveUseType=ActiveUseType::ACTIVEUSE;
	else 
	  myActiveUseType=ActiveUseType::PASSIVEUSE;
	myActiveUseTypeSetFlag=true;
	break;
      }
    default: 
      THROW_LOGICEXCEPTION_MACRO("Variable::getActiveFlag: unknown value of myActiveUseType:"
				 << myActiveUseType);
      break;
    }
    return theAnswer;
  } 

  ActiveUseType::ActiveUseType_E
  Variable::getActiveUseType() const { 
    getActiveFlag(); // update it if needed
    return myActiveUseType;
  } 

  void Variable::setConstantUseFlag() { 
    myConstantUseFlag=true;
  } 

  bool Variable::getConstantUseFlag() const { 
    return myConstantUseFlag;
  } 

} // end of namespace xaifBooster 
