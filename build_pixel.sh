#!/bin/bash

#build
rm -rf hardware/qcom-caf/sm6225
rm -rf hardware/qcom-caf/sm8550
. build/envsetup.sh
lunch feather_a71-ap3a-user
mka installclean
mka bacon
