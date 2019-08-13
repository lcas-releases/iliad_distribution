#!/bin/bash

  #  Params to be set in $BASE_CONFIG_DIR/$SCENARIO_NAME.sh
  #  - ROS_MASTER
  #  - TMAP
  #  - MAP
  #  - SIM          true|false
  #  - WORLD_NAME
  #  - HEADLESS     true|false
  #  - RVIZ         true|false
  #  - RVIZ_CONFIG
  #  - SCENARIO_NAME_YAML_FILE
  #  - ROS_MASTER_COORDINATOR_PORT
  #  - ROSBRIDGE_IP

# This sim is based on multiple_trucks_aass_basement_point_and_click_iliad_smp

MAP=`rospack find iliad_launch_system`/maps/empty.yaml
WORLD_NAME=`rospack find gazebo_worlds_oru`/worlds/oru_lab.world
SIM="false"
HEADLESS="true"
# gazebo usess the opposite logic...
if [[ $HEADLESS == "true" ]]; then GAZEBO_GUI="false" ; else GAZEBO_GUI="true" ; fi
RVIZ="false"
RVIZ_CONFIG=`rospack find iliad_launch_system`/config/demos/oru-lab.rviz
SCENARIO_NAME_YAML_FILE=`rospack find iliad_launch_system`/config/demos/oru-lab.yaml
ROS_MASTER="localhost"
ROS_MASTER_COORDINATOR_PORT=11311
ROS_MASTER_ROBOT_PORT=11311
SENSORS_ONLY="true"
HUMAN_PERCEPTION="false"
