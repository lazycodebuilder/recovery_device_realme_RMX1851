#
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

# health hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl-default.recovery \
    android.hardware.health@2.1-impl.recovery

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

PRODUCT_PROPERTY_OVERRIDES += \
	ro.fastbootd.available=true

TARGET_RECOVERY_DEVICE_MODULES += \
    libion

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_PROPERTY_OVERRIDES += \
	vendor.gatekeeper.disable_spu=true \
	ro.crypto.dm_default_key.options_format.version=2

# F2FS utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bootimage.build.date.utc=0 \
    ro.build.date.utc=0

# oem otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/realmelocal \
    $(DEVICE_PATH)/security/realmespecial
