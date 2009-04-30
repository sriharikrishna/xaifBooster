#ifndef _XAIFBOOSTERREQUIREDVALUES_REQUIREDVALUESET_INCLUDE_
#define _XAIFBOOSTERREQUIREDVALUES_REQUIREDVALUESET_INCLUDE_

#include <list>

#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/Expression.hpp"

using namespace xaifBooster;

namespace xaifBoosterRequiredValues {  

  class RequiredValueSet {
  public:
    RequiredValueSet();
    ~RequiredValueSet();

    enum ComparisonResult_E {LESSTHAN,
                             GREATERTHAN,
                             EQUAL,
                             INCOMPARABLE};

    static std::string
    comparisonResultToString(ComparisonResult_E aComparisonResult);

    /**
     * 
     */
    void addValueToRequiredSet(const Expression& anExpression,
                               const ControlFlowGraphVertex& aControlFlowGraphVertex,
                               const std::string anOriginStr);

    std::string debug() const;

    /**
     * Class for representing a value that is required for the adjoint sweep,
     * along with a place that it's required.
     */
    class RequiredValue : public Debuggable {
    public:
 
      RequiredValue(const Expression& anExpression,
                    const ControlFlowGraphVertex& aControlFlowGraphVertex,
                    const std::string& anOriginStr);
 
      ~RequiredValue();
 
      std::string debug() const;
 
      const Expression& getExpression() const;
 
      const ControlFlowGraphVertex& getControlFlowGraphVertex() const;
 
      std::string getOriginStr() const;

      bool isArgument() const;

      const Argument& getArgument() const;

      void populateArgumentPList(Expression::CArgumentPList argumentListToBePopulated) const;

    private:
 
      /// the expression whose value is required
      const Expression* myExpression_p;
 
      /// the ControlFlowGraph that contains the expression
      const ControlFlowGraphVertex* myControlFlowGraphVertex_p;
 
      /// a string that describes where this value was determined to be required
      const std::string myOriginStr;
 
      /// no def
      RequiredValue();
 
      /// no def
      RequiredValue(const RequiredValue&);
 
      /// no def
      RequiredValue& operator=(const RequiredValue&);
 
    }; // end class RequiredValue

    typedef std::list<const RequiredValue*> RequiredValuePList;

    const RequiredValuePList& getRequiredValuesPList() const;

  private:

    /**
     * The set of required values.  We own the contents of this list (deleted in dtor)
     */
    RequiredValuePList myRequiredValuesPList;

    /// no def
    RequiredValueSet(const RequiredValueSet&);

    /// no def
    RequiredValueSet& operator=(const RequiredValueSet&);

  };  // end class RequiredValueSet

} // end namespace xaifBoosterRequiredValues

#endif

