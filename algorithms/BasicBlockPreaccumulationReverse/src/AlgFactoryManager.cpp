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
#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/Linearization/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/AddressArithmetic/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/ArgumentSymbolReferenceAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/SubroutineCallAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/AlgFactoryManager.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  xaifBooster::AlgFactoryManager* 
  AlgFactoryManager::instance() { 
    if (ourInstance_p)
      return ourInstance_p;
    ourInstanceMutex.lock();
    try { 
      if (!ourInstance_p)
	ourInstance_p=new AlgFactoryManager();
      if (!ourInstance_p) { 
	THROW_LOGICEXCEPTION_MACRO("AlgFactoryManager::instance");
      } // end if 
    } // end try 
    catch (...) { 
      ourInstanceMutex.unlock();
      throw;
    } // end catch
    ourInstanceMutex.unlock();
    return ourInstance_p;
  } // end of AlgFactoryManager::instance

  void AlgFactoryManager::resets() {
    // we have to pick a path
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resetBasicBlockAlgFactory(new BasicBlockAlgFactory());
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resetArgumentSymbolReferenceAlgFactory(new ArgumentSymbolReferenceAlgFactory());
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resetSubroutineCallAlgFactory(new SubroutineCallAlgFactory());
    resetCallGraphVertexAlgFactory(new CallGraphVertexAlgFactory());
  }

  void AlgFactoryManager::init() {
    // need to pick a path
    dynamic_cast<xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager*>(this)->xaifBooster::AlgFactoryManager::init();
    dynamic_cast<xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager*>(this)->xaifBoosterLinearization::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulation::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulationTape::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AlgFactoryManager::resets();
    xaifBoosterControlFlowReversal::AlgFactoryManager::resets();
    xaifBoosterAddressArithmetic::AlgFactoryManager::resets();
    xaifBoosterBasicBlockPreaccumulationReverse::AlgFactoryManager::resets();
  }

}

