#ifndef _VARIABLE_INCLUDE_
#define _VARIABLE_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/VariableVertex.hpp"
#include "xaifBooster/system/inc/VariableEdge.hpp"
#include "xaifBooster/system/inc/AliasMapKey.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"
#include "xaifBooster/system/inc/ActiveUseType.hpp"

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
     * print attributes associated with VariableReference XML type
     */
    void printVariableReferenceXMLAttributes(std::ostream& os) const;

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

    AliasMapKey& getAliasMapKey();

    const AliasMapKey& getAliasMapKey() const;

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

    /** 
     * get the active use of this Variable
     * if UNDEFINED we go by the type specified in 
     * the SymbolTable
     */
    bool getActiveFlag() const; 

    ActiveUseType::ActiveUseType_E getActiveUseType() const; 

    /** 
     * set myActiveUseType once
     */
    void setActiveUseType(ActiveUseType::ActiveUseType_E anActiveUseType); 

  private: 
    
    /** 
     * key into  AliasMap
     */
    AliasMapKey myAliasMapKey;

    /** 
     * indicating the use of the value 
     * or the deriv component of an 
     * active type
     */
    bool myDerivFlag;

    const VariableSymbolReference& getVariableSymbolReference() const;

    /** 
     * indicating how a variable is used, 
     * defaults to UNDEFINED which is 
     * also the schema default, 
     * can be set once with setActiveUseType
     * and modified if UNDEFINED 
     * in getActiveFlag
     */
    mutable ActiveUseType::ActiveUseType_E myActiveUseType;

    bool myactiveUseTypeSetFlag;

  }; // end of class Variable

} // end of namespace xaifBooster
                                                                     
#endif
