#include "utils/inc/LogicException.hpp"
#include "utils/inc/PrintManager.hpp"
#include "system/inc/BooleanOperation.hpp"

namespace xaifBooster { 

  const std::string BooleanOperation::ourXAIFName("xaif:BooleanOperation");
  const std::string BooleanOperation::our_myType_XAIFName("name");
  const std::string BooleanOperation::our_myId_XAIFName("vertex_id");

  BooleanOperation::BooleanOperation(BooleanOperationType::BooleanOperationType_E theType) :
    myType(theType) {
  }

  ExpressionVertex& BooleanOperation::createCopyOfMyself(bool withAlgorithm) const { 
    BooleanOperation* aNewBooleanOperation_p=new BooleanOperation(myType);
//     aNewBooleanOperation_p->setId(getId());
//     if (!isActive())
//       aNewBooleanOperation_p->passivate();
    return *aNewBooleanOperation_p;
  } 

  std::string BooleanOperation::equivalenceSignature() const { 
    std::ostringstream oss;
    oss << "BooleanOperation::" 
	<< BooleanOperationType::toString(myType).c_str() 
	<< std::ends;
    return std::string(oss.str());
  }

  std::string BooleanOperation::debug() const { 
    std::ostringstream oss;
    oss << "BooleanOperation[" << this << "," 
	<< ExpressionVertex::debug().c_str()
	<< "myType=" << BooleanOperationType::toString(myType).c_str()
	<< "]" << std::ends;
    return std::string(oss.str());
  }

  void BooleanOperation::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << our_myType_XAIFName
       << "=\""
       << BooleanOperationType::toString(myType).c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } 

} // end of namespace 
