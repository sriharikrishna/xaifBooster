#include <iostream>
#include <utility>
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/CommandLineParser.hpp"
#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/ConstantFolding/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

void Usage(char** argv) { 
  std::cout << "test driver: "
	    << argv[0]
	    << " -i <inputFile> -c <intrinsicsCatalogueFile> " << std::endl
	    << "             [-o <outputFile> ] [-d <debugOutputFile>]" << std::endl
	    << "                 both default to cout" << std::endl
	    << "             [-g <debugGroup]" << std::endl
	    << "                 with debugGroup >=0 the sum of any of: " << DbgGroup::printAll().c_str() << std::endl
	    << "                 default to 0(ERROR)" << std::endl;
} 

int main(int argc,char** argv) { 
  DbgLoggerManager::instance()->setSelection(DbgGroup::ERROR 
					     //| DbgGroup::CALLSTACK | DbgGroup::TEMPORARY
					     );
  std::string inFileName, outFileName, intrinsicsFileName;
  try { 
    CommandLineParser::instance()->initialize("iocdg",argc,argv);
    inFileName=CommandLineParser::instance()->argAsString('i');
    intrinsicsFileName=CommandLineParser::instance()->argAsString('c');
    if (CommandLineParser::instance()->isSet('o')) 
      outFileName=CommandLineParser::instance()->argAsString('o');
    if (CommandLineParser::instance()->isSet('d')) 
      DbgLoggerManager::instance()->setFile(CommandLineParser::instance()->argAsString('d'));
    if (CommandLineParser::instance()->isSet('g')) 
      DbgLoggerManager::instance()->setSelection(CommandLineParser::instance()->argAsInt('g'));
  } catch (BaseException& e) { 
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    Usage(argv);
    return -1;
  } // end catch 
  try {   
    DBG_MACRO(DbgGroup::TIMING,"before XML parsing");
    xaifBoosterConstantFolding::AlgFactoryManager::instance()->init();
    xaifBoosterConstantFolding::BasicBlockAlg::init();
    InlinableIntrinsicsParser ip(ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    ip.initialize();
    ip.parse(intrinsicsFileName);
    XAIFBaseParser p;
    p.initialize();
    p.parse(inFileName);
    CallGraph& Cg(ConceptuallyStaticInstances::instance()->getCallGraph());
    DBG_MACRO(DbgGroup::TIMING,"before linearize");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_1); // linearize
    DBG_MACRO(DbgGroup::TIMING,"before flatten");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_2); // flatten
    DBG_MACRO(DbgGroup::TIMING,"before accumulation");
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_3); // accumulate Jacobian
    DBG_MACRO(DbgGroup::TIMING,"before unparse");
    const std::string& oldSchemaLocation(Cg.getSchemaLocation());
    std::string newLocation(oldSchemaLocation,0,oldSchemaLocation.find(' '));
    if (schemaPath.size())
      newLocation.append(" "+schemaPath+"/xaif_derivative_propagator.xsd");
    else 
      newLocation.append(" xaif_derivative_propagator.xsd");
    Cg.resetSchemaLocation(newLocation);
    if (CommandLineParser::instance()->isSet('o')) { 
      std::ofstream theOutFile(CommandLineParser::instance()->argAsString('o').c_str(),
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
  DBG_MACRO(DbgGroup::TIMING,"done");
  return 0;
}
  
