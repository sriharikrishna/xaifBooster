#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlg.hpp"


using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    CallGraphVertexAlgBase(theContaining), 
    // JU: this is iffy. Ideally I don't want to get into accessing theContaining 
    // here since it opens the door to ordering problems between the ctors.
    myReplacementList(theContaining.getControlFlowGraph().getSymbolReference().getSymbol(),
		      theContaining.getControlFlowGraph().getSymbolReference().getScope(),
                      "reverse_subroutine_template") { 
  }

  void
  CallGraphVertexAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().CallGraphVertex::printXMLHierarchyImpl(os);
  } // end of CallGraphVertexAlg::printXMLHierarchy
  

  std::string CallGraphVertexAlg::debug () const { 
    std::ostringstream out;
    out << "CallGraphVertexAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertexAlg::debug

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

} // end of namespace 
