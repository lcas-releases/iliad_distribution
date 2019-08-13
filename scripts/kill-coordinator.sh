#!/bin/bash

cd `rospack find iliad_launch_system`/tmule/
echo "-------------- KILLING COORDINATOR SYSTEM ------------------------"
tmule --session coordinator --config iliad-coordinator.yaml terminate
