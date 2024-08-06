#!/bin/bash

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/LineageOS-Revived/android.git -b lineage-17.1 --git-lfs --depth=1
git clone https://github.com/onesmiledx/local_manifest -b a10s .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
lunch lineage_a10s-eng
mka systemimage

#upload
curl -F "file=@out/target/product/a10s/system.img" https://temp.sh/upload
