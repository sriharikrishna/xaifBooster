#include "utils/inc/LogicException.hpp"
#include "utils/inc/PrintManager.hpp"
// UN: add later #include "system/inc/ConceptuallyStaticInstances.hpp"
#include "system/inc/Intrinsic.hpp"
#include "system/inc/IntrinsicAlgFactory.hpp"

namespace xaifBooster { 

  const std::string Intrinsic::ourXAIFName("xaif:Intrinsic");
  const std::string Intrinsic::our_myName_XAIFName("name");
  const std::string Intrinsic::our_myId_XAIFName("vertex_id");

  Intrinsic::Intrinsic(const std::string& aName, bool hasAlgorithm) :
      myName(aName) {
    myIntrinsicAlgBase_p=0;
    if (hasAlgorithm)
      myIntrinsicAlgBase_p=IntrinsicAlgFactory::instance()->makeNewAlg(*this);
  }

  void Intrinsic::copyMyselfInto(Intrinsic& theCopy) const {
    theCopy.setId(getId());
  } // end copyMyselfInto

  ExpressionVertex& Intrinsic::createCopyOfMyself(bool withAlgorithm) const { 
    Intrinsic* aNewIntrinsic_p=new Intrinsic(myName,withAlgorithm);
    aNewIntrinsic_p->setId(getId());
    return *aNewIntrinsic_p;
  } 

  std::string Intrinsic::equivalenceSignature() const { 
    std::ostringstream oss;
    oss << "Intrinsic::" << myName.c_str() << std::ends;
    return std::string(oss.str());
  }

  std::string Intrinsic::debug() const { 
    std::ostringstream oss;
    oss << "Intrinsic[" << this << "," 
	<< ExpressionVertex::debug().c_str()
	<< "myName=" << myName.c_str()
	<< "]" << std::ends;
    return std::string(oss.str());
  }

/* UN: add later
  const InlinableIntrinsicsCatalogueItem&
  Intrinsic::getInlinableIntrinsicsCatalogueItem() const { 
    return ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue().getElement(myName);
  } 
*/

  /*
   * if there is an algorithm, then let it decide what to print;
   * otherwise call the local implementation
   */
  void
  Intrinsic::printXMLHierarchy(std::ostream& os) const {
    if (myIntrinsicAlgBase_p)
      myIntrinsicAlgBase_p->printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of printXMLHierarchy


  void Intrinsic::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << our_myName_XAIFName
       << "=\""
       << myName.c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } 

  IntrinsicAlgBase&
  Intrinsic::getIntrinsicAlgBase() {
    if (!myIntrinsicAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Intrinsic::getIntrinsicAlgBase: not set"); 
    return *myIntrinsicAlgBase_p;
  } // end getIntrinsicAlgBase

  const IntrinsicAlgBase&
  Intrinsic::getIntrinsicAlgBase() const {
    if (!myIntrinsicAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Intrinsic::getIntrinsicAlgBase: not set");
    return *myIntrinsicAlgBase_p;
  } // end getIntrinsicAlgBase

  void Intrinsic::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getIntrinsicAlgBase().genericTraversal(anAction_c);
  } // end traversalToChildren 

} // end of namespace 
