#ifndef  _ALGBASE_INCLUDE_
#include "system/inc/AlgBase.hpp"
#endif

namespace xaifBooster {  

  template <class AlgContaining>
  AlgBase<AlgContaining>::AlgBase(const AlgContaining& theContaining) : 
    myContaining(theContaining) { 
  }

  template <class AlgContaining>
  AlgBase<AlgContaining>::~AlgBase(){
  }

  template <class AlgContaining>
  const AlgContaining& 
  AlgBase<AlgContaining>::getContaining() const { 
    return myContaining;
  }

  template <class AlgContaining>
  void AlgBase<AlgContaining>::printXMLHierarchy(std::ostream& os) const { 
    myContaining.printXMLHierarchyImpl(os);
  }

  template <class AlgContaining>
  std::string 
  AlgBase<AlgContaining>::debug() const { 
    return std::string("AlgBase");
  }

  template <class AlgContaining>
  void 
  AlgBase<AlgContaining>::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  }

}
