#ifndef _INTRINSIC_INCLUDE_
#define _INTRINSIC_INCLUDE_

#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/IntrinsicAlgBase.hpp"
#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"

namespace xaifBooster { 

  class Expression;

  /** 
   * this is an intrinsic (such as an operator 
   * or a function) within an Expression
   */
  class Intrinsic : public ExpressionVertex,
		    public ObjectWithAnnotation {

  public:

    Intrinsic(const std::string& aName, 
	      bool makeAlgorithm=true);

    ~Intrinsic(){};

    void printXMLHierarchy(std::ostream& os) const;
    void printXMLHierarchyImpl(std::ostream& os) const;
    void printXMLHierarchyImpl(std::ostream& os, const Expression& theExpression) const {};


    std::string debug() const;

    static const std::string ourXAIFName;
    static const std::string our_myName_XAIFName;
    static const std::string our_myId_XAIFName;

    std::string equivalenceSignature() const;

    /** 
     * the only useful implementation for this virtual
     */
    virtual const InlinableIntrinsicsCatalogueItem& getInlinableIntrinsicsCatalogueItem() const;

    ExpressionVertex& createCopyOfMyself(bool withAlgorithm=false) const;

    IntrinsicAlgBase& getIntrinsicAlgBase() const;

    void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private : 

    /** 
     * no def
     */
    Intrinsic();

    /**
     * no def
     */
    Intrinsic (const Intrinsic&);

    /**
     * no def
     */
    Intrinsic& operator=(const Intrinsic&);

    /**
     * \todo replace with reference to IntrinsicCatalogue
     */
    const std::string myName;

  }; // end of class Intrinsic
 
} // end of namespace xaifBooster
                                                                     
#endif
