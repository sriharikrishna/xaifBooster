#ifndef _CONTROLFLOWGRAPHVERTEX_INCLUDE_
#define _CONTROLFLOWGRAPHVERTEX_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/VertexTraversable.hpp"

namespace xaifBooster { 

  /**
   * the ControlFlowGraphVertex is a base class for elements 
   * of a control flow such a if statements, basic blocks, loops etc.
   */
  class ControlFlowGraphVertex : public VertexTraversable, 
				 public XMLPrintable,
				 public ObjectWithId,
				 public ObjectWithAnnotation {
  public:

    /**
     * ctor
     */
    ControlFlowGraphVertex (){};

    /** 
     * dtor
     */
    ~ControlFlowGraphVertex(){};

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;

  }; // end of class ControlFlowGraphVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
