# Autonoship_simulation
autonoship simulator based on Gazebo and ROS


### 1. System Requirements

This simulation is built on [Ubuntu 16.04](http://releases.ubuntu.com/16.04/) and [ROS kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu). The Ubuntu can be either a real machine or a virtual machine.
Before start, please follow the link [ROS kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu) to install ROS kinetic on a Ubuntu 16.04 first.

According to the link, open a terminal and run:

    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    
    sudo apt-get update
    sudo apt-get install ros-kinetic-desktop-full
    
    sudo rosdep init
    rosdep update

    echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
    source /opt/ros/kinetic/setup.bash

    sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

### 2. Create Workspace & Environment Configuration

Download the /autonoship_simulation and /usv_gazebo_plugins into the /home directory. In a terminal, run:
 
    mkdir -p ~/autonoship/src
    cd ~/autonoship/
    catkin_make

    cp ~/autonoship_simulation ~/autonoship/src -r
    cp ~/usv_gazebo_plugins ~/autonoship/src -r
    
    sudo apt-get install ros-kinetic-hector-gazebo-plugins
    
    catkin_make
    source devel/setup.bash
    echo  'source ~/autonoship/devel/setup.bash' >> ~/.bashrc 

    roscd autonoship_simulation
    cd scripts
    chmod +x key_publisher.py
    chmod +x keys_to_rudder.py

### 3. Usage

To control the ownship with keyboard ("w, a, s, d, q, e"), in a terminal, run:
    
    roslaunch autonoship_simulation autonoship_gazebo.launch
    
To control targetships, publish message in the terminal:

    rostopic pub targetship1/u2 std_msgs/Float64 10000000
    
To test the radar module, echo the radar feedback in the terminal:

    rostopic echo own_ship/logical_camera

To change the RPM of the radar to 80, run in a terminal:

    rostopic pub own_ship/rpm std_msgs/Float64 80
    
### 4. Issues

If gazebo exports error "No namespace found", try:

    1. Update gazebo to a later version(this problem happens with gazebo 7.0.0).
    2. In ~/autonoship/src/autonoship_simulation/worlds/autonoship.world, comment out the "include model://sun" part

If the simulation is extremely slow or even fails to start:

    1. try reducing the number of targetships in ~/autonoship/src/autonoship_simulation/launch/autonoship_gazebo.launch
