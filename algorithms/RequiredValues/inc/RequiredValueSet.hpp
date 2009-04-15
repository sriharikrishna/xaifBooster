#ifndef _XAIFBOOSTERREQUIREDVALUES_REQUIREDVALUESET_INCLUDE_
#define _XAIFBOOSTERREQUIREDVALUES_REQUIREDVALUESET_INCLUDE_

#include <list>

#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ExpressionVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterRequiredValues {  

  class RequiredValueSet {
  public:
    RequiredValueSet();
    ~RequiredValueSet();

    /**
     * 
     */
    void addValueToRequiredSet(const ExpressionVertex& theEV,
			       const ObjectWithId::Id theStatementId,
			       const ControlFlowGraphVertex& theControlFlowGraphVertex,
			       const std::string theOriginStr);

    /**
     * Marks \p theVariable as required for the reverse mode,
     * where \p theOrigin expresses the place at which the requiredness was recognized.
     * If \p theVariable has already been marked as required, the new Origin is added to the list of origins.
     * If \p theVariable has an array access, the variables in index expression are recursively marked as required.
     */
    void addValueToRequiredSet(const ExpressionVertex& theValueEV,
			       const ObjectWithId::Id theValueStatementId,
			       const ExpressionVertex& theLocationEV,
			       const ObjectWithId::Id theLocationStatementId,
			       const ControlFlowGraphVertex& theControlFlowGraphVertex,
			       const std::string theOriginStr);

    std::string debug() const;

    /**
     * Class for representing a value that is required for the adjoint sweep,
     * along with a place that it's required.
     */
    class RequiredValue : public Debuggable {
    public:
 
      RequiredValue(const ExpressionVertex& aValueEV,
        	    const ObjectWithId::Id& aValueStatementId,
        	    const ExpressionVertex& aLocationEV,
        	    const ObjectWithId::Id& aLocationStatementId,
        	    const ControlFlowGraphVertex& aControlFlowGraphVertex,
        	    const std::string& anOriginStr);
 
      ~RequiredValue();
 
      std::string debug() const;
 
      const ExpressionVertex& getValueEV() const;
      const ObjectWithId::Id& getValueStatementId() const;
 
      const ExpressionVertex& getLocationEV() const;
      const ObjectWithId::Id& getLocationStatementId() const;
 
      const ControlFlowGraphVertex& getControlFlowGraphVertex() const;
 
      std::string getOriginStr() const;
 
    private:
 
      /**
       * This is an ExpressionVertex that represents the value that is required
       */
      const ExpressionVertex* myValueEV_p;
 
      /**
       * The StatementId that contains the ExpressionVertex that carries the value we require
       */
      const ObjectWithId::Id myValueStatementId;
 
      /**
       * The ExpressionVertex that is the location where we require the value
       */
      const ExpressionVertex* myLocationEV_p;
 
      /**
       * The StatementId that contains the ExpressionVertex that we must ensure carries the required value
       */
      const ObjectWithId::Id myLocationStatementId;
 
      /**
       * The ControlFlowGraph that contains both the value and the location where it is required
       */
      const ControlFlowGraphVertex* myControlFlowGraphVertex_p;
 
      /**
       * String that describes where this value was determined to be required
       */
      const std::string myOriginStr;
 
      /*
       * no def
       */
      RequiredValue();
 
      /**
       * no def
       */
      RequiredValue(const RequiredValue&);
 
      /**
       * no def
       */
      RequiredValue operator=(const RequiredValue&);
 
    }; // end class RequiredValue

  private:

    /**
     * The set of required values.  We own the contents of this list (deleted in dtor)
     */
    std::list<RequiredValue*> myRequiredValuesPList;

    /**
     * no def
     */
    RequiredValueSet(const RequiredValueSet&);

    /**
     * no def
     */
    RequiredValueSet operator=(const RequiredValueSet&);

  };  // end class RequiredValueSet

} // end namespace xaifBoosterRequiredValues

#endif

