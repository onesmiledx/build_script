#!/bin/bash

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/CherishOS/android_manifest.git -b uqpr2 --git-lfs --depth=1
git clone https://github.com/onesmiledx/local_manifest -b pixelos .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
lunch aosp_a71-ap2a-user
mka installclean
mka bacon
