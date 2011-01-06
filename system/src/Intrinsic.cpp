// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/IntrinsicAlgFactory.hpp"

namespace xaifBooster { 

  const std::string Intrinsic::ourXAIFName("xaif:Intrinsic");
  const std::string Intrinsic::our_myName_XAIFName("name");
  const std::string Intrinsic::our_myId_XAIFName("vertex_id");

  Intrinsic::Intrinsic(const std::string& aName, bool makeAlgorithm) :
    myName(aName) {
    myExpressionVertexAlgBase_p=0;
    if (makeAlgorithm)
      myExpressionVertexAlgBase_p=IntrinsicAlgFactory::instance()->makeNewAlg(*this);
  }

  ExpressionVertex& Intrinsic::createCopyOfMyself(bool withAlgorithm) const { 
    Intrinsic* aNewIntrinsic_p=new Intrinsic(myName,withAlgorithm);
    aNewIntrinsic_p->setId(getId());
    if (annotationIsSet())
      aNewIntrinsic_p->setAnnotation(getAnnotation());
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

  const InlinableIntrinsicsCatalogueItem&
  Intrinsic::getInlinableIntrinsicsCatalogueItem() const { 
    return ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue().getElement(myName);
  } 

  void
  Intrinsic::printXMLHierarchy(std::ostream& os) const {
    if (myExpressionVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getIntrinsicAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of printXMLHierarchy

  void Intrinsic::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" ";
    if (annotationIsSet())
      os << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str()
	 << "=\""
	 << getAnnotation().c_str()
	 << "\" "; 
    os << our_myName_XAIFName.c_str()
       << "=\""
       << myName.c_str()
       << "\""
       << "/>" 
       << std::endl; 
    pm.releaseInstance();
  } 

  IntrinsicAlgBase&
  Intrinsic::getIntrinsicAlgBase() const {
    if (!myExpressionVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Intrinsic::getIntrinsicAlgBase: not set");
    return dynamic_cast<IntrinsicAlgBase&>(*myExpressionVertexAlgBase_p);
  } 

  void Intrinsic::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getIntrinsicAlgBase().genericTraversal(anAction_c);
  } 

  const std::string& Intrinsic::getName() const { 
    return myName;
  } 

  bool Intrinsic::isNonSmooth() const { 
    return getInlinableIntrinsicsCatalogueItem().isNonSmooth();
  }

  bool Intrinsic::isIntrinsic() const {
    return true;
  }

} // end of namespace 
