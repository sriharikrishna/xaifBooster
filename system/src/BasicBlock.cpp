#include <sstream>
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"

namespace xaifBooster { 

  BasicBlock::BasicBlock(Scope& theScope) : 
    PlainBasicBlock(theScope) {
    myBasicBlockAlgBase_p=BasicBlockAlgFactory::instance()->makeNewAlg(*this);
  }

  BasicBlock::~BasicBlock() {
    if (myBasicBlockAlgBase_p)
      delete myBasicBlockAlgBase_p;
  }

  BasicBlockAlgBase&
  BasicBlock::getBasicBlockAlgBase() {
    if (!myBasicBlockAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlock::getBasicBlockAlgBase: not set");
    return *myBasicBlockAlgBase_p;
  }

  const BasicBlockAlgBase&
  BasicBlock::getBasicBlockAlgBase() const {
    if (!myBasicBlockAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlock::getBasicBlockAlgBase: not set");
    return *myBasicBlockAlgBase_p;
  }

  void
  BasicBlock::printXMLHierarchy(std::ostream& os) const { 
    getBasicBlockAlgBase().printXMLHierarchy(os);
  } // end of BasicBlock::printXMLHierarchy

  std::string BasicBlock::debug () const { 
    return PlainBasicBlock::debug();
  } // end of BasicBlock::debug

  void BasicBlock::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getBasicBlockAlgBase().genericTraversal(anAction_c);
    std::list<BasicBlockElement*>::iterator li=myElementList.begin();
    for (;li!=myElementList.end();li++)
      (*(li))->genericTraversal(anAction_c);
  } 
  
} // end of namespace xaifBooster 
