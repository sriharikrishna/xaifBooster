#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  VertexIdentificationList::VertexIdentificationList() { 
  } 

  std::string VertexIdentificationList::debug () const { 
    std::ostringstream out;
    out << "VertexIdentificationList[" << this;
    out << "]" << std::ends;
    return out.str();
  } // end of Symbol::debug

  VertexIdentificationList::ListItem::ListItem() : 
    myAliasMapKey_p(0) { 
  }

} // end of namespace 

