#!/bin/bash

#removals
rm -rf .repo/local_manifests
rm -rf device/samsung/a71
rm -rf device/samsung/a71-common
rm -rf hardware/qcom-caf/common
rm -rf kernel/samsung/a71
rm -rf vendor/samsung/a71
rm -rf vendor/samsung/a71-common

#sync
repo init -u https://github.com/PixysOS/manifest -b fourteen-v3 --depth=1
git clone https://github.com/a71-aosp/local_manifest -b pixys .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
lunch pixys_a71-ap2a-userdebug
m pixysrelease
