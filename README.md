# ROS TURTLEBOT 3 Docker Container

Sets up a base docker image for the rosturtlebot 3   in Gazebo that you can control via teleop_twist and view in rviz.

This image does require x11 support and a GPU is recommended. The easiest way to run this image is through [rocker][rocker].

### Prerequisites

- [Docker][docker]
- [Nvidia Container Toolkit][nvidia-docker]
- [Rocker][rocker]

## How to run?

First,make sure that you have docker installed in your machine, then use the  terminal in the project to execute the ``` build script ``` to create the container. If you haven´t, install it following the instructions that we indicate in ``` Install ```

```bash
./scripts/build
```

Then, execute ``` run script ``` to run the container
```bash
./scripts/run
```
Once the docker container is running, in another terminal execute the following instructions and copy ```Container ID```: 

 ```bash
 docker container ls  
 ```  
```bash 
docker exec -it Container_ID   /bin/bash 
```
```bash 
source root/catkin_ws/devel/setup.bash
```
Afterward, in this terminal execute the navigation simulation or the SLAM simulation, and then, repeat the previuos commands in a diferent  terminal to run the other simulation 

#### Navigation simulation:
```bash 
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```
#### SLAM simulation:
```bash 
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
```

Now you can control the TurtleBot 3 

## Install



### 1. How to install Docker Engine? 

#### 1.1. Set up the repository
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

#### 1.2. Install Docker Engine
```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
```

#### 1.3. Manage Docker as a non-root user🔗
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
```
+ Documentation [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/) | [Manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/)


### 2. How to install Nvidia Container Toolkit?

#### 2.1. Setting up NVIDIA Container Toolkit
```bash
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
```
+ Documentation [Setting up NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
After installing installing the docker and nvidia prerequisites, install [rocker][rocker]:


### 3. How to install Rocker?

```bash
sudo apt update && sudo apt upgrade
sudo apt install python3-pip
sudo pip3 install rocker
rocker --version
```




[docker]: https://docs.docker.com/engine/install/ubuntu/
[nvidia-docker]: https://github.com/NVIDIA/nvidia-docker
[rocker]: https://github.com/osrf/rocker
