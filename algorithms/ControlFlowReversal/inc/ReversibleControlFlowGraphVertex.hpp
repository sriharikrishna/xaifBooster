#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHVERTEX_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHVERTEX_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/VertexTraversable.hpp"


#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement vertices that are used in
   * ControlFlowGraphAlg::myTransformedControlFlowGraph
   */
  class ReversibleControlFlowGraphVertex : public VertexTraversable,
                                 public XMLPrintable,
                                 public ObjectWithId,
                                 public ObjectWithAnnotation {

  public:
    
    ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex*);
    ReversibleControlFlowGraphVertex();
    ~ReversibleControlFlowGraphVertex();

    const ControlFlowGraphVertexAlg&
    getOriginalControlFlowGraphVertexAlg() const;

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    bool getVisited() const;
    void setVisited(bool);

    int getIndex() const;
    void setIndex(int);

  private:

    friend class ReversibleControlFlowGraph;
    friend class ReversibleControlFlowGraphEdge;
    
    /** 
     * no def
     */
    ReversibleControlFlowGraphVertex(const ReversibleControlFlowGraphVertex&);

    /** 
     * no def
     */
    ReversibleControlFlowGraphVertex operator=(const ReversibleControlFlowGraphVertex&);

    /** 
     * indicates if this is a reference to an original ControlFlowGraphVertex
     * or if it got created as a new ControlFlowGraphVertex
     */
    bool original;

    /** 
     * indicates if a reference to an original ControlFlowGraphVertex
     * references the augmented forward code or the adjoint code
     */
    bool adjoint;

    /** 
     * pointer to original ControlFlowGraphVertex
     */
    const ControlFlowGraphVertex* myOriginalVertex_p;

    /** 
     * pointer to new ControlFlowGraphVertex
     */
    ControlFlowGraphVertex* myNewVertex_p;

    /** 
     * flag for marking as visited during recursive traversal
     */
    bool myVisitedFlag;

    /** 
     * index for topological sort
     */
    int myIndex;

  };  // end of class

} // end of namespace 
                                                                     
#endif
