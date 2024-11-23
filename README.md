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
   git clone <repository-url>
   cd <repository-directory>

2. Build the Docker image:
   ```bash
   docker build -t ros-noetic-env .

## Run the Docker Container

1. Start the container:
   ```bash
   docker run -it -p 8080:8080 -p 5901:5901 ros-noetic-env
   
2. Once inside the container:
   1. Start the VNC server:
      ```bash
      restart-vncserver
      
   2. Launch code-server:
      ```bash
      start-codeserver

   3. Start NoVNC:
      ```bash
      start-novnc <vnc-port> <novnc-port>

   4. Start TTYD terminal:
      ```bash
      start-ttyd <port>

  ---
  ## Access the Environment
  - **VNC**: Open your browser and navigate to `http://localhost:5901`.
  - **Code Server**: Navigate to `http://localhost:8080`.
  - **NoVNC**: Navigate to `http://localhost:<novnc-port>`.
  - **Web Terminal (TTYD)**: Navigate to `http://localhost:<ttyd-port>`.

      

