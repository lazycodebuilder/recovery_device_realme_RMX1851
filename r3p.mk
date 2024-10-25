#
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_CPU_VARIANT_RUNTIME := cortex-a9
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

# Assert
TARGET_BOOTLOADER_BOARD_NAME := RMX1851
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := RMX1851,RMX1851EX,RMX1851EU,RMX1851EUEX,RMX1851CN,nicky

# Platform
TARGET_BOARD_PLATFORM := sdm710
QCOM_BOARD_PLATFORMS += sdm710
BOARD_USES_QCOM_HARDWARE := true
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0xA90000
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += androidboot.configfs=true
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3 
BOARD_KERNEL_CMDLINE += swiotlb=1
BOARD_KERNEL_CMDLINE += loop.max_part=7 
BOARD_KERNEL_CMDLINE += printk.devkmsg=on
BOARD_KERNEL_CMDLINE += kpti=off

BOARD_KERNEL_CMDLINE += loglevel=8
BOARD_KERNEL_CMDLINE += earlyprintk
BOARD_KERNEL_CMDLINE += fbcon=map:1
BOARD_KERNEL_CMDLINE += memblock=debug
BOARD_KERNEL_CMDLINE += kmemleak=on
BOARD_KERNEL_CMDLINE += dt.debug=1

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

TARGET_RECOVERY_ADDITIONAL_DEFAULT_PROPERTIES += persist.logd.size=1M

BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Dtbo
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Partitions Sizes
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 53600960000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5578424320
BOARD_VENDORIMAGE_PARTITION_SIZE := 1677721600
BOARD_ODMIMAGE_PARTITION_SIZE := 268435456

# Workaround for error copying files to recovery ramdisk
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR := vendor

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Decryption support for /data
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
TW_USE_FSCRYPT_POLICY := 2

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Add TW_DEVICE_VERSION
TW_DEVICE_VERSION := v0.1.2 | LazymeaoProjects

# Fixes wrong theme color
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Brightness flags
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 140

# CPU temp sysfs path, if it is zero all the time
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone12/temp

# Statusbar icons flags
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := 40
TW_CUSTOM_CLOCK_POS := 300
TW_CUSTOM_BATTERY_POS := 810

# EDL Mode (qcom)
TW_HAS_EDL_MODE := true

# ozip decrypt key
TW_OZIP_DECRYPT_KEY := 1c4c1ea3a12531ae491b21bb31613c11

# Logical partitions
TW_INCLUDE_LOGICAL := my_carrier my_company my_custom my_engineering my_heytap my_manifest my_preload my_product my_region my_stock my_version
