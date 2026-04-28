FROM osrf/ros:jazzy-desktop

COPY config /config
# COPY config/xstartup /root/.vnc/xstartup

RUN export DEBIAN_FRONTEND=noninteractive TZ="Etc/UTC" && \
    apt -y update && \
    apt -y install terminator \
    xfce4 xfce4-goodies \
    net-tools iputils-ping psmisc vim nano && \
    apt -y install wget && \
    wget https://github.com/cdr/code-server/releases/download/v4.3.0/code-server-4.3.0-linux-amd64.tar.gz && \
    tar -xzf code-server-4.3.0-linux-amd64.tar.gz && \
    wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 && \
    cp ttyd.x86_64 /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd && \
    apt -y install novnc  websockify dbus-x11 tigervnc-standalone-server && \
    cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html && \
    apt -y install xfce4 xfce4-goodies && \
    apt -y install x11vnc && \
    echo 'export RMW_IMPLEMENTATION=rmw_fastrtps_cpp' >> ~/.bashrc && \
    echo 'export CYCLONEDDS_URI=/config/cyclonedds.xml' >> ~/.bashrc && \
    echo 'export FASTRTPS_DEFAULT_PROFILES_FILE=/config/DEFAULT_FASTRTPS_PROFILES.xml' >> ~/.bashrc && \
    echo 'export ROS_DOMAIN_ID=0  # Replace with your Domain ID' >> ~/.bashrc && \
    # echo "127.0.1.1 $(hostname)" >> /etc/hosts && \
    # echo 'source /usr/share/gazebo/setup.sh' >> ~/.bashrc && \
    echo "alias restart-vncserver='bash /config/restartvncserver.sh'" >> ~/.bashrc \
    && echo "alias start-codeserver='cd /code-server-4.3.0-linux-amd64 && ./code-server --bind-addr 0.0.0.0:8080 --auth none'" >> ~/.bashrc \
    && echo 'start-novnc() { websockify --web /usr/share/novnc/ $1 localhost:$2 & }' >> ~/.bashrc \
    && echo 'start-ttyd() {' >> ~/.bashrc \
    && echo '    killall -9 ttyd' >> ~/.bashrc \
    && echo '    sleep 2' >> ~/.bashrc \
    && echo '    ttyd -p $1 bash &' >> ~/.bashrc \
    && echo '}' >> ~/.bashrc && \
    apt -y clean && \
    apt -y remove && \
    apt -y autoclean && \
    apt -y autoremove && \
    rm -rf /var/cache/apt

CMD bash /config/init.sh && bash
