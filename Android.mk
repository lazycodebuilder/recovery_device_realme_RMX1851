#
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), RMX1851)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif

# Hack some props
BOARD_RECOVERY_IMAGE_PREPARE += \
    sed -i 's/ro.adb.secure=.*/ro.adb.secure=0/' $(TARGET_RECOVERY_ROOT_OUT)/prop.default; \
    sed -i 's/ro.bootimage.build.date.utc=.*/ro.bootimage.build.date.utc=0/' $(TARGET_RECOVERY_ROOT_OUT)/prop.default; \
    sed -i 's/ro.build.date.utc=.*/ro.build.date.utc=0/' $(TARGET_RECOVERY_ROOT_OUT)/prop.default;
