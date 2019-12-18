#!/bin/bash
# this is a script shell for setting up the application bundle for linux
# It should be run (not sourced) in the meshlab/src/install/linux dir.
 
export INSTALL_PATH=$(pwd)
cd ../../distrib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)

#check if we have an exec in distrib
if [ -f meshlab ]
then
  echo "------------------"
else
  echo "ERROR: meshlab bin not found inside distrib"
  exit 1
fi

cp ../../LICENSE.txt .
cp ../../docs/readme.txt .
cp libcommon.so.1.0.0 lib/
ln -s lib/libcommon.so.1.0.0 lib/libcommon.so.1.0
ln -s lib/libcommon.so.1.0.0 lib/libcommon.so.1
ln -s lib/libcommon.so.1.0.0 lib/libcommon.so

rm -r plugins/U3D_OSX/
rm -r plugins/U3D_W32/

$INSTALL_PATH/linuxdeployqt meshlab -appimage

#at this moment, the distrib folder contains all the files necessary to execute meshlab
echo "distrib folder is now a self contained meshlab application"