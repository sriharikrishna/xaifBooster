#ifndef _EXPRESSION_INCLUDE_
#define _EXPRESSION_INCLUDE_

#include <list>
#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/system/inc/ExpressionAlgBase.hpp"

namespace xaifBooster { 

  /**
   * an expression, usually 
   * numeric but can contain boolean operations 
   */
  class Expression : 
    public GraphWrapperTraversable<ExpressionVertex, ExpressionEdge>, 
    public XMLPrintable {

  public:

    /**
     * ctor stes pointer to dynamically allocated algorithm
     * object if required
     */
    Expression(bool hasAlgorithm=true);

    /**
     * dtor deallocates algorithm if present
     */
    ~Expression();

    /**
     * virtual in XMLPrintable
     * decision on what is to be printed is taken in
     * algorithm (if present, otherwise printXMLHierarchyImpl
     * is called
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * actual implementation for printing xaif
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    /**
     * is virtual in Debuggable inherited via XMLPrintable
     */
    std::string debug() const ;

    /**
     * perform a deep copy of the contents 
     * into theTarget
     * \param withNewId indicates if the graph 
     * elements will have their own Id's  
     * created from getNexVertex/EdgeId()
     * \param withAlgorithm indicates if the graph 
     * elements will have their algorithm objects 
     * created.
     */
    void copyMyselfInto(Expression& theTarget,
			bool withNewId,
			bool withAlgorithm) const;  

    /**
     * similar to copyMyselfInto
     * perform a deep copy of the subexpression  contents 
     * starting with theTopVertex into theTarget
     * returning the copy of theTopVertex in theTarget
     */
    ExpressionVertex& copySubExpressionInto(Expression& theTarget,
					    const ExpressionVertex& theTopVertex,
					    bool withNewId,
					    bool withAlgorithm) const;
    
    /** 
     * algorithm access where the Expression may 
     * be const but in difference to the 
     * internal representation (wich is always 
     * const for the algorithms) the algorithm 
     * instances will always be modifiable.
     */
    ExpressionAlgBase& getExpressionAlgBase() const;

    /**
     * virtual in GenericTraverseInvoke
     * used by generic traversal
     * child is myExpressionAlgBase_p (if set)
     */
    void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * finds top vertex of positional subexpression
     */
    const ExpressionVertex& findPositionalSubExpressionOf(const ExpressionVertex& aVertex,
							  unsigned int aPosition) const;

  private:

    /** 
     * the class owns this instance, 
     * it will be set 
     * during construction and deleted during 
     * destruction
     */
    ExpressionAlgBase* myExpressionAlgBase_p;

    typedef std::list<const ExpressionVertex*> ExpressionVertexPList;

    /** 
     * recursively invoked implementation for public copySubExpressionInto
     */
    void copySubExpressionInto(Expression& theTarget,
					    const ExpressionVertex& theTopVertex,
					    ExpressionVertex& theTopCopy,
					    bool withNewId,
					    bool withAlgorithm,
					    ExpressionVertexPList theList) const;


  }; // end of class Expression

} // end of namespace xaifBooster
                                                                     
#endif
