#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=clover
export DEVICE_COMMON=sdm660-common
export DEVICE_SPECIFIED_COMMON_DEVICE="clover"
export VENDOR=xiaomi

export DEVICE_BRINGUP_YEAR=2018

DEVICE_BLOB_ROOT="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary
patchelf --remove-needed libandroid.so "$DEVICE_BLOB_ROOT"/vendor/lib/libmmcamera_bokeh.so
patchelf --remove-needed libgui.so "$DEVICE_BLOB_ROOT"/vendor/lib/libmmcamera_ppeiscore.so
patchelf --replace-needed libstdc++.so libstdc++_vendor.so "$DEVICE_BLOB_ROOT"/vendor/lib/libchromaflash.so
patchelf --replace-needed libstdc++.so libstdc++_vendor.so "$DEVICE_BLOB_ROOT"/vendor/lib/libmmcamera_ubifocus_lib.so
patchelf --replace-needed libstdc++.so libstdc++_vendor.so "$DEVICE_BLOB_ROOT"/vendor/lib/liboptizoom.so
patchelf --replace-needed libstdc++.so libstdc++_vendor.so "$DEVICE_BLOB_ROOT"/vendor/lib/libtrueportrait.so
patchelf --replace-needed libstdc++.so libstdc++_vendor.so "$DEVICE_BLOB_ROOT"/vendor/lib/libubifocus.so

patchelf --remove-needed libhidltransport.so "$DEVICE_BLOB_ROOT"/vendor/lib64/vendor.qti.hardware.fingerprint@1.0.so
patchelf --replace-needed libhidlbase.so libhidlbase-v32.so "$DEVICE_BLOB_ROOT"/vendor/lib64/vendor.qti.hardware.fingerprint@1.0.so

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
