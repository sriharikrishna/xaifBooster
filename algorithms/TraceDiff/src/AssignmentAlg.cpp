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

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogueItem.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpression.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpressionVertex.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/TraceDiff/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/TraceDiff/inc/Helpers.hpp"

namespace xaifBoosterTraceDiff { 

  AssignmentAlg::AssignmentAlg(Assignment& theContainingAssignment) : 
    AssignmentAlgBase(theContainingAssignment) { 
  }

  std::string AssignmentAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterTraceDiff::AssignmentAlg[" 
	<< this 
	<< "]" << std::ends;  
    return out.str();
  } // end of AssignmentAlg::debug

  void
  AssignmentAlg::printXMLHierarchy(std::ostream& os) const { 
    if (xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->getPrintVersion()
	!=
	xaifBoosterCodeReplacement::PrintVersion::ORIGINAL) { 
      if (!myTracingCalls.empty()) { 
	for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myTracingCalls.begin();
	     li!=myTracingCalls.end();
	     ++li) { 
	  (*li)->printXMLHierarchy(os);
	}
      }
    }
    getContaining().printXMLHierarchyImpl(os);
  }

  void 
  AssignmentAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void 
  AssignmentAlg::trace() { 
    const Expression& theRHS=getContainingAssignment().getRHS();
    Expression::ConstVertexIteratorPair p(theRHS.vertices());
    Expression::ConstVertexIterator it(p.first),endIt(p.second);
    for (;it!=endIt ;++it) {
      if (theRHS.numInEdgesOf(*it)>0) { 
	if ((*it).getInlinableIntrinsicsCatalogueItem().isNonSmooth()) {
	  // trace the  call: 
	  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theIntrinsicCall_p;
	  theIntrinsicCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_trace_call");
	  theIntrinsicCall_p->setId("TraceDiff::AssignmentAlg::trace");
	  myTracingCalls.push_back(theIntrinsicCall_p);
	  ConcreteArgument& theName(theIntrinsicCall_p->addConcreteArgument(1));
	  theName.makeConstant(SymbolType::STRING_STYPE);
	  theName.getConstant().setFromString(dynamic_cast<const Intrinsic&>(*it).getName());
	  ConcreteArgument& theOriginalLine(theIntrinsicCall_p->addConcreteArgument(2));
	  theOriginalLine.makeConstant(SymbolType::INTEGER_STYPE);
	  theOriginalLine.getConstant().setint(getContainingAssignment().getLineNumber());
	  Expression aSubExpression;
	  theRHS.copySubExpressionInto(aSubExpression,*it,false,false);
	  Expression::CArgumentPList activeArgPList;
	  aSubExpression.appendActiveArguments(activeArgPList);
	  for(Expression::CArgumentPList::const_iterator argIt=activeArgPList.begin();
	      argIt!=activeArgPList.end();
	      ++argIt) { 
	    Helpers::traceArgument(**argIt,
				   myTracingCalls,
                                   ConceptuallyStaticInstances::instance()->getTraversalStack().getCurrentBasicBlockInstance().getScope());
	  }
	  theIntrinsicCall_p=new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("oad_trace_ecall");
	  theIntrinsicCall_p->setId("TraceDiff::SubroutineCallAlg::algorithm_action_2");
	  myTracingCalls.push_back(theIntrinsicCall_p);
	}
      }
    }
  }
}
