#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"

namespace xaifBooster { 

  VariableVertex& 
  ArrayAccess::createCopyOfMyself() const { 
    ArrayAccess* theCopy_p=new ArrayAccess();
    for (IndexListType::const_iterator i=myIndexList.begin();
	 i!=myIndexList.end();
	 ++i) { 
      (*i)->copyMyselfInto(theCopy_p->addIndex(),false,false);
    } 
    theCopy_p->setId(getId());
    return *theCopy_p;
  }

  std::string ArrayAccess::equivalenceSignature() const { 
    std::ostringstream oss;
    // JU: incomplete: 
    oss << "ArrayAccess::" << std::ends;
    return std::string(oss.str());
  } 

  const std::string ArrayAccess::ourXAIFName("xaif:ArrayElementReference");
  const std::string ArrayAccess::our_myIndex_XAIFName("xaif:Index");
  const std::string ArrayAccess::our_myId_XAIFName("vertex_id");

  void ArrayAccess::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str() 
       << "\">" 
       << std::endl;
    for (IndexListType::const_iterator i=myIndexList.begin();
	 i!=myIndexList.end();
	 ++i) 
      printXMLHierarchyIndex(os,**i);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance(); 
  } // end ArrayAccess::printXMLHierarchy

  void ArrayAccess::printXMLHierarchyIndex(std::ostream& os,
					   const Expression& theIndex) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << our_myIndex_XAIFName.c_str() 
       << ">" 
       << std::endl;
    theIndex.printXMLHierarchyImpl(os);
    os << pm.indent() 
       << "</"
       << our_myIndex_XAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance(); 
  } // end of ArrayAccess::printXMLHierarchyIndex

  const ArrayAccess::IndexListType& ArrayAccess::getIndexList() const {
    return myIndexList;
  }
  
  ArrayAccess::IndexListType& ArrayAccess::getIndexList() {
    return myIndexList;
  }

  Expression& ArrayAccess::addIndex() {
    Expression* anExpression_p=new Expression();
    myIndexList.push_back(anExpression_p);
    return *anExpression_p;
  }

} 
