#
# Copyright (C) 2018 The Xiaomi-SDM660 Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit some common LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/clover/device.mk)

# Build Description
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="clover-user 8.1.0 OPM1.171019.019 9.7.4 release-keys" \
    BuildFingerprint=xiaomi/clover/clover:8.1.0/OPM1.171019.019/9.7.4/release-keys \
    RisingChipset="Snapdragon 660" \
    RisingMaintainer="Viviano" \
    DeviceProduct=clover

# Device identifier
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := lineage_clover
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_DEVICE := clover
PRODUCT_MODEL := MI PAD 4

# RisingOS
TARGET_ENABLE_BLUR := false
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := false
TARGET_DEFAULT_PIXEL_LAUNCHER := false
WITH_GMS :=  false
TARGET_CORE_GMS := false
