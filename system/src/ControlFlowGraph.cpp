#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgFactory.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraph::ourXAIFName("xaif:ControlFlowGraph");
  const std::string ControlFlowGraph::our_myId_XAIFName("vertex_id");
  const std::string ControlFlowGraph::our_myActiveFlag_XAIFName("active");

  ControlFlowGraph::ControlFlowGraph (const Symbol& theSymbol,
				      const Scope& theScope,
				      const Scope& theCFGScope,
				      const bool activeFlag) :
    ControlFlowGraphCommonAttributes(theSymbol,theScope,theCFGScope),
    myActiveFlag(activeFlag) { 
    myControlFlowGraphAlgBase_p=ControlFlowGraphAlgFactory::instance()->makeNewAlg(*this);
  } 

  ControlFlowGraph::~ControlFlowGraph() { 
    if (myControlFlowGraphAlgBase_p) delete myControlFlowGraphAlgBase_p;
  } 

  void
  ControlFlowGraph::printXMLHierarchy(std::ostream& os) const { 
    if (myControlFlowGraphAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getControlFlowGraphAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of ControlFlowGraph::printXMLHierarchy

  void
  ControlFlowGraph::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " ";
    printAttributes(os);
    os << " " 
       << our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << myActiveFlag
       << "\">" 
       << std::endl;
    myArgumentList.printXMLHierarchy(os);
    myModLocalList.printXMLHierarchy(SideEffectListType::our_ModLocal_XAIFName,
				     os);
    myModList.printXMLHierarchy(SideEffectListType::our_Mod_XAIFName,
				os);
    myReadLocalList.printXMLHierarchy(SideEffectListType::our_ReadLocal_XAIFName,
				      os);
    myReadList.printXMLHierarchy(SideEffectListType::our_Read_XAIFName,
				 os);
    ControlFlowGraph::ConstVertexIteratorPair p(vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ControlFlowGraph::ConstEdgeIteratorPair pe=edges();
    ControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte)
      (*beginIte).printXMLHierarchy(os,
				    *this);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ControlFlowGraph::printXMLHierarchyImpl

  std::string ControlFlowGraph::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraph[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraph::debug

  ControlFlowGraphAlgBase&
  ControlFlowGraph::getControlFlowGraphAlgBase() {
    if (!myControlFlowGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getControlFlowGraphAlgBase: not set");
    return *myControlFlowGraphAlgBase_p;
  }
                                                                                
  const ControlFlowGraphAlgBase&
  ControlFlowGraph::getControlFlowGraphAlgBase() const {
    if (!myControlFlowGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getControlFlowGraphAlgBase: not set");
    return *myControlFlowGraphAlgBase_p;
  }

  void ControlFlowGraph::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getControlFlowGraphAlgBase().genericTraversal(anAction_c);
    myArgumentList.genericTraversal(anAction_c);
    GraphWrapperTraversable<ControlFlowGraphVertex,ControlFlowGraphEdge>::traverseToChildren(anAction_c);
  }
  
  const bool& 
  ControlFlowGraph::getActiveFlag() const { 
    return myActiveFlag;
  } 

  ArgumentList& 
  ControlFlowGraph::getArgumentList() { 
    return myArgumentList;
  } 
  
  const ArgumentList& 
  ControlFlowGraph::getArgumentList() const { 
    return myArgumentList;
  } 
  
  // non-const return is a temporary hack
  Scope& ControlFlowGraph::getScope() const { 
    return const_cast<Scope&>(myScope);
  }

  // uncomment this when the above is fixed
  // Scope& ControlFlowGraph::getScope() { 
  //   return myArgumentList.getScope();
  // }

  Variable& ControlFlowGraph::addSideEffectReference(SideEffectListType::SideEffectListType_E aType) { 
    return getSideEffectList(aType).addSideEffectReference();
  }

  SideEffectList& ControlFlowGraph::getSideEffectList(SideEffectListType::SideEffectListType_E aType) { 
    SideEffectList* aSideEffectList_p=0;
    switch(aType) { 
    case SideEffectListType::MOD_LIST : 
      aSideEffectList_p=&myModList;
      break;
    case SideEffectListType::MOD_LOCAL_LIST : 
      aSideEffectList_p=&myModLocalList;
      break;
    case SideEffectListType::READ_LIST : 
      aSideEffectList_p=&myReadList;
      break;
    case SideEffectListType::READ_LOCAL_LIST : 
      aSideEffectList_p=&myReadLocalList;
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getSideEffectList: unknown list type >" << aType << "<.");
      break;
    }
    return  *aSideEffectList_p;
  }

  const SideEffectList& ControlFlowGraph::getSideEffectList(SideEffectListType::SideEffectListType_E aType) const { 
    const SideEffectList* aSideEffectList_p=0;
    switch(aType) { 
    case SideEffectListType::MOD_LIST : 
      aSideEffectList_p=&myModList;
      break;
    case SideEffectListType::MOD_LOCAL_LIST : 
      aSideEffectList_p=&myModLocalList;
      break;
    case SideEffectListType::READ_LIST : 
      aSideEffectList_p=&myReadList;
      break;
    case SideEffectListType::READ_LOCAL_LIST : 
      aSideEffectList_p=&myReadLocalList;
      break;
    default:
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getSideEffectList: unknown list type >" << aType << "<.");
      break;
    }
    return  *aSideEffectList_p;
  }

} // end of namespace xaifBooster 
