#!/bin/sh

if [ ! -f "VERSION" ]; then
  echo "No VERSION file found, exiting"
  exit 1
fi

VERSION=$(cat "VERSION")

echo "# Updating version $VERSION"
./scripts/set_version.sh
[ $? -eq 1 ] && exit 1

cd ./buildroot

echo "# Running cjson rebuild\n"
make cjson-rebuild
echo "# Running initial V1 build\n"
make V=1

cd ../

echo "# Updating bmc configurations"
./scripts/bmc_configs.sh
[ $? -eq 1 ] && exit 1

echo "# Rebuilding with bmc changes"

cd ./buildroot
make linux-rebuild
make swupdate-rebuild

cd ../
./scripts/mkfw.sh
[ $? -eq 1 ] && exit 1