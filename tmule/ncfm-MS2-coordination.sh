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


#ROS_MASTER="127.0.0.1"
CLIFFMAP=`rospack find iliad_launch_system`/cliffmaps/ncfm_pedsim_point5.xml
MAP=`rospack find gazebo_worlds_oru`/maps/ncfm_sim.yaml
WORLD_NAME=`rospack find base_simulation`/worlds/ncfm_model_no_actors.world
#  use this if you want humans ...
#WORLD_NAME=`rospack find gazebo_worlds_oru`/worlds/ncfm_model.world
SIM="true"
HEADLESS="true"
# gazebo usess the opposite logic...
if [[ $HEADLESS == "true" ]]; then GAZEBO_GUI="false" ; else GAZEBO_GUI="true" ; fi
RVIZ="true"
RVIZ_CONFIG=`rospack find iliad_launch_system`/config/demos/ncfm-MS2-coordination.rviz
SCENARIO_NAME_YAML_FILE=`rospack find iliad_launch_system`/config/demos/ncfm-MS2-coordination.yaml
ROS_MASTER_COORDINATOR_PORT=11311

# In simulation everything runs on the same machine
ROSBRIDGE_IP=$default_ip
ROSDUCT="false"
