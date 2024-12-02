#!/bin/bash

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/onesmiledx/android_manifests.git -b 15 --git-lfs --depth=1
git clone https://github.com/PixelOS-A71/local_manifests -b fifteen .repo/local_manifests
/opt/crave/resync.sh

#build
rm -rf hardware/qcom-caf/sm6225
. build/envsetup.sh
lunch feather_a71-ap3a-user
mka installclean
mka bacon
