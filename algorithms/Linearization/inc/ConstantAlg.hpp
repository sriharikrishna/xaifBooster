#ifndef _CONSTANTALG_INCLUDE_
#define _CONSTANTALG_INCLUDE_

#include "xaifBooster/system/inc/ConstantAlgBase.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   */
  class ConstantAlg : public ConstantAlgBase,
		      public ExpressionVertexAlg { 

  public:
    
    ConstantAlg(Constant& theContainingConstant) : 
      ConstantAlgBase(theContainingConstant),
      ExpressionVertexAlg(theContainingConstant) {};

    virtual ~ConstantAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 

    /** 
     * no def
     */
    ConstantAlg();

    /** 
     * no def
     */
    ConstantAlg(const ConstantAlg&);

    /** 
     * no def
     */
    ConstantAlg operator=(const ConstantAlg&);

  } ; 

} 
                                                                     
#endif
