#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  PrivateLinearizedComputationalGraphVertex::PrivateLinearizedComputationalGraphVertex() : 
    myRHSVariable_p(0), 
    myLHSVariable_p(0) {
  }

  std::string PrivateLinearizedComputationalGraphVertex::debug() const { 
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphVertex[" << this 
	<< "]" << std::ends;  
    return out.str();
  } 

  void PrivateLinearizedComputationalGraphVertex::setRHSVariable(const Variable& aRHSVariable) {
    if (myRHSVariable_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setRHSVariable: already set to "
				 << myRHSVariable_p->debug().c_str()
				 << " while trying to set for " 
				 << aRHSVariable.debug().c_str());
    myRHSVariable_p=&aRHSVariable;
  }

  const Variable& 
  PrivateLinearizedComputationalGraphVertex::getRHSVariable() const { 
    if (!myRHSVariable_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getRHSVariable: not set");
    return *myRHSVariable_p;
  } 

  void PrivateLinearizedComputationalGraphVertex::setLHSVariable(const Variable& aLHSVariable) {
    if (myLHSVariable_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setLHSVariable: already set to "
				 << myLHSVariable_p->debug().c_str()
				 << " while trying to set for " 
				 << aLHSVariable.debug().c_str());
    myLHSVariable_p=&aLHSVariable;
  }

  const Variable& 
  PrivateLinearizedComputationalGraphVertex::getLHSVariable() const { 
    if (!myLHSVariable_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getLHSVariable: not set");
    return *myLHSVariable_p;
  } 

} 
