#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/ConstantAlgFactory.hpp"

namespace xaifBooster { 

  const std::string Constant::ourXAIFName("xaif:Constant");
  const std::string Constant::our_myType_XAIFName("type");
  const std::string Constant::our_myValue_XAIFName("value");
  const std::string Constant::our_myId_XAIFName("vertex_id");

  Constant::Constant(const SymbolType::SymbolType_E aType, 
		     bool makeAlgorithm) : 
    BaseConstant(aType) {
    if (makeAlgorithm)
      myExpressionVertexAlgBase_p=ConstantAlgFactory::instance()->makeNewAlg(*this); 
  }

  std::string Constant::debug () const { 
    std::ostringstream out;
    out << "Constant[" << this 
	<< ExpressionVertex::debug()
	<< ","
	<< BaseConstant::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of ExpressionVertex::debug

  ExpressionVertex& Constant::createCopyOfMyself(bool withAlgorithm) const { 
    Constant* aNewConstant_p=new Constant(myType);
    switch(myType) { 
    case SymbolType::INTEGER_STYPE : 
	aNewConstant_p->setint(getint());
	break;
    case SymbolType::REAL_STYPE : 
	aNewConstant_p->setfloat(getfloat());
	break;
    case SymbolType::BOOL_STYPE : 
	aNewConstant_p->setbool(getbool());
	break;
    case SymbolType::STRING_STYPE : 
	aNewConstant_p->setFromString(toString());
	break;
    case SymbolType::CHAR_STYPE : 
	aNewConstant_p->setchar(getchar());
	break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("Constant::createCopyOfMyself: cannot handle " <<
				 SymbolType::toString(myType).c_str());
      break;
    } // end switch
    aNewConstant_p->setId(getId());
    //    aNewConstant_p->passivate();
    return *aNewConstant_p;
  } 
  
  std::string Constant::equivalenceSignature() const { 
    std::ostringstream oss;
    oss << "Constant::" <<  SymbolType::toString(myType) << ",";
    oss << toString().c_str();
    return std::string(oss.str());
  } 

  void
  Constant::printXMLHierarchy(std::ostream& os) const {
    if (myExpressionVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getConstantAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of printXMLHierarchy

  void Constant::printXMLHierarchyImpl(std::ostream& os) const { 
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
       << SymbolType::toString(myType).c_str()
       << "\" " 
       << our_myValue_XAIFName
       << "=\""
       << toString().c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } 

  ConstantAlgBase&
  Constant::getConstantAlgBase() const {
    if (!myExpressionVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Constant::getConstantAlgBase: not set");
    return dynamic_cast<ConstantAlgBase&>(*myExpressionVertexAlgBase_p);
  } 

  void Constant::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getConstantAlgBase().genericTraversal(anAction_c);
  } 


} // end of namespace 
