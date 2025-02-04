# ================================================================
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
# ================================================================

# ================================================================
# Configuration Validation and Defaults
# ================================================================
# Supported recovery types
VALID_RECOVERY_TYPES := twrp pbrp ofrp shrp

# Validate recovery type
ifeq ($(filter $(LAZY_TARGET_RECOVERY_TYPE),$(VALID_RECOVERY_TYPES)),)
    $(warning Invalid recovery type specified for LAZY_TARGET_RECOVERY_TYPE. Supported types are: '$(VALID_RECOVERY_TYPES)'. Using default value: 'twrp'.)
    # Set default recovery type to 'twrp'
    LAZY_TARGET_RECOVERY_TYPE ?= twrp
endif

# Validate legacy build support value
ifeq ($(filter true false,$(LAZY_SUPPORT_LEGACY_BUILD)),)
    $(warning Invalid value for LAZY_SUPPORT_LEGACY_BUILD. Accepted values are 'true' or 'false'. Using default value: 'false'.)
    # Set default legacy build support to 'false'
    LAZY_SUPPORT_LEGACY_BUILD ?= false
endif

# Validate debug flag inclusion value
ifeq ($(filter true false,$(LAZY_INCLUDE_DEBUG_FLAGS)),)
    $(warning Invalid value for LAZY_INCLUDE_DEBUG_FLAGS. Accepted values are 'true' or 'false'. Using default value: 'false'.)
    # Set default debug flag inclusion to 'false'
    LAZY_INCLUDE_DEBUG_FLAGS ?= false
endif

# ================================================================
# Common Feature Configuration
# ================================================================
# Include Prebuilt ICU Libraries for Legacy Build
LAZY_INCLUDE_PREBUILT_ICU_LIBS := $(if $(filter true,$(LAZY_SUPPORT_LEGACY_BUILD)),true)

# FastbootD configuration based on recovery type and Legacy Support
LAZY_INCLUDE_FASTBOOTD := $(if $(filter shrp_true pbrp_true,$(LAZY_TARGET_RECOVERY_TYPE)_$(LAZY_SUPPORT_LEGACY_BUILD)),false,true)

# ================================================================
# Recovery Type Specific Configurations
# ================================================================
ifeq ($(LAZY_TARGET_RECOVERY_TYPE), twrp)
    ## TWRP Configuration
    ## TWRP-specific flags here
    # Add TW_DEVICE_VERSION
    TW_DEVICE_VERSION := v0.1.2 | LazymeaoProjects
    # Statusbar icons flags
    TW_STATUS_ICONS_ALIGN := center
    TW_CUSTOM_CPU_POS := 40
    TW_CUSTOM_CLOCK_POS := 300
    TW_CUSTOM_BATTERY_POS := 810
else ifeq ($(LAZY_TARGET_RECOVERY_TYPE), pbrp)
    ## PBRP Configuration
    # Disable default DM-Verity
    PB_DISABLE_DEFAULT_DM_VERITY := true
    # Disable default Treble compatibility
    PB_DISABLE_DEFAULT_TREBLE_COMP := true
    # Disable default AVB2 patching
    PB_DISABLE_DEFAULT_PATCH_AVB2 := true
    # Path to the torch (flashlight) LED
    PB_TORCH_PATH := "/sys/class/leds/led:torch_0"
    # Maximum brightness level for the torch LED
    PB_TORCH_MAX_BRIGHTNESS := 500
