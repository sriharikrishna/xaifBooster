#ifndef _LINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
#define _LINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
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

#include "xaifBooster/boostWrapper/inc/Vertex.hpp"

#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"

using namespace xaifBooster;

namespace xaifBoosterCrossCountryInterface { 

  class LinearizedComputationalGraphVertex : public Vertex {
  public:

    LinearizedComputationalGraphVertex();
    ~LinearizedComputationalGraphVertex();

    std::string debug() const;

    bool hasOriginalVariable() const;
    void setOriginalVariable(const Variable& aVariable,
			     const ObjectWithId::Id& aStatementId);
    const Variable& getOriginalVariable() const;

    const ObjectWithId::Id& getStatementId() const;

    /**
     * Used to replace the original variable in the case where we have an independent that may alias with some non-independent.
     * In this case, we use this new variable for propagation exclusively. (see BasicBlockAlg::makePropagationVariables())
     * Also used for the case of a vertex that has no oroginal variable (some temporary)
     */
    void createNewPropagationVariable();

    const Variable& getPropagationVariable() const;

    bool hasSAX() const;
    xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& getSAX() const;
    void setSAX(xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& aSAX);

  private:

    /**
     * Pointer to the variable that originally corresponds to this vertex, in the case where one exists.
     * The variable is not owned by this class.
     */
    const Variable* myOriginalVariable_p;

    /**
     * Pointer to the variable that will be used for propagation in case there is no original variable,
     * or the original variable for an independent had to be replaced because of possible aliasing issues.
     * This variable is owned by this class, and is deleted in the dtor.
     */
    Variable* myPropagationVariable_p;

    /**
     * set to the respective statement id if myOriginalVariable_p is set
     */
    ObjectWithId::Id myStatementId;

    /**
     * Used to keep track of whether this vertex has been involved in a sax yet.
     * In case it has, this pointer is used to find the SAX.
     * The sax is not owned by this class.
     */
    xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy* mySAX_p;

  }; // end of class LinearizedComputationalGraphVertex
 
} // end namespace xaifBoosterCrossCountryInterface
                                                                     
#endif

