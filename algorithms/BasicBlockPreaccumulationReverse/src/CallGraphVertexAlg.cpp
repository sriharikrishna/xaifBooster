#include "xaifBooster/system/inc/CallGraphVertex.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlg.hpp"


using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    CallGraphVertexAlgBase(theContaining), 
    // JU: this is iffy. Ideally I don't want to get into accessing theContaining 
    // here since it opens the door to ordering problems between the ctors.
    myReplacementList(theContaining.getControlFlowGraph().getSymbolReference().getSymbol(),
		      theContaining.getControlFlowGraph().getSymbolReference().getScope(),
                      "reverse_subroutine_template",
		      theContaining.getControlFlowGraph().getArgumentList()) { 
  }

  void
  CallGraphVertexAlg::printXMLHierarchy(std::ostream& os) const { 
    myReplacementList.printXMLHierarchy(os);
    //  getContaining().CallGraphVertex::printXMLHierarchyImpl(os);
  } // end of CallGraphVertexAlg::printXMLHierarchy
  

  std::string CallGraphVertexAlg::debug () const { 
    std::ostringstream out;
    out << "CallGraphVertexAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertexAlg::debug

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void CallGraphVertexAlg::algorithm_action_4() { 
    myReplacementList.setAnnotation(getContaining().getControlFlowGraph().getAnnotation());
    myReplacementList.setId(getContaining().getControlFlowGraph().getId());
    xaifBoosterCodeReplacement::Replacement& theReplacement(myReplacementList.addReplacement(1));
    theReplacement.setControlFlowGraphBase(getContaining().getControlFlowGraph());
  } 

} // end of namespace 
