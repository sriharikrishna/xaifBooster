#ifndef _CONCRETEARGUMENT_INCLUDE_
#define _CONCRETEARGUMENT_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  /**
   * this class represents a concrete 
   * argument in a SubroutineCall
   * Note the restriction that 
   * concrete arguments are always 
   * lvalues. This saves the distinction 
   * between any kind of rvalue and lvalues 
   * for calls being made.
   */
  class ConcreteArgument: XMLPrintable { 
  public:
    
    ConcreteArgument (unsigned int thePosition);

    ~ConcreteArgument(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myPosition as represented in XAIF schema
     */
    static const std::string our_myPosition_XAIFName;

    unsigned int getPosition() const;
    
    Variable& getVariable();

    const Variable& getVariable() const ;

  private:
    
    /**
     * no def
     */
    ConcreteArgument();

    /**
     * position of this argument in the argument list of 
     * a subroutine
     */
    unsigned int myPosition;

    /**
     * the actual concrete argument
     */
    Variable myVariable;

  }; // end of class ConcreteArgument

} // end of namespace xaifBooster
                                                                     
#endif
