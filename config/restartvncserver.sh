#!/bin/bash

# Kill the VNC server and get the process ID
#output=$(vncserver -kill :2 2>&1)
#pid=$(echo "$output" | grep "Killing Xtightvnc process ID" | awk '{print $NF}')
rm -rf /tmp/.X1-lock
for display_num in {1..10}; do
  output=$(vncserver -kill ":$display_num" > /dev/null 2>&1)
  pid=$(echo "$output" | grep "Killing Xtightvnc process ID" | awk '{print $NF}')
  # If the process ID is not empty, print it
  if [ -n "$pid" ]; then
    echo "Killed VNC server with PID: $pid"
  else
    echo "VNC server is not running in $display_num"
  fi
done

vncserver