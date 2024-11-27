FROM --platform=linux/amd64 ros:noetic

COPY config /config
COPY config/xstartup /root/.vnc/xstartup

RUN export DEBIAN_FRONTEND=noninteractive TZ="Etc/UTC" && \
    apt -y update && \
    apt -y install novnc terminator \
    xfce4 xfce4-goodies \
    net-tools iputils-ping psmisc vim nano && \
    apt -y install wget && \
    wget https://github.com/cdr/code-server/releases/download/v4.3.0/code-server-4.3.0-linux-amd64.tar.gz && \
    tar -xzf code-server-4.3.0-linux-amd64.tar.gz && \
    wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 && \
    cp ttyd.x86_64 /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd && \
    apt -y install novnc tigervnc-standalone-server && \
    cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html && \
    apt -y install xfce4 xfce4-goodies && \
    apt -y install ros-noetic-turtlesim && \
    apt -y install x11vnc && \
    echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc && \
    echo "alias restart-vncserver='bash /config/restartvncserver.sh'" >> ~/.bashrc \
    && echo "alias start-codeserver='cd /code-server-4.3.0-linux-amd64 && ./code-server --bind-addr 0.0.0.0:6082 --auth none'" >> ~/.bashrc \
    && echo 'start-novnc() { /usr/share/novnc/utils/launch.sh --vnc 127.0.0.1:$1 --listen $2 & }' >> ~/.bashrc \
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
