#ifndef _COMBINEDGRAPH_INCLUDE_
#define _COMBINEDGRAPH_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraphVertex.hpp"

#include "xaifBooster/algorithms/PushPop/inc/CombinedGraphVertex.hpp"
#include "xaifBooster/algorithms/PushPop/inc/CombinedGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  /**
   * the default representation for the CombinedGraph
   */
  class CombinedGraph : public GraphWrapper<CombinedGraphVertex,
                                            CombinedGraphEdge>{
  public:

    /**
     * \todo AML implementation incomplete
     */
    std::string debug() const { return std::string("CombinedGraph");};

//private:

  };

  class CombinedGraphVertexLabelWriter {
  public:
    CombinedGraphVertexLabelWriter(const CombinedGraph& g) : myG(g) {};

    template <class BoostInternalVertexDescriptor>
    void
    operator()(std::ostream& out, 
               const BoostInternalVertexDescriptor& v) const {
      const CombinedGraphVertex& theCGVertex(dynamic_cast<const CombinedGraphVertex&>(*boost::get(boost::get(BoostVertexContentType(),
                                                                                                             myG.getInternalBoostGraph()),
                                                                                                  v)));
      std::string theShape("ellipse");
      std::string theColor("black");
      std::string vertexFixedSize("false");
      std::ostringstream labelStream;
      switch (theCGVertex.getOriginType()) {
        case CombinedGraphVertex::ORIGINAL_VERTEX: {
          labelStream << theCGVertex.getOriginalVertex().getLabelString().c_str();
        //if (theCGVertex.getOriginalVertex().hasOriginalVariable()) {
        //  labelStream << theCGVertex.getOriginalVertex().getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str();
        //}
        //else
        //  labelStream << &theCGVertex;
          break;
        }
        case CombinedGraphVertex::LINEARIZATION_VERTEX: {
          theShape = "diamond";
          theColor = "darkslateblue";
          if (theCGVertex.getLinearizationExpressionVertex().isIntrinsic()) {
            const Intrinsic& theIntrinsic(dynamic_cast<const Intrinsic&>(theCGVertex.getLinearizationExpressionVertex()));
            labelStream << theIntrinsic.getName();
          }
          else if (theCGVertex.getLinearizationExpressionVertex().isArgument()) {
            const Argument& theArgument(dynamic_cast<const Argument&>(theCGVertex.getLinearizationExpressionVertex()));
            labelStream << theArgument.getVariable().getVariableSymbolReference().getSymbol().getId().c_str();
          }
          else { // otherwise it's a constant?
            labelStream << dynamic_cast<const Constant&>(theCGVertex.getLinearizationExpressionVertex()).toString();
          }
          //labelStream << &theCGVertex;
          break;
        }
        case CombinedGraphVertex::TRIVIAL_PARTIAL_EXPRESSION: {
          theShape = "diamond";
          const xaifBoosterLinearization::ExpressionEdgeAlg& theLinearizedExpressionEdgeAlg(
            dynamic_cast<const xaifBoosterLinearization::ExpressionEdgeAlg&>(theCGVertex.getLinearizedExpressionEdge().getExpressionEdgeAlgBase())
          );
          if (theLinearizedExpressionEdgeAlg.getPartialDerivativeKind() == PartialDerivativeKind::LINEAR_ONE) {
            labelStream << "1";
            theColor = "red";
          }
          else if (theLinearizedExpressionEdgeAlg.getPartialDerivativeKind() == PartialDerivativeKind::LINEAR_MINUS_ONE) {
            labelStream << "-1";
            theColor = "pink";
          }
          else
            THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertexLabelWriter: invalid PDK for " << theLinearizedExpressionEdgeAlg.debug().c_str());
          break;
        }
        case CombinedGraphVertex::ACCUMULATION_VERTEX: {
          theShape = "box";
          if (myG.numInEdgesOf(theCGVertex)) {
            theColor = "goldenrod4";
            vertexFixedSize = "true";
            if (theCGVertex.getAccumulationGraphVertex().getOperation()
                == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP)
              labelStream << "+";
	    else if (theCGVertex.getAccumulationGraphVertex().getOperation()
                == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP)
	      labelStream << "*";
          }
          else {
            switch(theCGVertex.getAccumulationGraphVertex().getPartialDerivativeKind()) {
              case PartialDerivativeKind::LINEAR_ONE:
	        theColor = "red";
	        labelStream << "1";
	        break;
	      case PartialDerivativeKind::LINEAR_MINUS_ONE:
	        theColor = "pink";
	        labelStream << "-1";
	        break;
	      case PartialDerivativeKind::LINEAR:
	        theColor = "blue";
                labelStream << theCGVertex.getAccumulationGraphVertex().getValue();
	        break;
	    //case PartialDerivativeKind::NONLINEAR:
	    //  theColor = "black";
	    //  break;
              default:
                THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertexLabelWriter: unexpected ACCVertex PDK");
                break;
            }
          }
          break;
        }
        default:
          THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertexLabelWriter: invalid OriginType");
          break;
      } // end switch
      // output LHS vertices
      for (CVariablePSet::const_iterator setI = theCGVertex.getLHSCVariablePSet().begin(); setI != theCGVertex.getLHSCVariablePSet().end(); ++setI) {
        labelStream << " = " << (*setI)->getVariableSymbolReference().getSymbol().getId().c_str();
      }

      out << "["
          << "fontsize=7"
          << ",height=0.25,width=0.25"
          << ",penwidth=3.0"
          << ",fixedsize=" << vertexFixedSize.c_str()
          << ",shape=" << theShape.c_str()
          << ",color=" << theColor.c_str()
          << ",label=\"" << labelStream.str() << "\""
        //<< ",labelloc=\"" << labelloc.c_str() << "\""
        //<< ",group=\"" << theVertexGroupname.c_str() << "\""
          << ",tooltip=\"" << theCGVertex.debug().c_str() << "\""
          << "]";
    }

    const CombinedGraph& myG;

  };

  class CombinedGraphEdgeLabelWriter {
  public:
    CombinedGraphEdgeLabelWriter(const CombinedGraph& g) : myG(g) {};

    template <class BoostInternalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostInternalEdgeDescriptor& v) const {
      const CombinedGraphEdge& theCGEdge(dynamic_cast<const CombinedGraphEdge&>(*boost::get(boost::get(BoostEdgeContentType(),
                                                                                                       myG.getInternalBoostGraph()),
                                                                                            v)));
      // common properties
      out << "["
          << "fontsize=7"
          << ",labelfloat=false";
      // specific to original LCG edges
      if(theCGEdge.getOriginType() == CombinedGraphEdge::ORIGINAL_EDGE) {
        const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdge& thePLCGEdge(theCGEdge.getPrivateLinearizedComputationalGraphEdge());
        out << ",penwidth=3.0"
            << ",color=" << thePLCGEdge.getColorString().c_str()
            << ",style=" << thePLCGEdge.getStyleString().c_str()
            << ",label=\"" << thePLCGEdge.getLabelString().c_str() << "\""
            << ",edgetooltip=\"" << theCGEdge.debug().c_str() << "\"";
      }
      out << "]";
    }

    const CombinedGraph& myG;

  };

  class CombinedGraphPropertiesWriter {
  public:
    CombinedGraphPropertiesWriter(const CombinedGraph& g,
                                  const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph& aPLCG) : myG(g),
                                                                                                                 myPLCG(aPLCG) {
    };

    void operator()(std::ostream& out) const {
      //out << "rankdir=BT;" << std::endl;
      out << "rankdir=LR;" << std::endl;
      // give accumulation outputs (Jacobian entries or RemainderGraph entries) max rank
      out << "{rank=max;";
      CombinedGraph::ConstVertexIteratorPair aCGVpair(myG.vertices());
      for (CombinedGraph::ConstVertexIterator aCGVi(aCGVpair.first), aCGViend(aCGVpair.second);
           aCGVi != aCGViend; ++aCGVi) {
        const CombinedGraphVertex& aCGV(*aCGVi);
        if(myG.numOutEdgesOf(aCGV) == 0) {
          if (aCGV.getOriginType() == CombinedGraphVertex::ACCUMULATION_VERTEX
          || aCGV.getOriginType() == CombinedGraphVertex::LINEARIZATION_VERTEX) {
            out << " " << aCGV.getDescriptor();
          }
        }
      }
      out << ";}" << std::endl;
    }

    const CombinedGraph& myG;

    const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph& myPLCG;

  };

}

#endif
