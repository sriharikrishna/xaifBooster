#ifndef _INTRINSIC_INCLUDE_
#define _INTRINSIC_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/IntrinsicAlgBase.hpp"

namespace xaifBooster { 

  class Expression;

  class Intrinsic : public ExpressionVertex {
  public:

    Intrinsic(const std::string& aName, bool hasAlgorithm=true);

    ~Intrinsic(){};

    void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyImpl(std::ostream& os) const;
    void printXMLHierarchyImpl(std::ostream& os, const Expression& theExpression) const {};


    std::string debug() const;

    static const std::string ourXAIFName;
    static const std::string our_myName_XAIFName;
    static const std::string our_myId_XAIFName;

    /**
     * virtual in ExpressionVertex
     */
    std::string equivalenceSignature() const;

    virtual const InlinableIntrinsicsCatalogueItem& getInlinableIntrinsicsCatalogueItem() const;

    /**
     * copy into provided object
     */
    void copyMyselfInto(Intrinsic& theCopy) const;

    /**
     * virtual in ExpressionVertex
     */
    ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const;

    /**
     * routines for accessing the algorithm
     */
    IntrinsicAlgBase& getIntrinsicAlgBase();
    const IntrinsicAlgBase& getIntrinsicAlgBase() const;

    /**
     * used by generic traversal
     * child is myIntrinsicAlgBase_p (if set)
     * virtual in utils/GenericTraverseInvoke
     */
    void traverseToChildren(const GenericAction::GenericAction_E anAction_c);


  private : 

    /** 
     * no def
     */
    Intrinsic();

    /**
     * \todo replace with reference to IntrinsicCatalogue
     */
    const std::string myName;

    /**
     * pointer to algorithm
     */
    IntrinsicAlgBase* myIntrinsicAlgBase_p;


  }; // end of class Intrinsic
 
} // end of namespace xaifBooster
                                                                     
#endif
