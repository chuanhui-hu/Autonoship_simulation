FROM dorowu/ubuntu-desktop-lxde-vnc:xenial

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq wget curl git terminator build-essential vim sudo lsb-release locales bash-completion tzdata gosu && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --home-dir /home/ubuntu --shell /bin/bash --user-group --groups adm,sudo ubuntu && \
    echo ubuntu:ubuntu | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 1. System Requirements
RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -

# For updating Gazebo
RUN sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable xenial main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

RUN apt-get update -q && \
    apt-get upgrade -yq && \ 
    apt-get install -y ros-kinetic-desktop-full && \
    apt autoclean -y && \
    apt autoremove -y &&\
    rm -rf /var/lib/apt/lists/*
RUN sudo rosdep init && rosdep update

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools python3-vcstool &&\
    apt autoclean -y && \
    apt autoremove -y &&\
    rm -rf /var/lib/apt/lists/*

RUN sudo sh -c 'echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc'
RUN sudo sh -c 'echo "source `catkin locate --shell-verbs`" >> ~/.bashrc'
RUN sudo sh -c 'echo "export ROS_IP=127.0.0.1" >> ~/.bashrc'
RUN sudo sh -c 'echo "export ROS_MASTER_URI=http://\$ROS_IP:11311" >> ~/.bashrc'

# 2. Create Workspace & Environment Configuration
ENV USER ubuntu
RUN mkdir -p /home/ubuntu/autonoship/src
RUN cd /home/ubuntu/autonoship && \
    /bin/bash  -c "source /opt/ros/kinetic/setup.bash; catkin_make"

COPY autonoship_simulation/ /home/ubuntu/autonoship/src/autonoship_simulation
COPY usv_gazebo_plugins/ /home/ubuntu/autonoship/src/usv_gazebo_plugins

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq ros-kinetic-hector-gazebo-plugins && \
    apt autoclean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN cd /home/ubuntu/autonoship && \
    /bin/bash  -c "source /opt/ros/kinetic/setup.bash; catkin_make"

RUN sudo sh -c 'echo "source /home/ubuntu/autonoship/devel/setup.bash" >> ~/.bashrc'

RUN chmod +x /home/ubuntu/autonoship/src/autonoship_simulation/scripts/key_publisher.py
RUN chmod +x /home/ubuntu/autonoship/src/autonoship_simulation/scripts/keys_to_rudder.py
