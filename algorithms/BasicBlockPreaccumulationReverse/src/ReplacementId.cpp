#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/ReplacementId.hpp"

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  ReplacementId::ReplacementId() : myCurrent(ORIGINAL) { 
  }

  std::string 
  ReplacementId::toString(const ReplacementId_E& aKind)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aKind) {
    case ORIGINAL:
      returnString="ORIGINAL";
      break;
    case TAPING: 
      returnString="TAPING";
    case ADJOINT: 
      returnString="ADJOINT";
    case STOREARGUMENT: 
      returnString="STOREARGUMENT";
    case STORERESULT: 
      returnString="STORERESULT";
    case RESTOREARGUMENT: 
      returnString="RESTOREARGUMENT";
    case RESTORERESULT: 
      returnString="RESTORERESULT";
      break;
    default: 
      throw PrintingIntException("ReplacementId::toString: unknown value",aKind);
      break;
    } // end switch
    return returnString;
  } // end of std::string ReplacementId::toString

  const ReplacementId::ReplacementId_E
  ReplacementId::fromString(const std::string& aName) { 
    ReplacementId_E returnValue;
    if (aName=="ORIGINAL")
      returnValue=ORIGINAL;
    else if (aName=="TAPING")
      returnValue=TAPING;
    else if (aName=="ADJOINT")
      returnValue=ADJOINT;
    else if (aName=="STOREARGUMENT")
      returnValue=STOREARGUMENT;
    else if (aName=="STORERESULT")
      returnValue=STORERESULT;
    else if (aName=="RESTOREARGUMENT")
      returnValue=RESTOREARGUMENT;
    else if (aName=="RESTORERESULT")
      returnValue=RESTORERESULT;
    else  
      THROW_LOGICEXCEPTION_MACRO("ReplacementId::fromString: unknown value >"
			   << aName.c_str() << "<");
    return returnValue;
  } // end of std::string ReplacementId::fromString
  
  void ReplacementId::reset() { 
    myCurrent=ORIGINAL;
  } 

  bool ReplacementId::atEnd() {
    return (myCurrent>RESTORERESULT);
  } 

  ReplacementId::ReplacementId_E ReplacementId::operator*() const { 
    return myCurrent;
  } 

  ReplacementId& ReplacementId::operator++() { 
    myCurrent=(ReplacementId::ReplacementId_E)(((int)myCurrent)+1);
    return *this;
  } 

} // end of namespace
