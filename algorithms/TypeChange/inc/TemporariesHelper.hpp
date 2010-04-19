#ifndef _XAIFBOOSTERTYPECHANGE_TEMPORARIESHELPER_INCLUDE_
#define _XAIFBOOSTERTYPECHANGE_TEMPORARIESHELPER_INCLUDE_
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

#include <string> 
#include <vector>

#include "xaifBooster/utils/inc/NameCreator.hpp"

#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/Variable.hpp"

using namespace xaifBooster;

namespace xaifBoosterTypeChange {

  /**
   * class to support creation of temporary variables
   */
  class TemporariesHelper {
  public:

    /** 
     * \param contextAnnotation so we can identify in the xaif file who made the temporary
     * \param theExpression whose value is supposed to be held in the temporary
     * \param theTopVertex is the top vertex in theExpression (i.e. specifying a sub expression)
     */
    TemporariesHelper(const std::string& contextAnnotation,
                      const Expression& theExpression,
                      const ExpressionVertex& theTopVertex);

    TemporariesHelper(const std::string& contextAnnotation,
                      const Variable& variableToMatch);

    ~TemporariesHelper();

    /**
     * \param aScope - Scope in which the symbol is made
     */
    Symbol& makeTempSymbol(Scope& aScope);

    /**
     * returns true if the temporary would need to be allocated
     * can be called before makeTempSymbol
     */
    bool needsAllocation();

    /** 
     * \return a variable that can serve a s model to allocate the temporary
     */ 
    const Variable& allocationModel();

    /**
     * \param aScope - Scope in which the symbol is made
     * \param aNameCreator - used to determine the name of the new variable
     * \param isActive - Flag indicating whether or not the new variable is active
     */
    Symbol& makeTempSymbol(Scope& aScope,
                           const NameCreator& aNameCreator,
                           bool isActive);

  private:

    /// no def
    TemporariesHelper();

    /// no def
    TemporariesHelper(const TemporariesHelper&);

    /// no def
    TemporariesHelper & operator=(const TemporariesHelper&);

    typedef std::vector<DimensionBounds*> DimensionBoundsPVector;

    void typeInfo(const ExpressionVertex& theTopVertex);

    void typeInfo(const Variable& aVariable);

    void setTypeInfo();

    /**
     * populate the effective dimension bounds
     * \param aVariable in the dimension bounds are set
     */
    void populateDimensionBounds(const Variable& aVariable);

    void setDimensionBounds(Symbol& aNewSymbol);

    const std::string myContextAnnnotation;

    const Expression* myExpression_p;

    const ExpressionVertex* myTopVertex_p;

    const Variable* myVariable_p;

    SymbolShape::SymbolShape_E myShape;

    SymbolType::SymbolType_E myType;

    FrontEndType myFrontEndType;

    DimensionBoundsPVector myDimensionBoundsPVector;

    bool myTypeInfo;

    const Variable* myAllocationModel_p;

  }; // end of class TemporariesHelper

}

#endif
