#!/bin/bash

#init
sudo apt update -y
sudo apt upgrade -y
sudo apt-get update -y
sudo apt install bc bison neofetch build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev -y
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git config --global user.email "beksultanbazuov@gmail.com"
git config --global user.name "onesmiledx"
git config --global color.ui false

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs --depth=1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
rm -rf .repo/local_manifests
git clone https://github.com/onesmiledx/local_manifest -b a10s .repo/local_manifests
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

#idk
neofetch
df -h

#build
. build/envsetup.sh
lunch lineage_a10s-ap2a-userdebug
mka bacon
