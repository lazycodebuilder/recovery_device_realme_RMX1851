#!/system/bin/sh
#
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

# Function to set SELinux to permissive mode
set_permissive() {
  setenforce 0 && echo "I:postrecoveryboot: SELinux set to permissive." >> /tmp/recovery.log || echo "E:postrecoveryboot: Failed to set SELinux to permissive." >> /tmp/recovery.log
}

# Function to check firmware
firmware_check()
{
  if grep -q androidboot.prjname /proc/cmdline; then
      echo "I:postrecoveryboot: Detected realme UI 2 firmware" >> /tmp/recovery.log
      resetprop ro.device.latest_fw true
  else
      echo "I:postrecoveryboot: Detected realme UI 1 firmware" >> /tmp/recovery.log
      resetprop ro.device.latest_fw false
  fi
}

# Function to set properties
properties()
{
  echo "I:postrecoveryboot: Setting up props for $CODENAME" >> /tmp/recovery.log
  resetprop "ro.boot.prjname" "$PRJNAME"
  resetprop "ro.build.product" "$CODENAME"
  resetprop "ro.product.name" "$CODENAME"
  resetprop "ro.product.model" "$CODENAME"
  resetprop "ro.product.device" "$CODENAME"
  resetprop "ro.product.product.device" "$CODENAME"
  resetprop "ro.vendor.product.device.oem" "$CODENAME"
  resetprop "ro.commonsoft.ota" "$PRJNAME"
  resetprop "ro.separate.soft" "$PRJNAME"
}

load_properties()
{
  PRJNAME=18621
  CODENAME=RMX1851
  properties
}

# Main script execution
set_permissive
firmware_check
load_properties

exit 0