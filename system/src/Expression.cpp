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
#include <iostream>
#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/ExpressionAlgBase.hpp"
#include "xaifBooster/system/inc/ExpressionAlgFactory.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogueItem.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"


namespace xaifBooster { 

  Expression::Expression(bool hasAlgorithm) : 
    myExpressionAlgBase_p(0) {
    if (hasAlgorithm)
      myExpressionAlgBase_p=ExpressionAlgFactory::instance()->makeNewAlg(*this); 
  }

  Expression::~Expression() {
    if (myExpressionAlgBase_p)
      delete myExpressionAlgBase_p;
  }

  ExpressionAlgBase&
  Expression::getExpressionAlgBase() const {
    if (!myExpressionAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Expression::getExpressionAlgBase: not set");
    return *myExpressionAlgBase_p;
  }

  void
  Expression::printXMLHierarchy(std::ostream& os) const { 
    if (myExpressionAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getExpressionAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of Expression::printXMLHierarchy


  void 
  Expression::printXMLHierarchyImpl(std::ostream& os) const { 
    ConstVertexIteratorPair p(vertices());
    ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ConstEdgeIteratorPair pe=edges();
    ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,*this);
  } // end of Expression::printXMLHierarchyImpl


  std::string Expression::debug () const { 
    std::ostringstream out;
    out << "Expression[" << this
	<< ", numVertices=" << numVertices()
	<< "]" << std::ends;  
    return out.str();
  } // end of Expression::debug

  void Expression::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {        
    getExpressionAlgBase().genericTraversal(anAction_c);
  } // end traversalToChildren

  void 
  Expression::copyMyselfInto(Expression& theTarget,
			     bool withNewId,
			     bool withAlgorithm) const { 
    ConstVertexIteratorPair p(vertices());
    ConstVertexIterator beginIt(p.first),endIt(p.second);
    typedef std::pair<const ExpressionVertex*, const ExpressionVertex*> PointerPair;
    typedef std::list<PointerPair> PointerPairList;
    PointerPairList theList; // first original, second copy
    for (;beginIt!=endIt ;++beginIt) {
      ExpressionVertex& theCopy((*beginIt).createCopyOfMyself(withAlgorithm));
      if(withNewId)
	theCopy.overWriteId(theTarget.getNextVertexId());
      theTarget.supplyAndAddVertexInstance(theCopy);
      theList.push_back(PointerPair(&(*beginIt),&theCopy));
    }
    ConstEdgeIteratorPair pe=edges();
    ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) { 
      const ExpressionVertex 
	*theOriginalSource_p(&(getSourceOf(*beginIte))), 
	*theOriginalTarget_p(&(getTargetOf(*beginIte)));
      const ExpressionVertex 
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
	THROW_LOGICEXCEPTION_MACRO("Expression::copyMyselfInto: couldn't find source or target");
      ExpressionEdge* theCopy = new ExpressionEdge(withAlgorithm);
      (*beginIte).copyMyselfInto(*theCopy);
      if(withNewId) 
	(*theCopy).overWriteId(theTarget.getNextEdgeId());
      theTarget.supplyAndAddEdgeInstance(*theCopy,*theCopySource_p, *theCopyTarget_p);
    } // end for 
  } // end of Expression::copyMyselfInto

  ExpressionVertex&
  Expression::copySubExpressionInto(Expression& theTarget,
				    const ExpressionVertex& theTopVertex,
				    bool withNewId,
				    bool withAlgorithm) const { 
    typedef std::list<const ExpressionVertex*> ExpressionVertexPList;
    ExpressionVertexPList theList;
    ExpressionVertex& theTopCopy(theTopVertex.createCopyOfMyself(withAlgorithm));
    if(withNewId)
      theTopCopy.overWriteId(theTarget.getNextVertexId());
    theTarget.supplyAndAddVertexInstance(theTopCopy);
    theList.push_back(&theTopVertex);
    copySubExpressionInto(theTarget,
			  theTopVertex,
			  theTopCopy,
			  withNewId,
			  withAlgorithm,
			  theList);
    return theTopCopy;
  }

  void
  Expression::copySubExpressionInto(Expression& theTarget,
				    const ExpressionVertex& theTopVertex,
				    ExpressionVertex& theTopCopy,
				    bool withNewId,
				    bool withAlgorithm,
				    Expression::ExpressionVertexPList theList) const { 
    ConstInEdgeIteratorPair pe=getInEdgesOf(theTopVertex);
    ConstInEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) { 
      const ExpressionVertex& theOriginalSource(getSourceOf(*beginIte));
      // check if we created the target already
      bool haveIt=false;
      for (ExpressionVertexPList::iterator i=theList.begin();
	   i!=theList.end();
	   ++i) { 
	if (&theOriginalSource==*i){ 
	  haveIt=true;
	  break;
	}
      }
      if (haveIt)
	continue;
      ExpressionVertex& theCopy(theOriginalSource.createCopyOfMyself(withAlgorithm));
      if(withNewId)
	theCopy.overWriteId(theTarget.getNextVertexId());
      theTarget.supplyAndAddVertexInstance(theCopy);
      theList.push_back(&theOriginalSource);
      ExpressionEdge* theEdgeCopy = new ExpressionEdge(withAlgorithm);
      (*beginIte).copyMyselfInto(*theEdgeCopy);
      if(withNewId) 
	(*theEdgeCopy).overWriteId(theTarget.getNextEdgeId());
      theTarget.supplyAndAddEdgeInstance(*theEdgeCopy,theCopy, theTopCopy );
      copySubExpressionInto(theTarget,
			    theOriginalSource,
			    theCopy,
			    withNewId,
			    withAlgorithm,
			    theList);
    } // end for 
  } 

  const ExpressionVertex& Expression::findPositionalSubExpressionOf(const ExpressionVertex& aVertex,
								    unsigned int aPosition) const { 
    ConstInEdgeIteratorPair p=getInEdgesOf(aVertex);
    ConstInEdgeIterator vI(p.first),vIE(p.second);
    for(; vI!=vIE; ++vI) 
      if(aPosition==(*vI).getPosition())
	return getSourceOf(*vI);
    THROW_LOGICEXCEPTION_MACRO("Expression::findPositionalSubExpressionOf: no such subexpression");
    return aVertex;
  }

} // end of namespace xaifBooster 
