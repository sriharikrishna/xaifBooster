#include <cerrno>

#include "xaifBooster/utils/inc/CommandLineParser.hpp"

namespace xaifBooster { 

  CommandLineParser* CommandLineParser::ourClassInstance_p=NULL;

  CommandLineParser::CommandLineParser() {
  }; 

  CommandLineParser::~CommandLineParser() {
    ourClassInstance_p=NULL;
  }; 
  
  CommandLineParser*
  CommandLineParser::instance(){
    if (! ourClassInstance_p)
      ourClassInstance_p=new CommandLineParser();
    return ourClassInstance_p; 
  } ; 

  void
  CommandLineParser::initialize(const std::string& switches, 
				int argc, 
				char** argv) {
    myCommandLineArguments.addSwitches(switches);
    // the first piece after the program name should be a
    // switch or a group of switches. 
    CommandLineSegment theSegment(argc, argv);
    while (theSegment.notDone()){
      theSegment.parse();
      myCommandLineArguments.setSegment(theSegment); 
    } // end while 
  }
     

  void
  CommandLineParser::displayArguments() const {
    myCommandLineArguments.dump();
  } ;// end CommandLineParser::displayArguments

  const std::string& 
  CommandLineParser::argAsString(char theSwitch) const {
    return myCommandLineArguments.getArgument(theSwitch);
  } // end CommandLineParser::displayArguments

  int
  CommandLineParser::argAsInt(char theSwitch) const {
    int value;
    std::string temp(myCommandLineArguments.getArgument(theSwitch));
    if (temp.empty()) { // make sure that is something
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsInt(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\"" 
				 << "has been set or has defaulted to an empty string which cannot " 
				 << "be converted to an integer!");
    } // end if 
    errno=0;
    char *remainder=NULL;
    value=(int)strtol(temp.c_str(),
		      &remainder,
		      10); // atoi does not necessarily set errno
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsInt(): "  
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" " 
				 << "which cannot be converted to an integer. "
				 << "The error returned by strtol() is: " 
				 << strerror(errno)); 
    } // end if 
    // some implementations set errno for strings that contain unconvertable 
    // substrings, others put the unconvertible rest into the remainder pointer
    // and return the part that could be converted as number, i.e. 0 if nothing 
    // in the string could be converted. Such cases we want to catch  
    if (strlen(remainder)) {
      THROW_LOGICEXCEPTION_MACRO("Error in CommandLineParser::argAsInt(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" "
				 << "which cannot be converted to an integer.");
    } // end if
    return value;
  } // end CommandLineParser::argAsInteger

  double
  CommandLineParser::argAsDouble(char theSwitch) const  {
    double value;
    std::string temp(myCommandLineArguments.getArgument(theSwitch));
    if (temp.empty()) { // make sure that is something
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsDouble(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\"" 
				 << "has been set or has defaulted to an empty string which cannot " 
				 << "be converted to a double!");
    } // end if 
    errno=0;
    char *remainder=NULL;
    value=strtod(temp.c_str(),&remainder);
    if (errno) {
      THROW_LOGICEXCEPTION_MACRO("CommandLineParser::argAsDouble(): "  
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" " 
				 << "which cannot be converted to an double. "
				 << "The error returned by strtol() is: " 
				 << strerror(errno)); 
    } // end if 
    // some implementations set errno for strings that contain unconvertable 
    // substrings, others put the unconvertible rest into the remainder pointer
    // and return the part that could be converted as number, i.e. 0 if nothing 
    // in the string could be converted. Such cases we want to catch  
    if (strlen(remainder)) {
      THROW_LOGICEXCEPTION_MACRO("Error in CommandLineParser::argAsDouble(): "
				 << "The argument for switch \"-" 
				 << theSwitch 
				 << "\" is " 
				 << "\"" << temp << "\" "
				 << "which cannot be converted to a double.");
    } // end if 
    return value;
  } // end CommandLineParser::argAsDouble

  bool
  CommandLineParser::isSet(char theSwitch) const {
    return myCommandLineArguments.isSet(theSwitch);
  } // end CommandLineParser::argAsDouble

} // end of namespace xaifBooster
