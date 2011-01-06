// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/FindDefinitionResult.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"
#include "xaifBooster/system/inc/ForLoopAlgFactory.hpp"

namespace xaifBooster { 

  const std::string ForLoop::ourXAIFName("xaif:ForLoop");

  const std::string ForLoop::our_myId_XAIFName("vertex_id");

  ForLoop::ForLoop(const ForLoopReversalType::ForLoopReversalType_E theUserReversalType) : 
    myInitialization(true),
    myUpdate(true) { 
    myReversalType=theUserReversalType;
    myControlFlowGraphVertexAlgBase_p=ForLoopAlgFactory::instance()->makeNewAlg(*this);
  }
                                                                                
  ForLoop::~ForLoop() {
    if (myControlFlowGraphVertexAlgBase_p) delete myControlFlowGraphVertexAlgBase_p;
  }

  void
  ForLoop::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\" " 
       << ForLoopReversalType::our_attribute_XAIFName.c_str() 
       << "=\""
       << ForLoopReversalType::toString(myReversalType).c_str()
       << "\">" 
       << std::endl;
    myInitialization.printXMLHierarchy(os);
    myCondition.printXMLHierarchy(os);
    myUpdate.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of ForLoop::printXMLHierarchy

  std::string ForLoop::debug () const { 
    std::ostringstream out;
    out << "ForLoop[" << this 
	<< ControlFlowGraphVertex::debug().c_str()
	<< ObjectWithLineNumber::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of ForLoop::debug

  Initialization& ForLoop::getInitialization() { 
    return myInitialization;
  } 

  const Initialization& ForLoop::getInitialization() const { 
    return myInitialization;
  } 

  Condition& ForLoop::getCondition() { 
    return myCondition;
  } 

  const Condition& ForLoop::getCondition() const { 
    return myCondition;
  } 

  Update& ForLoop::getUpdate() { 
    return myUpdate;
  } 

  const Update& ForLoop::getUpdate() const { 
    return myUpdate;
  } 

  ForLoopAlgBase&
  ForLoop::getForLoopAlgBase() const {
    if (!myControlFlowGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ForLoop::getControlFlowGraphVertexAlgBase: not set");
    return dynamic_cast<ForLoopAlgBase&>(*myControlFlowGraphVertexAlgBase_p);
  }

  bool 
  ForLoop::hasStatement(const ObjectWithId::Id& aStatementId) const { 
    bool found=false;
    if (getInitialization().getAssignment().getId()==aStatementId)
      found=true;
    if (getUpdate().getAssignment().getId()==aStatementId) { 
      if (found)
	THROW_LOGICEXCEPTION_MACRO("ForLoop::hasStatement: duplicate id " << aStatementId.c_str() << " in loop with id " << getId().c_str());
      found=true;
    }
    return found; 
  } 

  void 
  ForLoop::addLoopVariable() { 
    myKnownLoopVariables.push_back(&(getInitialization().
				     getAssignment().
				     getLHS()));
  }

  FindDefinitionResult ForLoop::findDefinition(const ObjectWithId::Id& aStatementId) const { 
    if (aStatementId==getInitialization().getAssignment().getId())
      return FindDefinitionResult(&(getInitialization().getAssignment()));
    if (aStatementId==getUpdate().getAssignment().getId())
      return FindDefinitionResult(&(getUpdate().getAssignment()));
    return FindDefinitionResult(0);
  }

} // end of namespace xaifBooster 
