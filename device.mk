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

# oem otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/realmelocal \
    $(DEVICE_PATH)/security/realmespecial


ifeq ($(INCLUDE_PREBUILT_ICU_LIBS), true)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*.so,$(LOCAL_PATH)/prebuilt/icu_libraries,$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64)
endif
