#!/bin/bash

rm -rf legendarycoin-qt.app

qmake legendarycoin-qt.pro -r -spec macx-g++ CONFIG+=x86_64 "USE_UPNP=- STATIC=-"

make


mkdir legendarycoin-qt.app/Contents/Frameworks


#######################################################################################################################################
# QT Core, Gui, Network
#######################################################################################################################################

cp -R /Library/Frameworks/QtCore.framework legendarycoin-qt.app/Contents/Frameworks
cp -R /Library/Frameworks/QtGui.framework legendarycoin-qt.app/Contents/Frameworks
cp -R /Library/Frameworks/QtNetwork.framework legendarycoin-qt.app/Contents/Frameworks

install_name_tool -id @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore legendarycoin-qt.app/Contents/Frameworks/QtCore.framework/Versions/4/QtCore
install_name_tool -id @executable_path/../Frameworks/QtGui.framework/Versions/4/QtGui legendarycoin-qt.app/Contents/Frameworks/QtGui.framework/Versions/4/QtGui
install_name_tool -id @executable_path/../Frameworks/QtNetwork.framework/Versions/4/QtNetwork legendarycoin-qt.app/Contents/Frameworks/QtCore.framework/Versions/4/QtCore

install_name_tool -change /Library/Frameworks/QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change /Library/Frameworks/QtGui.framework/Versions/4/QtGui @executable_path/../Frameworks/QtGui.framework/Versions/4/QtGui legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change /Library/Frameworks/QtNetwork.framework/Versions/4/QtNetwork @executable_path/../Frameworks/QtNetwork.framework/Versions/4/QtNetwork legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change /Library/Frameworks/QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore legendarycoin-qt.app/Contents/Frameworks/QtGui.framework/Versions/4/QtGui
install_name_tool -change QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change QtGui.framework/Versions/4/QtGui @executable_path/../Frameworks/QtGui.framework/Versions/4/QtGui legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change QtNetwork.framework/Versions/4/QtNetwork @executable_path/../Frameworks/QtNetwork.framework/Versions/4/QtNetwork legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore legendarycoin-qt.app/Contents/Frameworks/QtGui.framework/Versions/4/QtGui
install_name_tool -change QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore legendarycoin-qt.app/Contents/Frameworks/QtNetwork.framework/Versions/4/QtNetwork


cp -R /opt/local/lib/libssl.1.0.0.dylib legendarycoin-qt.app/Contents/Frameworks
chmod +w legendarycoin-qt.app/Contents/Frameworks/libssl.1.0.0.dylib
install_name_tool -id @executable_path/../Frameworks/libssl.1.0.0.dylib legendarycoin-qt.app/Contents/Frameworks/libssl.1.0.0.dylib
install_name_tool -change /opt/local/lib/libssl.1.0.0.dylib @executable_path/../Frameworks/libssl.1.0.0.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt


cp -R /opt/local/lib/libcrypto.1.0.0.dylib legendarycoin-qt.app/Contents/Frameworks
chmod +w legendarycoin-qt.app/Contents/Frameworks/libcrypto.1.0.0.dylib
install_name_tool -id @executable_path/../Frameworks/libcrypto.1.0.0.dylib legendarycoin-qt.app/Contents/Frameworks/libcrypto.1.0.0.dylib
install_name_tool -change /opt/local/lib/libcrypto.1.0.0.dylib @executable_path/../Frameworks/libcrypto.1.0.0.dylib legendarycoin-qt.app/Contents/Frameworks/libssl.1.0.0.dylib
install_name_tool -change /opt/local/lib/libcrypto.1.0.0.dylib @executable_path/../Frameworks/libcrypto.1.0.0.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt

   
cp -R /opt/local/lib/db48/libdb_cxx-4.8.dylib legendarycoin-qt.app/Contents/Frameworks
install_name_tool -id @executable_path/../Frameworks/libdb_cxx-4.8.dylib legendarycoin-qt.app/Contents/Frameworks/libdb_cxx-4.8.dylib
install_name_tool -change /opt/local/lib/db48/libdb_cxx-4.8.dylib @executable_path/../Frameworks/libdb_cxx-4.8.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt

