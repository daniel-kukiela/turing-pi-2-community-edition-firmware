#!/bin/sh

date=`date +%F`

version="0.1.0"

if [ ! -d "build/${date}" ];then
    echo "mkdir build/${date}"
    mkdir -p "build/${date}"
fi

echo "----- make fw -----" 
echo "Version: ${version}" 
echo "Date: ${date}"

echo "build fw"
make -C buildroot V=1
echo "cp -rf buildroot/output/images/buildroot_linux_nand_uart3.img ./build/${date}/turing_pi2_ce-${version}.img"
cp -rf buildroot/output/images/buildroot_linux_nand_uart3.img ./build/${date}/turing_pi2_ce-${version}.img

cd buildroot/output/images/
./genSWU.sh
cd -

cp -rf ./buildroot/output/images/turing_pi2_ce-${version}.swu ./build/${date}/turing_pi2_ce-${version}.swu

echo "build turing pi firmware over"

