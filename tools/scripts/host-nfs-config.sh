#!/bin/bash

sudo apt install -y nfs-common
sudo mkdir -p /nfs/shared
sudo mount -t nfs 172.16.1.10:/volume1/shared /nfs/shared

git config --global --add safe.directory '*'

export DL_DIR=/nfs/shared/downloads
export SSTATE_DIR=/nfs/shared/sstate-cache

export BB_ENV_EXTRAWHITE="$BB_ENV_EXTRAWHITE DL_DIR SSTATE_DIR"
