#ifndef _VARIABLE_INCLUDE_
#define _VARIABLE_INCLUDE_

#include "system/inc/BaseVariableReference.hpp"
#include "system/inc/ExpressionVertex.hpp"

namespace xaifBooster { 

  /**
   * a class to express a variable  within 
   * an expression, i.e. think of a variable
   *  inside a LHS of an assignment as 
   * part of the expression graph 
   * vs a RHS. However, we use the RHS representation, 
   * the BaseVariableReference as a data member
   */
  class Variable : public ExpressionVertex { 

  public: 

    Variable();
    
    ~Variable(){};

    void printXMLHierarchy(std::ostream& os) const;
    
    std::string debug() const ;

    /**
     * name for the representation of this class in the 
     * XAIF schema
     */
    static const std::string ourXAIFName;
    
    /**
     * name for the inherited member myId 
     * in the XAIF schema
     */
    static const std::string our_myId_XAIFName;

    BaseVariableReference& getBaseVariableReference();

    const BaseVariableReference& getBaseVariableReference()const;

    virtual std::string equivalenceSignature() const ;

    virtual ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const;

  private: 

    /**
     * the actual representation of the 
     * variable 
     */
    BaseVariableReference myBaseVariableReference; 

  };  

} 

#endif 
