#ifndef _INLINABLEINTRINSICSEXPRESSION_INCLUDE_
#define _INLINABLEINTRINSICSEXPRESSION_INCLUDE_

#include "system/inc/GraphWrapper.hpp"
#include "system/inc/InlinableIntrinsicsExpressionVertex.hpp"
#include "system/inc/InlinableIntrinsicsExpressionEdge.hpp"
#include "system/inc/PartialDerivativeKind.hpp"
#include "system/inc/PositionSet.hpp"

namespace xaifBooster { 
  
  class InlinableIntrinsicsExpression : public GraphWrapper<InlinableIntrinsicsExpressionVertex,
					InlinableIntrinsicsExpressionEdge> { 
    
  public: 

    InlinableIntrinsicsExpression(unsigned int aNumberOfArguments,
				  PartialDerivativeKind::PartialDerivativeKind_E aPartialDerivativeKind);

    /**
     * get positions of arguments used in this partial
     */ 
    const PositionSet& getUsedPositionalArguments() const;

    /**
     * defines the position for a formal argument to the partial
     */
    void setPartialArgument(const InlinableIntrinsicsExpressionVertex& theVertex,
			    unsigned int thePosition);

    /**
     * returns the formal argument (vertex) for the partial 
     * that corresponds to the intrinsics argument  in position 
     * aPosition
     */
    const InlinableIntrinsicsExpressionVertex& getPartialArgumentAt(unsigned int aPosition) const ;

    bool isBuiltinFunction() const;
    void setBuiltinFunction();

    void setBuiltinFunctionName(std::string);
    std::string getBuiltinFunctionName() const;
    
  private: 

    /**
     * no def
     */
    InlinableIntrinsicsExpression();

    /**
     * set of argument positions used in this 
     * partial, counting starts with 1, 
     * the 0 position denotes the intrinsic's value
     */
    PositionSet myUsedPositionalArguments;

    typedef std::vector<const InlinableIntrinsicsExpressionVertex*> VertexVector;

    /**
     * this is the positional argument vector for this 
     * partial. Positions are expressed in terms of 
     * argument positions of the intrinsic. 
     * counting starts with 1 but the 0th 
     * position signifies the intrinsic's result. 
     * The vector doesn't own the pointers.
     */
    VertexVector myPartialArgumentSignature;

    const unsigned int myNumberOfArguments;

    /**
     * this specifies whether an intrinsic is builtin
     * if it is then myBuiltinFunctionName 
     * contains the name of the builtin function
     *
     * this is only used for the function evaluation
     * part of an InlinableIntrinsicCatalogueItem
     */

    bool myIsBuiltinFunction;

    std::string myBuiltinFunctionName;

    /**
     * this specifies categories of  
     * partial derivatives;
     * this is not used for the function expression
     */
    const PartialDerivativeKind::PartialDerivativeKind_E myPartialDerivativeKind;
    
    /** 
     * true if this partial used the intrinsics positional 
     * argument in position aPosition
     */
    bool hasPartialArgumentAt(unsigned int aPosition) const ;

  }; // end of class InlinableIntrinsicsExpression
  
} 

#endif
