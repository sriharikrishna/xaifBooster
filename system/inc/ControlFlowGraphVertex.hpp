#ifndef _CONTROLFLOWGRAPHVERTEX_INCLUDE_
#define _CONTROLFLOWGRAPHVERTEX_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/VertexTraversable.hpp"

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

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
    ControlFlowGraphVertex ();

    /** 
     * dtor
     */
    ~ControlFlowGraphVertex();

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;
    void printXMLHierarchyImpl(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;


    /**
     * get algorithm
     */
    ControlFlowGraphVertexAlgBase& getControlFlowGraphVertexAlgBase();
    const ControlFlowGraphVertexAlgBase& getControlFlowGraphVertexAlgBase() const;

    private:

    /**
     * this will be set to point a dynamically instance
     * during construction and deleted during
     * destruction
     */
    ControlFlowGraphVertexAlgBase* myControlFlowGraphVertexAlgBase_p;


  }; // end of class ControlFlowGraphVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
