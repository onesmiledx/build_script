#!/bin/bash

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/alphadroid-project/manifest -b alpha-14 --git-lfs
git clone https://github.com/a71-aosp/local_manifest -b alpha .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
lunch lineage_a71-ap2a-userdebug
mka installclean
mka bacon
