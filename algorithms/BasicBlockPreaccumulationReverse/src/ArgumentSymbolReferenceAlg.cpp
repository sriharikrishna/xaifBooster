#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReference.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/ArgumentSymbolReferenceAlg.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  ArgumentSymbolReferenceAlg::ArgumentSymbolReferenceAlg(ArgumentSymbolReference& theContaining):
    ArgumentSymbolReferenceAlgBase(theContaining) { 
  }

  void
  ArgumentSymbolReferenceAlg::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ArgumentSymbolReference::ourXAIFName.c_str() 
       << " "
       << ArgumentSymbolReference::our_myPosition_XAIFName.c_str()
       << "=\""
       << getContaining().getPosition()
       << "\" " 
       << ArgumentSymbolReference::our_symbolId_XAIFName.c_str()
       << "=\"" 
       << getContaining().getSymbol().getId().c_str()
       << "\" " 
       << ArgumentSymbolReference::our_scopeId_XAIFName.c_str() 
       << "=\"" 
       << getContaining().getScope().getId().c_str()
       << "\" " 
       << ArgumentSymbolReference::our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << getContaining().getActiveFlag()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getContaining().getAnnotation().c_str()
       << "\" " 
       << ArgumentSymbolReference::our_myIntent_XAIFName.c_str() 
       << "=\"" 
       << IntentType::toString(myIntent).c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end of ArgumentSymbolReferenceAlg::printXMLHierarchy
  
  std::string ArgumentSymbolReferenceAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::ArgumentSymbolReferenceAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of ArgumentSymbolReferenceAlg::debug

  void ArgumentSymbolReferenceAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void ArgumentSymbolReferenceAlg::algorithm_action_1() {
    myIntent=getContaining().getIntent();
    if (getContaining().getSymbol().getActiveTypeFlag())
      // all active parameters should become inout
      myIntent=IntentType::INOUT_ITYPE;
  }

} // end of namespace
