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
repo init --depth=1 -u https://github.com/AfterlifeOS/android_manifest.git -b 14 --git-lfs
# repo sync
/opt/crave/resync.sh
# cloning DT
# remove frameworks/base
rm -rf frameworks/base
# remove packages/apps/AfterHome
rm -rf packages/apps/AfterHome
# remove packages/apps/Settings
rm -rf packages/apps/Settings
# device tree
git clone https://github.com/MatrixxOS9/device_xiaomi_mojito.git --depth 1 -b afterlife device/xiaomi/mojito
git clone https://github.com/MatrixxOS9/android_device_xiaomi_sm6150-common.git --depth 1 -b afterlife device/xiaomi/sm6150-common
# kernel tree
git clone https://github.com/Kou-Yeager/kernel_xiaomi_mojito.git --depth 1 -b BORE+UCLAMP kernel/xiaomi/mojito
# vendor tree
git clone https://gitlab.com/Sepidermn/android_vendor_xiaomi_mojito.git --depth 1 -b 14 vendor/xiaomi/mojito
git clone https://gitlab.com/Sepidermn/android_vendor_xiaomi_sm6150-common.git --depth 1 -b 14 vendor/xiaomi/sm6150-common
# hardware tree
git clone https://github.com/MatrixxOS9/android_hardware_xiaomi.git --depth 1 -b mojito hardware/xiaomi
# add frameworks/base
git clone https://github.com/wulan17/frameworks_base.git --depth 1 -b 14 frameworks/base
# add packages/apps/AfterHome
git clone https://github.com/wulan17/packages_apps_AfterHome.git --depth 1 -b 14 packages/apps/AfterHome
# add packages/apps/Settings
git clone https://github.com/wulan17/packages_apps_Settings.git --depth 1 -b 14 packages/apps/Settings
# Export
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
# set build environment
. build/envsetup.sh
# lunch
goafterlife mojito userdebug

