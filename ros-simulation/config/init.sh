#!/bin/bash
export VNC_PASSWD="121212"
export TTYD_PORT="5000"
export NOVNC_PORT="6080"
export HOME="/root"
export DEBIAN_FRONTEND=noninteractive TZ="Etc/UTC" &&

apt -y update && 

rm -rf /tmp/.X1-lock
# killall websockify Xtigervnc ttyd launch.sh

mkdir -p /root/.vnc
echo $VNC_PASSWD | vncpasswd -f > /root/.vnc/passwd 
vncserver -kill :1
vncserver -PasswordFile /root/.vnc/passwd :4 &

ttyd -p $TTYD_PORT -t 'theme={"foreground":"#fff","background":"#111", "cursor":"#943124"}' bash &
websockify --web /usr/share/novnc/ $NOVNC_PORT localhost:5904 &

chmod +x /config/restartvncserver.sh