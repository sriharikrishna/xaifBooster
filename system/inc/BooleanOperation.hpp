#ifndef _BOOLEANOPERATION_INCLUDE_
#define _BOOLEANOPERATION_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/BooleanOperationType.hpp"

namespace xaifBooster { 

  class BooleanOperation : public ExpressionVertex {
  public:

    BooleanOperation(BooleanOperationType::BooleanOperationType_E theType);

    ~BooleanOperation(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myType as represented in XAIF schema
     */
    static const std::string our_myType_XAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    virtual std::string equivalenceSignature() const;

    virtual ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const;

  private : 

    /** 
     * no def
     */
    BooleanOperation ();

    /**
     * the type of the boolean operation
     */
    const BooleanOperationType::BooleanOperationType_E myType;

  }; // end of class BooleanOperation
 
} // end of namespace xaifBooster
                                                                     
#endif
