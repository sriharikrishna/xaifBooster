#ifndef _ARGUMENT_INCLUDE_
#define _ARGUMENT_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/ExpressionVertex.hpp"

namespace xaifBooster { 

  /**
   * a class to express a variable argument within 
   * an expression, i.e. think of a variable
   *  inside a LHS of an assignment as 
   * part of the expression graph 
   * vs a RHS. However, we use the RHS representation, 
   * the Variable as a data member
   */
  class Argument : public ExpressionVertex { 

  public: 

    Argument();
    
    ~Argument(){};

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

    Variable& getVariable();

    const Variable& getVariable()const;

    virtual std::string equivalenceSignature() const ;

    virtual ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const;

  private: 

    /**
     * the actual representation of the 
     * variable 
     */
    Variable myVariable; 

  };  

} 

#endif 
