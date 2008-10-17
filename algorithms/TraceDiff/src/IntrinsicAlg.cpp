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
#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/TraceDiff/inc/IntrinsicAlg.hpp"

namespace xaifBoosterTraceDiff { 

  IntrinsicAlg::IntrinsicAlg(Intrinsic& theContainingIntrinsic) : 
    ExpressionVertexAlgBase(theContainingIntrinsic),
    IntrinsicAlgBase(theContainingIntrinsic),
    myRenameFlag(false) {
  }

  IntrinsicAlg::~IntrinsicAlg() {}

  std::string IntrinsicAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterTraceDiff::IntrinsicAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of IntrinsicAlg::debug

  void
  IntrinsicAlg::printXMLHierarchy(std::ostream& os) const { 
    if (ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      IntrinsicAlgBase::getContaining().printXMLHierarchyImpl(os);
    else {
      const Intrinsic& theOriginal(dynamic_cast<const Intrinsic&>(getContaining()));
      PrintManager& pm=PrintManager::getInstance();
      os << pm.indent() 
	 << "<"
	 << Intrinsic::ourXAIFName.c_str() 
	 << " " 
	 << Intrinsic::our_myId_XAIFName.c_str() 
	 << "=\"" 
	 << theOriginal.getId().c_str()
	 << "\" ";
      if (theOriginal.annotationIsSet())
	os << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str()
	   << "=\""
	   << theOriginal.getAnnotation().c_str()
	   << "\" "; 
      os << Intrinsic::our_myName_XAIFName.c_str()
	 << "=\"";
      if (myRenameFlag)
	os << "oad_" ;
      os << theOriginal.getName().c_str()
	 << "\"/>" 
	 << std::endl; 
      pm.releaseInstance();
    }
  }

  void IntrinsicAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void IntrinsicAlg::algorithm_action_2() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterTraceDiff::IntrinsicAlg::algorithm_action_2(tracing) called for: "
              << debug().c_str());
    if (dynamic_cast<const Intrinsic&>(getContaining()).isNonSmooth())
      myRenameFlag=true;
  }

}
