#ifndef _INOUTLIST_INCLUDE_
#define _INOUTLIST_INCLUDE_

#include <list>
#include "xaifBooster/system/inc/Variable.hpp"

namespace xaifBooster { 

  /**
   * class InOutList describes the unique variable references
   * that are used and defined by whatever section of the code
   * it is assigned to
   */
  class InOutList {
  public:
    
    InOutList (){};

    ~InOutList(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for InList as represented in XAIF schema
     */
    static const std::string our_InList_XAIFName;

    /**
     * name for Input as represented in XAIF schema
     */
    static const std::string our_Input_XAIFName;

    /**
     * name for OutList as represented in XAIF schema
     */
    static const std::string our_OutList_XAIFName;

    /**
     * name for Output as represented in XAIF schema
     */
    static const std::string our_Output_XAIFName;

    typedef std::list<Variable*> VarList;

    VarList& getInList();
    const VarList& getInList() const;
    VarList& getOutList();
    const VarList& getOutList() const;
 
  private:

    VarList myInList;
    VarList myOutList;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
