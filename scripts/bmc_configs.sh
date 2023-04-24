#!/bin/sh

# Initial Configurations for the BMC.
# Needs to be run anytime the buildroot output is cleared or fresh AND after an initial V=1 build

build_path=./buildroot/output/build
linux_path="$build_path/linux-5112fdd843715f1615703ca5ce2a06c1abe5f9ee"
img_path=./buildroot/output/images

# Bail out if the initial build is missing
if [ ! -d "$linux_path" ]; then
  echo "Something went wrong, could not find build assets, ensure V=1 has been built, exiting"
  exit 1
fi

# Override defaults with BMC configs
cp ./bmc4tpi/config/sun8iw20p1* "$linux_path/arch/arm/boot/dts/"
cp ./bmc4tpi/config/kernelconfig "$linux_path/.config"
cp ./bmc4tpi/config/swupdateconfig "$build_path/swupdate-2021.11/.config"

# Copy the swu env to the images output
[ ! -f "$img_path/sw-description" ] && cp ./bmc4tpi/swupdate/sw-description "$img_path/"
[ ! -f "$img_path/genSWU.sh" ] && cp ./bmc4tpi/swupdate/genSWU.sh "$img_path/"
[ ! -f "$img_path/env0.fex" ] && cp ./bmc4tpi/swupdate/env0.fex "$img_path/"
[ ! -f "$img_path/env1.fex" ] && cp ./bmc4tpi/swupdate/env1.fex "$img_path/"

echo "# BMC configured at ./buildroot, make sure to run linux-rebuild and swupdate-rebuild"