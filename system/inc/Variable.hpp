#ifndef _VARIABLE_INCLUDE_
#define _VARIABLE_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/VariableVertex.hpp"
#include "xaifBooster/system/inc/VariableEdge.hpp"
#include "xaifBooster/system/inc/AliasMapKey.hpp"
#include "xaifBooster/system/inc/DuUdMapKey.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"
#include "xaifBooster/system/inc/ActiveUseType.hpp"

namespace xaifBooster { 

  class VariableSymbolReference;
  class ArrayAccess;

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

    /**
     * \todo: JU think about copying duud information
     */
    void copyMyselfInto(Variable& theTarget) const;

    AliasMapKey& getAliasMapKey();

    const AliasMapKey& getAliasMapKey() const;

    DuUdMapKey& getDuUdMapKey();

    const DuUdMapKey& getDuUdMapKey() const;

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
     * name of member myAliasMapKey as represented in XAIF schema
     */
    static const std::string our_myAliasMapKey_XAIFName;

    /**
     * name of member myDuUdMapKey as represented in XAIF schema
     */
    static const std::string our_myDuUdMapKey_XAIFName;

    /**
     * name of member myDerivFlag as represented in XAIF schema
     */
    static const std::string our_myDerivFlag_XAIFName;

    /**
     * name of member myConstantUseFlag as represented in XAIF schema
     */
    static const std::string our_myConstantUseFlag_XAIFName;

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

    /** 
     * returns the first VariableVertex that is an ArrayAccess
     * \todo this is a bit of a hack because we might 
     * conceivably have something with more than one such vertex
     */
    const ArrayAccess& getArrayAccess() const;
    ArrayAccess& getArrayAccess();

    /** 
     * returns true if this has a VariableVertex that is an ArrayAccess
     * \todo see also getArrayAccess 
     */
    bool hasArrayAccess() const;

    /**
     * \see myConstantUseFlag
     * sets it to true
     */
    void setConstantUseFlag();

    /**
     * \see myConstantUseFlag
     */
    bool getConstantUseFlag() const;

  private: 
    
    /** 
     * key into  AliasMap
     */
    AliasMapKey myAliasMapKey;

    /** 
     * key into  DuUdMap
     */
    DuUdMapKey myDuUdMapKey;

    /** 
     * indicating the use of the value 
     * or the deriv component of an 
     * active type
     */
    bool myDerivFlag;

    /** 
     * returns the first VariableVertex that is a VariableSymbolReference
     * \todo: this is a bit of a hack because we might 
     * conceivably have something with more than one such vertex
     */
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

    mutable bool myActiveUseTypeSetFlag;

    /**
     * defaults to false, 
     * set from XAIF constant attribute
     * set to true for a use of a variable 
     * which provably always has a unique literal
     * value, but not necessarily a constant type modifier
     * Conversely, a variable with constant 
     * type modifier that is however not initialized 
     * by a literal constant but instead from a parameter
     * would have this flag set to false
     * i.e this flag decides if the value is known at 
     * compile time or not so we may use it for 
     * constant folding or may not.
     */
    bool myConstantUseFlag;

  }; // end of class Variable

} // end of namespace xaifBooster
                                                                     
#endif
