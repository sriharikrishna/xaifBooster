#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphEdge.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ReversibleControlFlowGraphEdge::ReversibleControlFlowGraphEdge() : toLoopBody(false), original(false), myOriginalEdge_p(NULL) {}

  ReversibleControlFlowGraphEdge::ReversibleControlFlowGraphEdge(const ControlFlowGraphEdge* theOriginal) : toLoopBody(false), original(true), myOriginalEdge_p(theOriginal) {}

  ReversibleControlFlowGraphEdge::~ReversibleControlFlowGraphEdge() {}

  bool
  ReversibleControlFlowGraphEdge::isBackEdge(const ReversibleControlFlowGraph& theGraph) const {
    if (theGraph.getSourceOf(*this).getIndex()==-1||theGraph.getTargetOf(*this).getIndex()==-1) return false;
    return theGraph.getSourceOf(*this).getIndex()>theGraph.getTargetOf(*this).getIndex();
  }

  bool 
  ReversibleControlFlowGraphEdge::isOriginal() const {
    return original;
  }

  const ControlFlowGraphEdge& 
  ReversibleControlFlowGraphEdge::getOriginalEdge() const {
    return *myOriginalEdge_p;
  }

  const ControlFlowGraphEdge& 
  ReversibleControlFlowGraphEdge::getNewEdge() const {
    return myNewEdge;
  }

  ControlFlowGraphEdge& 
  ReversibleControlFlowGraphEdge::getNewEdge() {
    return myNewEdge;
  }

  bool ReversibleControlFlowGraphEdge::has_condition_value() const {
      if (original)
        return my_has_condition_value;
      else
        return myNewEdge.has_condition_value();
  }

  void ReversibleControlFlowGraphEdge::set_has_condition_value(bool hcv) {
      if (original)
        my_has_condition_value=hcv;
      else 
        myNewEdge.set_has_condition_value(hcv);
  }
                                                                                
  void ReversibleControlFlowGraphEdge::set_condition_value(int cv) {
      if (original)
        my_condition_value=cv;
      else
        myNewEdge.set_condition_value(cv);
  }

  const int& ReversibleControlFlowGraphEdge::get_condition_value() const {
      if (original)
        return my_condition_value;
      else
        return myNewEdge.get_condition_value();
  }

  void
  ReversibleControlFlowGraphEdge::printXMLHierarchy(std::ostream& os, const ReversibleControlFlowGraph& theGraph) const {
    PrintManager& pm=PrintManager::getInstance();
    if (original) {
      os << pm.indent()
       << "<"
       << myOriginalEdge_p->ourXAIFName
       << " "
       << myOriginalEdge_p->our_myId_XAIFName
       << "=\""
       << myOriginalEdge_p->getId().c_str()
       << "\" "
       << myOriginalEdge_p->our_source_XAIFName
       << "=\"";
      const ReversibleControlFlowGraphVertex& src=theGraph.getSourceOf(*this);
      if (src.original)
        os << src.myOriginalVertex_p->getId().c_str();
      else
        os << src.myNewVertex_p->getId().c_str();
      os << "\" " << myOriginalEdge_p->our_target_XAIFName << "=\"";
      const ReversibleControlFlowGraphVertex& tgt = theGraph.getTargetOf(*this);
      if (tgt.original)
        os << tgt.myOriginalVertex_p->getId().c_str();
      else
        os << tgt.myNewVertex_p->getId().c_str();
      os << "\" "
         << myOriginalEdge_p->our_has_condition_value_XAIFName
         << "=\""
         << my_has_condition_value
         << "\" "
         << myOriginalEdge_p->our_condition_value_XAIFName
         << "=\""
         << my_condition_value
         << "\"/>" << std::endl;
    } 
    else {
      os << pm.indent()
       << "<"
       << myNewEdge.ourXAIFName
       << " "
       << myNewEdge.our_myId_XAIFName
       << "=\""
       << myNewEdge.getId().c_str()
       << "\" "
       << myNewEdge.our_source_XAIFName
       << "=\"";
      const ReversibleControlFlowGraphVertex& src=theGraph.getSourceOf(*this);
      if (src.original)
        os << src.myOriginalVertex_p->getId().c_str();
      else
        os << src.myNewVertex_p->getId().c_str();
      os << "\" " << myNewEdge.our_target_XAIFName << "=\"";
      const ReversibleControlFlowGraphVertex& tgt = theGraph.getTargetOf(*this);
      if (tgt.original)
        os << tgt.myOriginalVertex_p->getId().c_str();
      else
        os << tgt.myNewVertex_p->getId().c_str();
      os << "\" "
         << myNewEdge.our_has_condition_value_XAIFName
         << "=\""
         << myNewEdge.has_condition_value()
         << "\" "
         << myNewEdge.our_condition_value_XAIFName
         << "=\""
         << myNewEdge.get_condition_value()
         << "\"/>" << std::endl;
    }
    pm.releaseInstance();
  } // end of ReversibleControlFlowGraphEdge::printXMLHierarchy


  std::string
  ReversibleControlFlowGraphEdge::debug() const {
     std::ostringstream out;
     out << "xaifBoosterControlFlowReversal::ReversibleControlFlowGraphEdge["
        << this
        << "]" << std::ends;
    return out.str();
  }

  void ReversibleControlFlowGraphEdge::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

} // end of namespace

