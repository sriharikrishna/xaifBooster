// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/system/inc/Intrinsic.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

namespace xaifBoosterBasicBlockPreaccumulation { 

  PrivateLinearizedComputationalGraphVertex::PrivateLinearizedComputationalGraphVertex() : myOriginalVariable_p(NULL),
                                                                                           myAuxiliaryVariable_p(NULL) {
  }

  std::string
  PrivateLinearizedComputationalGraphVertex::debug() const {
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphVertex[" << Vertex::debug().c_str()
        << ",myStatementId=" << myStatementId;
    out << ",myOriginalVariable_p=";
    if (myOriginalVariable_p)
      out << ">" << myOriginalVariable_p->debug().c_str();
    else
      out << myOriginalVariable_p;
    out << ",myAuxiliaryVariable_p=";
    if (myAuxiliaryVariable_p)
      out << ">" << myAuxiliaryVariable_p->debug().c_str();
    else
      out << myAuxiliaryVariable_p;
    out << ",myOriginalExpressionVertexPSet={";
    for (CExpressionVertexPSet::const_iterator setI = myOriginalExpressionVertexPSet.begin(); setI != myOriginalExpressionVertexPSet.end(); ++setI)
      out << (*setI)->debug().c_str();
    out << "}";
    out << "]" << std::ends;
    return out.str();
  } 

  const CExpressionVertexPSet&
  PrivateLinearizedComputationalGraphVertex::getAssociatedExpressionVertexPSet() const {
    return myOriginalExpressionVertexPSet;
  }

  void
  PrivateLinearizedComputationalGraphVertex::associateExpressionVertex(const ExpressionVertex& aExpressionVertex) {
    if (myOriginalExpressionVertexPSet.find(&aExpressionVertex) != myOriginalExpressionVertexPSet.end())
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::associateExpressionVertex: "
                                 << aExpressionVertex.debug().c_str() << "already associated");
    myOriginalExpressionVertexPSet.insert(&aExpressionVertex);
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

  bool
  PrivateLinearizedComputationalGraphVertex::hasAuxiliaryVariable() const {
    return (myAuxiliaryVariable_p) ? true : false;
  }

  void
  PrivateLinearizedComputationalGraphVertex::setAuxiliaryVariable(const Variable& aVariable) {
    if (myAuxiliaryVariable_p)
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::setAuxiliaryVariable:"
                                 << " already set to " << myAuxiliaryVariable_p->debug().c_str()
                                 << " while trying to set to " << aVariable.debug().c_str());
    myAuxiliaryVariable_p = &aVariable;
  }

  const Variable&
  PrivateLinearizedComputationalGraphVertex::getAuxiliaryVariable() const {
    if (!myAuxiliaryVariable_p)
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphVertex::getAuxiliaryVariable: not set");
    return *myAuxiliaryVariable_p;
  }

  std::string
  PrivateLinearizedComputationalGraphVertex::getLabelString() const {
    std::ostringstream out;

    // auxiliary variable
    if (hasAuxiliaryVariable())
      out << getAuxiliaryVariable().getVariableSymbolReference().getSymbol().getId().c_str() << "=";

    // search for a (LHS) variable symbol reference
    if (hasOriginalVariable()) {
      out << getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str();
    }
    else { // no LHS variable, but maybe an argument?
      for (CExpressionVertexPSet::const_iterator evpI = myOriginalExpressionVertexPSet.begin();
           evpI != myOriginalExpressionVertexPSet.end(); ++evpI)
        if ((*evpI)->isArgument())
          out << dynamic_cast<const Argument&>(**evpI).getVariable().getVariableSymbolReference().getSymbol().getId().c_str() << "=";
    }

    // search for an operation
    std::string theOpString("");
    for (CExpressionVertexPSet::const_iterator evpI = myOriginalExpressionVertexPSet.begin();
         evpI != myOriginalExpressionVertexPSet.end(); ++evpI)
      if ((*evpI)->isIntrinsic()) {
        theOpString = dynamic_cast<const Intrinsic&>(**evpI).getInlinableIntrinsicsCatalogueItem().getFunction().getBuiltinFunctionName();
      }
    if (!theOpString.empty() && hasOriginalVariable())
      out << "=";
    out << theOpString;

    // print DuUdMapKey
    if (hasOriginalVariable()) {
      if (getOriginalVariable().getDuUdMapKey().getKind() == InfoMapKey::SET)
        out  << "\\n[k=" << getOriginalVariable().getDuUdMapKey().getKey() << "]";
    }
    return out.str();
  }

} // end namespace xaifBoosterBasicBlockPreaccumulation

