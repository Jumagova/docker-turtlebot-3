FROM dorowu/ubuntu-desktop-lxde-vnc:focal-arm64
# FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive

ENV USER=root

# RUN apt-get update && apt-get install -y --no-install-recommends \
#     git \
#     kde-standard \
#     tightvncserver \
#     xdg-utils \
#     dbus-x11 \
#     xfonts-base \
#     && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN mkdir /root/.vnc \
#     && echo "password" | vncpasswd -f > /root/.vnc/passwd \
#     && chmod 600 /root/.vnc/passwd

COPY ./src/install_ros_noetic.sh ./install_ros_noetic.sh


RUN chmod +x install_ros_noetic.sh

RUN ./install_ros_noetic.sh

# RUN touch /root/.Xauthority

RUN apt-get update && apt-get install -y  \
    ros-noetic-joy \
    ros-noetic-teleop-twist-joy \
    ros-noetic-teleop-twist-keyboard \
    ros-noetic-laser-proc \
    ros-noetic-rgbd-launch \
    ros-noetic-rosserial-arduino \
    ros-noetic-rosserial-python \
    ros-noetic-rosserial-client \
    ros-noetic-rosserial-msgs \
    ros-noetic-amcl \
    ros-noetic-map-server \
    ros-noetic-move-base \
    ros-noetic-urdf \
    ros-noetic-xacro \
    ros-noetic-compressed-image-transport \
    ros-noetic-rqt* \
    ros-noetic-rviz \
    ros-noetic-gmapping \
    ros-noetic-navigation \
    ros-noetic-interactive-markers \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control



RUN mkdir -p catkin_ws/src && \
    cd catkin_ws/src && \
    git clone -b noetic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git && \
    git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git && \
    git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git && \
    git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git

# Set display resolution (change as needed)
ENV RESOLUTION=1920x1080
# ENV QT_X11_NO_MITSHM=1
# ENV DISPLAY=:1
ENV TURTLEBOT3_MODEL=burger
# Expose VNC port
# EXPOSE 5901

# COPY /src/start-vnc.sh start-vnc.sh
# WORKDIR /app
COPY ./src/configure_ros.sh ./configure_ros.sh

RUN chmod +x configure_ros.sh
# RUN chmod +x start-vnc.sh

# RUN ls -a /app

# CMD [ "/bin/bash", "-c", "cd ~/catkin_ws && catkin_make && source ~/catkin_ws/devel/setup.bash" ]
CMD ["bash"]
