#!/bin/bash

# script to setup TIDL target on BeagleY-AI running edgeai image
# https://www.beagleboard.org/distros/beagley-ai-ti-sdk-edge-ai-11-00-00-08-2025-09-06

# set up git on target
git config --global user.email "iain@hunterembedded.co.uk"
git config --global user.name "Iain Hunter"


export GIT_SSH_COMMAND='ssh -i /root/.ssh/id_ed25519_github_new.db'


git clone https://github.com/TexasInstruments/edgeai-tidl-tools.git || exit
cd edgeai-tidl-tools || exit
# match edgeai image version
git checkout 11_00_08_00 || exit
git am  ../patches/0001-fix-syntax-error-in-update_target.sh.patch || exit

# setup for BeagleY-AI and make persistent by writing to .profile, overwrite default .profile
echo " export SOC=am67a 
export TISDK_IMAGE=edgeai
export SDK_VERSION=11_0 " > ~/.profile

export SOC=am67a
export TISDK_IMAGE=edgeai
export SDK_VERSION=11_0
export UPDATE_FIRMWARE_AND_LIB=0

# install tools
./setup.sh

# setup env for specific board
./setup_env.sh am67a

# now update the target 
./update_target.sh

