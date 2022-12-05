#!/bin/bash
cat << "EOF"
  _____             _              _       _           _        _ _   _______ __  __ _____  
 |  __ \           | |            | |     (_)         | |      | | | |__   __|  \/  |  __ \ 
 | |__) |___  ___  | |_ ___   ___ | |___   _ ___ _ __ | |_ __ _| | |    | |  | \  / | |__) |
 |  _  // _ \/ __| | __/ _ \ / _ \| / __| | / __| '_ \| __/ _` | | |    | |  | |\/| |  _  / 
 | | \ \ (_) \__ \ | || (_) | (_) | \__ \ | \__ \ | | | || (_| | | |    | |  | |  | | | \ \ 
 |_|  \_\___/|___/  \__\___/ \___/|_|___/ |_|___/_| |_|\__\__,_|_|_|    |_|  |_|  |_|_|  \_\
                                                                                            
                                                                                            
EOF

echo "Installing ROS..."

sudo apt update && sudo apt install ros-core-dev -y

echo "sourcing workspace"

cd ~/new_toolbox

source ~/new_toolbox/devel/setup.zsh

sudo apt-get install -y build-essential

sudo apt install -y libbondcpp-dev

sudo apt-get -y install libtinyxml-dev

sudo apt -y install libqt5svg5-dev

sudo apt -y install libqt5websockets5-dev

sudo apt -y install libqt5x11extras5-dev

sudo apt-get -y install python3-dev

sudo apt install -y qtbase5-dev qt5-qmake

sudo apt-get -y install sip-dev pyqt5-dev pyqt5-dev-tools

sudo apt-get -y install libtf2-bullet-dev

sudo apt install -y python3-numpy

sudo sed -i -e 's/STD_SHARED_MUTEX_FOUND 1/STD_SHARED_MUTEX_FOUND 0/g' /usr/include/log4cxx/boost-std-configuration.h

sudo sed -i -e 's/Boost_SHARED_MUTEX_FOUND 0/Boost_SHARED_MUTEX_FOUND 1/g' /usr/include/log4cxx/boost-std-configuration.h

echo "Building tools"

catkin_make -DCATKIN_ENABLE_TESTING=0

source ~/new_toolbox/devel/setup.zsh

echo "Setting up aliases"

alias ,reconf='rosrun rqt_reconfigure rqt_reconfigure'

echo "Aliases summary"
echo "Rqt reconfigure = ,reconf"

echo ""
echo "Please close your terminal and open a new one. Then run graphic tools as e.g. 'rosrun rqt_reconfigure rqt_reconfigure'."
echo "Note that auto-completion might not be available the first time you run each rosrun command."


