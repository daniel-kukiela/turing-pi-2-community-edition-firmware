#!/bin/sh

VERSION=$(cat "./VERSION")
sed -i "s/version: .*$/version: $VERSION\"/" "./app/board/rootfs_overlay/etc/init.d/S99hello.sh"
sed -i "s/CONTAINER_VER=.*$/CONTAINER_VER=\"$VERSION\"/" "./bmc4tpi/swupdate/genSWU.sh"

if [ -f "./buildroot/output/images/genSWU.sh" ]; then
  sed -i "s/CONTAINER_VER=.*$/CONTAINER_VER=\"$VERSION\"/" "./buildroot/output/images/genSWU.sh"
fi