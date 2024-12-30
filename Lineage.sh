#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
# remove device
rm -rf device/xiaomi/mojito
rm -rf device/xiaomi/sm6150-common
# remove kernel
rm -rf kernel/xiaomi/mojito
# remove hardware
rm -rf hardware/xiaomi
# remove vendor
rm -rf vendor/xiaomi/mojito
rm -rf vendor/xiaomi/sm6150-common
# Initialize ROM manifest
repo init --depth=1 -u https://github.com/ProjectSakura/android.git -b 14 --git-lfs
# repo sync
/opt/crave/resync.sh
# cloning DT
# device tree
git clone https://github.com/MatrixxOS9/device_xiaomi_mojito.git --depth 1 -b sakura device/xiaomi/mojito
git clone https://github.com/MatrixxOS9/android_device_xiaomi_sm6150-common.git --depth 1 -b mojito-universe device/xiaomi/sm6150-common
# kernel tree
git clone https://github.com/MatrixxOS9/kernel_xiaomi_mojito.git --depth 1 -b sakura kernel/xiaomi/mojito
# vendor tree
git clone https://gitlab.com/Sepidermn/android_vendor_xiaomi_mojito.git --depth 1 -b 14 vendor/xiaomi/mojito
git clone https://gitlab.com/Sepidermn/android_vendor_xiaomi_sm6150-common.git --depth 1 -b 14 vendor/xiaomi/sm6150-common
# hardware tree
git clone https://github.com/MatrixxOS9/android_hardware_xiaomi.git --depth 1 -b mojito hardware/xiaomi
# add leica
git clone https://gitlab.com/Sepidermn/android_vendor_xiaomi_mojito-leicacamera.git -b main vendor/xiaomi/mojito-leicacamera
# set build environment
. build/envsetup.sh
# lunch
lunch lineage_mojito-ap2a-userdebug
# full building
mka bacon
