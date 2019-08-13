#!/bin/bash
ROBOT_NUM=5
TMULE_SCRIPT="iliad-robot-sensors.yaml"
session_name=robot$ROBOT_NUM

source ~/.iliadrc
# .iliadrc will give us the SCENARIO_NAME

# you shouldn't need to change the following lines ...
cd `rospack find iliad_launch_system`/tmule/
echo "------------------------------------------------------------------"
echo "EVERYTHING IS BEING DESTROYED BY THE SHEER POWER OF MALEVOLENCE!  "
echo "------------------------------------------------------------------"

echo "scenario name: ["$SCENARIO_NAME"]"
echo "tmule script: ["$TMULE_SCRIPT"]"
echo "tmule session name: ["$session_name"]"

echo "----------------- TERMINATING ROBOT SYSTEM -----------------------"
tmule --session $session_name --config $TMULE_SCRIPT terminate

echo "---------------- FORCING TMUX SESSION EXIT -----------------------"
tmux kill-session -t $session_name

echo "------------------------------------------------------------------"
