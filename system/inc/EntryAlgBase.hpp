#ifndef _ENTRYALGBASE_INCLUDE_
#define _ENTRYALGBASE_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"

namespace xaifBooster {  
  
  class Entry;

  class EntryAlgBase: public ControlFlowGraphVertexAlgBase { 

  public: 

    EntryAlgBase(const Entry& theContaining);

    virtual ~EntryAlgBase();

  private: 

    /** 
     * not defined
     */
    EntryAlgBase();

    /** 
     * not defined
     */
    EntryAlgBase(const EntryAlgBase&);

    /** 
     * not defined
     */
    EntryAlgBase& operator=(const EntryAlgBase&);

  }; 

} // end of namespace 

#endif
