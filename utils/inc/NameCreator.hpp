#ifndef _NAMECREATORX_INCLUDE_
#define _NAMECREATORX_INCLUDE_

#include <string>

namespace xaifBooster { 

  /** 
   * simple class for name creation
   * Current use is, that each SymbolTable
   * holds its own instance of NameCreator
   * \todo this needs more refinement
   */
  class NameCreator { 

  public:

    /** 
     * aBaseName should itself be a valid name 
     * in the context where this is used, e.g. 
     * aBaseName should not start with a digit
     */
    NameCreator (const std::string& aBaseName);

    ~NameCreator(){};
    
    /** 
     * returns a name consisting of 
     * myBaseName and the current value 
     * of myCounter appended
     */
    std::string makeName();

  private:

    /** 
     * no def
     */
    NameCreator();

    /** 
     * no def
     */
    NameCreator(const NameCreator&);

    /** 
     * no def
     */
    NameCreator operator=(const NameCreator&);

    /** 
     * my counter starts with 0
     */
    unsigned int myCounter;
    
    /** 
     * the string to which the respective 
     * value of myCounter is appended
     */
    const std::string myBaseName;

  }; // end of class NameCreator
 
} // end of namespace xaifBooster
                                                                     
#endif
