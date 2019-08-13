#!/bin/bash

cd `rospack find iliad_launch_system`/tmule/
tmule --session robot --config iliad-robot.yaml terminate
