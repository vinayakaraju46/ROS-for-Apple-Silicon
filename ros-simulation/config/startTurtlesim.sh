#!/bin/bash
export DISPLAY=":1"
rosrun turtlesim turtlesim_node &
sleep 3
window_id=$(xwininfo -name TurtleSim | grep "Window id:" | cut -d " " -f 4)
echo $window_id
x11vnc -id $window_id -usepw -forever -rfbport 5902 &
/usr/share/novnc/utils/launch.sh --vnc 127.0.0.1:5902 --listen 6081