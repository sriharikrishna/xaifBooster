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

#include "xaifBooster/system/inc/Assignment.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/BasicBlockAlgParameter.hpp"

#include "xaifBooster/algorithms/TraceDiff/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/TraceDiff/inc/AssignmentAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterTraceDiff { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    BasicBlockAlgBase(theContaining),
    xaifBoosterControlFlowReversal::BasicBlockAlg(theContaining),
    xaifBoosterTypeChange::BasicBlockAlg(theContaining) { 
  }

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterTraceDiff::BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    xaifBoosterTypeChange::BasicBlockAlg::printXMLHierarchy(os);
  } 

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void BasicBlockAlg::algorithm_action_2() { 
    static unsigned int recursionGuard=0;
    try { 
      recursionGuard++;
      if (recursionGuard>1)
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_2: recursive invocation not allowed");
      DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorithm_action_2(set parameter)");
      
      // the BasicBlock instance will be used in SubroutineCallAlg::algorithm_action_2:
      // because of virtual function use on the system structural level we cannot 
      // invoke directly and need to rely on GenericTraverseInvoke
      // In order to pass parameters through BasicBlockParameter
      // we have to make sure that this method is never invoked recursively
      xaifBoosterTypeChange::BasicBlockAlgParameter::instance().set(*this);	// in BasicBlockAlg::algorithm_action_2()
      // for every assignment check the RHS
      const PlainBasicBlock::BasicBlockElementList& theContainingBBEelemtList(dynamic_cast<const BasicBlock&>(xaifBoosterTypeChange::BasicBlockAlg::getContaining()).
									      getBasicBlockElementList());
      for (PlainBasicBlock::BasicBlockElementList::const_iterator li=theContainingBBEelemtList.begin();
	   li!=theContainingBBEelemtList.end();
	   li++) { 
	// see if this is an assignment
	const Assignment* anAssignment_p=dynamic_cast<const Assignment*>(*li);
	if (anAssignment_p) { 
	  dynamic_cast<AssignmentAlg&>(anAssignment_p->getAssignmentAlgBase()).trace();
	}
      } 
    } 
    catch (...) { 
      recursionGuard--;
      throw;
    }
    recursionGuard--;
  }
  
} // end of namespace
