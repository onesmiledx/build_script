#!/bin/bash

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs --depth=1
git clone https://github.com/onesmiledx/local_manifest -b los21 .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
lunch lineage_a10s-ap2a-userdebug
mka bacon