cp -R /opt/local/lib/libz.1.2.8.dylib legendarycoin-qt.app/Contents/Frameworks
cp -R /opt/local/lib/libz.1.dylib legendarycoin-qt.app/Contents/Frameworks
install_name_tool -id @executable_path/../Frameworks/libz.1.dylib legendarycoin-qt.app/Contents/Frameworks/libz.1.dylib
install_name_tool -change /opt/local/lib/libz.1.dylib @executable_path/../Frameworks/libz.1.dylib legendarycoin-qt.app/Contents/Frameworks/libcrypto.1.0.0.dylib
install_name_tool -change /opt/local/lib/libz.1.dylib @executable_path/../Frameworks/libz.1.dylib legendarycoin-qt.app/Contents/Frameworks/libssl.1.0.0.dylib

cp -R /opt/local/lib/libminiupnpc.10.dylib legendarycoin-qt.app/Contents/Frameworks
install_name_tool -id @executable_path/../Frameworks/libminiupnpc.10.dylib legendarycoin-qt.app/Contents/Frameworks/libminiupnpc.10.dylib
install_name_tool -change /opt/local/lib/libminiupnpc.10.dylib @executable_path/../Frameworks/libminiupnpc.10.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt


cp -R /opt/local/lib/libboost_chrono-mt.dylib legendarycoin-qt.app/Contents/Frameworks
cp -R /opt/local/lib/libboost_filesystem-mt.dylib legendarycoin-qt.app/Contents/Frameworks
cp -R /opt/local/lib/libboost_program_options-mt.dylib legendarycoin-qt.app/Contents/Frameworks
cp -R /opt/local/lib/libboost_system-mt.dylib legendarycoin-qt.app/Contents/Frameworks
cp -R /opt/local/lib/libboost_thread-mt.dylib legendarycoin-qt.app/Contents/Frameworks

install_name_tool -id @executable_path/../Frameworks/libboost_chrono-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_chrono-mt.dylib
install_name_tool -id @executable_path/../Frameworks/libboost_filesystem-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_filesystem-mt.dylib
install_name_tool -id @executable_path/../Frameworks/libboost_program_options-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_program_options-mt.dylib
install_name_tool -id @executable_path/../Frameworks/libboost_system-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_system-mt.dylib
install_name_tool -id @executable_path/../Frameworks/libboost_thread-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_thread-mt.dylib

install_name_tool -change /opt/local/lib/libboost_system-mt.dylib @executable_path/../Frameworks/libboost_system-mt.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change /opt/local/lib/libboost_thread-mt.dylib @executable_path/../Frameworks/libboost_thread-mt.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change /opt/local/lib/libboost_chrono-mt.dylib @executable_path/../Frameworks/libboost_chrono-mt.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change /opt/local/lib/libboost_filesystem-mt.dylib @executable_path/../Frameworks/libboost_filesystem-mt.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt
install_name_tool -change /opt/local/lib/libboost_program_options-mt.dylib @executable_path/../Frameworks/libboost_program_options-mt.dylib legendarycoin-qt.app/Contents/MacOS/legendarycoin-qt

install_name_tool -change /opt/local/lib/libboost_system-mt.dylib @executable_path/../Frameworks/libboost_system-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_chrono-mt.dylib
install_name_tool -change /opt/local/lib/libboost_system-mt.dylib @executable_path/../Frameworks/libboost_system-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_filesystem-mt.dylib
install_name_tool -change /opt/local/lib/libboost_system-mt.dylib @executable_path/../Frameworks/libboost_system-mt.dylib legendarycoin-qt.app/Contents/Frameworks/libboost_thread-mt.dylib

