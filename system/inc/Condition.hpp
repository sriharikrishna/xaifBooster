#ifndef _CONDITION_INCLUDE_
#define _CONDITION_INCLUDE_

#include "system/inc/Expression.hpp"
#include "utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  /**
   * this class describes 
   * a condition used in control flow constructs (if,for loop etc.).
   */
  class Condition : public XMLPrintable {
  public:

    Condition (){};

    ~Condition(){};

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;
    
    Expression& getExpression();

    const Expression& getExpression() const;

  private:
    
    /** 
     * the expression for the condition 
     */
    Expression myExpression;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
