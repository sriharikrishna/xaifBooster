#ifndef _EXPRESSIONVERTEX_INCLUDE_
#define _EXPRESSIONVERTEX_INCLUDE_

#include "utils/inc/ObjectWithId.hpp"
#include "system/inc/VertexTraversable.hpp"

namespace xaifBooster { 

  /**
   * base class for various vertex types inside of expressions
   */
  class ExpressionVertex : public VertexTraversable, public ObjectWithId {
  public:

    ExpressionVertex();

    ~ExpressionVertex();

    /**
     * invoked by Expression
     */
    virtual void printXMLHierarchy(std::ostream& os) const=0;

    std::string debug() const ;

    /**
     * leaf objects that are derived from this class
     * need to be comparable for equivalence
     */
    virtual std::string equivalenceSignature() const =0;

    /**
     * ExpressionVertex is base class for variety of leaf classes
     * with algorithms; those need to be able to create copy of 
     * themselves for use in algorithms
     */
    virtual ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const=0;

  private: 

  }; // end of class ExpressionVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
