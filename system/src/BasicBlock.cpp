#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/Scope.hpp"

namespace xaifBooster { 

  BasicBlock::BasicBlock(Scope& theScope) : 
    PlainBasicBlock(theScope) { 
    myControlFlowGraphVertexAlgBase_p=BasicBlockAlgFactory::instance()->makeNewAlg(*this);
  }

  BasicBlock::~BasicBlock() {
    if (myControlFlowGraphVertexAlgBase_p) delete myControlFlowGraphVertexAlgBase_p;
  }

  BasicBlockAlgBase&
  BasicBlock::getBasicBlockAlgBase() const {
    if (!myControlFlowGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlock::getControlFlowGraphVertexAlgBase: not set");
    return dynamic_cast<BasicBlockAlgBase&>(*myControlFlowGraphVertexAlgBase_p);
  }

  void
  BasicBlock::printXMLHierarchy(std::ostream& os) const { 
    if (myControlFlowGraphVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getBasicBlockAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of BasicBlock::printXMLHierarchy

  void
  BasicBlock::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName
       << " "
       << our_myId_XAIFName
       << "=\""
       << getId().c_str()
       << "\" "
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str()
       << "=\""
       << getAnnotation().c_str()
       << "\" "
       << PlainBasicBlock::our_myScopeId_XAIFName.c_str()
       << "=\""
       << PlainBasicBlock::myScope_r.getId().c_str()
       << "\">"
       << std::endl;
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=myElementList.begin();
         li!=myElementList.end();
         li++)
      (*(li))->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of BasicBlock::printXMLHierarchyImpl

  std::string BasicBlock::debug () const { 
    std::ostringstream out;
    out << "BasicBlock[" << this 
	<< PlainBasicBlock::debug().c_str()
	<< ControlFlowGraphVertex::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlock::debug

  void BasicBlock::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getBasicBlockAlgBase().genericTraversal(anAction_c);
    std::list<BasicBlockElement*>::iterator li=myElementList.begin();
    for (;li!=myElementList.end();li++)
      (*(li))->genericTraversal(anAction_c);
  } 
  
} // end of namespace xaifBooster 
