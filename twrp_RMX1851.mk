#
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := RMX1851
PRODUCT_NAME := twrp_RMX1851
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme 3 Pro
PRODUCT_MANUFACTURER := realme
PRODUCT_RELEASE_NAME := RMX1851

# Default device path for tree
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)

ifeq ($(TARGET_RECOVERY_TYPE), pbrp)
    # Configure pbrp common.mk
    $(call inherit-product, vendor/pb/config/common.mk)
else
    # Configure twrp common.mk
    $(call inherit-product, vendor/twrp/config/common.mk)
endif

# Configure
$(call inherit-product, $(DEVICE_PATH)/r3p.mk)
$(call inherit-product, $(DEVICE_PATH)/BoardConfigRecovery.mk)
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Configure
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="RMX1851-user 11 RKQ1.201217.002 1650246662208 release-keys" \
    TARGET_DEVICE=RMX1851 \
    TARGET_PRODUCT=RMX1851

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Realme/RMX1851/RMX1851:11/RKQ1.201217.002/1650246662208:user/release-keys

PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)