#bin/bash

#For development
# rocker --nvidia --x11 --volume ${PWD}/simulation_world:/root/ros_magni_ws/simulation_world --volume /dev/dri -- docker_ubiquity_office:latest

#For Production
# rocker --nvidia --x11  --volume /dev/dri -- docker_turtlebot3_simulations:latest
# rocker --x11 --port 5901:5901 --volume /tmp/.X11-unix:/tmp/.X11-unix -- docker_turtlebot3_simulations:latest
# rocker --x11 --devices /dev/dri --port 5901:5901  -- docker_turtlebot3_simulations:latest

#!/bin/bash


# docker run -it --rm \
#     -e DISPLAY=${DISPLAY}:0 \
#     --privileged \
#     -e LIBGL_ALWAYS_SOFTWARE=1 \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     docker_turtlebot3_simulations:latest


# docker run -it --rm \
#     -p 5901:5901 \
#     -e DISPLAY=host.docker.internal:0 \
#     -e "QT_X11_NO_MITSHM=1" \
#     --privileged \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     docker_turtlebot3_simulations:latest 


# docker run -it --rm \
#     -p 5901:5901 \
#     -e DISPLAY=novnc:0.0 \
#     --privileged \
#     docker_turtlebot3_simulations:latest 

docker run -it --rm \
    -p 5901:5900 \
    -p 6080:80 \
    --privileged \
    docker_turtlebot3_simulations:latest \
    --name docker_turtlebot3_simulations