# ℹ️ About
```
 _____ _   _ ____  ___ _   _  ____   ____  ___   ___  
|_   _| | | |  _ \|_ _| \ | |/ ___| |  _ \|_ _| |_  \ 
  | | | | | | |_) || ||  \| | |  _  | |_) || |    ) | 
  | | | |_| |  _ < | || |\  | |_| | |  _ / | |   / /  
  |_|  \___/|_| \_|___|_| \_|\____| |_|   |___| |___| 
Community Updates by DhanOS
```
This is an **UNOFFICIAL** build of the Turing Pi 2 firmware. Created as a fork of the [original Turing Pi 2 firmware](https://github.com/wenyi0421/turing-pi). The aim for this project is to add the most wanted functionalities before the new official firmware is being created.

Even if it's generally safe to use this firmware, I must mention that you are using it on your own risk. Neither TURING MACHINES INC. nor me are not responsible for any possible damage made by this firmware.

While this is never necessary, if you like my work, you can consider [buying me a coffee](https://ko-fi.com/dhanos) and keep me fueled for longer :)

<br>

# 📝 Changelog and TODO:

The full changelog and TODO can be found on the [changelog page](changelog.md).

The most important changes:
- [x] Add SSH root logins
- [x] Set static MAC address (`12:34:56:78:9A:BC`)
- [x] Add `ntp` and `ntpd` (automatic time synchronization from the internet)
- [ ] Add login/password protection to the webpanel
- [ ] Add an ability to set the MAC address read from the SD card
- [ ] Add an ability to set the IP address read from the SD card
- [ ] Synhcronize the hardware clock when the system clock is being set
- [ ] Fix possible buffer-overflow errors found in the firmware
- [ ] Add timezone settings for the time to be set correctly

<br>

# 💾 Installing the firmware

The easiest way to install the firmware is to download the `swu` file from the [latest release](https://github.com/daniel-kukiela/turing-pi2-community-firmware/releases) and upgrade it through the web panel:    
<img src="https://help.turingpi.com/hc/article_attachments/8848581719453" width="50%">

In general, the upgrade process is the same as with the original fimrmware and the more detailed instructions can be found in the [Turing Pi documentation](https://help.turingpi.com/hc/en-us/articles/8686945524893-Baseboard-Management-Controller-BMC-).

<br>

# 📦 Compiling the firmware

You can compile the firmware on your own and the steps to follow are similar to the steps to compile the original firmware.
This project also includes a helpful bash script to get started.


## ⚙️ Install the necessary dependent packages
```bash
sudo apt-get install build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip lib32z1 lib32z1-dev lib32stdc++6 libstdc++6 libncurses-dev u-boot-tools mkbootimg bc -y
```

## ⚙️ Getting Started
```bash
# Clone the project and change directory
git clone git@github.com:daniel-kukiela/turing-pi-2-community-edition-firmware.git
cd turing-pi-2-community-edition-firmware

# Configure buildroot for your system
./tpi.sh init

# Make sure Python3 is not installed in the buildroot menu. The path is:
# Target Packages > Interpreter languages and scripting > python3
# Opening the menu by running:
./tpi.sh menu

# Finally run a full build for the system, this only has to be done once
# Can optionally pass in a VERSION, by default it is stored in the VERSION file
./tpi.sh build # Make sure the final image has a valid MBR, it will be near the end of the output
```

## ⚙️ Update Existing Build
```bash
# Once the project is built, it will have already run mkfw once.
# After changes are made, the project can be rebuilt much faster using
./tpi.sh mkfw
```

## Windows Tips:
- Install [Ubuntu WSL](https://ubuntu.com/wsl) from the app store
- Remove the windows path from WSL to use built in toolchains and remove spaces from path
- Clone the repository after removing windows path to ensure line file endings are LF
- Run dos2unix on all files after cloneing to fix any existing line ending normalization issues

Example `/etc/wsl.conf` for the Ubuntu WSL instance:
```
[interop]
appendWindowsPath = false
```

Example dos2unix for Ubuntu WSL
```bash
sudo apt get install dos2unix -y
# inside of the turing-pi-2-community-edition-firmware project:
find . -type f -print0 | xargs -0 dos2unix
```