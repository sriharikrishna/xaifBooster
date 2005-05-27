#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ConcreteArgument.hpp"
#include "xaifBooster/system/inc/ConcreteArgumentAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBooster { 

  const std::string ConcreteArgument::ourXAIFName("xaif:Argument");
  const std::string ConcreteArgument::our_myPosition_XAIFName("position");

  ConcreteArgument::ConcreteArgument (unsigned int thePosition,
				      bool makeAlgorithm) :
    myPosition(thePosition) {
    if (makeAlgorithm)
      myConcreteArgumentAlgBase_p=ConcreteArgumentAlgFactory::instance()->makeNewAlg(*this); 
    else 
      myConcreteArgumentAlgBase_p=0;
  }

  ConcreteArgument::~ConcreteArgument(){
    if (myConcreteArgumentAlgBase_p)
      delete myConcreteArgumentAlgBase_p;
  }

  ConcreteArgumentAlgBase& 
  ConcreteArgument::getConcreteArgumentAlgBase() const { 
    if (!myConcreteArgumentAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgument::getConcreteArgumentAlgBase: not set");
    return dynamic_cast<ConcreteArgumentAlgBase&>(*myConcreteArgumentAlgBase_p);
  }

  void
  ConcreteArgument::printXMLHierarchy(std::ostream& os) const { 
    if (myConcreteArgumentAlgBase_p
// 	&& 
// 	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY
	)
      getConcreteArgumentAlgBase().printXMLHierarchy(os);
    else 
      printXMLHierarchyImpl(os);
  }

  void ConcreteArgument::printXMLHierarchyImpl(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " "
       << our_myPosition_XAIFName.c_str()
       << "=\""
       << myPosition
       << "\">" 
       << std::endl; 
    myVariable.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end if ConcreteArgument::printXMLHierarchy
  
  std::string ConcreteArgument::debug () const { 
    std::ostringstream out;
    out << "ConcreteArgument[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ConcreteArgument::debug

  unsigned int ConcreteArgument::getPosition() const { 
    return myPosition;
  } 
    
  Variable& 
  ConcreteArgument::getVariable() { 
    return myVariable;
  } 

  const Variable& 
  ConcreteArgument::getVariable() const { 
    return myVariable;
  } 

} // end of namespace xaifBooster 
