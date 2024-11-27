# ROS Docker Environment on macOS (Apple Silicon)

This project sets up a Docker-based virtual environment to run ROS with support for Gazebo and V-REP/Virtual Robotics Experimentation Platform. The setup is tailored for macOS devices with Apple Silicon chips, using a Linux/amd64 base image to ensure compatibility.

---

## Features

1. **Pre-installed Tools**:
   - `novnc` for browser-based remote desktop access.
   - `terminator` for advanced terminal multiplexing.
   - `xfce4` as a lightweight desktop environment.
   - `ttyd` for terminal access via the web.
   - `code-server` for a web-based VS Code experience.

2. **ROS Noetic Compatibility**:
   - Designed for running ROS Noetic, Gazebo, and V-REP.

3. **Ease of Use**:
   - Predefined aliases for quick operations.
   - Easily extendable and customizable environment.

---

## Prerequisites

Ensure the following are installed on your macOS system:

- **Docker Desktop**: [Download](https://www.docker.com/products/docker-desktop/)
- **Rosetta 2**: Required for running `amd64` images on Apple Silicon.

---

## Build the Docker Image

**⚠️ Note:** Don't forget to pull the image
```bash
   sudo docker pull --platform=linux/amd64 ubuntu:20.04
```
   

1. Clone this repository:
   ```bash
   git clone https://github.com/vinayakaraju46/ROS-for-Apple-Silicon.git
   cd <repository-directory>/ros-simulation

2. Build the Docker image:
   ```bash
   sudo docker-compose build --no-cache

## Run the Docker Container

1. Start the container:
   ```bash
   sudo docker-compose up
   ```
   - `4000`: ttyd
   - `4001`: vnc
   - `4002`: vs-code
   - `4003`: ros-master-uri
   
2. Getting inside the container:

  
   1. Attach to Container:
      ```bash
      sudo docker attach <container-name>
      
   2. Re-start the VNC server:
      ```bash
      restart-vncserver

      #Enter passcode as 121212
      
   2. Launch code-server for VSCode:
      ```bash
      start-codeserver

  ---
  ## Access the Environment
  - **VNC**: Open your browser and navigate to `http://localhost:4000`.
  - **Code Server**: Navigate to `http://localhost:4002`.
  - **Web Terminal (TTYD)**: Navigate to `http://localhost:4000`.

      

