#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/InOutList.hpp"

namespace xaifBooster { 

  const std::string InOutList::our_InList_XAIFName("xaif:InList");
  const std::string InOutList::our_OutList_XAIFName("xaif:OutList");
  const std::string InOutList::our_Input_XAIFName("xaif:Input");
  const std::string InOutList::our_Output_XAIFName("xaif:Output");

  void
  InOutList::printXMLHierarchy(std::ostream& os) const { 
  } // end of InOutList::printXMLHierarchy

  std::string InOutList::debug () const { 
    std::ostringstream out;
    out << "InOutList[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of InOutList::debug

  InOutList::VarList&
  InOutList::getInList() {
    return myInList;
  }
                                                                                
  const InOutList::VarList&
  InOutList::getInList() const {
    return myInList;
  }

  InOutList::VarList&
  InOutList::getOutList() {
    return myOutList;
  }
                                                                                
  const InOutList::VarList&
  InOutList::getOutList() const {
    return myOutList;
  }


} // end of namespace xaifBooster 
