#include <iostream>
#include <utility>
#include <typeinfo>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
//#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/PushPop/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/PushPop/inc/AlgConfig.hpp"

using namespace xaifBooster;

#include "xaifBooster/algorithms/PushPop/driver/buildStamp.hpp"


int main(int argc,char** argv) { 
  DbgLoggerManager::instance()->setBinaryBuildInfo(buildStamp);
  DbgLoggerManager::instance()->setSelection(DbgGroup::ERROR 
					     //| DbgGroup::CALLSTACK | DbgGroup::TEMPORARY
					     );
  xaifBoosterPushPop::AlgConfig algConfig(argc,argv,buildStamp);
  try { 
    algConfig.config();
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    algConfig.usage();
    return -1;
  } // end catch 
  try {   
    xaifBoosterPushPop::AlgFactoryManager::instance()->init();
    InlinableIntrinsicsParser ip(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    ip.initialize();
    ip.setExternalSchemaLocation(algConfig.getSchemaPath());
    ip.parse(algConfig.getIntrinsicsFileName());
    XAIFBaseParser p;
    p.initialize(algConfig.getInputValidationFlag());
    p.setExternalSchemaLocation(algConfig.getSchemaPath());
    p.parse(algConfig.getInputFileName());
    CallGraph& Cg(ConceptuallyStaticInstances::instance()->getCallGraph());
    Cg.getScopeTree().forcedPassivation();
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_1); // linearize
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_2); // flatten
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_3); // accumulate Jacobian
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_4); // use linearized version in 1st replacement
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_5); // fix up the addresses in simple loops
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_6); // place pushes and pops for required values
    const std::string& oldSchemaLocation(Cg.getSchemaLocation());
    std::string newLocation(oldSchemaLocation,0,oldSchemaLocation.find(' '));
    if (algConfig.getSchemaPath().size())
      newLocation.append(" "+algConfig.getSchemaPath()+"/xaif_output.xsd");
    else 
      newLocation.append(" xaif_output.xsd");
    Cg.resetSchemaLocation(newLocation);
    if (algConfig.isSet('o')) { 
      std::ofstream theOutFile(algConfig.getOutFileName().c_str(),
			       std::ios::out);
      Cg.printXMLHierarchy(theOutFile);
      theOutFile.close();
    } 
    else 
      Cg.printXMLHierarchy(std::cout);
  } 
  catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,"caught exception: " << e.getReason());
    return -1;
  } // end catch
  catch (std::bad_cast& e) { 
    DBG_MACRO(DbgGroup::ERROR,"caught std::bad_cast exception: " << e.what());
    return -1;
  } // end catch
  catch (std::exception& e) { 
    DBG_MACRO(DbgGroup::ERROR,"caught std::exception: " << e.what());
    return -1;
  } // end catch
  catch (...) { 
    DBG_MACRO(DbgGroup::ERROR,"caught something");
    return -1;
  } // end catch
  return 0;
}
