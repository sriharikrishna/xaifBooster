#include "xaifBooster/system/inc/BaseAlias.hpp"

namespace xaifBooster { 
  
  bool BaseAlias::isGreaterThan(const BaseAlias& theOther) const { 
    return (max()<theOther.min() ? true:false);
  } // end of BaseAlias::isGreaterThan

  bool BaseAlias::isContainedIn(const BaseAlias& theOther) const { 
    return (max()<=theOther.max() && min()>=theOther.min() ?
	    true:false);
  } // end of BaseAlias::isGreaterThan

  bool BaseAlias::overlapsWith(const BaseAlias& theOther) const { 
    if (((min()<=theOther.max() && max()>theOther.max())
	 || 
	 (max()>=theOther.min() && min()<theOther.min())) 
	&&
	min()!=max())
      return true;
    return false;
  } // end of BaseAlias::overlapsWith

  void BaseAlias::add(const BaseAlias& theOther) { 
    if (theOther.min()<min())
      min(theOther.min());
    if (theOther.max()>max())
      max(theOther.max());
  } // end of BaseAlias::add

}
