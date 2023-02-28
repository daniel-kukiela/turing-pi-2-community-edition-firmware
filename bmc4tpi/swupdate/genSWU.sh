#!/bin/sh
CONTAINER_VER="0.1.0"
PRODUCT_NAME="turing_pi2_ce"
FILES="sw-description rootfs.ubifs env0.fex env1.fex"
for i in $FILES;do
        echo $i;done | cpio -ov -H crc >  ${PRODUCT_NAME}-${CONTAINER_VER}.swu
