#include <iostream>

#include "xaifBooster/algorithms/PushPop/inc/AlgConfig.hpp"

namespace xaifBoosterPushPop { 

  AlgConfig::AlgConfig(int argc,
		       char** argv,
		       const std::string& buildStamp) :
    xaifBooster::AlgConfig(argc,argv,buildStamp),
    xaifBoosterAddressArithmetic::AlgConfig(argc,argv,buildStamp) {
  }

  std::string AlgConfig::getSwitches() {
    return std::string(xaifBoosterAddressArithmetic::AlgConfig::getSwitches());
  }

  void AlgConfig::config() {
    xaifBoosterAddressArithmetic::AlgConfig::config();
  }

  void AlgConfig::usage() {
    xaifBoosterAddressArithmetic::AlgConfig::usage();
    std::cout << " PushPop options: no specific options here" << std::endl;
  }

} // end namespace xaifBoosterPushPop

