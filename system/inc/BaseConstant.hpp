#ifndef _BASECONSTANT_INCLUDE_
#define _BASECONSTANT_INCLUDE_

#include "system/inc/ExpressionVertex.hpp"
#include "system/inc/SymbolType.hpp"
#include "utils/inc/Debuggable.hpp"

namespace xaifBooster { 

  /**
   * \todo cannot handle COMPLEX
   */
  class BaseConstant: public Debuggable {
  public:

    BaseConstant(const SymbolType::SymbolType_E aType) : 
      myType(aType) {};

    ~BaseConstant(){};

    virtual std::string debug() const;

    float getfloat()const;
    int getint()const;
    bool getbool()const;
    char getchar()const;
    void setfloat(float);
    void setint(int);
    void setbool(bool);
    void setchar(char);
    void setFromString(const std::string& aValue);

    SymbolType::SymbolType_E getType() const;

    std::string toString() const; 

  protected: 

    const SymbolType::SymbolType_E myType;

  private : 

    BaseConstant ();

    /**
     * obviously we don't need 
     * anything special for 
     * string constants
     */
    union myValueUnion { 
      float f;
      int i;
      bool b;
      char c;
    };

    myValueUnion myValue;

    /** 
     * the original string if set from string
     */
    std::string myOriginalStringRep;

    static const std::string ourBooleanTrueString;
    static const std::string ourBooleanFalseString;

  }; // end of class BaseConstant
 
} // end of namespace xaifBooster
                                                                     
#endif
