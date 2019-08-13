#!/bin/bash

cd `rospack find iliad_launch_system`/scripts/ncfm-MS2-coordination/
echo "-------------- COORDINATOR ------------------------"
./start-ncfm-MS2-coordination.sh
sleep 5

echo "-------------- ROBOT4 ------------------------"
./start-ncfm-MS2-robot4.sh
sleep 5

echo "-------------- ROBOT5 ------------------------"
./start-ncfm-MS2-robot5.sh
sleep 5
