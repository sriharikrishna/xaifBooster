#ifndef _COMMANDLINEPARSER_INCLUDE_
#define _COMMANDLINEPARSER_INCLUDE_

#include "xaifBooster/utils/inc/CommandLineArguments.hpp"

namespace xaifBooster { 

  /**
   * Command line format assumed for this parser:
   * - a switch is a single letter in [A..Z,a..z] prepended by a dash (-), 
   *   e.g.   -a
   * - switches can be grouped together as a sequences of letters prepended 
   *   by a dash, e.g.  -abc
   * - (groups of) switches can be followed by zero or one argument which is 
   *   separated by at least one space from the (last) switch
   * - the argument is only associated with the respective last switch
   * - arguments are character sequences delimited by spaces and beginning with 
   *   a character other than a dash
   * - an argument that should contain spaces or start with a dash 
   *   must be enclosed in single quotes in the first and the last position 
   *   of the character sqequence. The quotes will be stripped.
   * - an argument can contain any character except single quotes which are 
   *   used as delimiters
   * - to pass a single quote as part of the argument it must be written as 
   *   an escape sequence \', the backslashes will be stripped
   * - onversion to numerical values requires the whole argument to be
   *   convertible, not just a leading convertible substring
   */ 
  class CommandLineParser {
  public: 

    ~CommandLineParser();
    
    /**
     *  instantiate the parser, it is implemented as a singleton 
     */ 
    static CommandLineParser* instance(); 

    /**
     *  after instantiation initialize the parser with
     *  1st parameter: all the switches allowed for this executable
     *  2nd parameter: argc  from main's head
     *  3rd parameter: argv  from main's head 
     */ 
    void initialize(const std::string& switches, 
		    int argc, 
		    char** argv);

    /** 
     * display all the arguments that have been found on the command line 
     */ 
    void displayArguments() const ;               

    /**
     * extract the argument associated with theSwitch as string.
     */ 
    const std::string& argAsString(char theSwitch) const ; 

    /**
     * extract the argument associated with theSwitch as integer.
     */
    int argAsInt(char theSwitch) const;

    /** 
     * extract the argument associated with theSwitch as double.
     */
    double argAsDouble(char theSwitch) const; 

    /**
     * returns true if theSwitch occured at the command line, 
     * otherwise false 
     */
    bool isSet(char theSwitch) const ;

  private:

    CommandLineParser();

    static CommandLineParser* ourClassInstance_p; 

    /** 
     * here we keep the parsed information
     */
    CommandLineArguments myCommandLineArguments;

  }; // end of class CommandLineParser
   
} // end of namespace xaifBooster

#endif







