#!/bin/bash

# script to setup TIDL target on BeagleY-AI running edgeai image
# https://www.beagleboard.org/distros/beagley-ai-ti-sdk-edge-ai-11-00-00-08-2025-09-06

git clone https://github.com/TexasInstruments/edgeai-tidl-tools.git || exit
cd edgeai-tidl-tools || exit
# match edgeai image version
git checkout 11_00_08_00


# setup for BeagleY-AI
export SOC=am67a
export TISDK_IMAGE=edgeai
export SDK_VERSION=11_0 


# now update the target 
./update_target.sh

