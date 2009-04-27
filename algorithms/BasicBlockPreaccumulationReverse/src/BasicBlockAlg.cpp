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

#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    BasicBlockAlgBase(theContaining),
    xaifBoosterPushPop::BasicBlockAlg(theContaining) { 
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    switch(xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->getPrintVersion()) { 
    case xaifBoosterCodeReplacement::PrintVersion::ORIGINAL: { 
      xaifBooster::PrintVersion::PrintVersion_E aPrintVersion(xaifBooster::ConceptuallyStaticInstances::instance()->
							      getPrintVersion());
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(xaifBooster::PrintVersion::SYSTEM_ONLY);
      xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::getContaining().printXMLHierarchyImpl(os);
      xaifBooster::ConceptuallyStaticInstances::instance()->setPrintVersion(aPrintVersion);
      break;
    }
    case xaifBoosterCodeReplacement::PrintVersion::AUGMENTED: 
      xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::printXMLHierarchy(os);
      break;
    case xaifBoosterCodeReplacement::PrintVersion::ADJOINT: 
      xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::printXMLHierarchy(os);
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::printXMLHierarchy: cannot handle PrintVersion "
				 << xaifBoosterCodeReplacement::PrintVersion::toString(xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->
							   getPrintVersion()).c_str());
      break;
    } // end switch
  } // end of BasicBlockAlg::printXMLHierarchy
  
  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationReverse::BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

} // end of namespace
