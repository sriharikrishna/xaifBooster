#ifndef _DERIVATIVEPROPAGATORSAXPY_INCLUDE_
#define _DERIVATIVEPROPAGATORSAXPY_INCLUDE_

#include "xaifBooster/system/inc/DerivativePropagatorEntry.hpp"
#include "xaifBooster/system/inc/BaseVariableReference.hpp"
#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include <list>

namespace xaifBooster { 

  class DerivativePropagatorSaxpy : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorSaxpy(const BaseVariableReference& theA,
			      const BaseVariableReference& theX,
			      const BaseVariableReference& theY);

    DerivativePropagatorSaxpy(const Constant& theA,
			      const BaseVariableReference& theX,
			      const BaseVariableReference& theY);

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

    void addAX(const BaseVariableReference& theA,
	       const BaseVariableReference& theX);

    void addAX(const Constant& theA,
	       const BaseVariableReference& theX);
    
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
      BaseVariableReference myX;
    }; 
    typedef std::list <AX*> AXPList;

    AXPList myAXPList;

    BaseVariableReference myY;

    bool useAsSaxFlag;

    void printMemberXMLHierarchy(const BaseVariableReference& theBaseVariableReference,
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
