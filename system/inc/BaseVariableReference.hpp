#ifndef _BASEVARIABLEREFERENCE_INCLUDE_
#define _BASEVARIABLEREFERENCE_INCLUDE_

#include "utils/inc/XMLPrintable.hpp"
#include "utils/inc/ObjectWithId.hpp"
#include "system/inc/GraphWrapperTraversable.hpp"
#include "system/inc/BaseVariableReferenceVertex.hpp"
#include "system/inc/BaseVariableReferenceEdge.hpp"
#include "system/inc/AliasActivityMapKey.hpp"
#include "system/inc/SymbolType.hpp"

namespace xaifBooster { 

  class BaseVariableSymbolReference;

  /**
   * the default representation for VariableReferences as a graph
   */
  class BaseVariableReference : public GraphWrapperTraversable<BaseVariableReferenceVertex,BaseVariableReferenceEdge> , 
				public XMLPrintable,
				public ObjectWithId {
  public:
    
    BaseVariableReference();

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;

    /** 
     * creates a signature that represents 
     * equivalence between two BaseVariableReferences in 
     * the sense that they refer to the same address.
     * This can be established for plain references to value symbols
     * or array references with constant index expressions. 
     * Arrary references with index expressions that are not 
     * known to be constant cannot be equivalent in this sense
     * since we cannot establish if the index expression changes the 
     * the value between two 'semantically' equivalent arrary accesses
     * \todo incomplete implementation, doesn't deal with constant index expressions
     */
    virtual std::string equivalenceSignature() const ;

    /** 
     * establishes equivalence in the sense described for 
     * equivalenceSignature()
     */
    bool equivalentTo(const BaseVariableReference& rhs) const;

    void copyMyselfInto(BaseVariableReference& theTarget) const;

    AliasActivityMapKey& getAliasActivityMapKey();

    const AliasActivityMapKey& getAliasActivityMapKey() const;

    /**
     * get the data type from the SymbolReference,
     * \todo note that this will not work if we ever allow 
     * structures
     */
    const SymbolType::SymbolType_E& getType() const;

    /**
     * get the data type active flag from the SymbolReference
     * \todo note that this will not work if we ever allow 
     * structures
     */
    bool getActiveType() const;
 
    /**
     * set the flag to access the deriv component
     */
    void setDerivFlag();

    /**
     * get the deriv flag 
     */
    bool getDerivFlag() const;

    /**
     * name of member myKey as represented in XAIF schema
     */
    static const std::string our_myKey_XAIFName;

    /**
     * name of member myDerivFlag as represented in XAIF schema
     */
    static const std::string our_myDerivFlag_XAIFName;

 private: 
    
    /** 
     * key into  AliasActivityMap
     */
    AliasActivityMapKey myAliasActivityMapKey;

    /** 
     * indicating the use of the value 
     * or the deriv component of an 
     * active type
     */
    bool myDerivFlag;

    const BaseVariableSymbolReference& getBaseVariableSymbolReference() const;

  }; // end of class BaseVariableReference

} // end of namespace xaifBooster
                                                                     
#endif
