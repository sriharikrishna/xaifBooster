#ifndef _SYMBOL_INCLUDE_
#define _SYMBOL_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/SymbolKind.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"
#include "xaifBooster/system/inc/SymbolShape.hpp"

namespace xaifBooster { 

  class Symbol : public XMLPrintable,
		 public ObjectWithId,
		 public ObjectWithAnnotation {
  public:
    
    const SymbolKind::SymbolKind_E& getSymbolKind() const;

    const SymbolType::SymbolType_E& getSymbolType() const;

    const SymbolShape::SymbolShape_E& getSymbolShape() const;

    bool getActiveTypeFlag() const;

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    
    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for member myActiveTypeFlag as represented in XAIF schema
     */
    static const std::string our_myActiveTypeFlag_XAIFName;

    /**
     * name for inherited member myTempFlag as represented in XAIF schema
     */
    static const std::string our_myTempFlag_XAIFName;

    /**
     * Destructor.
     * Symbols should only be destroyed through SymbolTable's methods
     * but it is not private because it is used for a hash table template
     */    
    ~Symbol() {};

  private:

    friend class SymbolTable;

    /**
     * Constructor.
     * Symbols can only be created through SymbolTable::addSymbol
     * otherwise we deal with references only
     */      
    Symbol(const std::string& aName, 
	   const SymbolKind::SymbolKind_E& aKind,
	   const SymbolType::SymbolType_E& aType,
	   const SymbolShape::SymbolShape_E& aShape,
	   bool anActiveTypeFlag,
	   bool aTempFlag);

    const SymbolKind::SymbolKind_E myKind;
    const SymbolType::SymbolType_E myType;
    const SymbolShape::SymbolShape_E myShape;

    /**
     * is it an active data type?
     */
    bool myActiveTypeFlag;

    /**
     * is this a temporary variable created by xaifBooster?
     */
    bool myTempFlag;
    
  };
 
} // end of namespace xaifBooster
                                                                     
#endif
