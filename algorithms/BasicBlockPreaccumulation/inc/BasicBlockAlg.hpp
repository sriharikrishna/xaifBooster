#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICBLOCKALG_INCLUDE_

#include <list>

#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"


namespace xaifBooster { 
  class ExpressionVertex;
  class Assignment;
  class BasicBlockElement;
}

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  
  class PrivateLinearizedComputationalGraphAlgFactory;
  class PrivateLinearizedComputationalGraphEdgeAlgFactory;
  class PrivateLinearizedComputationalGraphVertexAlgFactory;
  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class BasicBlockAlg : virtual public BasicBlockAlgBase {
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
    virtual void algorithm_action_2();

    /**
     * generate code for the elimination sequence returned by Angel
     */
    virtual void algorithm_action_3();

    /**
     * pointer to function for computing elimination sequence
     */
     typedef void (*Compute_elimination_sequence_fp)(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph&,
						     int,
						     double,
						     xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList&
						     );

    static Compute_elimination_sequence_fp ourCompute_elimination_sequence_fp;
    static int ourIntParameter;
    static double ourGamma;
    static PrivateLinearizedComputationalGraphAlgFactory *getPrivateLinearizedComputationalGraphAlgFactory();
    static PrivateLinearizedComputationalGraphEdgeAlgFactory *getPrivateLinearizedComputationalGraphEdgeAlgFactory();
    static PrivateLinearizedComputationalGraphVertexAlgFactory *getPrivateLinearizedComputationalGraphVertexAlgFactory();
    static void setPrivateLinearizedComputationalGraphAlgFactory(xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphAlgFactory*);
    static void setPrivateLinearizedComputationalGraphEdgeAlgFactory(xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdgeAlgFactory*);
    static void setPrivateLinearizedComputationalGraphVertexAlgFactory(xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertexAlgFactory*);
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
     * signals a necessary split in the sequence due to an 
     * ambiguity
     */
    void splitFlattenedSequence(const Assignment& theAssignment);

    /** 
     * returns the DerivativePropagtor 
     * to be used by theAssignment
     * this expects to be called only after 
     * a Sequence has been associated with 
     * theAssignment through a call to 
     * getFlattenedSequence
     */
    xaifBoosterDerivativePropagator::DerivativePropagator& getDerivativePropagator(const Assignment& theAssignment);

    /**
     * access container
     */
    const BasicBlock& getContaining() const;
    
    /** 
     * we can decide to restrict the 
     * preaccumulation to the level of single statements 
     * effectively precluding the flattening
     */
    static void limitToStatementLevel();
    
    static bool hasLimitToStatementLevel();
    
  protected: 

    /**
     * pointer to printer for DerivativePropagator
     */
    typedef void (*PrintDerivativePropagator_fp)(std::ostream& os,
						 const BasicBlockAlgBase& aBasicBlockAlg, 
						 const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator);

    void printXMLHierarchyImpl(std::ostream& os,
			       PrintDerivativePropagator_fp aPrintDerivativePropagator_fp) const;

  private:
    static PrivateLinearizedComputationalGraphAlgFactory* ourPrivateLinearizedComputationalGraphAlgFactory_p;
    static PrivateLinearizedComputationalGraphEdgeAlgFactory* ourPrivateLinearizedComputationalGraphEdgeAlgFactory_p;
    static PrivateLinearizedComputationalGraphVertexAlgFactory* ourPrivateLinearizedComputationalGraphVertexAlgFactory_p;
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
   
  protected: 
    /**
     * an instance of Sequence is held 
     * for every sequence of consecutive assignments 
     * in the block. 
     * Note that any non Assignment BasicBlockElement 
     * interrupts the sequence
     */
    class Sequence : public Debuggable { 

    public: 

      Sequence();      
      ~Sequence();

      virtual std::string debug() const ;

      /** 
       * the graph of all basic block elements combined, 
       * i.e. flattened, however since this is only for 
       * nontrivial derivative computations all zero 
       * expressions are clipped from the graph
       */
      PrivateLinearizedComputationalGraph* myFlattenedSequence_p;
    
      /**
       * here we hold the results from the Angel call,
       * i.e. the expressions for the partial calculation
       * obtained from the optimal elimination sequence
       */
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList myJacobianAccumulationExpressionList;    

      /** 
       * the derivative accumulator for this sequence
       */
      xaifBoosterDerivativePropagator::DerivativePropagator myDerivativePropagator;      

      /**
       * first original BasicBlockElement 
       * covered by this Sequence
       * set in getFlattenedSequence
       * used in printXMLHierarchy
       */
      const BasicBlockElement* myFirstElement_p;

      /**
       * last original BasicBlockElement 
       * covered by this Sequence
       * set in getFlattenedSequence
       * used in printXMLHierarchy
       */
      const BasicBlockElement* myLastElement_p;

      /** 
       * create a new Assignment instance
       * and append it to the list to be printed 
       * in printXMLHierarchy
       * before any element of the sequence
       */
      Assignment& appendFrontAssignment();

      /** 
       * create a new Assignment instance
       * and append it to the list to be printed 
       * in printXMLHierarchy
       * after any element of the sequence but 
       * before the DerivativePropagator
       */
      Assignment& appendEndAssignment();

      typedef std::list<Assignment*> AssignmentPList;

      const AssignmentPList& getFrontAssignmentList() const;

      const AssignmentPList& getEndAssignmentList() const;

    private: 


      /**
       * list to hold statements to be added to 
       * the front of this sequence
       */
      AssignmentPList myFrontAssignmentList;

      /**
       * list to hold statements to be added to 
       * the end of this sequence
       */
      AssignmentPList myEndAssignmentList;
      Sequence(const Sequence&);
      Sequence& operator= (const Sequence&);

    }; // end of struct Sequence

  private: 

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

  protected: 

    typedef std::list<Sequence*> SequencePList;

    const SequencePList& getUniqueSequencePList() const { return myUniqueSequencePList;}; 

  private: 
    
    /** 
     * this is just a helper to accomodate 
     * the additional BasicBlockAlgBase&
     * in the signature of PrintDerivativePropagator_fp
     */
    static void printerWrapper(std::ostream& os,
			       const BasicBlockAlgBase&, 
			       const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator) {
      xaifBoosterDerivativePropagator::DerivativePropagator::printXMLHierarchyImpl(os,aPropagator);
    }; 
    
    /** 
     * this list owns all the Sequence instances
     * created by getFlattenedSequence and keeps them in order
     * it is for convenient ordered traversal over all 
     * Sequence instances. 
     * The classes dtor will delete the instances held here
     */
    SequencePList myUniqueSequencePList;

    typedef std::pair<const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex*,
		      const Variable*> InternalReferenceConcretization; 
    typedef std::list<InternalReferenceConcretization> InternalReferenceConcretizationList;

    typedef std::pair<const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex*,
		      const ExpressionVertex*> VertexPair; 
    typedef std::list<VertexPair> VertexPairList;
    
    /**
     * \todo JU: here we just make up positions for the + and * operations because
     * they don't matter for scalars. In the future for vector valued Jacobian 
     * accumulations ANGEL needs to return the positions. 
     */
    void traverseAndBuildJacobianAccumulationsFromBottomUp(const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theVertex,
							   const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression,
							   Assignment& theNewAssignment,
							   const InternalReferenceConcretizationList& theInternalReferenceConcretizationList,
							   VertexPairList& theVertexPairList);
    typedef std::list<const Variable*> VariableCPList;

    /** 
     * determines variables in IN and OUT
     */
    bool isAliased(const Variable& theIndepVariable,
		   const VariableCPList& theDependentList);
    
    /** 
     * if this flag is true each FlattenedSequence 
     * consists of exactly one assignment
     */ 
    static bool ourLimitToStatementLevelFlag;


  };
 
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
