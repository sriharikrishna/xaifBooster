#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphAlg.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 
  std::string CallGraphAlg::myAlgorithmSignature(std::string("__control_flow_reversal_"));


  CallGraphAlg::CallGraphAlg(const CallGraph& theContaining) : CallGraphAlgBase(theContaining), myPushIntegerSymbol_r(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope().getSymbolTable().addSymbol(std::string(myAlgorithmSignature+"push_integer"),SymbolKind::SUBROUTINE,SymbolType::VOID_STYPE,SymbolShape::SCALAR,false,true)),
    myPopIntegerSymbol_r(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope().getSymbolTable().addSymbol(std::string(myAlgorithmSignature+"pop_integer"),SymbolKind::SUBROUTINE,SymbolType::VOID_STYPE,SymbolShape::SCALAR,false,true)) {
    myPushIntegerSymbol_r.setAnnotation(myAlgorithmSignature);
    myPopIntegerSymbol_r.setAnnotation(myAlgorithmSignature);
  }

  CallGraphAlg::~CallGraphAlg() {
  }

  const std::string&
  CallGraphAlg::getAlgorithmSignature() const {
    return myAlgorithmSignature;
  }

  const Symbol&
  CallGraphAlg::getPushIntegerSymbol() const {
    return myPushIntegerSymbol_r;
  }
   
  const Symbol&
  CallGraphAlg::getPopIntegerSymbol() const {
    return myPopIntegerSymbol_r;
  }

  class VertexLabelWriter {
  public:
    VertexLabelWriter(const CallGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(),
                                                  myG.getInternalBoostGraph()),
                                       v)->getSubroutineName() << "\"]";
    };
    const CallGraph& myG;
  };

  void CallGraphAlg::algorithm_action_4() {
    DBG_MACRO(DbgGroup::CALLSTACK,
              "xaifBoosterControlFlowReversal::CallGraphAlg::algorithm_action_4(reverse control flow) called for: "
              << debug().c_str());
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	GraphVizDisplay::show(getContaining(),"call_graph",
			      VertexLabelWriter(getContaining()));
      }
  } // end CallGraphAlg::algorithm_action_4() 

  void
  CallGraphAlg::printXMLHierarchy(std::ostream& os) const {
    getContaining().printXMLHierarchyImpl(os);
  }

  std::string
  CallGraphAlg::debug() const {
     std::ostringstream out;
     out << "xaifBoosterControlFlowReversal::CallGraphAlg["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void CallGraphAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace
