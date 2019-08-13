#!/bin/bash
ROBOT_NUM=4
TMULE_SCRIPT="iliad-robot.yaml"
session_name=robot$ROBOT_NUM
SCENARIO_NAME="ncfm-MS2-coordination"
# SCENARIO_NAME could be also read just sourcing ~/.iliadrc
# source ~/.iliadrc

# you shouldn't need to change the following lines ...
cd `rospack find iliad_launch_system`/tmule/
echo "-------------- ROBOT SYSTEM CONFIGURATION ------------------------"
echo "robot name: [robot"$ROBOT_NUM"]"
echo "scenario name: ["$SCENARIO_NAME"]"
echo "tmule script: ["$TMULE_SCRIPT"]"
echo "tmule session name: ["$session_name"]"

echo "--------------- SETTING ROBOT NAME IN ~/.iliadrc -----------------"
sed -i "s/ROBOT_NAME\=\"robot[0-9]/ROBOT_NAME\=\"robot$ROBOT_NUM/g" ~/.iliadrc

echo "--------------- SETTING SCENARIO NAME IN ~/.iliadrc --------------"
sed -i "s/SCENARIO_NAME=.*/\SCENARIO_NAME=\"$SCENARIO_NAME\"/g" ~/.iliadrc

echo "--------------    LAUNCHING TMULE SCRIPT    ----------------------"
tmule --session $session_name --config $TMULE_SCRIPT launch

echo "------------------------------------------------------------------"