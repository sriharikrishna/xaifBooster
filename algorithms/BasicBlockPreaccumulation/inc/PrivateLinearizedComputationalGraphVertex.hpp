#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
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

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"

namespace xaifBooster { 
  class Variable;
}

using namespace xaifBooster; 

namespace xaifBoosterBasicBlockPreaccumulation { 
  
  class PrivateLinearizedComputationalGraphVertex : 
    public xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex {

  public:

    PrivateLinearizedComputationalGraphVertex();

    ~PrivateLinearizedComputationalGraphVertex(){}

    void setRHSVariable(const Variable& aVariable);

    void setLHSVariable(const Variable& aVariable);
    
    const Variable& getRHSVariable() const;

    const Variable& getLHSVariable() const;

    bool hasLHSVariable() const; 

    std::string debug() const ;
    
  private:
    
    /**
     * this refers to some Variable in
     * right hand side of an assignment in a 
     * basic block for independent variables.
     * see also myLHSVariable_p.
     * this class doesn't own the Variable pointed 
     * to by myRHSVariable_p
     */
    const Variable* myRHSVariable_p;

    /**
     * this refers to the Variable in
     * the left hand side of an Assignment.
     * LHS and RHS while normally mutually 
     * exclusive cannot use the same data member because 
     * we have to account for 
     * something like y=x where this vertex needs to 
     * keep a reference to both y and x 
     * this class doesn't own the Variable pointed 
     * to by myLHSVariable_p
     */
    const Variable* myLHSVariable_p;
 
  }; // end of class PrivateLinearizedComputationalGraphVertex
 
} 
                                                                     
#endif
