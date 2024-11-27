#!/bin/bash
export VNC_PASSWD="121212"
export TTYD_PORT="5000"
export NOVNC_PORT="6080"

export DEBIAN_FRONTEND=noninteractive TZ="Etc/UTC" &&

apt -y update && 

rm -rf /tmp/.X1-lock
# killall websockify Xtigervnc ttyd launch.sh

mkdir -p /root/.vnc
echo $VNC_PASSWD | vncpasswd -f > /root/.vnc/passwd 
vncserver -kill :1
vncserver -PasswordFile /root/.vnc/passwd :1 &

ttyd -p $TTYD_PORT bash &
/usr/share/novnc/utils/launch.sh --vnc 127.0.0.1:5901 --listen $NOVNC_PORT &

chmod +x /config/restartvncserver.sh 
chmod +x /config/startGazebo.sh 
chmod +x /config/startTurtlesim.sh