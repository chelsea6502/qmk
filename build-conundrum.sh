#!/bin/bash
set -exo pipefail

# Load base image if not present
if ! docker image inspect thock/conundrum-base >/dev/null 2>&1; then
    if [ -f conundrum-base-image.tar.gz ]; then
        echo "Loading base image from local archive..."
        docker load < conundrum-base-image.tar.gz
    else
        echo "Base image not found. Downloading from GitHub Releases..."
        wget -q https://github.com/chelsea6502/qmk-conundrum/releases/latest/download/conundrum-base-image.tar.gz
        docker load < conundrum-base-image.tar.gz
    fi
fi

# Build the project image
docker build -t thock/conundrum --build-arg keymap=${keymap:-default:uf2} .

# Run the build
docker run -v $PWD:/qmk_firmware -v $PWD/.build:/qmk_firmware/.build -it thock/conundrum
