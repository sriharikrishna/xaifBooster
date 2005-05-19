#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"

namespace xaifBooster { 

  const std::string Symbol::ourXAIFName("xaif:Symbol");

  const std::string Symbol::our_myId_XAIFName("symbol_id");

  const std::string Symbol::our_myActiveTypeFlag_XAIFName("active");

  const std::string Symbol::our_myTempFlag_XAIFName("temp");

  Symbol::Symbol(const std::string& aName, 
		 const SymbolKind::SymbolKind_E& aKind,
		 const SymbolType::SymbolType_E& aType,
		 const SymbolShape::SymbolShape_E& aShape,
		 bool anActiveTypeFlag,
		 bool aTempFlag) : 
    myKind(aKind),
    myType(aType),
    myShape(aShape),
    myActiveTypeFlag(anActiveTypeFlag),
    myTempFlag(aTempFlag) {
    setId(aName);
  }

  void Symbol::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << SymbolKind::our_attribute_XAIFName.c_str() 
       << "=\""
       << SymbolKind::toString(myKind).c_str()
       << "\" " 
       << SymbolType::our_attribute_XAIFName.c_str() 
       << "=\""
       << SymbolType::toString(myType).c_str()
       << "\" " 
       << SymbolShape::our_attribute_XAIFName.c_str() 
       << "=\""
       << SymbolShape::toString(myShape).c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\" " 
       << our_myActiveTypeFlag_XAIFName.c_str() 
       << "=\""
       << myActiveTypeFlag
       << "\" " 
       << our_myTempFlag_XAIFName.c_str() 
       << "=\""
       << myTempFlag
       << "\"/>" 
       << std::endl; 
    for (DimensionBoundsPList::const_iterator li=myDimensionBoundsPList.begin();
	 li!=myDimensionBoundsPList.end();
	 ++li)
      (*li)->printXMLHierarchy(os);
    pm.releaseInstance();
  } // end if Symbol::printXMLHierarchy
  
  std::string Symbol::debug () const { 
    std::ostringstream out;
    out << "Symbol[" << this 
	<< ",myName=" << getId() 
	<< ",myKind=" << SymbolKind::toString(myKind) 
	<< ",myType=" << SymbolType::toString(myType) 
	<< ",myShape=" << SymbolShape::toString(myShape)
	<< ",myActiveTypeFlag=" << myActiveTypeFlag
	<< ",myTempFlag=" << myTempFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of Symbol::debug

  const SymbolKind::SymbolKind_E& Symbol::getSymbolKind() const { 
    return myKind; 
  }

  const SymbolType::SymbolType_E& Symbol::getSymbolType() const { 
    return myType; 
  }

  const SymbolShape::SymbolShape_E& Symbol::getSymbolShape() const {
    return myShape;
  }

  bool Symbol::getActiveTypeFlag() const { 
    return myActiveTypeFlag;
  }

  void Symbol::addDimensionBounds(int aLower, 
				  int anUpper) { 
    myDimensionBoundsPList.push_back(new DimensionBounds(aLower,anUpper));
  }

  const Symbol::DimensionBoundsPList& Symbol::getDimensionBoundsPList() const { 
    if (myShape==SymbolShape::SCALAR)
      THROW_LOGICEXCEPTION_MACRO("Symbol::getDimensionBoundsPList: no dimensions for scalar symbols");
    return myDimensionBoundsPList;
  } 

  bool Symbol::hasDimensionBounds()const { 
    return ((myShape==SymbolShape::SCALAR) && !myDimensionBoundsPList.empty() ? true:false);
  } 

} // end of namespace xaifBooster 
