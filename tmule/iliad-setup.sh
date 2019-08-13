#!/bin/bash
  
  # TODO: Files, params, and where to find them:
  # 
  #  Params not necesarily defined. Default values are usually ok, aren't they?: 
  #   CATKIN_WORKSPACE
  #   BASE_CONFIG_DIR
  #   ROS_IP
  #   ROS_HOSTNAME
  #   MONGO_PATH
  #   ROSBRIDGE_PORT
  #
  #  Params to be set in  .iliadrc
  #  - ROBOT_NAME      'robotN' [where N is a numb between 0-9]
  #  - SCENARIO_NAME  [string] e.g.  ncfm, ncfm_sim, oru_basement ...
  # 
  #  Params to be set in $BASE_CONFIG_DIR/$ROBOT_NAME.sh
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
  #
  #  Params to be set in $BASE_CONFIG_DIR/$SCENARIO_NAME.sh
  #  - ROS_MASTER
  #  - ROS_MASTER_COORDINATOR_PORT
  #  - TMAP  ...not used yet...
  #  - MAP
  #  - SIM          true|false
  #  - WORLD_NAME
  #  - HEADLESS     true|false
  #  - RVIZ         true|false
  #  - RVIZ_CONFIG
  #  - SCENARIO_NAME_YAML_FILE
  #  - ROSBRIDGE_IP
  #
  #  Params to be set in $SCENARIO_NAME_YAML_FILE
  #  - Whatever is relevant to scenario
  #
  #  Params to be set in $ROBOT_TYPE_YAML_FILE
  #  - Whatever is specific to the robot model (sizes, speeds)
  #
  #  Params to be set in $ROBOT_NAME_YAML_FILE
  #  - Whatever is specific to the robot (sensor parameters)
  #

  # sets the exit code of a pipeline to that of the rightmost command to exit with a non-zero status
  set -o pipefail

  # export given variable or give a default value
  function export_default () {
    var_name="$1"
    var_default="$2"
    eval $var_name="${!var_name:-$var_default}"
    export $var_name
    echo "  $0 -> $var_name=${!var_name}"
  }

  # source ROS
  source "/opt/ros/kinetic/setup.bash"

# NOTE: moved upwards to allow using rospack find for source packages
  export_default CATKIN_WORKSPACE "`readlink -f ../../.. || echo $HOME/catkin_ws`"
  # FIXME: devel or devel_isolated?

  source "$CATKIN_WORKSPACE/devel_isolated/setup.bash"
  source "$CATKIN_WORKSPACE/devel/setup.bash"

  # search for VPN tun device:
  default_iface=`route -n | grep "^172." | tr -s " " |  cut -f8 -d" " || echo lo`
  default_ip=`ip addr show dev "$default_iface" | grep "inet " | sed 's@ *inet \([0-9\.]*\).*@\1@' || echo 127.0.0.1`
  
  # load robot-specific config variables: define here ROBOT_NAME, SCENARIO_NAME at least
  if [ -r "$HOME/.iliadrc" ]; then echo "*** loading $HOME/.iliadrc" ; source "$HOME/.iliadrc"; fi
  
  export_default BASE_CONFIG_DIR `readlink -f . || echo .`

  # figure out the robot name from the hostname, assuming it is like "iliad-robot4"
  export_default ROBOT_NAME `hostname | cut -f2 -d"-"`
  export_default SCENARIO_NAME "default"

  # load scenario-specific config file
  if [ -r "$BASE_CONFIG_DIR/$SCENARIO_NAME.sh" ]; then echo "*** loading $BASE_CONFIG_DIR/$SCENARIO_NAME.sh" ; source "$BASE_CONFIG_DIR/$SCENARIO_NAME.sh"; fi  

  # load robot-specific config file: define here ROBOT_TYPE, ROBOT_NO
  # needs to be loaded after the scenario
  if [ -r "$BASE_CONFIG_DIR/$ROBOT_NAME.sh" ]; then echo "*** loading $BASE_CONFIG_DIR/$ROBOT_NAME.sh" ; source "$BASE_CONFIG_DIR/$ROBOT_NAME.sh"; fi
   
  # path where to expect MONGODB
  export_default MONGO_PATH "$HOME/mongodb"
  
  # the topomap to be used
  export_default TMAP empty
  
  # the gridmap to be used
  export_default MAP "$(rospack find gazebo_worlds_oru)/maps/empty.yaml"
  
  # figure out robot number from the robot_name var, assuming it is like "robot4"
  export_default ROBOT_NO `echo $ROBOT_NAME | cut -f2 -d"-" | tr -dc '0-9'` 
  
  # set the robot type
  export_default ROBOT_TYPE "cititruck"

  export_default ROSBRIDGE_IP "10.8.0.4"
  export_default ROSBRIDGE_PORT "9090"

  export_default ROS_MASTER $default_ip
  
  # set ROS_IP not to the IP that we will connect to remotely
  export_default ROS_IP `ip route get $default_ip | grep "src" | sed 's/.*src \([0-9\.]*\).*/\1/' || echo $default_ip`
  
  # set ROS_HOSTNAME to the ROS_IP to avoid configuring /etc/hosts for anyone who connects
  export_default ROS_HOSTNAME "$ROS_IP"

  # change port to allow simultaneous roscores in a single machine simulation
  export_default  ROS_MASTER_ROBOT_PORT "11411"

  export_default  ROS_MASTER_COORDINATOR_PORT "11311"
