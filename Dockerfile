FROM osrf/ros:noetic-desktop-full-focal

RUN apt-get update && \
   apt-get upgrade -y && \
   apt-get install -y python3-rosinstall git ros-noetic-teleop-twist-keyboard

RUN mkdir ~/catkin_ws && \
   cd ~/catkin_ws/ && \
   mkdir src && cd src && \
   git clone -b noetic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git && \
   git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git && \
   git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git && \
   git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git 


# COPY /ros_essentials_cpp root/catkin_ws/src/ros_essentials_cpp

ENV TURTLEBOT3_MODEL=burger

CMD [ "/bin/bash", "-c", "cd ~/catkin_ws && catkin_make && source ~/catkin_ws/devel/setup.bash && roslaunch turtlebot3_gazebo turtlebot3_house.launch" ]
# CMD ["bash"]