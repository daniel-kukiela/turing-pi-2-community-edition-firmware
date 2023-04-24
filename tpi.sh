#!/bin/sh

BANNER=$(
  cat <<-EndOfMessage
 _____ _   _ ____  ___ _   _  ____   ____  ___   ___
|_   _| | | |  _ \|_ _| \ | |/ ___| |  _ \|_ _| |_  \\
  | | | | | | |_) || ||  \| | |  _  | |_) || |    ) |
  | | | |_| |  _ < | || |\  | |_| | |  _ / | |   / /
  |_|  \___/|_| \_|___|_| \_|\____| |_|   |___| |___|
Community Updates by DhanOS\n
EndOfMessage
)

USAGE=$(
  cat <<-EndOfMessage
Usage:
  ./tpi.sh init            # Update the base buildroot configuration for your system, it will override any .config files
  ./tpi.sh build <VERSION> # Full build, including linux. Version is optional and will be pulled from VERSION file
  ./tpi.sh menu            # Run buildroot menuconfig
  ./tpi.sh mkfw <VERSION>  # Lightweight rebuild of V=1. Version is optional, updates version before rebuild firmware
EndOfMessage
)

error() {
  echo "$USAGE\n"
  echo "Error:"
  echo "  $1\n"
  exit $2
}

echo "$BANNER"

if [ $# -eq 0 ]; then
  error "Missing command" 1
fi

if [ "$1" = "build" ]; then
  if [ ! -z "$2" ]; then
    echo "$2" >VERSION
  fi
  ./scripts/build.sh
fi

if [ "$1" = "menu" ]; then
  cd ./buildroot
  make menuconfig
  cd ../
fi

if [ "$1" = "init" ]; then

  echo "# Configuring br2t113pro\n"
  cd ./buildroot
  make BR2_EXTERNAL="../br2t113pro" 100ask_t113-pro_spinand_core_defconfig
  cd ../
fi

if [ "$1" = "mkfw" ]; then
  echo "$BANNER"
  if [ ! -z "$2" ]; then
    echo "$2" > "VERSION"
    ./scripts/set_version.sh
  fi
  ./scripts/mkfw.sh
fi

echo "Finished"