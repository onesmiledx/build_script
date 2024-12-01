#!/bin/bash

#removals
rm -rf .repo/local_manifests device/samsung/a71-common device/samsung/a71 kernel/samsung/a71 vendor/samsung/a71 vendor/samsung/a71-common hardware/samsung

#sync
repo init -u git@github.com:FeatherROM/android_manifests.git -b 15 --git-lfs
git clone https://github.com/PixelOS-A71/local_manifests s-b fifteen .repo/local_manifests
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
