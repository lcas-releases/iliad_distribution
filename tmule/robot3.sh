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

ROBOT_TYPE="bt"
ROBOT_NO=3
VELODYNE="true"
KINECT2="true"
PALLET_SENSOR="true"
REFLEX_SENSOR="true"
S3000="true"
LASER2D_FLOOR="true"
LASER2D_TOP="true"
PALLET_SENSOR_TYPE="asus"
ROBOT_NAME_YAML_FILE=`rospack find iliad_launch_system`/config/robots/robot3.yaml
ROS_MASTER_ROBOT_PORT="11311"
LOC_METHOD="kollmorgen"

