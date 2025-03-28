# Docker

- 46 lessons (3hrs 3min) 
- this summarises this section into a 30min read -> demystify roadblocks for Docker installing / troubleshooting
- NOTE: it takes longer than the 3hrs 3min stated to go through the course section though.

## Table of contents
- [1. Docker theory](#1-docker-theory)
- [2. Installing WSL2 AND Docker-Desktop (Docker)](#2-installing-wsl2-and-docker-desktop-docker)
- [3. Using Docker](#3-using-docker)
- [4. DOCKER PROJECT - A Real World usecase](#4-docker-project---a-real-world-example-use-case-for-docker)

---
---
# 1. Docker Theory

### section 24: basics of Docker
- these notes extends from my own course notes here: [microservices-stephengrider-with-node-and-react](https://github.com/clarklindev/microservices-stephengrider-with-node-and-react.git) 
  - source: udemy - stephen grider - [microservices-with-node-js-and-react](https://www.udemy.com/course/microservices-with-node-js-and-react/)
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

---
---
# 2. Installing WSL2 AND Docker-Desktop (Docker)
- here is how to install docker (summarised) -> see notes of lessons for details...

## create docker hub account
- todo: register -> Register for a [DockerHub](https://hub.docker.com) account

## Installing WSL
- NOTE: In Windows, if you install `DOCKER FOR DESKTOP` it will install WSL (and WSL 2)

- so docker is native for linux, but for windows it needs WSL (Windows Subsystem for Linux) 
- wsl and wsl 2 is a full Linux kernel built by Microsoft, which lets Linux distributions run without managing virtual machines. 

<img
src='exercise_files/wsl-install.png'
alt='wsl-install.png'
width=600
/>
- screenshot showing that: 
1. you need to install WSL (windows subsystem for linux) if you install Docker for Windows, WSL will be installed and updated.
2. you need a WSL 2 distro like ubuntu

### install WSL
- NOTE: installing docker desktop also installs docker cli
- basic wsl install command (if installing wsl for first time, installs WSL, AND gets the default set linux distribution: Ubuntu)

```powershell
wsl --install
```

<img
src='exercise_files/wsl-install-2.png'
alt='wsl-install-2.png'
width=600
/>

-enable the distro
<img
src='exercise_files/docker-desktop-resource.png'
alt='docker-desktop-resource.png'
width=600
/>

- otherwise Install using `wsl --install -d <Distro>`
```
PS C:\Users\admin> wsl --install
Windows Subsystem for Linux is already installed.
The following is a list of valid distributions that can be installed.
Install using 'wsl --install -d <Distro>'.

NAME                            FRIENDLY NAME
Ubuntu                          Ubuntu
Debian                          Debian GNU/Linux
kali-linux                      Kali Linux Rolling
Ubuntu-18.04                    Ubuntu 18.04 LTS
Ubuntu-20.04                    Ubuntu 20.04 LTS
Ubuntu-22.04                    Ubuntu 22.04 LTS
Ubuntu-24.04                    Ubuntu 24.04 LTS
OracleLinux_7_9                 Oracle Linux 7.9
OracleLinux_8_7                 Oracle Linux 8.7
OracleLinux_9_1                 Oracle Linux 9.1
openSUSE-Leap-15.6              openSUSE Leap 15.6
SUSE-Linux-Enterprise-15-SP5    SUSE Linux Enterprise 15 SP5
SUSE-Linux-Enterprise-15-SP6    SUSE Linux Enterprise 15 SP6
openSUSE-Tumbleweed             openSUSE Tumbleweed
```

#### TROUBLESHOOT 
- WSL requires update
```
Installing, this may take a few minutes...
WslRegisterDistribution failed with error: 0x800701bc
Error: 0x800701bc WSL 2 requires an update to its kernel component. For information please visit https://aka.ms/wsl2kernel

Press any key to continue...
```

### update WSL 2
- you might need to update wsl first

```powershell
wsl --update
```

### install linux
- install the linux distribution
- NOTE: Upgrade version from WSL 1 to WSL 2 -> Linux installations, installed using the wsl --install command, will be set to WSL 2 by default.

```powershell
wsl --install -d <Distro>
```

- this is the result:
```
PS C:\Users\***> wsl --install -d Ubuntu
Ubuntu is already installed.
Launching Ubuntu...
Installing, this may take a few minutes...
Please create a default UNIX user account. The username does not need to match your Windows username.
For more information visit: https://aka.ms/wslusers
Enter new UNIX username:
New password:
Retype new password:
passwd: password updated successfully
```

### Set a Username and Password in Ubuntu
- (unless this is already done...) After the reboot, Windows will (in powershell) auto-launch your new Ubuntu OS and prompt you to set a username and password.

### Requirement to get docker working...to get docker desktop running...
  1. WSL is enabled.
  2. WSL 2 is set as your default version (select this at install)
  3. The necessary Linux distributions are installed

### troubleshoot - SOLVED SOLUTION
- To see whether your Linux distribution is set to WSL 1 or WSL 2, use the command: `wsl -l -v`.
- PROBLEM: after installing docker-desktop (docker engine running) -> further attempts to start docker engine fail.

- FIX:
  - after reboot -> `wsl -l -v` 
  - if you see 'docker-desktop' 
  - you should remove (`wsl --unregister docker-desktop`) and restart docker-desktop

```powershell 
  - PS C:\Windows\system32> wsl -l -v
    NAME              STATE           VERSION
  * docker-desktop    Stopped         2
    Ubuntu            Running         2
```

- FIX:
  - If you want to completely shut down the WSL instance, you would need to run wsl --shutdown in PowerShell or Command Prompt.
```powershell
wsl --shutdown
```
  - it should recreate docker-desktop under `wsl -l -v` if you open docker-desktop again 
  - but this time there wont be problems...

### troubleshoot - SOLVED SOLUTION
- windows 11 disable fast reboot 
- win 11 -> settings -> accounts -> sign-in options -> automatically save my restartable apps and restart them when i sign back in -> OFF

### troubleshoot - SOLVED SOLUTION
- after installing Ubuntu (wsl --install)
- you need to also install docker in wsl OR from docker-desktop -> enable `Enable Integration with Additional Distros` -> and make sure your distro eg. `Ubuntu` is checked

- NOTE: YOU DO NOT NEED TO INSTALL DOCKER IN WSL, WSL INSTALLS UBUNTU -> WHICH YOU LINK DOCKER VIA DOCKER DESKTOP 
<!--
```
sudo apt update

sudo apt upgrade

sudo apt install docker-ce
``` -->

### troubleshoot - SOLVED SOLUTION
- trouble shooting docker desktop -> kubernetes not runnning...
- see my Kubernetes installation notes: section 64. [microservices-stephengrider-with-node-and-react](https://github.com/clarklindev/microservices-stephengrider-with-node-and-react?tab=readme-ov-file#section-04---orchestrating-collections-of-services-with-kubernetes-3hr25min)

#### Expected outcome from all steps discussed
- The expected outcome after the process above is that: 
  - you have WSL installed 
  - linux (Ubuntu) is working
  - docker desktop is installed
  - docker desktop -> is running
  - docker desktop -> kubernetes is running (OPTIONAL -> will be required when using Skaffold for automating docker)
  - docker-hub account created, logged-in (required for pushing docker images)

<img
src='exercise_files/docker-desktop-installed-running-screengrab-markings.png'
alt='docker-desktop-installed-running-screengrab-markings.png'
width=600
/>

---

### 537. docker for mac/windows
- Download and install all pending `Windows OS updates` ie. update windows

### docker hub (online part)
- https://hub.docker.com/

- Register for a DockerHub account
  - this is online website
  - Visit [link](https://hub.docker.com/signup) to register for a DockerHub account (this is free) 

### docker desktop (software part)
- docker desktop -> for windows/mac 
- includes:
  - docker client (docker cli) terminal commands (tool to interact with docker daemon)
  - docker server (docker daemon) (tool for creating containers, images, maintanance, uploading images)

#### Installing Docker desktop with (WSL2) on Windows 10, windows 11
- follow these instructions [539. Installing Docker with WSL2 on Windows 10/11](https://www.udemy.com/course/microservices-with-node-js-and-react/learn/lecture/34345306#overview)
- do EXACTLY as the steps tell you:

- Navigate to the Docker Desktop installation page
  - Windows 10 & 11 users will be able to install Docker Desktop if their computer supports the Windows Subsystem for Linux (WSL2)
  - the default install for docker desktop `Docker Desktop Installer.exe` (currently v4.34.3) - you select wsl2 option at install time.
  - NOTE: you have to run docker desktop (as Administrator)
  - NOTE: you can alternatively add logged-in user to 'docker-group' (see troubleshoot below..)

- Install Docker Desktop
  - Navigate to the [Docker Desktop installation page](https://docs.docker.com/desktop/install/windows-install/) and click the Docker Desktop for Windows button

- Double-click the Docker Desktop Installer from your Downloads folder

- Click "Install anyway" if warned the app isn't Microsoft-verified
  - wait for  install to complete
  - NOTE: you need to run Docker App as Administrator or it wont open in win11.
  - NOTE: you can alternatively add logged-in user to 'docker-group' (see troubleshoot below..)

### WSL (WSL part)
- NOTE: if you install docker-desktop, you need to set-up the WSL part
- Windows Subsystem for Linux (WSL) 2 is a full Linux kernel built by Microsoft, which lets Linux distributions run without managing virtual machines. 
- Windows Subsystem for Linux (WSL) lets developers install a Linux distribution (such as Ubuntu, OpenSUSE, Kali, Debian, Arch Linux, etc) and use Linux applications, utilities, and Bash command-line tools directly on Windows, unmodified, without the overhead of a traditional virtual machine or dualboot setup. 
- Open PowerShell as Administrator and run the command...

- cmd: `wsl` -> starts wsl if ubuntu already been installed and done
- other params: 
- `wsl --version`
- `wsl --status`
- `wsl -l -v`
- [docs - https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command](https://docs.microsoft.com/en-us/windows/wsl/install#install-wsl-command)
- [docs - https://docs.docker.com/go/wsl2/](https://docs.docker.com/go/wsl2/)

<!-- - using wsl, you should be able to go: `docker --version` instead of `docker.exe --version`  -->
<!-- - FIX: create a symlink to docker (from WSL window): `sudo ln -s /mnt/c/Program\ Files/Docker/Docker/resources/bin/docker.exe /usr/local/bin/docker` -->

<!-- #### install docker for wsl
```
sudo apt update
sudo apt install docker.io
``` -->

#### Add Your User to the Docker Group (optional):
- this is if you are not windows admin ie a normal local account
- To avoid using sudo every time you run Docker commands
```
sudo usermod -aG docker $USER
```

#### Switching Between Distributions
```
wsl -d Ubuntu
```
#### Step 1: Install WSL 2
#### set to WSL 2
`wsl.exe --set-default-version 2`
- NOTE: if you install ubuntu by running `wsl --install`, you can uninstall `wsl --unregister Ubuntu`
- This will enable and install all required features as well as install Ubuntu (then later in docker-desktop you will set `Enable WSL Integration` in docker-desktop)

#### Installing OR starting if already installed
```PowerShell
wsl --install

```
- should get status: `Launching ubuntu...`

<!--

NOTE THIS IS NOT NECESSARY AS wsl --install BY DEFAULT INSTALLS WSL VERSION 2
```PowerShell
wsl --set-default-version 2
``` -->

#### UNINSTALLING
```
wsl --unregister Ubuntu
```

- NOTE: using wsl --install is not the same as installing Ubuntu from the Microsoft Store

`wsl --install`: This command installs the Windows Subsystem for Linux (WSL) and sets up a default Linux distribution, which is typically Ubuntu. It automates the installation process, including enabling necessary features.

Installing from the Microsoft Store: This allows you to choose and install specific distributions of Linux, such as Ubuntu, Debian, or others. After installing, you might need to configure WSL separately.

#### login docker
- login from powershell (YOU SHOULD DO THIS EVERYTIME)
- ONLY AFTER login run docker desktop (AS ADMIN)
- You will be prompted to enter the username and password (or your Personal Access Token) you created earlier when registering for a DockerHub account.

```command
docker login
```
- `Your one-time device confirmation code is: XXXX-XXX.`
- `Press ENTER to open your browser or submit your device code here: https://login.docker.com/activate`
- so navigate to: `https://login.docker.com/activate`

### Troubleshoot
- Udemy Q&A - https://www.udemy.com/course/microservices-with-node-js-and-react/learn/lecture/34345306#questions/22551131
- Udemy Q&A - https://www.udemy.com/course/microservices-with-node-js-and-react/learn/lecture/34345306#questions/22555525

- ERROR: `The command 'docker' could not be found in this WSL 2 distro. We recommend to activate the WSL integration in Docker Desktop settings.`
  - FIX: 
    - install docker desktop (run as admin)
    - Enable WSL Integration:
      - Open Docker Desktop.
      - Go to Settings > Resources > WSL Integration.
      - Ensure that your WSL distribution (eg. Ubuntu) is selected for integration.
    - Enable Integration with Additional Distros:
    - You can keep this option on for Ubuntu if you want to use Docker there as well. However, if Docker Desktop is struggling to start, you might consider turning this off temporarily to simplify the configuration.

  -FIX: 
    - If your administrator account is different to your user account, you must add the user to the docker-users group:
    - Run Computer Management as an administrator.
    - Navigate to Local Users and Groups > Groups > docker-users.
    - Right-click to add the user to the group.
    - Sign out and sign back in for the changes to take effect.

  - FIX:
    - shutdown docker: 
  - FIX: 
    - change firewall settings -> Windows Security app (Windows Defender Firewall) -> Firewall & network protection -> Allow an app through firewall
      - ADD docker desktop (C:\Program Files\Docker\Docker\resources\bin\docker.exe)
      - ADD WSL (C:\Windows\System32\wsl.exe)
      
```powershell
wsl --shutdown
```

### WSL - access linux system
- A significant difference when using WSL is that you will need to create and run your project files from within the Linux filesystem, not the Windows filesystem. This will be very important in later lectures when we cover volumes.
- You can access your Linux system by running wsl in the Windows Search Bar. The wsl terminal will automatically open to the /mnt/c/Windows/System32 location. This is still the Windows filesystem! You will need to run the `cd ~`command to change into your Ubuntu user's home directory on the Linux filesystem.
- Going forward, all `Docker commands` should be `run within WSL` and NOT `Windows file system`

---
---
# 3. Using Docker

### 541. using the docker client
- start docker image `hello-world`

```wsl
docker run hello-world
```
- it first tries to get it locally, if it cant find it, it gets it from docker hub
- docker hub -> is a repository of free docker images
- then it runs the docker image it downloaded as a container 
- below: cmd output

```cmd output
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

```

### 542. but really what is a container?
- kernel -> is OS software that governs physical hardware on computer and processes running on computer
- the interaction between hardware and software requesting resource access is called `system call`
- namespacing allows isolating resources per process (segmenting of hardware for specific resources) (eg. co-exist python 2 and python 3) and the kernel directs the system call.
- control groups limits the amount of resources used per process.
- image -> file system snapshot + startup commands
- container -> grouping of resources (running process/s + resource) 

### 543. hows the docker running on your computer
- the kernel then isolates a section of resouce (harddrive) and makes it available for the container
- not all OS have the concept of Namespace + control group (specific to linux)
- DOCKER (installs a linux vm) which houses the containers and inside the "linux vm" is a "linux kernel" (`docker version` -> os arch -> linux/amd64)

### 544. docker client (docker cli)
- creating a container from an image
- `reference to docker client` | `create + run` | `image` 

```cmd
docker run `image name`
```

### 545. overriding default commands
- variation of `docker run ...`
- `reference to docker client` | `create + run` | `image` | `command`
- docker run `image name` command

```cmd
//test
docker run busybox echo hi there

//prints out all files/folders in container
docker run busybox ls
```

### 546. list all running containers
- test with commands that run longer than "running command and exit" eg. `docker run busybox ping google.com`
- in second window -> list all running containers on machine (shows running containers) -> `docker ps`
- note 'names' is random generated
- the container id is required when we want to issue commands on a container

```output

CONTAINER ID   IMAGE     COMMAND             CREATED          STATUS          PORTS     NAMES
39c69041b8ea   busybox   "ping google.com"   16 seconds ago   Up 15 seconds             happy_bhaskara
```

#### list all containers ever created on machine
- list all containers ever created on machine
```
docker ps --all
```

### 547. container lifecycle
- `docker run` = `docker create` + `docker start`

#### run
- `docker run ...` by default prints outputs to terminal

#### create
- `docker create hello-world` > returns id of containers eg. 3245459743957340958743958734597345 

#### start
- `docker start -a 3245459743957340958743958734597345`
- `-a` whatch out for output from docker terminal and print it
- by default docker start wont show output to terminal

### 548. restarting stopped containers
- when a container is exited, you can start it back up
- `docker start -a id`

```
docker start -a 3245459743957340958743958734597345
```

### 549. docker system prune - removing stopped containers
- remove stopped containers with `docker system prune` 
- it also removes docker cache (ie. images fetched from docker-hub) 
- then it lists removed containers

### 550. retrieving output logs
- if you ran docker start without -a flag, but want the output logs...
- `docker logs container-id`

```
docker logs 3245459743957340958743958734597345
```

### 551. stopping containers
- `docker stop id `
  - shutdown in its own time
  - default gives 10seconds to stop -> otherwise `kill` is issued

- `docker kill id`
  - kill signal issues immediate shutdown (no grace period)

### 552. multi-command containers
- the example given is using docker to spinup redis 
- the redis cli is the interface to interact with the redis server / db
- but redis cli is outside the container so it cannot communicate with container unless the container adds the cli inside (so it can execute commands from within container)

### 553. executing commands in running containers
- execute additional command in a container with "exec" -> `docker exec -it "container id" "command"`
- `exec` allows running command 
- `-it` allows input of text

```
docker exec -it 3245459743957340958743958734597345 redis-cli
```

### 554. purpose of 'it' flag
- 'i' is so typed content gets redirected to "stdin"
- 't' is so the output displays pretty 

### 555. getting a command prompt in a container
- "sh" giving terminal/shell access to running container -> `sh` is a command processor
- eg. of command processors on computer: bash, powershell, sh
- ie. open a shell (terminal) in running container
- TODO: test by starting redis container, then get the container id (`docker ps`)
- then `docker exec -it "container id" sh`
- the cmd prompt that shows next is in context of the container...
- `CTRL + D` -> exits the cmd prompt
```
docker exec -it 3245459743957340958743958734597345 sh
```

### 556. starting with a shell
- if you want to load up container with shell but not have any command run...
- CTRL + D -> exit shell
```cmd
docker run -it busybox sh

```

### 557. container isolation
- file system is not shared between different containers (they are isolated)

### 558. creating docker images

#### creating a docker image
1. a `dockerfile` (configuration defining how container should behave - the apps/programs it contains and what it does when it starts up) 
2. dockerfile gets passed on to `docker client` (cli (terminal)) 
3. which passes it on to `docker server` which builds a usable image.

#### the docker file
1. has base image
2. add configuration to run commands (add dependencies (whatever to successfully create container))
3. specify the command to run at startup

### 559. buildkit for docker
- buildkit - is enabled by default
- when building a dockerfile, the output of final step in build process is something like:
- note below... (ee59c34ada9890ca09145cc88ccb25d32b677fc3b61e921) is the result `image id` 
- this is used for `docker run ee59c34ada9890ca09145cc88ccb25d32b677fc3b61e921`
- disable buildkit to match course output `DOCKER_BUILDKIT=0 docker build .`

```
=> => exporting layers                                                      
0.0s => => writing image sha256:ee59c34ada9890ca09145cc88ccb25d32b677fc3b61e921  0.0s
```

### progress
- buildkit hides most output, to see more use `--progress`
```
docker build --progress=plain
```

### no-cache
- disable caching
- NOTE: do not use `--no-cache` as a `Minimizing Cache Busting` technique

```
docker build --no-cache --progress=plain .
```

### 560. build a dockerfile
- TODO: create an image that runs `redis-server`
- Dockerfile comments have #

### step 1 - create a file called 'Dockerfile' (no extension)

```Dockerfile
# use an existing image as a base
FROM alpine

# download and install a dependency
RUN apk add --update redis

# tell image what to do when it starts a container
CMD ["redis-server"]
```

### step 2 - run dockerfile
- NOTE: REQUIRED - ensure you have started docker-desktop (docker daemon)
- then from inside the folder where Dockerfile is created
- after running it gives the image id 

```cmd
docker build .
```

### 561. dockerfile teardown
- NOTE: every line starts with an instruction
- 1st part -> command (FROM, RUN, CMD)
- 2nd part -> instruction

### 562. base image
- base image 'alpine'
- `alpine` is the base docker-image (we use alpine because this image has set of basic apps we need eg. apk)
- `apk` is a package manager that comes with alpine -> program that is useful for installing and running 'redis'

### 563. the build process in detail
- behind the scenes -> the output produced when running `docker build .`
- each step of the process... where it says `running in ...` that is when a new temp container is created and the instructions are run in that container

#### step 1 - FROM (use alpine image)
- download alpine image off docker-hub

#### step 2 - RUN apk...
- when command is run, look at previous step...and use that image - and create a new container
- redis is installed to that container, 
- then a temporary image is created ie. a snapshot (of file system) is taken of the container and the container is removed
- snapshot of the container was created 
- saves this snapshot as an image
- and its id is returned  

#### step 3 - CMD 
- step sets primary command to run
- look at previous step's image
- create a new image out of it... 
- and then notes the command to run.
- takes a snapshot of the intermediary container (which has the primary command to run)-> then shutsdown that container
- saves this snapshot as an image
- returns id of snapshot

### step 4
- when there are no more instructions output the last steps image

### 565. rebuilds using cache
- if you need to add additional docker build steps, docker will use cached content if there have been no changes from previous step to current step
- so the steps that need to re-run are only from the changed step and onewards

### 566. tagging an image
- tagging an image so you dont have to use docker run `container-id`
- tag the image `docker build -t stephengrider/redis:lastest .`
- the `.` is the directory to use for the build
- tag convention: `"your docker-id" / "repo/project name" : "version"`

- an example
```
docker build -t stephengrider/redis:lastest .
```

#### run
- note by default it will use the latest version (if version is ommited)
```
docker run stephengrider/redis
```

### 568. Manual Image Generation with Docker Commit

- `docker commit -c 'CMD ["redis-server"]' CONTAINERID`

- NOTE: in windows, creating a new image with `docker commit ...`
  - try this format when using windows: `docker commit -c "CMD 'redis-server'" CONTAINERID`

---
---
# 4. DOCKER PROJECT - a real world example use case for docker

### 569. project outline
- TODO: create a nodejs application -> wrap inside docker container -> be able to access this app from browser running on local machine.

#### Steps
1. create a NodeJS application
2. create a Dockerfile (that will use image to run webserver inside a container)
3. build image from Dockerfile
4. run image as container
5. connect to web app from browser

### 570. Node server setup
- create a new project folder
- add package.json (`npm init`)
- in package.json -> dependencies -> using "express": "*" in your package.json means that you want to install the latest version of Express available
- to install specific version syntax is eg: `FROM node:6.14`
- create index.js (server)

```js
//index.js
const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Hi there');
});

app.listen(8080, () => {
  console.log('Listening on port 8080');
});

```

### 571. a few planned errors

#### Node app start process
1. install dependencies (`npm i`) -> assumes npm is installed on machine/container
2. start server (`npm start`) -> assumes npm is installed

- reminder: steps for dockerfile
1. FROM -> specify base image
2. RUN -> run commands to install additional programs (dependencies)
3. CMD -> specify command to run on container startup 

#### relating steps to node project
1. FROM alpine
2. RUN npm install
3. CMD ["npm", "start"]

#### Troubleshoot
note: it is `CMD ["npm", "start"]` NOT `CMD ["npm": "start"]`

### 1. creating docker file
- create `Dockerfile` inside project folder

```js
//simpleweb/Dockerfile
# specify base image
FROM alpine

# install dependencies
RUN npm install

# default command
CMD ["npm", "start"]

```

### list all docker images
- list all docker images: `docker images -a`

### deleting
- `docker rmi -f <image_id>`

#### delete all images with tags `<none>`
-If you want to remove all images with `<none>` tags in one go: `docker rmi -f $(docker images -q -f "dangling=true")`

### 2. build docker image
- NOTE: REMINDER Docker-desktop needs to be running (in windows) before running next step

```cmd
<!-- //simpleweb/ -->

docker build . 
```

#### TROUBLESHOOT -> ERROR
```cmd output

 > [2/2] RUN npm install:
0.430 /bin/sh: npm: not found

```
- FIX: see below

### 572. REQUIRED node base image version
#### TROUBLESHOOT - continued...
- To properly follow along with the lectures, please add this specific version:
- Change this: `FROM node:alpine` to this: `FROM node:14-alpine`
- NOTE: not updating node version will give errors `npm ERR! idealTree already exists`
- This can be resolved by adding a `WORKDIR` right after the FROM instruction: (we will be adding this in the Specifying a Working Directory lecture anyway):

```Dockerfile

FROM node:alpine
WORKDIR /usr/app

```

### 573. Base image issues and SOLUTIONS
- note we used `FROM alpine`
- but alpine is a small image (therefore has limited programs included -> which doesnt include npm)
- FIX: 1. use an image that does include `npm` or 2. install npm as a command
- you can try find something in [docker-hub](https://hub.docker.com/)
- [DOCKER OFFICIAL IMAGES](https://hub.docker.com/search?image_filter=official)
- in docker terminology `alpine` is a term for 'as small and compact as possible'
- UPDATED Dockerfile
- rebuild: `docker build .`

```Dockerfile
# FROM node:alpine -> note: Dockerfile use node:14-alpine -> see 572. REQUIRED node base image version 

FROM node:14-alpine
```

#### TROUBLESHOOT - package.json 
- if you build `docker build .` -> error: `package.json no-such-file-or-directory, open '/package.json'`
- the reason is that the Dockerfile only gets the nodejs image and uses that... there is no reference to package.json
- when building an image, none of the files in project folder where you run build command are included (by default)
- FIX: see 575.

### 575. copying build files
- `COPY ./ ./` (note: ./ means current working directory)
- COPY (path to folder to copy from on your machine relative to build context) (place to copy stuff to inside the container)  
- TODO: update Dockerfile -> NB the copying should happen before `RUN`
- cmd: `docker build .`

```Dockerfile
# ...

COPY ./ ./
RUN npm install

# ...
```
#### tag the docker image
- TODO: tag the project so you dont have to work with id
- REMINDER: DO NOT FORGET THE . at the end of docker build command
- `docker build -t stephengrider/simpleweb .`
```cmd
docker build -t stephengrider/simpleweb .
```

### start this image we tagged
- `docker run stephengrider/simpleweb`

```
docker run stephengrider/simpleweb
```
- cmd status: listening on port 8080

### 576. container port forwarding
- browser is making request to port 8080
- NOTE: by default no traffic to computer (:8080) is routed to docker container
- container has its own isolated set of ports
- TODO: setup explicit port mapping for INCOMING REQUESTS (requests to a port on localnetwork should be forwarded to a port on container)
  - adjust docker's run command (NOTE: this is NOT done inside dockerfile -> it is a runtime constraint)
- NOTE: docker container can make its own requests to outside (OUTBOUND)
- to setup docker with portmapping (-p)
- docker run -p `route incoming requests for this port on local host` : `to this port inside the container` `image id / image tag-name`

```cmd
<!-- example -->
docker run -p 8080:8080 stephengrider/simpleweb
```

- test: from browser `localhost:8080`
- output on page: `Hi there`

- NOTE: the FROM port / TO ports do not have to be identical
- the docker port is specified in app server file (index.js) BUT the from port in localhost can be anything..
- eg. forwards any request from localhost port :2000 to the docker container 

```cmd
<!-- example -->
docker run -p 2000:8080 stephengrider/simpleweb
```

### 577. specifying a working directory
- TODO: startup shell on a container we build (to look at container folders and files)
- NOTE: docker should be running

```cmd
docker run -it stephengrider/simpleweb sh

ls
```
- you will notice files are copied to root folder of container.
- PROBLEM: there could be conflict with any files / folder (eg. conflict 'lib' folder) in default container folder system
- FIX: instead of copying everything into root folder directory, copy to a nested directory
- FIX: you can specify `WORKDIR`

```Dockerfile
WORKDIR /usr/app
```
- any command following the setting of WORKDIR will be executed relative to this path in the container 
- eg. setting `WORKDIR` with `COPY` afterwards will copy relative to `/user/app` 
- if WORKDIR folder doesnt exist, it will be automatically created

```
WORKDIR /usr/app
COPY ./ ./
```
- FIX: TODO -> exit running container `exit`
- TODO: rebuild from within project folder (with tag)

```cmd
<!-- /simpleweb/ -->
docker build -t stephengrider/simpleweb .

```

- run updated container
```
docker run -p 8080:8080 stephengrider/simpleweb
```

- spy in the updated container (can use -it -sh -> ls)
- OR can use `docker exec` to start second process inside running container
- TODO: open second terminal window (powershell or cmd)
- get running container id (eg. 26ba67ffe05d) with `docker ps`
- run docker exec -it `container id` `program to run`
```
docker exec -it 26ba67ffe05d sh
```
- NOTE: it takes you directly to the working folder (/user/app)...
- if you run `ls` then you will see the project files in this folder
- if you `cd /` you will see no project files/folder in root container (ie no conflicts)

```cmd-output
bin    etc    lib    mnt    proc   run    srv    tmp    usr
dev    home   media  opt    root   sbin   sys    user   var
```

### 578. unecessary rebuilds
- if you make changes to your project and rebuild, the Dockerfile COPY step re-copies everything over instead of just the file
- ie. all steps following also have to be re-done eg step 4 `RUN npm install` dependencies have to be re-installed

### 579. minimizing cache busting and rebuilds
- splitting up Dockerfile command
- streamline the Dockerfile by separating dependency for commands 
  - moving to its own command -> copying package.json and installing dependencies
  - moving to its own command -> `COPY ./ ./` copying project files separately
- the order of instructions inside the Dockerfile does matter

### Before
```Dockerfile
# install dependencies
COPY ./ ./
RUN npm install
```

### After
- so here we only copy the package.json to the container and do RUN command.
- then after copy the rest of project files
- rebuild -> `docker build -t stephengrider/simpleweb .`

```Dockerfile
COPY ./package.json ./
RUN npm install

# separate the copying of the rest of project files
COPY ./ ./
```

### cleanup
- docker ps -a
- docker kill `container-id`