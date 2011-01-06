// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

namespace xaifBoosterBasicBlockPreaccumulation { 

  PrivateLinearizedComputationalGraphVertex::PrivateLinearizedComputationalGraphVertex() :
    myOriginalVariable_p (NULL) {
  }

  std::string PrivateLinearizedComputationalGraphVertex::debug() const { 
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphVertex[" << this 
	<< ",myOriginalVariable_p=" << myOriginalVariable_p
	<< ",myStatementId=" << myStatementId
	<< "]" << std::ends;  
    return out.str();
  } 

  bool PrivateLinearizedComputationalGraphVertex::hasOriginalVariable() const {
   return (myOriginalVariable_p) ? true : false;
  } 

  void PrivateLinearizedComputationalGraphVertex::setOriginalVariable(const Variable& aVariable,
							       const ObjectWithId::Id& aStatementId) {
    if (myOriginalVariable_p)
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setOriginalVariable: already set to " << myOriginalVariable_p->debug().c_str()
                                 << " while trying to set to " << aVariable.debug().c_str());
    myOriginalVariable_p = &aVariable;
    myStatementId = aStatementId;
  } 

  const Variable& PrivateLinearizedComputationalGraphVertex::getOriginalVariable() const {
    if (!myOriginalVariable_p)
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getOriginalVariable: not set");
    return *myOriginalVariable_p;
  } 

  const ObjectWithId::Id& PrivateLinearizedComputationalGraphVertex::getStatementId() const {
    if (!myStatementId.size())
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getStatementId: not set");
    return myStatementId;
  } 

} // end namespace xaifBoosterBasicBlockPreaccumulation

