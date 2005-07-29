#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_

#include <list>

#include "xaifBooster/algorithms/AddressArithmetic/inc/CallGraphVertexAlg.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/ReplacementList.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/ReplacementId.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class CallGraphVertexAlg : public xaifBoosterAddressArithmetic::CallGraphVertexAlg {
  public:
    
    CallGraphVertexAlg(CallGraphVertex& theContaining);

    virtual ~CallGraphVertexAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    virtual void algorithm_action_4();

  private:
    
    /** 
     * no def
     */
    CallGraphVertexAlg();

    /** 
     * no def
     */
    CallGraphVertexAlg(const CallGraphVertexAlg&);

    /** 
     * no def
     */
    CallGraphVertexAlg operator=(const CallGraphVertexAlg&);

    xaifBoosterCodeReplacement::ReplacementList myReplacementList;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGStoreArguments_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGStoreResults_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGRestoreArguments_p;

    /** 
     * we own this
     */
    ControlFlowGraph* myCFGRestoreResults_p;
    
    /**
     * make entry, exit and a basic block which is returned
     */
    BasicBlock& initCheckPointCFG(ControlFlowGraph& aCheckPointCFG); 
    
    /** 
     * give a name for the inlinable routine to which we append 
     * e.g. '_<type_string>_<shape_string>';
     * with intent type to be excluded we filter out all 
     * non-applicable things (OUT for argument and IN for result)
     * and the ControlFlowGraph is the one we are adding to
     */
    void handleCheckPointing(const std::string& aSubroutineNameBase,
			     IntentType::IntentType_E theExcludedIntent,
			     ControlFlowGraph& theCFG,
			     bool reverse);

    /** 
     * called by handleCheckPointing to deal with one argument
     */
    void handleCheckPoint(const std::string& aSubroutineNameBase,
			  IntentType::IntentType_E theExcludedIntent,
			  BasicBlock& theBasicBlock,
			  const ArgumentSymbolReference& theArgumentSymbolReference); 
    /** 
     * add the InlinableSubroutineCall with name  aSubroutineName
     * to theBasicBlock which pushes or pops to/from a Variable 
     * with name as specified by theSymbol and theScope
     */
    void addCheckPointingInlinableSubroutineCall(const std::string& aSubroutineName,
						 BasicBlock& theBasicBlock,
						 const Symbol& theSymbol,
						 const Scope& theScope);

  };
 
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
