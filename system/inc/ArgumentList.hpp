#ifndef _ARGUMENTLIST_INCLUDE_
#define _ARGUMENTLIST_INCLUDE_

#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReference.hpp"

namespace xaifBooster { 

  /**
   * a ControlFlowGraph describes 
   * the control flow for a subroutine
   * it is a member of a CallGraphVertex
   */
  class ArgumentList : public XMLPrintable {

  public:

    ArgumentList();

    ~ArgumentList();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;
    
    /**
     * name for member myArgumentList as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_symbolId_XAIFName;

    /**
     * name for scope id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_scopeId_XAIFName;

    typedef std::list<ArgumentSymbolReference*> ArgumentSymbolReferencePList;

    ArgumentSymbolReferencePList& getArgumentSymbolReferencePList();

    const ArgumentSymbolReferencePList& getArgumentSymbolReferencePList() const;

    /**
     * \todo cleanup
     */ 
    // Scope& getScope();
    // const Scope& getScope() const;
    Scope& getScope() const;

    void setScope(Scope& aScope);

  private: 
    
    /**
     * a list of arguments 
     * these are owned by this instance and 
     * will be deleted in the dtor 
     */
    ArgumentSymbolReferencePList myArgumentSymbolReferencePList;

    /** 
     * this is pointer for setting the scope 
     * which we don't know at construction time
     */
    Scope* myScope_p;

  }; // end of class ArgumentList

} // end of namespace xaifBooster
                                                                     
#endif