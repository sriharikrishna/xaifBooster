#ifndef _DERIVATIVEPROPAGATORSAXPY_INCLUDE_
#define _DERIVATIVEPROPAGATORSAXPY_INCLUDE_

#include <list>
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorEntry.hpp"

namespace xaifBooster { 

  class DerivativePropagatorSaxpy : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorSaxpy(const Variable& theA,
			      const Variable& theX,
			      const Variable& theY);

    DerivativePropagatorSaxpy(const Constant& theA,
			      const Variable& theX,
			      const Variable& theY);

    ~DerivativePropagatorSaxpy();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const;

    void useAsSax();

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string our_SAX_XAIFName;

    static const std::string our_myA_XAIFName;
    
    static const std::string our_myX_XAIFName;

    static const std::string our_myY_XAIFName;

    static const std::string our_myAX_XAIFName;

    void addAX(const Variable& theA,
	       const Variable& theX);

    void addAX(const Constant& theA,
	       const Variable& theX);
    
  private:

    /**
     * no def
     */
    DerivativePropagatorSaxpy ();

    /**
     * no def
     */
    DerivativePropagatorSaxpy (const DerivativePropagatorSaxpy&);

    /**
     * no def
     */
    DerivativePropagatorSaxpy operator=(const DerivativePropagatorSaxpy&);

    struct AX { 
      Expression myA;
      Variable myX;
    }; 
    typedef std::list <AX*> AXPList;

    AXPList myAXPList;

    Variable myY;

    bool useAsSaxFlag;

    void printMemberXMLHierarchy(const Variable& theVariable,
				 const std::string& aName,
				 std::ostream& os) const;

    void printMemberXMLHierarchy(const Expression& thePartial,
				 const std::string& aName,
				 std::ostream& os) const;

    void printAXMemberXMLHierarchy(const AX&,
				   std::ostream& os) const;

  }; // end of class DerivativePropagatorSaxpy
 
} // end of namespace xaifBooster
                                                                     
#endif
