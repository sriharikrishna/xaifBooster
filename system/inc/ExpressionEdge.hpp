#ifndef _EXPRESSIONEDGE_INCLUDE_
#define _EXPRESSIONEDGE_INCLUDE_

#include "system/inc/EdgeTraversable.hpp"
#include "system/inc/ExpressionEdgeAlgBase.hpp"
#include "utils/inc/ObjectWithId.hpp"

namespace xaifBooster { 

  class Expression;

  class ExpressionEdge : public EdgeTraversable, public ObjectWithId { 
  public:

    /**
     * ctor sets pointer to dynamically allocated algorithm
     * object is hasAlgorithm==true
     */
    ExpressionEdge(bool hasAlgorithm=true);

    /**
     * dtor deallocates the algorithm object if present
     */
    ~ExpressionEdge();

    /**
     * called by parser, expects a string 
     * representing an unsigned int
     */
    void setPosition(const std::string& i);
    
    void setPosition(unsigned int i);

    /**
     * position is retrieved as integer > 0
     */
    unsigned int getPosition() const;

    /**
     * print xaif driven by algorithm
     * always invoked by the graph
     */
    void printXMLHierarchy(std::ostream& os, const Expression& theExpression) const;

    /**
     * actual implementation for printing xaif
     * always invoked by the graph
     */
    void printXMLHierarchyImpl(std::ostream& os, const Expression& theExpression) const;
    void printXMLHierarchyImpl(std::ostream& os) const {};

    /**
     * concretization of virtual base function in Debuggable
     */
    std::string debug() const ;

    /**
     * names used in xaif schema
     */
    static const std::string ourXAIFName; 
    static const std::string our_myId_XAIFName;
    static const std::string our_source_XAIFName;
    static const std::string our_target_XAIFName;
    static const std::string our_myPosition_XAIFName;

    /**
     * copy into provided object
     */
    void copyMyselfInto(ExpressionEdge& theCopy) const;

    /**
     * provide copy (default: without algorithm)
     */
    ExpressionEdge& createCopyOfMyself(bool withAlgorithm=false) const;

    /**
     * routines for accessing the algorithm
     */
    ExpressionEdgeAlgBase& getExpressionEdgeAlgBase();
    const ExpressionEdgeAlgBase& getExpressionEdgeAlgBase() const;

    /**
     * used by generic traversal
     * child is myExpressionEdgeAlgBase_p (if set)
     * virtual in utils/GenericTraverseInvoke
     */
    void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 

    /**
     * not defined
     */
    ExpressionEdge(const ExpressionEdge&);
    ExpressionEdge operator=(const ExpressionEdge&);

    /**
     * this indicates the position 
     * of the argument in the call
     * to an elemental function 
     * represent by the target vertex
     * counting starts with 1
     * initialized to 0 to indicate 'not set'
     */
    unsigned int myPosition;

    /**
     * if required then an algorithm object is allocated dynamically
     * by the factory and the pointer is set
     */
    ExpressionEdgeAlgBase* myExpressionEdgeAlgBase_p;

  }; // end of class ExpressionEdge
 
} // end of namespace xaifBooster
                                                                     
#endif
