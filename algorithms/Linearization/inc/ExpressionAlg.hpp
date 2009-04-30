#ifndef _XAIFBOOSTERLINEARIZATION_EXPRESSIONALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_EXPRESSIONALG_INCLUDE_
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

#include "xaifBooster/system/inc/ExpressionAlgBase.hpp"
#include "xaifBooster/system/inc/Argument.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   */
  class ExpressionAlg : public ExpressionAlgBase {

  public:
    
    ExpressionAlg(Expression& theContainingExpression);

    virtual ~ExpressionAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    typedef std::list<const Argument*> ArgumentPList;

    const ArgumentPList& getPartialUsageList() const;

    /**
     * indicate if an input variable is used as 
     * an argument to a partial expression
     */
    void markUsedInPartial(const Argument&);

    /**
     * indicate if an input variable is used as 
     * an argument to a partial expression
     */
    bool isUsedInPartial(const Argument&) const;

    /**
     * mark all passive vertices/edges bottom up
     */
    void activityAnalysis();

    /**
     * after the  activityAnalysis we can 
     * create the exprssions to calculate the partials
     */
    void createPartialExpressions();

  private: 

    /** 
     * no def
     */
    ExpressionAlg();

    /** 
     * no def
     */
    ExpressionAlg(const ExpressionAlg&);

    /** 
     * no def
     */
    ExpressionAlg& operator=(const ExpressionAlg&);

    /**
     * the list of input variables, i.e. instances
     * of Argument (not constants)
     * in this PlainExpression that are used in 
     * a partial calculation
     * The list doesn't own the ExpressionVertices contained
     * i.e. we don't delete the pointers
     */
    ArgumentPList myPartialUsageList;

    /**
     * mark theVertex and all outgoing edges bottom up
     */
    void activityAnalysisBottomUpPass(const ExpressionVertex& theVertex);

    /**
     * mark all passive vertices/edges top down
     * we assume activityAnalysisBottomUpPass has run first
     */
    void activityAnalysisTopDownPass(const ExpressionVertex& theVertex);

    /** 
     * to satisfy schema uniqueness constraints
     */
    static std::string makeUniqueId(); 

  };
 
} 
                                                                     
#endif
