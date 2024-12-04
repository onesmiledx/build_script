#!/bin/bash

#build
rm -rf hardware/qcom-caf/sm6225
rm -rf hardware/qcom-caf/sm8550
rm -rf device/samsung/a71
git clone https://github.com/PixelOS-A71/device_samsung_a71 device/samsung/a71
. build/envsetup.sh
lunch feather_a71-ap3a-user
mka installclean
mka bacon
