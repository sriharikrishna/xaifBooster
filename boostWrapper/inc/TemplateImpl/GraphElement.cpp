#ifndef  _GRAPHELEMENT_INCLUDE_
#include "xaifBooster/boostWrapper/inc/GraphElement.hpp"
#endif

#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  template <class VertexOrEdgeDescriptor>
  GraphElement<VertexOrEdgeDescriptor>::GraphElement() 
    : myInitFlag(false) {};
  
  template <class VertexOrEdgeDescriptor>
  void 
  GraphElement<VertexOrEdgeDescriptor>::init(const VertexOrEdgeDescriptor& aDescriptor) { 
    if (myInitFlag) 
      THROW_LOGICEXCEPTION_MACRO("GraphElement<VertexOrEdgeDescriptor>::init already initialized"); 
    myInitFlag=true;
    myBoostDescriptor=aDescriptor;
  } // end of GraphElement<VertexOrEdgeDescriptor>::init
  
  template <class VertexOrEdgeDescriptor>
  const VertexOrEdgeDescriptor& 
  GraphElement<VertexOrEdgeDescriptor>::getDescriptor() const { 
    if (!myInitFlag) 
      THROW_LOGICEXCEPTION_MACRO("GraphElement<VertexOrEdgeDescriptor>::getDescriptor not initialized"); 
    return myBoostDescriptor;
  } // end of GraphElement<VertexOrEdgeDescriptor>::getDescriptor
  
  template <class VertexOrEdgeDescriptor>
  std::string GraphElement<VertexOrEdgeDescriptor>::debug() const { 
    std::ostringstream out;
    out << "GraphElement[" << this 
	<< ",myInitFlag=" << myInitFlag 
	<< ",myBoostDescriptor=" << myBoostDescriptor
	<< "]" << std::ends;  
    return out.str();
  } // end of GraphElement<VertexOrEdgeDescriptor>::debug

} // end of namespace
