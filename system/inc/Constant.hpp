#ifndef _CONSTANT_INCLUDE_
#define _CONSTANT_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/BaseConstant.hpp"

namespace xaifBooster { 

  class Constant : public ExpressionVertex,
		   public BaseConstant {
  public:

    Constant(const SymbolType::SymbolType_E aType,
	     bool makeAlgorithm=true);

    ~Constant(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const;

    virtual std::string equivalenceSignature() const;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myType as represented in XAIF schema
     */
    static const std::string our_myType_XAIFName;

    /**
     * name for member myValue as represented in XAIF schema
     */
    static const std::string our_myValue_XAIFName;

    /**
     * name for member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    virtual ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const;

  private : 

    /**
     * no def
     */
    Constant ();
    /**
     * no def
     */
    Constant (const Constant&);
    /**
     * no def
     */
    Constant& operator=(const Constant&);

  }; // end of class Constant
 
} // end of namespace xaifBooster
                                                                     
#endif
