#include "utils/inc/PrintManager.hpp"
#include "system/inc/BaseVariableReferenceEdge.hpp"
#include "system/inc/BaseVariableReference.hpp"

namespace xaifBooster { 

  const std::string BaseVariableReferenceEdge::ourXAIFName("xaif:VariableReferenceEdge");
  const std::string BaseVariableReferenceEdge::our_myId_XAIFName("edge_id");
  const std::string BaseVariableReferenceEdge::our_source_XAIFName("source");
  const std::string BaseVariableReferenceEdge::our_target_XAIFName("target");

  void 
  BaseVariableReferenceEdge::printXMLHierarchy(std::ostream& os,
					       const BaseVariableReference& theGraph) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<" 
       << ourXAIFName 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId().c_str() 
       << "\" " 
       << our_source_XAIFName 
       << "=\"" 
       << theGraph.getSourceOf(*this).getId().c_str() 
       << "\" " 
       << our_target_XAIFName 
       << "=\"" 
       << theGraph.getTargetOf(*this).getId().c_str() 
       << "\"/>"
       << std::endl; 
    pm.releaseInstance();
  } 

   std::string BaseVariableReferenceEdge::debug () const {
     std::ostringstream out;
     out << "BaseVariableReferenceEdge[" << this
         << Edge::debug()
         << "]" << std::ends;
     return out.str();
   } // end of BaseVariableReferenceEdge::debug

}
