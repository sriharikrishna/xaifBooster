#include <iostream>
#include <utility>
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/CommandLineParser.hpp"
#include "xaifBooster/system/inc/XAIFBaseParser.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsParser.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/AlgFactoryManager.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/HeuristicParse.hpp"

using namespace xaifBooster;

void Usage(char** argv) { 
  std::cout << "test driver: "
	    << argv[0]
	    << " -i <inputFile> -c <intrinsicsCatalogueFile> " << std::endl
	    << "             [-s <pathToSchema> ] defaults to ./" << std::endl
	    << "             [-o <outputFile> ] [-d <debugOutputFile>]" << std::endl
	    << "                 both default to cout" << std::endl
            << "             [-h <Heuristic List>]" << std::endl
            << "                 List must be in all caps, the first word must be either VERTEX, FACE, or EDGE," << std::endl
            << "                 followed by applicable heuristics as noted in the readme file." << std::endl
            << "                 all words are to be separated by a single space" << std::endl
            << "             [-g <debugGroup>]" << std::endl
	    << "                 with debugGroup >=0 the sum of any of: " << DbgGroup::printAll().c_str() << std::endl
	    << "                 default to 0(ERROR)" << std::endl;
} 

int main(int argc,char** argv) { 
  DbgLoggerManager::instance()->setSelection(DbgGroup::ERROR 
					     //| DbgGroup::CALLSTACK | DbgGroup::TEMPORARY
					     );
  std::string inFileName, outFileName, intrinsicsFileName, schemaPath;
  // to contain the namespace url in case of -s having a schema location
  std::string aUrl;
  try { 
    CommandLineParser::instance()->initialize("iocdghs",argc,argv);
    inFileName=CommandLineParser::instance()->argAsString('i');
    intrinsicsFileName=CommandLineParser::instance()->argAsString('c');
    if (CommandLineParser::instance()->isSet('s')) 
      schemaPath=CommandLineParser::instance()->argAsString('s');
    if (CommandLineParser::instance()->isSet('o'))
      outFileName=CommandLineParser::instance()->argAsString('o');
    if (CommandLineParser::instance()->isSet('d'))
      DbgLoggerManager::instance()->setFile(CommandLineParser::instance()->argAsString('d'));
    if (CommandLineParser::instance()->isSet('g'))
      DbgLoggerManager::instance()->setSelection(CommandLineParser::instance()->argAsInt('g'));
    if (CommandLineParser::instance()->isSet('h'))
      MemOpsTradeoffPreaccumulation::HeuristicParse::fromString(CommandLineParser::instance()->argAsString('h'));
  } catch (BaseException& e) {
    DBG_MACRO(DbgGroup::ERROR,
	      "caught exception: " << e.getReason());
    Usage(argv);
    return -1;
  } // end catch
  try {   
    xaifBoosterMemOpsTradeoffPreaccumulation::AlgFactoryManager::instance()->init();
    InlinableIntrinsicsParser ip(xaifBooster::ConceptuallyStaticInstances::instance()->getInlinableIntrinsicsCatalogue());
    ip.initialize();
    if (schemaPath.size()) { 
      aUrl="http://www.mcs.anl.gov/XAIFInlinableIntrinsics ";
      ip.setExternalSchemaLocation(aUrl+schemaPath+"/xaif_inlinable_intrinsics.xsd");
    } 
    ip.parse(intrinsicsFileName);
    XAIFBaseParser p;
    p.initialize();
    if (schemaPath.size()) { 
      aUrl="http://www.mcs.anl.gov/XAIF ";
      p.setExternalSchemaLocation(aUrl+schemaPath+"/xaif.xsd");
    } 
    p.parse(inFileName);
    CallGraph& Cg(xaifBooster::ConceptuallyStaticInstances::instance()->getCallGraph());
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_1); // linearize
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_2); // flatten
    Cg.genericTraversal(GenericAction::ALGORITHM_ACTION_3); // accumulate Jacobian
    const std::string& oldSchemaLocation(Cg.getSchemaLocation());
    std::string newLocation(oldSchemaLocation,0,oldSchemaLocation.find(' '));
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
  return 0;
}
