#ifndef _XAIFBOOSTERLINEARIZATION_EXPRESSIONALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_EXPRESSIONALG_INCLUDE_

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
    ExpressionAlg operator=(const ExpressionAlg&);

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
     * mark all passive vertices/edges bottom up
     */
    void activityAnalysisBottomUpPass(const ExpressionEdge& theEdge);

  };
 
} 
                                                                     
#endif
