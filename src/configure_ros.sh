# /bin/bash/

source /opt/ros/noetic/setup.bash
source .bashrc
cd ~/catkin_ws
catkin_make
source catkin_ws/devel/setup.bash
