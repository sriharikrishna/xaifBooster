#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATORENTRY_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATORENTRY_INCLUDE_

#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 
  class Variable; 
  class Constant; 
}

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  /** 
   * class representing different 
   * shortcuts for y+=[a*x]
   */
  class DerivativePropagatorEntry : public XMLPrintable {
  public:

    DerivativePropagatorEntry(){};
    ~DerivativePropagatorEntry(){};

    typedef std::list<const Variable*> VariablePList;

    /**
     * the Variable pointers returned in the VariablePList 
     * are owned by the DerivativePropagatorSaxpy
     * and are therefore not to be deleted by the caller
     * returns the list of the x in a*x
     */
    virtual void getSources(VariablePList& theVariablePList) const ; 

    /** 
     * Factors a in a*x
     */
    class Factor { 
    public: 
      /**
       * the kind of factor a 
       * in y+=a*x
       */
      enum FactorKind_E {  ZERO_FACTOR,
			   UNIT_FACTOR,
			   CONSTANT_FACTOR,
			   VARIABLE_FACTOR, 
			   NOT_SET};

      Factor() : myFactorKind(NOT_SET) {};
      void setZero(); 
      void setUnit(); 
      void setConstant(const Constant& theConstant); 
      void setVariable(const Variable& theVariable); 
      FactorKind_E getKind() const;
      const Variable& getVariable() const;
      const Constant& getConstant() const;
    private: 
      union { 
	const Variable* myVariable_p;
	const Constant* myConstant_p;
      } myFactor;
      FactorKind_E myFactorKind;
    };

    typedef std::list<Factor> FactorList;

    /**
     * the kind of all factors a 
     * in y+=a*x
     */
    virtual void getFactors(FactorList& theFactorList) const =0; 

    /**
     * returns y from y+=a*x
     */
    virtual const Variable& getTarget() const =0;

    virtual bool isIncremental() { return false;}; 

  private:

    /**
     * no def
     */
    DerivativePropagatorEntry (const DerivativePropagatorEntry&);

    /**
     * no def
     */
    DerivativePropagatorEntry operator=(const DerivativePropagatorEntry&);

  }; // end of class DerivativePropagatorEntry
 
} // end of namespace
                                                                     
#endif
