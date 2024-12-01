#!/bin/bash

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/FeatherROM/android_manifests.git -b 15 --git-lfs --depth=1
git clone https://github.com/PixelOS-A71/local_manifests -b fifteen .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
lunch feather_a71-ap3a-user
mka installclean
mka bacon
