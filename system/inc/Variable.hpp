#ifndef _VARIABLE_INCLUDE_
#define _VARIABLE_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/VariableVertex.hpp"
#include "xaifBooster/system/inc/VariableEdge.hpp"
#include "xaifBooster/system/inc/AliasActivityMapKey.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"

namespace xaifBooster { 

  class VariableSymbolReference;

  /**
   * the default representation for VariableReferences as a graph
   */
  class Variable : public GraphWrapperTraversable<VariableVertex,VariableEdge> , 
		   public XMLPrintable,
		   public ObjectWithId {
  public:
    
    Variable();

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
     * equivalence between two Variable instances in 
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
    bool equivalentTo(const Variable& rhs) const;

    void copyMyselfInto(Variable& theTarget) const;

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

    const VariableSymbolReference& getVariableSymbolReference() const;

  }; // end of class Variable

} // end of namespace xaifBooster
                                                                     
#endif
