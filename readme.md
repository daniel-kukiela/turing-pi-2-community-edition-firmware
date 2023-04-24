# About
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

# Changelog and TODO:

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

# Installing the firmware

The easiest way to install the firmware is to download the `swu` file from the [latest release](https://github.com/daniel-kukiela/turing-pi2-community-firmware/releases) and upgrade it through the web panel:    
<img src="https://help.turingpi.com/hc/article_attachments/8848581719453" width="50%">

In general, the upgrade process is the same as with the original fimrmware and the more detailed instructions can be found in the [Turing Pi documentation](https://help.turingpi.com/hc/en-us/articles/8686945524893-Baseboard-Management-Controller-BMC-).

<br>

# Compiling the firmware

You can compile the formware on your own and the steps to follow are similar to the steps to compile the original firmware.

## Install the necessary dependent packages



```makefile
sudo apt-get install build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip lib32z1 lib32z1-dev lib32stdc++6 libstdc++6 libncurses-dev u-boot-tools mkbootimg -y
```

## build

```makefile
cd buildroot
make   BR2_EXTERNAL="../br2t113pro"  100ask_t113-pro_spinand_core_defconfig
make cjson-rebuild
make V=1

//update config  //Only once
cd ../
cp bmc4tpi/config/sun8iw20p1* buildroot/output/build/linux-5112fdd843715f1615703ca5ce2a06c1abe5f9ee/arch/arm/boot/dts/
cp bmc4tpi/config/kernelconfig buildroot/output/build/linux-5112fdd843715f1615703ca5ce2a06c1abe5f9ee/.config
cp bmc4tpi/config/swupdateconfig buildroot/output/build/swupdate-2021.11/.config
cp bmc4tpi/swupdate/sw-description buildroot/output/images/
cp bmc4tpi/swupdate/genSWU.sh buildroot/output/images/
cp bmc4tpi/swupdate/env0.fex buildroot/output/images/
cp bmc4tpi/swupdate/env1.fex buildroot/output/images/

//rebuild 
cd buildroot
make linux-rebuild
make swupdate-rebuild

make V=1

//build swu
cd output/images/
./genSWU.sh

//generate the images
cd ../../../
./mkfw.sh

```
