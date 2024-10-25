#
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), RMX1851)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
