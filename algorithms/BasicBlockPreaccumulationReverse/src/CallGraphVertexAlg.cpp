#include "xaifBooster/system/inc/CallGraphVertex.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/Replacement.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    xaifBoosterControlFlowReversal::CallGraphVertexAlg(theContaining), 
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
    out << "xaifBoosterBasicBlockPreaccumulationReverse::CallGraphVertexAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertexAlg::debug

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void CallGraphVertexAlg::algorithm_action_4() { 
    myReplacementList.setAnnotation(getContaining().getControlFlowGraph().getAnnotation());
    myReplacementList.setId(getContaining().getControlFlowGraph().getId());
    // this should be the original code
    xaifBoosterCodeReplacement::Replacement& theReplacement1(myReplacementList.addReplacement(1));
    theReplacement1.setControlFlowGraphBase(getContaining().getControlFlowGraph());
    theReplacement1.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::ORIGINAL);
    // this should be the tape
    xaifBoosterCodeReplacement::Replacement& theReplacement2(myReplacementList.addReplacement(2));
    theReplacement2.setControlFlowGraphBase(getContaining().getControlFlowGraph());
    theReplacement2.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::AUGMENTED);
    // this should be the tape adjoint
    xaifBoosterCodeReplacement::Replacement& theReplacement3(myReplacementList.addReplacement(3));
    theReplacement3.setControlFlowGraphBase(getContaining().getControlFlowGraph());
    theReplacement3.setPrintVersion(xaifBoosterCodeReplacement::PrintVersion::ADJOINT);
  } 

} // end of namespace 
