#ifndef _XAIFBOOSTERLINEARIZATION_SUBROUTINECALLALG_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_SUBROUTINECALLALG_INCLUDE_

#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/system/inc/PlainBasicBlock.hpp"


using namespace xaifBooster;

namespace xaifBooster { 
  class SubroutineCall;
  class ArgumentSymbolReference;
}

namespace xaifBoosterLinearization {  

  /** 
   * class to implement reversal of BasicBlockElements
   */
  class SubroutineCallAlg : public SubroutineCallAlgBase{

  public:
    
    SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall);

    virtual ~SubroutineCallAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /** 
     * adjust for active/passive type mismatches 
     * \todo fix handling for external calls which should all be passive!
     */
    virtual void algorithm_action_1();

  private: 

    /** 
     * no def
     */
    SubroutineCallAlg();

    /** 
     * no def
     */
    SubroutineCallAlg(const SubroutineCallAlg&);

    /** 
     * no def
     */
    SubroutineCallAlg operator=(const SubroutineCallAlg&);

    /** 
     * prior call argument adjustments
     */
    PlainBasicBlock::BasicBlockElementList myPriorAdjustmentsList;

    /** 
     * post call argument adjustments
     */
    PlainBasicBlock::BasicBlockElementList myPostAdjustmentsList;

    /** 
     * makes a temporary variable for a given formal argument symbol
     */
    const Variable& makeTempVariable(const Symbol& formalArgument);

    /** 
     * the bit that creates the inlinable calls
     */
    void addConversion(const ConcreteArgument& theConcreteArgument,
		       const ArgumentSymbolReference& aFormalArgumentSymbolReference);

    std::string giveCallName(bool concreteArgumentActive,
			     const SymbolReference &aTempSymbolReference,
			     bool prior) const ;

    void makeTempSymbol(const ConcreteArgument& theConcreteArgument,
			const Symbol& formalArgumentSymbol,
			const Scope& formalArgumentScope,
			Variable& aVariable); 
     
  }; // end of class SubroutineCallAlg
 
} 
                                                                     
#endif
