#!/bin/bash
export TURTLEBOT3_MODEL=burger
export DISPLAY=":1"
source devel/setup.bash
roslaunch turtlebot3_gazebo $1 &
sleep 10
window_id=$(xwininfo -name Gazebo | grep "Window id:" | cut -d " " -f 4)
echo $window_id
x11vnc -id $window_id -usepw -forever -rfbport 5903 &
/usr/share/novnc/utils/launch.sh --vnc 127.0.0.1:5903 --listen 6082