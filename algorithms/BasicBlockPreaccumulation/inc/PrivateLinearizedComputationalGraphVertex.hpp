#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"

using namespace xaifBooster; 

namespace xaifBoosterBasicBlockPreaccumulation { 
 
  /**
   * This class is no longer necessary
   */
  class PrivateLinearizedComputationalGraphVertex : public xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex {

  public:

    PrivateLinearizedComputationalGraphVertex();
    ~PrivateLinearizedComputationalGraphVertex(){};

    bool hasOriginalVariable() const;
    void setOriginalVariable(const Variable& aVariable,
			     const ObjectWithId::Id& aStatementId);
    const Variable& getOriginalVariable() const;

    const ObjectWithId::Id& getStatementId() const;

    std::string debug() const;

  private: 
    
    /**
     * Pointer to the variable that originally corresponds to this vertex, in the case where one exists.
     * The variable is not owned by this class.
     */
    const Variable* myOriginalVariable_p;

    /**
     * set to the respective statement id if myOriginalVariable_p is set
     */
    ObjectWithId::Id myStatementId;

  }; 
 
  class PrivateLinearizedComputationalGraphVertexLabelWriter {
  public:
    PrivateLinearizedComputationalGraphVertexLabelWriter(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& g) : myG(g) {};

    template <class BoostInternalVertexDescriptor>
    void operator()(std::ostream& out, 
                    const BoostInternalVertexDescriptor& v) const {
      const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p=
        dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(boost::get(boost::get(BoostVertexContentType(),
                                                                                             myG.getInternalBoostGraph()),
                                                                                  v));
      std::string theVertexShape("ellipse");
      std::string theVertexGroupname("intermediates");
      std::string vertexFixedSize("false");
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(myG.getDependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aDepVertexPListI(theDepVertexPList.begin());
           aDepVertexPListI!=theDepVertexPList.end();
           ++aDepVertexPListI) { 
        if (thePrivateLinearizedComputationalGraphVertex_p==*(aDepVertexPListI)) {
          theVertexShape = "invtriangle";
          theVertexGroupname = "dependents";
          vertexFixedSize = "true";
          break;
        }
      }
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theIndepVertexPList(myG.getIndependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aIndepVertexPListI(theIndepVertexPList.begin());
           aIndepVertexPListI!=theIndepVertexPList.end();
           ++aIndepVertexPListI) { 
        if (thePrivateLinearizedComputationalGraphVertex_p==*(aIndepVertexPListI)) {
          theVertexShape = "triangle";
          theVertexGroupname = "independents";
          vertexFixedSize = "true";
          break;
        }
      }

      // set label
      std::string theVertexKind("");
      std::ostringstream oss;
      if (thePrivateLinearizedComputationalGraphVertex_p->hasOriginalVariable()) {
        oss << thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str();
        if (thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getDuUdMapKey().getKind() == InfoMapKey::SET)
          oss  << " k=" << thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getDuUdMapKey().getKey();
        theVertexKind = oss.str();
      }

      out << "["
          << "fixedsize=" << vertexFixedSize.c_str()
          << ",fontsize=7"
          << ",group=\"" << theVertexGroupname.c_str() << "\""
          << ",shape=" << theVertexShape.c_str()
          << ",label=\"" << theVertexKind.c_str() << "\""
          << "]";
    }

    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;

  };

} 
                                                                     
#endif

