#ifndef _SYMBOLTABLE_INCLUDE_
#define _SYMBOLTABLE_INCLUDE_

#include "utils/inc/HashTable.hpp"
#include "utils/inc/XMLPrintable.hpp"
#include "utils/inc/NameCreator.hpp"
#include "system/inc/Symbol.hpp"

namespace xaifBooster { 

  class SymbolTable : public HashTable<Symbol>,
		      public XMLPrintable {
  public:
    
    SymbolTable();

    ~SymbolTable() {};

    /**
     * adds the symbol to the table, 
     */
    Symbol&  addSymbol(const std::string& aName, 
		       const SymbolKind::SymbolKind_E& aKind,
		       const SymbolType::SymbolType_E& aType,
		       const SymbolShape::SymbolShape_E& aShape,
		       bool anActiveTypeFlag,
		       bool aTempFlag);

    const Symbol&  addUniqueAuxSymbol(const SymbolKind::SymbolKind_E& aKind,
				      const SymbolType::SymbolType_E& aType,
				      const SymbolShape::SymbolShape_E& aShape,
				      bool anActiveTypeFlag);

    std::string debug() const ; 

    void printXMLHierarchy(std::ostream& os) const; 

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

  private:

    NameCreator myNameCreator;

  }; // end of class SymbolTable

} // end of namespace 
                                                                     
#endif
