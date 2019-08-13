#!/bin/bash

cd `rospack find iliad_launch_system`/tmule/
echo "-------------- KILLING COORDINATOR ------------------------"
tmule -c iliad-robot.yaml --session coordinator terminate

echo "-------------- KILLING ROBOT4 ------------------------"
tmule -c iliad-robot.yaml --session robot4 terminate

echo "-------------- KILLING ROBOT5 ------------------------"
tmule -c iliad-robot.yaml --session robot5 terminate