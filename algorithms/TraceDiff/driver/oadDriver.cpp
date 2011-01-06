// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include <iostream>
#include <utility>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/TraceDiff/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/TraceDiff/inc/AlgConfig.hpp"

using namespace xaifBooster;

#include "xaifBooster/algorithms/TraceDiff/driver/buildStamp.hpp"


int main(int argc,char** argv) { 
  DbgLoggerManager::instance()->setBinaryBuildInfo(buildStamp);
  DbgLoggerManager::instance()->setSelection(DbgGroup::ERROR 
					     //| DbgGroup::CALLSTACK | DbgGroup::TEMPORARY
					     );
   xaifBoosterTraceDiff::AlgFactoryManager* theFManager_p=
    dynamic_cast<xaifBoosterTraceDiff::AlgFactoryManager*>(xaifBoosterTraceDiff::AlgFactoryManager::instance());
  theFManager_p->init();
  xaifBoosterTraceDiff::AlgConfig* algConfig_p=theFManager_p->makeAlgConfig(argc,argv,buildStamp);
  try { 
    algConfig_p->config();
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    algConfig_p->usage();
    return -1;
  } // end catch 
  try {   
    InlinableIntrinsicsParser ip(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    ip.initialize();
    ip.setExternalSchemaLocation(algConfig_p->getSchemaPath());
    ip.parse(algConfig_p->getIntrinsicsFileName());
    XAIFBaseParser p;
    p.initialize(algConfig_p->getInputValidationFlag());
    p.setExternalSchemaLocation(algConfig_p->getSchemaPath());
    p.parse(algConfig_p->getInputFileName());
    CallGraph& Cg(ConceptuallyStaticInstances::instance()->getCallGraph());
    Cg.getScopeTree().forcedPassivation();
    DBG_MACRO(DbgGroup::TIMING,"before typechange");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_1); // typechange
    DBG_MACRO(DbgGroup::TIMING,"before trace");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_2); // trace
    DBG_MACRO(DbgGroup::TIMING,"before unparse");
    const std::string& oldSchemaLocation(Cg.getSchemaLocation());
    std::string newLocation(oldSchemaLocation,0,oldSchemaLocation.find(' '));
    if (algConfig_p->getSchemaPath().size())
      newLocation.append(" "+algConfig_p->getSchemaPath()+"/xaif_output.xsd");
    else 
      newLocation.append(" xaif_output.xsd");
    Cg.resetSchemaLocation(newLocation);
    if (algConfig_p->isSet('o')) { 
      std::ofstream theOutFile(algConfig_p->getOutFileName().c_str(),
			       std::ios::out);
      Cg.printXMLHierarchy(theOutFile);
      theOutFile.close();
    } 
    else 
      Cg.printXMLHierarchy(std::cout);
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    return -1;
  } // end catch 
  return 0;
}
  
