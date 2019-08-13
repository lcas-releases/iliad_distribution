#!/bin/bash
TMULE_SCRIPT="iliad-coordinator-scripted.yaml"
session_name=coordinator
SCENARIO_NAME="ncfm-UOL"

# you shouldn't need to change the following lines ...
cd `rospack find iliad_launch_system`/tmule/
echo "----------------- SYSTEM CONFIGURATION ---------------------------"
echo "scenario name: ["$SCENARIO_NAME"]"
echo "tmule script: ["$TMULE_SCRIPT"]"
echo "tmule session name: ["$session_name"]"

echo "--------------- SETTING SCENARIO NAME IN ~/.iliadrc --------------"
sed -i "s/SCENARIO_NAME=.*/\SCENARIO_NAME=\"$SCENARIO_NAME\"/g" ~/.iliadrc

echo "--------------    LAUNCHING TMULE SCRIPT    ----------------------"
tmule --session $session_name --config $TMULE_SCRIPT launch

echo "------------------------------------------------------------------"
echo " remember to launch robot scripts sequentially if simulated "
echo "------------------------------------------------------------------"
