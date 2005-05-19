#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/SymbolTable.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

namespace xaifBooster { 

  const std::string SymbolTable::ourXAIFName("xaif:SymbolTable");
  
  SymbolTable::SymbolTable() { 
  } // end of SymbolTable::SymbolTable

  Symbol& 
  SymbolTable::addSymbol(const std::string& aName, 
			 const SymbolKind::SymbolKind_E& aKind,
			 const SymbolType::SymbolType_E& aType,
			 const SymbolShape::SymbolShape_E& aShape,
			 bool anActiveTypeFlag,
			 bool aTempFlag) { 
    std::pair<InternalHashMapType::iterator,bool> 
      thePair(myHashMap.insert(std::make_pair(aName,Symbol(aName,
							   aKind,
							   aType,
							   aShape,
							   anActiveTypeFlag,
							   aTempFlag))));

    if (!thePair.second)
      // JU: ?      if (myHashMap_iterator.second!=aSymbol)
      // not sure about the use case here. 
      THROW_LOGICEXCEPTION_MACRO(debug().c_str() << "::addSymbol new" << 
			   Symbol(aName,
				  aKind,
				  aType,
				  aShape,
				  anActiveTypeFlag,
				  aTempFlag).debug().c_str() << 
			   " colliding with existing " <<
			   (*(thePair.first)).second.debug().c_str());
    return (*(thePair.first)).second;
  } // end of SymbolTable::addSymbol

  Symbol&  
  SymbolTable::addUniqueAuxSymbol(const SymbolKind::SymbolKind_E& aKind,
				  const SymbolType::SymbolType_E& aType,
				  const SymbolShape::SymbolShape_E& aShape,
				  bool anActiveTypeFlag) { 
    // use a unique name
    std::string aName(ConceptuallyStaticInstances::instance()->getNameCreator().makeName());
    Symbol& theSymbol(addSymbol(aName,
				aKind,
				aType,
				aShape,
				anActiveTypeFlag,
				true));
    theSymbol.setAnnotation("");
    return theSymbol; 
  } 

  std::string SymbolTable::debug() const {
    std::ostringstream out;
    out << "SymbolTable[" << this 
	<< "," << HashTable<Symbol>::debug() 
	<< "]" << std::ends; 
    return out.str();
  } // end of SymbolTable::debug
  
  void SymbolTable::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(InternalHashMapType::const_iterator myHashMap_iterator=myHashMap.begin();
	myHashMap_iterator!=myHashMap.end();
	myHashMap_iterator++)
      (*myHashMap_iterator).second.printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } 

} 
