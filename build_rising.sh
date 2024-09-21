#!/bin/bash

#removals
rm -rf .repo/local_manifests device/samsung/a71-common device/samsung/a71 kernel/samsung/a71 vendor/samsung/a71 vendor/samsung/a71-common hardware/samsung

#sync
repo init -u https://github.com/RisingTechOSS/android.git -b fourteen --git-lfs --depth=1
git clone https://github.com/onesmiledx/local_manifest -b pixelos .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
export RISING_MAINTAINER=Starlix
export RISING_CHIPSET=Snapdragon 730 4G
riseup a71 userdebug
make installclean
rise b
