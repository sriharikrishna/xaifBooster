#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgFactory.hpp"

namespace xaifBooster { 

  ControlFlowGraphVertex::ControlFlowGraphVertex() : myControlFlowGraphVertexAlgBase_p(0) {}

  ControlFlowGraphVertex::~ControlFlowGraphVertex() {
    if (myControlFlowGraphVertexAlgBase_p) delete myControlFlowGraphVertexAlgBase_p;
  }


  void
  ControlFlowGraphVertex::printXMLHierarchy(std::ostream& os) const { 
  } // end of ControlFlowGraphVertex::printXMLHierarchy

  void
  ControlFlowGraphVertex::printXMLHierarchyImpl(std::ostream& os) const { 
  } // end of ControlFlowGraphVertex::printXMLHierarchyImpl

  std::string ControlFlowGraphVertex::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraphVertex[" << this 
	<< Vertex::debug().c_str()
	<< ObjectWithId::debug().c_str()
	<< ObjectWithAnnotation::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraphVertex::debug

  ControlFlowGraphVertexAlgBase&
  ControlFlowGraphVertex::getControlFlowGraphVertexAlgBase() const {
    if (!myControlFlowGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraphVertex::getControlFlowGraphVertexAlgBase: not set");
    return *myControlFlowGraphVertexAlgBase_p;
  }


} // end of namespace xaifBooster 
