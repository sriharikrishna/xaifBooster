#ifndef _ARGUMENTALG_INCLUDE_
#define _ARGUMENTALG_INCLUDE_

#include "xaifBooster/system/inc/ArgumentAlgBase.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

using namespace xaifBooster; 

namespace xaifBoosterLinearization { 

  /**
   * class to implement linearization steps
   */
  class ArgumentAlg : public ArgumentAlgBase,
		      public ExpressionVertexAlg { 

  public:
    
    ArgumentAlg(Argument& theContainingArgument);

    virtual ~ArgumentAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 

    /** 
     * no def
     */
    ArgumentAlg();

    /** 
     * no def
     */
    ArgumentAlg(const ArgumentAlg&);

    /** 
     * no def
     */
    ArgumentAlg operator=(const ArgumentAlg&);

  } ; 

} 
                                                                     
#endif
