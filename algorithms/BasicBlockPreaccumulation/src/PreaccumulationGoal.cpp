#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationGoal.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  std::string
  PreaccumulationGoal::toString(const PreaccumulationGoal_E& aPreaccumulationGoal)
  throw (PrintingIntException) {
    std::string returnString;
    switch(aPreaccumulationGoal) {
      case OPERATIONS:
        returnString = "operations";
        break;
      case SCARCITY:
        returnString = "scarcity";
        break;
      default: 
        throw PrintingIntException("PreaccumulationGoal::toString: unknown value", aPreaccumulationGoal);
        break;
    } // end switch(aPreaccumulationGoal)
    return returnString;
  } // end PreaccumulationGoal::toString()

  void
  PreaccumulationGoal::checkValid(const PreaccumulationGoal_E& aPreaccumulationGoal) {
    switch(aPreaccumulationGoal) {
      case OPERATIONS:
      case SCARCITY:
        break;
      default: 
        THROW_LOGICEXCEPTION_MACRO("PreaccumulationGoal::checkValid: unknown value " << aPreaccumulationGoal);
        break;
    } // end switch(aPreaccumulationGoal)
  } // end PreaccumulationGoal::checkValid()

} // end namespace xaifBoosterBasicBlockPreaccumulation

