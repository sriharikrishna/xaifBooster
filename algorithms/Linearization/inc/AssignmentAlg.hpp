#ifndef _XAIFBOOSTERLINEARIZATION_ASSIGNMENTALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_ASSIGNMENTALG_INCLUDE_
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

#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   * AssignmentAlgBase
   */
  class AssignmentAlg : public AssignmentAlgBase {

  public:
    
    AssignmentAlg(Assignment& theContainingAssignment);

    virtual ~AssignmentAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /** 
     * copy/activity analysis 
     */
    virtual void algorithm_action_1();

    /** 
     * code generation
     */
    virtual void algorithm_action_2();

    /** 
     * statement local activity analysis
     * can be rerun once the right hand side is copied
     * Note: if this discovers that an assignment is passive 
     * it may remove the copy and any associated code created.
     */
    void activityAnalysis();

    Expression& getLinearizedRightHandSide();

    const Expression& getLinearizedRightHandSide() const;

    bool haveLinearizedRightHandSide() const;

    bool getActiveFlag() const; 

  private: 

    /** 
     * no def
     */
    AssignmentAlg();

    /** 
     * no def
     */
    AssignmentAlg(const AssignmentAlg&);

    /** 
     * no def
     */
    AssignmentAlg operator=(const AssignmentAlg&);

    typedef std::pair<ExpressionVertex*, ExpressionVertex*> PointerPair;

    typedef std::list<PointerPair> PointerPairList;

    /**
     * this method is used by makeSSACodeList
     * this part of the iteration intends to go from the 
     * maximal node straight down to the 'leaf' nodes without 
     * any modification and then searches back up to the first 
     * node requiering the creation of a replacement assignment.
     * It creates the top node of the replacement assignment
     * and then calls localRHSExtractionInner for each in edge
     * which in turn recursively builds the rest of the 
     * replacement assignment
     * upon return of the inner recursion we add the 
     * completed replacement assignment to the end of 
     * myReplacementAssignmentList which should by means
     * of this recursion yield the correct order 
     */
    void localRHSExtractionOuter(const ExpressionEdge& theEdge);

    
    /**
     * this method is called by localRHSExtractionOuter for each 
     * top node of a subexpression that needs a replacement 
     * assignment constructed. This method adds the respective
     * source for the input edge to the replacement assignment expression, 
     * and the edge itself and recursively invokes itself for all 
     * input edges of the source vertex. If the source vertex however 
     * requires a replacement and has not gotten one, then it invokes 
     * localRHSExtractionOuter 
     * to ensure that we process subexpressions in the proper order
     */
    void localRHSExtractionInner(const ExpressionEdge& theEdge,
				 Assignment& theReplacementAssignment,
				 const ExpressionVertex& theTargetVertex,
				 ExpressionVertex& theReplacementTargetVertex,
				 PointerPairList& theVertexPointerPairList); 

    /**
     * list of assignments replacing this 
     * assignment for SSA.
     * This list will be inserted in place of this 
     * assignment in the BasicBlockElement list
     * and the replacement transfers ownership
     * \todo JU revisit actual reinsertion of the 
     * \todo replacement assignments mentioned in the statement above
     */
    typedef std::list<Assignment*> AssignmentPList;
    AssignmentPList mySSAReplacementAssignmentList;

    /** 
     * This is used by the linerization process. 
     * Initially it will hold a copy of the original 
     * right hand side
     */
    Expression myLinearizedRightHandSide;

    /** 
     * this indicates that the linearization has 
     * happened
     */
    bool myHaveLinearizedRightHandSide;

    /**
     * this dumps the linearization code
     * which needs to happen in dependency order, 
     * i.e. bottom up
     */
    void printEdgeAnnotationsBottomUp(const ExpressionEdge& theEdge,
				      const Expression& theExpression,
				      std::ostream& os) const;

    /** 
     * this is an assignment that will be created 
     * if the LHS occurs as an argument that 
     * is also used in a partial expression.
     * Since the partial are calculated after 
     * the assignment or its SSA replacements
     * the result will the assigned to a temporary
     * the partials will be calculated  and 
     * then the temporary is assigned to the 
     * original LHS
     */
    Assignment* myDelayedLHSAssignment_p;

    /** 
     * this determines if the assignment is active or not
     * it has a delayed initialization from the active informantion 
     * if the containing assignments LHS.
     */
    mutable bool myActiveFlag;

    /** 
     * determines whether myActiveFlag has been initialized 
     */
    mutable bool myActiveFlagInit;

    /**
     * create replacement assignments that use the 
     * auxilliary variables for SSA
     */
    void makeSSACodeList();

    /** 
     * we count the replacements and use the counter 
     * to make the statement ids unique
     */
    unsigned int myReplacementCounter;

    /**
     * to be used for replacement assignment Ids
     */
    std::string makeReplacementId(); 

  }; // end of class Assignment
 
} 
                                                                     
#endif
