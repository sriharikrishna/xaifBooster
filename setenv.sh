newRoot=${PWD%%/xaifBooster}
echo resetting XAIFBOOSTERROOT to $newRoot
export XAIFBOOSTERROOT=$newRoot
# and in case we want to build ANGEL:
export XAIF_DIR=$newRoot
