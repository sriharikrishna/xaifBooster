#ifndef _BASICBLOCKALG_INCLUDE_
#define _BASICBLOCKALG_INCLUDE_

#include <list>

#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagator.hpp"

namespace xaifBooster {
class ExpressionVertex;
class PlainAssignment;
class Assignment;
class BasicBlockElement;
}

using namespace xaifBooster;

namespace xaifBoosterAngelInterfaceAlgorithms {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class BasicBlockAlg : public BasicBlockAlgBase {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * flatten the Assignment level graphs found here into a graph held by 
     * myFlattenedSequence per sequence of consecutive Assignment instances
     */
    virtual void algorithm_action_1();

    /**
     * generate code for the elimination sequence returned by Angel
     */
    virtual void algorithm_action_2();

    /** 
     * returns the PrivateLinearizedComputationalGraph 
     * to be used by theAssignment
     * this expects to be called in the 
     * sequence order of BasicBlockElements
     * to work best as it creates the Sequence
     * instances to be used by sequences of consecutive
     * assignments. 
     */
    PrivateLinearizedComputationalGraph& getFlattenedSequence(const Assignment& theAssignment);

    /** 
     * returns the DerivativePropagtor 
     * to be used by theAssignment
     * this expects to be called only after 
     * a Sequence has been associated with 
     * theAssignment through a call to 
     * getFlattenedSequence
     */
    DerivativePropagator& getDerivativePropagator(const Assignment& theAssignment);
    
  private:
    
    /** 
     * no def
     */
    BasicBlockAlg();

    /** 
     * no def
     */
    BasicBlockAlg(const BasicBlockAlg&);

    /** 
     * no def
     */
    BasicBlockAlg operator=(const BasicBlockAlg&);
    
    /**
     * an instance of Sequence is held 
     * for every sequence of consecutive assignments 
     * in the block. 
     * Note that any non Assignment BasicBlockElement 
     * interrupts the sequence
     */
    class Sequence { 

    public: 
      
      ~Sequence();


      /** 
       * the graph of all basic block elements combined, 
       * i.e. flattened, however since this is only for 
       * nontrivial derivative computations all zero 
       * expressions are clipped from the graph
       */
      PrivateLinearizedComputationalGraph myFlattenedSequence;
    
      /**
       * here we hold the results from the Angel call,
       * i.e. the expressions for the partial calculation
       * obtained from the optimal elimination sequence
       */
      JacobianAccumulationExpressionList myJacobianAccumulationExpressionList;    

      /** 
       * the derivative accumulator for this sequence
       */
      DerivativePropagator myDerivativePropagator;      

      /**
       * first original BasicBlockElement 
       * covered by this Sequence
       * set in getFlattenedSequence
       * used in printXMLHierarchy
       */
      const BasicBlockElement* myFirstElement;

      /**
       * last original BasicBlockElement 
       * covered by this Sequence
       * set in getFlattenedSequence
       * used in printXMLHierarchy
       */
      const BasicBlockElement* myLastElement;

      /** 
       * create a new PlainAssignment instance
       * and append it to the list to be printed 
       * in printXMLHierarchy
       * before any element of the sequence
       */
      PlainAssignment& appendFrontAssignment();

      /** 
       * create a new PlainAssignment instance
       * and append it to the list to be printed 
       * in printXMLHierarchy
       * after any element of the sequence but 
       * before the DerivativePropagator
       */
      PlainAssignment& appendEndAssignment();

      typedef std::list<PlainAssignment*> PlainAssignmentPList;

      const PlainAssignmentPList& getFrontAssignmentList() const;

      const PlainAssignmentPList& getEndAssignmentList() const;

    private: 


      /**
       * list to hold statements to be added to 
       * the front of this sequence
       */
      PlainAssignmentPList myFrontAssignmentList;

      /**
       * list to hold statements to be added to 
       * the end of this sequence
       */
      PlainAssignmentPList myEndAssignmentList;

    }; // end of struct Sequence

    /**
     * Variables representing the independent and 
     * the dependent variables of the basic block. Owned by the
     * algorithm, that is, needs to be deleted by it.
     */
    typedef std::list<Variable*> VariablePList;
    VariablePList myNewIndependentsPList;
    VariablePList myIndependentsPList;
    VariablePList myDependentsPList;

    typedef std::pair<BasicBlockElement*,
		      Sequence*> BasicBlockElementSequencePPair;

    typedef std::list<BasicBlockElementSequencePPair> BasicBlockElementSequencePPairList;

    /** 
     * this list does not own the Sequence
     * instances it contains 
     * consecutive assignments may share 
     * a Sequence
     * BasicBlockElement instances that are not an 
     * Assignment will have a 0 pointer. 
     */
    BasicBlockElementSequencePPairList myBasicBlockElementSequencePPairList;

    typedef std::list<Sequence*> SequencePList;
    
    /** 
     * this list owns all the Sequence instances
     * created by getFlattenedSequence and keeps them in order
     * it is for convenient ordered traversal over all 
     * Sequence instances. 
     * The classes dtor will delete the instances held here
     */
    SequencePList myUniqueSequencePList;

    typedef std::pair<const JacobianAccumulationExpressionVertex*,
		      const Variable*> InternalReferenceConcretization; 
    typedef std::list<InternalReferenceConcretization> InternalReferenceConcretizationList;

    typedef std::pair<const JacobianAccumulationExpressionVertex*,
		      const ExpressionVertex*> VertexPair; 
    typedef std::list<VertexPair> VertexPairList;
    
    /**
     * \todo JU: here we just make up positions for the + and * operations because
     * they don't matter for scalars. In the future for vector valued Jacobian 
     * accumulations ANGEL needs to return the positions. 
     */
    void traverseAndBuildJacobianAccumulationsFromBottomUp(const JacobianAccumulationExpressionVertex& theVertex,
							   const JacobianAccumulationExpression& theExpression,
							   PlainAssignment& theNewAssignment,
							   const InternalReferenceConcretizationList& theInternalReferenceConcretizationList,
							   int& theCounter,
							   VertexPairList& theVertexPairList);

  };
 
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
