# Docker

### section 24: basics of Docker
- these notes extends from the course by stephen grider: [microservices-stephengrider-with-node-and-react](https://github.com/clarklindev/microservices-stephengrider-with-node-and-react.git)
- externalised for easier reference (46 lessons (lesson 534 -> lesson 579))

### 535. why use docker?
- docker makes it easy to install and run software without worrying about setup or dependencies

### 536. what is docker?
- docker ecosystem to run containers: 
  - docker client, 
  - docker server, 
  - docker machine, 
  - docker images, 
  - docker hub, 
  - docker compose

- docker cli reaches out to -> docker hub -> download image (contains configuration) 
- image is used to create container (instance of image , isolated resources)

### software
- docker desktop -> for windows/mac 
- includes:
  - docker client (docker cli) terminal commands (tool to interact with docker daemon)
  - docker server (docker daemon) (tool for creating containers, images, maintanance, uploading images)

### docker hub

#### install Docker and signup for a DockerHub account on Windows
- [539. Installing Docker with WSL2 on Windows 10/11](https://www.udemy.com/course/microservices-with-node-js-and-react/learn/lecture/34345306#overview)
1. Register for a DockerHub account
  - Visit [link](https://hub.docker.com/signup) to register for a DockerHub account (this is free) 

2. Navigate to the Docker Desktop installation page
  - Windows 10 & 11 users will be able to install Docker Desktop if their computer supports the Windows Subsystem for Linux (WSL2)
  - Download and install all pending Windows OS updates

3. Run the WSL install script
  - WSL is a Windows feature that lets you run Linux distributions on your Windows machine
  - [docs](https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command)
  - Open PowerShell as Administrator and run the `wsl --install` command.
  - This will enable and install all required features as well as install Ubuntu.

4. reboot pc

5. Set a Username and Password in Ubuntu
  - After the reboot, Windows will auto-launch your new Ubuntu OS and prompt you to set a username and password.

6. Install Docker Desktop
  - Navigate to the [Docker Desktop installation page](https://docs.docker.com/desktop/install/windows-install/) and click the Docker Desktop for Windows button

7. Double-click the Docker Desktop Installer from your Downloads folder

8. Click "Install anyway" if warned the app isn't Microsoft-verified
  - wait for  install to complete
  
9. Open the WSL terminal
  - type search `wsl`

10. Check that Docker is working
  - type `docker` 

11. Log in to Docker
  - login from wsl terminal
  - You will be prompted to enter the username and password (or your Personal Access Token) you created earlier when registering for a DockerHub account.

```command
docker login
```

15. NB NOTES

### access linux system
- A significant difference when using WSL is that you will need to create and run your project files from within the Linux filesystem, not the Windows filesystem. This will be very important in later lectures when we cover volumes.
- You can access your Linux system by running wsl in the Windows Search Bar. The wsl terminal will automatically open to the /mnt/c/Windows/System32 location. This is still the Windows filesystem! You will need to run the cd ~ command to change into your Ubuntu user's home directory on the Linux filesystem.
- Going forward, all Docker commands should be run within WSL and not on the Windows file system
