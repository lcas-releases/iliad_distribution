#!/bin/bash
# This file is intended for a real robot, so parameters should be ok in .iliadrc
source ~/.iliadrc
ROBOT_NUM=`echo $ROBOT_NAME | awk -F 'robot' '{print $2}'`
TMULE_SCRIPT="iliad-robot-sensors.yaml"
session_name="robot"$ROBOT_NUM
#SCENARIO_NAME could come from from .iliadrc file
SCENARIO_NAME="ncfm-UOL"

# you shouldn't need to change the following lines ...
cd `rospack find iliad_launch_system`/tmule/
echo "-------------- ROBOT SYSTEM CONFIGURATION ------------------------"
echo "robot name: [robot"$ROBOT_NUM"]"
echo "scenario name: ["$SCENARIO_NAME"]"
echo "tmule script: ["$TMULE_SCRIPT"]"
echo "tmule session name: ["$session_name"]"

echo "--------------    LAUNCHING TMULE SCRIPT    ----------------------"
tmule --session $session_name --config $TMULE_SCRIPT launch

echo "------------------------------------------------------------------"
