#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorSaxpy.hpp"

namespace xaifBoosterBasicBlockPreaccumulation { 

  const std::string DerivativePropagatorSaxpy::ourXAIFName("xaif:Saxpy");
  const std::string DerivativePropagatorSaxpy::our_SAX_XAIFName("xaif:Sax");
  const std::string DerivativePropagatorSaxpy::our_myA_XAIFName("xaif:A");
  const std::string DerivativePropagatorSaxpy::our_myX_XAIFName("xaif:X");
  const std::string DerivativePropagatorSaxpy::our_myY_XAIFName("xaif:Y");
  const std::string DerivativePropagatorSaxpy::our_myAX_XAIFName("xaif:AX");

  DerivativePropagatorSaxpy::DerivativePropagatorSaxpy(const Variable& theA,
						       const Variable& theX,
						       const Variable& theY) : 
    useAsSaxFlag(false) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    Variable* theVariable_p=new Variable();
    theVariable_p->setId(1);
    theAX_p->myA.supplyAndAddVertexInstance(*theVariable_p);
    theA.copyMyselfInto(theVariable_p->getVariable());
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
    theY.copyMyselfInto(myY);
    myY.setId(1);
    myY.setDerivFlag();
  }

  void DerivativePropagatorSaxpy::addAX(const Variable& theA,
					const Variable& theX) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    Variable* theVariable_p=new Variable();
    theVariable_p->setId(1);
    theAX_p->myA.supplyAndAddVertexInstance(*theVariable_p);
    theA.copyMyselfInto(theVariable_p->getVariable());
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
  } 

  DerivativePropagatorSaxpy::DerivativePropagatorSaxpy(const Constant& theA,
						       const Variable& theX,
						       const Variable& theY) : 
    useAsSaxFlag(false) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    ExpressionVertex& theConstant(theA.createCopyOfMyself());
    theAX_p->myA.supplyAndAddVertexInstance(theConstant);
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
    theY.copyMyselfInto(myY);
    myY.setId(1);
    myY.setDerivFlag();
  }


  void DerivativePropagatorSaxpy::addAX(const Constant& theA,
					const Variable& theX) { 
    AX* theAX_p=new AX();
    myAXPList.push_back(theAX_p);
    ExpressionVertex& theConstant(theA.createCopyOfMyself());
    theAX_p->myA.supplyAndAddVertexInstance(theConstant);
    theX.copyMyselfInto(theAX_p->myX);
    theAX_p->myX.setId(1);
    theAX_p->myX.setDerivFlag();
  } 
  
  DerivativePropagatorSaxpy::~DerivativePropagatorSaxpy() { 
    for (AXPList::iterator i=myAXPList.begin();
	 i!=myAXPList.end();
	 ++i) 
      if (*i)
	delete *i;
  } 

  void DerivativePropagatorSaxpy::useAsSax() { 
    useAsSaxFlag=true;
  }

  void
  DerivativePropagatorSaxpy::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"; 
    if (useAsSaxFlag) 
      os << our_SAX_XAIFName.c_str();
    else
      os << ourXAIFName.c_str(); 
    os << ">" 
       << std::endl; 
    for (AXPList::const_iterator i=myAXPList.begin();
	 i!=myAXPList.end();
	 ++i) 
      printAXMemberXMLHierarchy(**i,os);
    printMemberXMLHierarchy(myY,our_myY_XAIFName,os);
    os << pm.indent() 
       << "</";
    if (useAsSaxFlag) 
      os << our_SAX_XAIFName.c_str();
    else
      os << ourXAIFName.c_str(); 
    os << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  void
  DerivativePropagatorSaxpy::printAXMemberXMLHierarchy(const AX& theAX,
						       std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myAX_XAIFName.c_str()
       << ">" 
       << std::endl; 
    printMemberXMLHierarchy(theAX.myA,our_myA_XAIFName,os);
    printMemberXMLHierarchy(theAX.myX,our_myX_XAIFName,os);
    os << pm.indent() 
       << "</"
       << our_myAX_XAIFName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  void
  DerivativePropagatorSaxpy::printMemberXMLHierarchy(const Variable& theVariable,
						     const std::string& aName,
						     std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << aName.c_str() 
       << " "
       << Variable::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << theVariable.getDerivFlag()
       << "\""
       << ">" 
       << std::endl; 
    theVariable.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << aName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  void
  DerivativePropagatorSaxpy::printMemberXMLHierarchy(const Expression& theA,
						     const std::string& aName,
						     std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << aName.c_str() 
       << ">" 
       << std::endl; 
    theA.printXMLHierarchyImpl(os);
    os << pm.indent() 
       << "</"
       << aName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSaxpy::printXMLHierarchy

  std::string DerivativePropagatorSaxpy::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagatorSaxpy[" << this 
      // 	<< ", myA=" << myA.debug()
      // 	<< ", myX=" << myX.debug()
	<< ", myY=" << myY.debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagatorSaxpy::debug

}
