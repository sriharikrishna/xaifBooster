#ifndef _GENERICTRAVERSEINVOKE_INCLUDE_
#define _GENERICTRAVERSEINVOKE_INCLUDE_
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

#include "xaifBooster/utils/inc/GenericAction.hpp"

namespace xaifBooster { 

  /** 
   * class for generic traversal and invocation 
   * through the internal representation
   * following the 'visitor' design pattern
   */
  class GenericTraverseInvoke {

  public: 

    virtual ~GenericTraverseInvoke(){};

    /**
     * to be called in traverseToChildren 
     */
    void genericTraversal(const GenericAction::GenericAction_E anAction_c); 

    /** 
     * to be implemented in every leaf class of the hierarchy that 
     * is instantiated as part of the internal representation. 
     * the traversal is intended to go into 
     * 1. the associated algorithm class if available
     * 2. any member that itself is part of the internal representation 
     * 
     * The traversal is NOT to descend into any member that is part 
     * of system algorithms. 
     * For example in Assignment we traverse to the left and the right hand  
     * sides but not into myReplacementAssignmentList as the latter is 
     * only part of the linearization/ssa code
     */ 
    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c)=0; 

    /** 
     * some generic initialization for algorithm instances
     */
    virtual void algorithm_init(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_1(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_2(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_3(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_4(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_5(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_6(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_7(){};

    /** 
     * a generic algorithm action
     */
    virtual void algorithm_action_8(){};

  private: 

    /** 
     * perform the invocation
     */
    void genericInvocation(const GenericAction::GenericAction_E anAction_c); 

  }; // end of class GenericTraverseInvoke

}
#endif
