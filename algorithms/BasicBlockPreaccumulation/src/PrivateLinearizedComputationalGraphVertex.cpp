#include "PrivateLinearizedComputationalGraphVertex.hpp"
#include "LogicException.hpp"
#include "BaseVariableReference.hpp"

namespace xaifBooster { 

  PrivateLinearizedComputationalGraphVertex::PrivateLinearizedComputationalGraphVertex() : 
    myRHSBaseVariableReference_p(0), 
    myLHSBaseVariableReference_p(0) {
  }

  std::string PrivateLinearizedComputationalGraphVertex::debug() const { 
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphVertex[" << this 
	<< "]" << std::ends;  
    return out.str();
  } 

  void PrivateLinearizedComputationalGraphVertex::setRHSBaseVariableReference(const BaseVariableReference& aRHSBaseVariableReference) {
    if (myRHSBaseVariableReference_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setRHSBaseVariableReference: already set to "
				 << myRHSBaseVariableReference_p->debug().c_str()
				 << " while trying to set for " 
				 << aRHSBaseVariableReference.debug().c_str());
    myRHSBaseVariableReference_p=&aRHSBaseVariableReference;
  }

  const BaseVariableReference& 
  PrivateLinearizedComputationalGraphVertex::getRHSBaseVariableReference() const { 
    if (!myRHSBaseVariableReference_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getRHSBaseVariableReference: not set");
    return *myRHSBaseVariableReference_p;
  } 

  void PrivateLinearizedComputationalGraphVertex::setLHSBaseVariableReference(const BaseVariableReference& aLHSBaseVariableReference) {
    if (myLHSBaseVariableReference_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setLHSBaseVariableReference: already set to "
				 << myLHSBaseVariableReference_p->debug().c_str()
				 << " while trying to set for " 
				 << aLHSBaseVariableReference.debug().c_str());
    myLHSBaseVariableReference_p=&aLHSBaseVariableReference;
  }

  const BaseVariableReference& 
  PrivateLinearizedComputationalGraphVertex::getLHSBaseVariableReference() const { 
    if (!myLHSBaseVariableReference_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getLHSBaseVariableReference: not set");
    return *myLHSBaseVariableReference_p;
  } 

} 