else ifeq ($(LAZY_TARGET_RECOVERY_TYPE), ofrp)
    ## OFRP Configuration
    # Set the locale to ensure consistent behavior and character encoding
    LC_ALL := C.UTF-8
    ## Build settings
    # Use TWRP's recovery image builder
    FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
    # Target architecture is arm64
    TARGET_ARCH := arm64
    # Maintainer's name
    OF_MAINTAINER := LazymeaoProjects
    # Version of OrangeFox
    FOX_VERSION := v0.1.2
    # Variant based on Legacy Support
    FOX_VARIANT := $(if $(filter true,$(LAZY_SUPPORT_LEGACY_BUILD)),A9-To-A11,A12.1-To-A15)
    # Build type is stable
    FOX_BUILD_TYPE := Stable
    ## Decryption settings
    # Do not reload after decryption
    OF_NO_RELOAD_AFTER_DECRYPTION := 1
    # Run post-format processes
    OF_RUN_POST_FORMAT_PROCESS := 1
    # Fix decryption on data media
    OF_FIX_DECRYPTION_ON_DATA_MEDIA := 1
    # Skip decryption adopted storage
    OF_SKIP_DECRYPTED_ADOPTED_STORAGE := 1
    # Keep DM Verity and forced encryption
    OF_KEEP_DM_VERITY_FORCED_ENCRYPTION := 1
    ## Screen notch and status bar settings
    # Screen height
    OF_SCREEN_H := 2340
    # Status bar height
    OF_STATUS_H := 100
    # Status bar left indent
    OF_STATUS_INDENT_LEFT := 48
    # Status bar right indent
    OF_STATUS_INDENT_RIGHT := 48
    # Clock position (top right)
    OF_CLOCK_POS := 1
    # Do not allow disabling of navbar
    OF_ALLOW_DISABLE_NAVBAR := 0
    # Hide notch
    OF_HIDE_NOTCH := 1
    ## Reduce OrangeFox size
    # Remove aapt tool to reduce size
    FOX_REMOVE_AAPT := 1
    # Remove busybox binary to reduce size
    FOX_REMOVE_BUSYBOX_BINARY := 1
    # Delete AromaFM to reduce size
    FOX_DELETE_AROMAFM := 1
    # Delete Magisk addon to reduce size
    FOX_DELETE_MAGISK_ADDON := 1
    ## Compatibility and feature settings
    # Do not check Treble compatibility
    OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
    # Do not show MIUI patch warning
    OF_NO_MIUI_PATCH_WARNING := 1
    # Disable MIUI-specific features
    OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
    # Remove Samsung-specific features
    FOX_NO_SAMSUNG_SPECIAL := 1
    # Disable App Manager
    FOX_DISABLE_APP_MANAGER := 1
    ## Device settings
    # Alternative device names
    TARGET_DEVICE_ALT := RMX1851,RMX1851EX,RMX1851EU,RMX1851EUEX,RMX1851CN,nicky
    # Include quick backup list for restoring critical partitions
    OF_QUICK_BACKUP_LIST := /rboot;
    # Enable TWRP compatibility mode
    OF_TWRP_COMPATIBILITY_MODE := 1
    # Use TWRP's SAR detection
    OF_USE_TWRP_SAR_DETECT := 1
    # Check overwrite attempts
    OF_CHECK_OVERWRITE_ATTEMPTS := 1
    # Enable advanced security features
    OF_ADVANCED_SECURITY := 1
    # Skip OrangeFox process
    OF_SKIP_ORANGEFOX_PROCESS := 1
    # Disable auto reboot after installation
    FOX_INSTALLER_DISABLE_AUTOREBOOT := 1
    # Support OZIP decryption
    OF_SUPPORT_OZIP_DECRYPTION := 1
    ## Tools
    # Use bash shell
    FOX_USE_BASH_SHELL := 1
    # Use ash as bash
    FOX_ASH_IS_BASH := 1
    # Use tar binary
    FOX_USE_TAR_BINARY := 1
    # Use sed binary
    FOX_USE_SED_BINARY := 1
    # Use xz utilities
    FOX_USE_XZ_UTILS := 1
    # Replace toolbox getprop with full getprop
    FOX_REPLACE_TOOLBOX_GETPROP := 1
    # Use nano editor
    FOX_USE_NANO_EDITOR := 1
    # Enable LP tools
    OF_ENABLE_LPTOOLS := 1
else ifeq ($(LAZY_TARGET_RECOVERY_TYPE), shrp)
    ## TWRP-specific flags here
    # Add TW_DEVICE_VERSION
    TW_DEVICE_VERSION := v0.1.2
    ## SHRP Configuration
    # Device codename
    SHRP_DEVICE_CODE := RMX1851
    # Path of your SHRP device tree
    SHRP_PATH := $(DEVICE_PATH)
    # Maintainer name
    SHRP_MAINTAINER := LazymeaoProjects
    # Recovery Type (for "About" section only)
    SHRP_REC_TYPE := SAR
    # Recovery path
    SHRP_REC := /dev/block/bootdevice/by-name/recovery
    # Use this flag only if SHRP_REC is set
    SHRP_HAS_RECOVERY_PARTITION := true
    ## Emergency DownLoad mode
    SHRP_EDL_MODE := 1
    # Internal storage path
    SHRP_INTERNAL := /sdcard
    # External SDcard path
    SHRP_EXTERNAL := /sdcard1
    # USB OTG path
    SHRP_OTG := /usb_otg
    # Flashlight
    SHRP_FLASH := 1
    ## For notch devices
    SHRP_NOTCH := true
    # SHRP Express, enables on-the-fly theme patching (also persistent) + persistent lock
    SHRP_EXPRESS := true
    # SHRP Express use Data save shrp files inside /data instead of /system
    # Note - SHRP_EXPRESS must be true to use this flag otherwise it won't work.
    SHRP_EXPRESS_USE_DATA := true
    # SHRP Dark mode, use this flag to have dark theme set by default
    SHRP_DARK := true
    # Custom led paths for flashlight
    SHRP_CUSTOM_FLASHLIGHT := true
    SHRP_FONP_1 := /sys/class/leds/led:torch_0/brightness
    SHRP_FONP_2 := /sys/class/leds/led:torch_1/brightness
    SHRP_FONP_3 := /sys/class/leds/led:switch_0/brightness
    # Max brightness of flashlight
    SHRP_FLASH_MAX_BRIGHTNESS := 500
    ## Addon - Substratum Overlay (OMS -Normal- disabler)
    SHRP_SKIP_DEFAULT_ADDON_1 := true
    # Addon - Substratum Overlay (OMS -legacy- disabler)
    SHRP_SKIP_DEFAULT_ADDON_2 := true
    # Addon - Clear Fingerprint (remove fingerprint lock from system)
    # To store this addon into the recovery ramdisk instead set to "true" here.
    INC_IN_REC_ADDON_3 := true
    # Addon - Force Encryption (remove force encryption from your device)
    # To store this addon into the recovery ramdisk instead set to "true" here.
    INC_IN_REC_ADDON_4 := true
    # To hide the prebuilt magisk flash option from recovery, set value to "true".
    SHRP_EXCLUDE_MAGISK_FLASH := true
endif
