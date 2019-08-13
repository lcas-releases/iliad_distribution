#!/bin/bash

#  Params to be set in ROBOT_NAME.sh
  #  - ROBOT_TYPE cititruck|bt
  #  - ROBOT_NO  [same number than in robot_name var]
  #  - VELODYNE true|false
  #  - KINECT2  true|false
  #  - PALLET_SENSOR true|false
  #  - LASER2D_FLOOR true|false
  #  - LASER2D_TOP  true|false
  #  - PALLET_SENSOR_TYPE asus|orbec
  #  - ROBOT_TYPE_YAML_FILE
  #  - ROBOT_NAME_YAML_FILE
  #  - ROS_MASTER_ROBOT_PORT
  #  - HUMAN_PERCEPTION true|false

ROBOT_TYPE="cititruck"
ROBOT_NO=1
VELODYNE="false"
KINECT2="false"
PALLET_SENSOR="false"
LASER2D_FLOOR="true"
LASER2D_TOP="true"
PALLET_SENSOR_TYPE="asus"
if [[ $SIM == 'true' ]]; then ROBOT_NAME_YAML_FILE=`rospack find iliad_launch_system`/config/robots/robot1_sim.yaml; else ROBOT_NAME_YAML_FILE=`rospack find iliad_launch_system`/config/robots/robot1.yaml; fi
ROS_MASTER_ROBOT_PORT="11311"
HUMAN_PERCEPTION="false"
LOC_METHOD="kollmorgen"
