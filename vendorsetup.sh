#!/bin/bash
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0

[ -z "$TARGET_RECOVERY_TYPE" ] && export TARGET_RECOVERY_TYPE=twrp-a9 || return

[ "$TARGET_RECOVERY_TYPE" = "*rp-a9" ] && export INCLUDE_PREBUILT_ICU_LIBS=true || export INCLUDE_PREBUILT_ICU_LIBS=false

[ "$TARGET_RECOVERY_TYPE" = "pbrp-a9" ] && export INCLUDE_FASTBOOTD=false || export INCLUDE_FASTBOOTD=true

[ -z "$INCLUDE_DEBUG_FLAGS" ] && export INCLUDE_DEBUG_FLAGS=false || return

# TWRP Configuration
case "$TARGET_RECOVERY_TYPE" in
  "twrp*")
      ## TWRP-specific flags here
      # Add TW_DEVICE_VERSION
      export TW_DEVICE_VERSION="v0.1.2 | LazymeaoProjects"
      # Statusbar icons flags
      export TW_STATUS_ICONS_ALIGN=center
      export TW_CUSTOM_CPU_POS=40
      export TW_CUSTOM_CLOCK_POS=300
      export TW_CUSTOM_BATTERY_POS=810
      ;;
  "pbrp*")
      ## PBRP Configuration
      # Disable default DM-Verity
      export PB_DISABLE_DEFAULT_DM_VERITY=true
      # Disable default Treble compatibility
      export PB_DISABLE_DEFAULT_TREBLE_COMP=true
      # Disable default AVB2 patching
      export PB_DISABLE_DEFAULT_PATCH_AVB2=true
      # Path to the torch (flashlight) LED
      export PB_TORCH_PATH="/sys/class/leds/led:torch_0"
      # Maximum brightness level for the torch LED
      export PB_TORCH_MAX_BRIGHTNESS=500
      ;;
  "ofrp*")
      ## OFRP Configuration
      # Set the locale to ensure consistent behavior and character encoding
      export LC_ALL="C.UTF-8"
      ## Build settings
      # Use TWRP's recovery image builder
      export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
      # Target architecture is arm64
      export TARGET_ARCH=arm64
      # Maintainer's name
      export OF_MAINTAINER="LazymeaoProjects"
      # Version of OrangeFox
      export FOX_VERSION="v0.1.2"
      # Android variant compatibility
      [ "$TARGET_RECOVERY_TYPE" = "ofrp-a9" ] && export FOX_VARIANT="A9-To-A11" || export FOX_VARIANT="12.1-To-A15"
      # Build type is stable
      export FOX_BUILD_TYPE="Stable"
      ## Decryption settings
      # Do not reload after decryption
      export OF_NO_RELOAD_AFTER_DECRYPTION=1
      # Run post-format processes
      export OF_RUN_POST_FORMAT_PROCESS=1
      # Fix decryption on data media
      export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
      # Skip decryption adopted storage
      export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1
      # Keep DM Verity and forced encryption
      export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
      ## Screen notch and status bar settings
      # Screen height
      export OF_SCREEN_H=2340
      # Status bar height
      export OF_STATUS_H=100
      # Status bar left indent
      export OF_STATUS_INDENT_LEFT=48
      # Status bar right indent
      export OF_STATUS_INDENT_RIGHT=48
      # Clock position (top right)
      export OF_CLOCK_POS=1
      # Do not allow disabling of navbar
      export OF_ALLOW_DISABLE_NAVBAR=0
      # Hide notch
      export OF_HIDE_NOTCH=1
      ## Reduce OrangeFox size
      # Remove aapt tool to reduce size
      export FOX_REMOVE_AAPT=1
      # Remove busybox binary to reduce size
      export FOX_REMOVE_BUSYBOX_BINARY=1
      # Delete AromaFM to reduce size
      export FOX_DELETE_AROMAFM=1
      # Delete Magisk addon to reduce size
      export FOX_DELETE_MAGISK_ADDON=1
      ## Compatibility and feature settings
      # Do not check Treble compatibility
      export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
      # Do not show MIUI patch warning
      export OF_NO_MIUI_PATCH_WARNING=1
      # Disable MIUI-specific features
      export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
      # Remove Samsung-specific features
      export FOX_NO_SAMSUNG_SPECIAL=1
      # Disable App Manager
      export FOX_DISABLE_APP_MANAGER=1
      ## Device settings
      # Alternative device names
      export TARGET_DEVICE_ALT="RMX1851,RMX1851EX,RMX1851EU,RMX1851EUEX,RMX1851CN,nicky"
      # Include quick backup list for restoring critical partitions
      export OF_QUICK_BACKUP_LIST="/rboot;"
      # Enable TWRP compatibility mode
      export OF_TWRP_COMPATIBILITY_MODE=1
      # Use TWRP's SAR detection
      export OF_USE_TWRP_SAR_DETECT=1
      # Check overwrite attempts
      export OF_CHECK_OVERWRITE_ATTEMPTS=1
      # Enable advanced security features
      export OF_ADVANCED_SECURITY=1
      # Skip OrangeFox process
      export OF_SKIP_ORANGEFOX_PROCESS=1
      # Disable auto reboot after installation
      export FOX_INSTALLER_DISABLE_AUTOREBOOT=1
      # Support OZIP decryption
      export OF_SUPPORT_OZIP_DECRYPTION=1
      ## Tools
      # Use bash shell
      export FOX_USE_BASH_SHELL=1
      # Use ash as bash
      export FOX_ASH_IS_BASH=1
      # Use tar binary
      export FOX_USE_TAR_BINARY=1
      # Use sed binary
      export FOX_USE_SED_BINARY=1
      # Use xz utilities
      export FOX_USE_XZ_UTILS=1
      # Replace toolbox getprop with full getprop
      export FOX_REPLACE_TOOLBOX_GETPROP=1
      # Use nano editor
      export FOX_USE_NANO_EDITOR=1
      # Enable LP tools
      export OF_ENABLE_LPTOOLS=1
      ;;
  "shrp*")
      ## TWRP-specific flags here
      # Add TW_DEVICE_VERSION
      export TW_DEVICE_VERSION=v0.1.2
      ## SHRP Configuration
      # Device codename
      export SHRP_DEVICE_CODE=RMX1851
      # Path of your SHRP device tree
      export SHRP_PATH=$(DEVICE_PATH)
      # Maintainer name
      export SHRP_MAINTAINER=LazymeaoProjects
      # Recovery Type (for "About" section only)
      export SHRP_REC_TYPE=SAR
      # Recovery path
      export SHRP_REC=/dev/block/bootdevice/by-name/recovery
      # Use this flag only if SHRP_REC is set
      export SHRP_HAS_RECOVERY_PARTITION=true
      ## Emergency DownLoad mode
      export SHRP_EDL_MODE=1
      # Internal storage path
      export SHRP_INTERNAL=/sdcard
      # External SDcard path
      export SHRP_EXTERNAL=/sdcard1
      # USB OTG path
      export SHRP_OTG=/usb_otg
      # Flashlight
      export SHRP_FLASH=1
      ## For notch devices
      export SHRP_NOTCH=true
      # SHRP Express, enables on-the-fly theme patching (also persistent) + persistent lock
      export SHRP_EXPRESS=true
      # SHRP Express use Data save shrp files inside /data instead of /system
      # Note - SHRP_EXPRESS must be true to use this flag otherwise it won't work.
      export SHRP_EXPRESS_USE_DATA=true
      # SHRP Dark mode, use this flag to have dark theme set by default
      export SHRP_DARK=true
      # Custom led paths for flashlight
      export SHRP_CUSTOM_FLASHLIGHT=true
      export SHRP_FONP_1=/sys/class/leds/led:torch_0/brightness
      # Max brightness of flashlight
      export SHRP_FLASH_MAX_BRIGHTNESS=500
      ## Addon - Substratum Overlay (OMS -Normal- disabler)
      export SHRP_SKIP_DEFAULT_ADDON_1=true
      # Addon - Substratum Overlay (OMS -legacy- disabler)
      export SHRP_SKIP_DEFAULT_ADDON_2=true
      # Addon - Clear Fingerprint (remove fingerprint lock from system)
      # To store this addon into the recovery ramdisk instead set to "true" here.
      export INC_IN_REC_ADDON_3=true
      # Addon - Force Encryption (remove force encryption from your device)
      # To store this addon into the recovery ramdisk instead set to "true" here.
      export INC_IN_REC_ADDON_4=true
      # To hide the prebuilt magisk flash option from recovery, set value to "true".
      export SHRP_EXCLUDE_MAGISK_FLASH=true
      ;;
    *) echo -e "No specific recovery type matched" ;;
esac
