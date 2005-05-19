#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ConcreteArgument.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ConcreteArgumentAlg.hpp"

namespace xaifBoosterLinearization {  

  ConcreteArgumentAlg::ConcreteArgumentAlg(const ConcreteArgument& theContainingConcreteArgument) : 
    ConcreteArgumentAlgBase(theContainingConcreteArgument),
    myReplacement_p(0) { 
  }

  ConcreteArgumentAlg::~ConcreteArgumentAlg() { 
    if (myReplacement_p)
      delete myReplacement_p;
  } 

  void ConcreteArgumentAlg::printXMLHierarchy(std::ostream& os) const { 
    if (myReplacement_p)
      myReplacement_p->printXMLHierarchyImpl(os);
    else
      getContaining().printXMLHierarchyImpl(os);
  }

  std::string 
  ConcreteArgumentAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::ConcreteArgumentAlg["
	<< this 
	<< ","
 	<< ConcreteArgumentAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void ConcreteArgumentAlg::makeReplacement(const Variable& aVariable) { 
    if(myReplacement_p)
      THROW_LOGICEXCEPTION_MACRO("ConcreteArgumentAlg::makeReplacement : already have a replacement");
    myReplacement_p=new ConcreteArgument(getContaining().getPosition());
    aVariable.copyMyselfInto(myReplacement_p->getVariable());
  }
  
} // end of namespace 
