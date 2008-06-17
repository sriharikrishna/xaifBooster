#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATOR_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATOR_INCLUDE_
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

#include <list>
#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

namespace xaifBooster{ 
  class Variable;
  class Constant;
}

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  class DerivativePropagatorSaxpy;
  class DerivativePropagatorSetDeriv;

  class DerivativePropagator : public XMLPrintable {
  public:

    DerivativePropagator (){};

    ~DerivativePropagator ();

    void printXMLHierarchy(std::ostream& os) const;

    /**
     * the actual printing is in here 
     * so we can take a function pointer and 
     * replace this 
     */
    static void printXMLHierarchyImpl(std::ostream& os,
				      const DerivativePropagator& aDerivativePropagator);

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;
    
    typedef std::list<DerivativePropagatorEntry*> EntryPList;

    /**
     * we add entries to the DerivativePropagator as
     * addZeroDerivToEntryPList in AssignmentAlg::algorithm_action_2
     * and as Saxpy/SetDeriv in 
     * BasicBlockAlg::algorithm_action_3
     * For SetDeriv we either add as a temporary for variables that are 
     * both input and output 
     * OR 
     * for simple assignments, i.e. FlattenedSequences with exactly 1 vertex. 
     * The question is now where the respective SetDeriv operation should be located.
     * For FlattenedSequences with one vertex it doesn't matter since there is nothing 
     * else. 
     * For setting temporaries they always come before the saxpy ops but 
     * we have to look at their position relative to the ZeroDeriv entries. 
     * All ZeroDerivEntries are pushed in algorithm_action_2.
     * If all SetDeriv entries go before the ZeroDeriv entries we just need to be 
     * sure that none of those should have been zeroed out, meaning that 
     * e.g. a constant assignment is not preceeding any 'active' use of a variable.
     * The basic block level activity analysis takes care of this by removing 
     * vertices identified as passive, so no contribution comes from that 
     * passivated vertex. If we cannot identify, then the flattening stops at this 
     * point and the ZeroDeriv remains with the previous flatten in the correct order.
     * Therefore we can always do a push_front for SetDeriv.
     */
    const DerivativePropagatorSetDeriv& addSetDerivToEntryPList(const Variable& theTarget,
								const Variable& theSource);

    /** 
     * orderring this list becomes more complicated
     * we need to determine the insertion point
     * via supplying an iterator
     */
    const DerivativePropagatorSetDeriv& addSetDerivToEntryPList(const Variable& theTarget,
								const Variable& theSource,
								EntryPList::iterator& insertBefore);

    DerivativePropagatorSaxpy& addSaxpyToEntryPList(const Constant& thePartial,
						    const Variable& theIndependent,
						    const Variable& theDependent);

    DerivativePropagatorSaxpy& addSaxpyToEntryPList(const Variable& thePartial,
						    const Variable& theIndependent,
						    const Variable& theDependent);

    void addZeroDerivToEntryPList(const Variable& theTarget);

    const EntryPList& getEntryPList() const;

    /** 
     * now that we want to have control over the insertion point
     * we need to supply a non-const list
     */
    EntryPList& getEntryPList();

  private:

    /**
     * this class owns the DerivativePropagatorEntry
     * instances pointed to in myEntryPList
     */
    EntryPList myEntryPList;

  }; // end of class DerivativePropagator
 
} // end of namespace
                                                                     
#endif
