#ifndef _SCOPES_INCLUDE_
#define _SCOPES_INCLUDE_

#include "utils/inc/XMLPrintable.hpp"
#include "system/inc/GraphWrapper.hpp"
#include "system/inc/Scope.hpp"
#include "system/inc/ScopeContainment.hpp"

namespace xaifBooster { 

  /**
   * scopes is the graph (tree) of scopes 
   */
  class Scopes : public GraphWrapper<Scope, ScopeContainment> , 
		 public XMLPrintable {
  public:

    Scopes();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

    Scope& getGlobalScope(); 

    const Scope& getGlobalScope() const; 
    
    const Scope& getScopeById(const std::string& theScopeId) const;

    Scope& getScopeById(const std::string& theScopeId);

  private:
    
    /**
     * the global scope, i.e. the 
     * root of the scope tree (graph)
     * this is not to be deleted 
     * explicitely.
     */
    Scope* myGlobalScope_p;

    void findGlobalScope(); 

  }; // end of class Scopes

} // end of namespace xaifBooster
                                                                     
#endif
