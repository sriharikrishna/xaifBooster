#ifndef _XAIFBOOSTERLINEARIZATION_EXPRESSIONALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_EXPRESSIONALG_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/system/inc/ExpressionAlgBase.hpp"
#include "xaifBooster/system/inc/Argument.hpp"

#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlg.hpp"

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

    typedef std::list<xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall*> AllocationsPList;
    
    const AllocationsPList& getPartialAllocationsPList() const;

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
    
    /**
     * list of allocations potentially needed for partial variables
     */
    AllocationsPList myPartialAllocationsPList;

  };
 
} 
                                                                     
#endif
