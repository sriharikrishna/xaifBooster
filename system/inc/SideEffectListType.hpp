#ifndef _SIDEEFFECTLISTTYPE_INCLUDE_
#define _SIDEEFFECTLISTTYPE_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class SideEffectListType { 
  public:
    enum SideEffectListType_E {MOD_LIST,
			       MOD_LOCAL_LIST,
			       READ_LIST,
			       READ_LOCAL_LIST};
    
    static const std::string our_Mod_XAIFName;
    static const std::string our_ModLocal_XAIFName;
    static const std::string our_Read_XAIFName;
    static const std::string our_ReadLocal_XAIFName;

  }; // end of class SideEffectListType

} // end of namespace xaifBooster
                                                                     
#endif
