#ifndef _BOOLEANOPERATIONALG_INCLUDE_
#define _BOOLEANOPERATIONALG_INCLUDE_

#include "xaifBooster/system/inc/BooleanOperationAlgBase.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   */
  class BooleanOperationAlg : public BooleanOperationAlgBase,
		      public ExpressionVertexAlg { 

  public:
    
    BooleanOperationAlg(BooleanOperation& theContainingBooleanOperation);

    virtual ~BooleanOperationAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 

    /** 
     * no def
     */
    BooleanOperationAlg();

    /** 
     * no def
     */
    BooleanOperationAlg(const BooleanOperationAlg&);

    /** 
     * no def
     */
    BooleanOperationAlg operator=(const BooleanOperationAlg&);

  } ; 

} 
                                                                     
#endif
