# ROS Noetic Docker Environment on macOS (Silicon)

This project sets up a Docker-based virtual environment to run ROS Noetic with support for Gazebo and V-REP/Virtual Robotics Experimentation Platform. The setup is tailored for macOS devices with Apple Silicon chips, using a Linux/amd64 base image to ensure compatibility.

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

1. Clone this repository:
   ```bash
   git clone https://github.com/vinayakaraju46/roslabs-ros-noetic.git
   cd <repository-directory>

2. Build the Docker image:
   ```bash
   docker build -t ros-noetic-env .

## Run the Docker Container

1. Start the container:
   ```bash
   sudo docker run -it --platform=linux/amd64 -p 4000:5000 -p 4080:6080 -p 4081:6081 -p 4082:6082 -p 11311:11311 --name ros-sim ros-noetic-env
   ```
   - `4000`: ttyd
   - `4080`: vnc
   - `4082`: code-server
   
2. Getting inside the container:

  
   1. Attach to Container:
      ```bash
      sudo docker attach <container-id>
      
   2. Re-start the VNC server:
      ```bash
      restart-vncserver
      
   2. Launch code-server for VSCode:
      ```bash
      start-codeserver

  ---
  ## Access the Environment
  - **VNC**: Open your browser and navigate to `http://localhost:4000`.
  - **Code Server**: Navigate to `http://localhost:4082`.
  - **Web Terminal (TTYD)**: Navigate to `http://localhost:4000`.

      

