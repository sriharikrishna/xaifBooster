#ifndef _XAIFBOOSTERCROSSCOUNTRYINTERFACE_ACCUMULATIONGRAPH_INCLUDE_
#define _XAIFBOOSTERCROSSCOUNTRYINTERFACE_ACCUMULATIONGRAPH_INCLUDE_
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

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraphVertex.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterCrossCountryInterface {

  /**
   * Class that implements a graph that represents a flattening of JAEs.
   * Use of this graph allows easier constant folding for Jacobian acumulation
   * and allows us to create expressions for preaccumulation that involve more than one operation.
   * NOTE: building the accumulation graph from the list of JAEs should not be part of eliminate in the future.
   */
  class AccumulationGraph : public GraphWrapper<AccumulationGraphVertex,
						AccumulationGraphEdge>,
			    public virtual Debuggable {

  public:

    AccumulationGraph(); 
    ~AccumulationGraph();

    std::string debug() const;

  }; // end of class AccumulationGraph

  class AccumulationGraphPropertiesWriter {
  public:
    AccumulationGraphPropertiesWriter(const AccumulationGraph& g) : myG(g) {};
    void operator()(std::ostream& out) const {
      out << "rankdir=BT;" << std::endl;
    }
    const AccumulationGraph& myG;
  }; // end class AccumulationGraphPropertiesWriter

  class AccumulationGraphVertexLabelWriter {
  public:
    AccumulationGraphVertexLabelWriter(const AccumulationGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, 
		    const BoostIntenalVertexDescriptor& v) const {
      const AccumulationGraphVertex* theAccumulationGraphVertex_p =
	dynamic_cast<const AccumulationGraphVertex*>(boost::get(boost::get(BoostVertexContentType(),
									   myG.getInternalBoostGraph()),
								v));
      std::ostringstream labelStream;
      std::string FixedSize("false"), theFontSize, theShape, theGroupname, theColor, theLabel;

      // set shape
      if (theAccumulationGraphVertex_p->hasRemainderGraphEdge()) {
	theGroupname = "RemainderGraphEdges";
	theShape = "box";
      }
      else if (myG.numInEdgesOf(*theAccumulationGraphVertex_p)) {
	theGroupname = "Intermediate ops";
	theShape = "circle";
      }
      else { // leaves
	theShape = "egg";
	theGroupname = "leaves";
      }

      // set label, font size, fixed size
      if (myG.numInEdgesOf(*theAccumulationGraphVertex_p)) { // ops
	theFontSize = "25";
	FixedSize = "true";
	if (theAccumulationGraphVertex_p->getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP)
	  labelStream << "+" << std::ends;
	else if (theAccumulationGraphVertex_p->getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP)
	  labelStream << "*" << std::ends;
      }	
      else { // leaves
	FixedSize = "false";
	switch(theAccumulationGraphVertex_p->getPartialDerivativeKind()) {
	  case PartialDerivativeKind::LINEAR_ONE: {
	    theFontSize = "16";
	    labelStream << "1" << std::ends;
	    break;
	  } // end case LINEAR_ONE
	  case PartialDerivativeKind::LINEAR_MINUS_ONE: {
	    theFontSize = "16";
	    labelStream << "-1" << std::ends;
	    break;
	  } // end case LINEAR_MINUS_ONE
	  case PartialDerivativeKind::LINEAR: {
	    theFontSize = "16";
	    labelStream << theAccumulationGraphVertex_p->getValue() << std::ends;
	    break;
	  } // end case LINEAR
	  case PartialDerivativeKind::NONLINEAR: {
	    theFontSize = "8";
	    labelStream << &theAccumulationGraphVertex_p->getLHSVariable() << std::ends;
	    break;
	  } // end case NONLINEAR
	  default:
	    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::AccumulationGraphVertexLabelWriter: partial derivative type on AccumulationGraphVertex is NOT_SET");
	    break;
	} // end switch on PDK
      }

      // set color according to PartialDerivativeKind
      switch(theAccumulationGraphVertex_p->getPartialDerivativeKind()) {
	case PartialDerivativeKind::LINEAR_ONE:
	  theColor = "red";
	  break;
	case PartialDerivativeKind::LINEAR_MINUS_ONE:
	  theColor = "pink";
	  break;
	case PartialDerivativeKind::LINEAR:
	  theColor = "blue";
	  break;
	case PartialDerivativeKind::NONLINEAR:
	  theColor = "black";
	  break;
	case PartialDerivativeKind::PASSIVE:
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::AccumulationGraphVertexLabelWriter: partial derivative type on AccumulationGraph vertex is PASSIVE");
	  break;
	case PartialDerivativeKind::NOT_SET:
	  theColor = "green";
	  break;
	default:
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::AccumulationGraphVertexLabelWriter: unknown partial derivative type on AccumulationGraph vertex");
	  break;
      } // end switch on vertex PartialDerivativeKind

      out << "["
          << "group=\"" << theGroupname.c_str() << "\","
	  << "fixedsize=" << FixedSize.c_str() << ","
          << "fontsize=" << theFontSize.c_str() << ","
          << "shape=" << theShape.c_str() << ","
          << "color=" << theColor.c_str() << ","
	  << "label=\"" << labelStream.str().c_str() << "\""
	  << "]";
    }
    const AccumulationGraph& myG;
  }; // end class AccumulationGraphVertexLabelWriter

  class AccumulationGraphEdgeLabelWriter {
  public:
    AccumulationGraphEdgeLabelWriter(const AccumulationGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out,
		    const BoostIntenalEdgeDescriptor& v) const {
    }
    const AccumulationGraph& myG;
  }; // end class AccumulationGraphEdgeLabelWriter

} // end namespace xaifBoosterCrossCountryInterface

#endif

