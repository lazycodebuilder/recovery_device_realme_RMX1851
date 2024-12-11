# Twrp Recovery Tree For Realme 3 Pro (RMX1851)

## Specifications

Component Type | Details
--------------:|:-------
SoC | Qualcomm Snapdragon 710 (SDM710)
CPU | 2x 2.2 GHz Cortex-A75, 6x 1.7 GHz Cortex-A55 (Kryo 360)
GPU | Qualcomm Adreno 616, 504 MHz
RAM | 4 GB, 6 GB, 1866 MHz
Storage | 64 GB, 128 GB
Display | 6.3 in, IPS, 1080 x 2340 pixels, 24 bit
Dimensions | 74.2 x 156.8 x 8.3 mm
Battery | 4045 mAh, Li-Polymer
OS | ColorOS 6.0 (Android 9.0 Pie)

![Realme RMX1851](https://github.com/lazycodebuilder/devices/blob/e71f50743449fc5786d64df2d350b192b3d47373/RMX1851.png)

# Status
Current state of features:
- [x] Correct screen/recovery size
- [x] Working touch, display
- [x] Screen goes off and on
- [x] Backup/restore to/from internal/external storage and adb
- [x] Poweroff
- [x] Reboot to system, bootloader, recovery, fastboot, edl
- [x] ADB (including sideload)
- [x] Support EROFS/F2FS/EXT4/exFAT/FAT32/NTFS
- [x] Decrypt /data
- [x] Flashing zip/images
- [x] MTP export
- [x] All important partitions listed in wipe/mount/backup lists
- [x] Input devices via USB-OTG
- [x] USB mass storage export
- [x] Correct date
- [x] Battery level
- [x] Set brightness
- [x] Vibrate and set vibration
- [x] Fastbootd
- [x] Screenshot
- [x] Advanced features

## Build Instructions
```sh
export LAZY_TARGET_RECOVERY_TYPE=twrp #set twrp, pbrp, ofrp or shrp depends on recovery project
export LAZY_SUPPORT_LEGACY_BUILD=false #optional  flag: set false or true depens on branch
export LAZY_INCLUDE_DEBUG_FLAGS=false #optional  flag
# necessary build config
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true && export SOONG_VERBOSE=true
lunch twrp_RMX1851-userdebug && mka adbd recoveryimage | tee out/r3p-rec.log
or
lunch twrp_RMX1851-userdebug && mka pbrp | tee out/r3p-rec.log
or
lunch twrp_RMX1851-eng && mka adbd recoveryimage | tee out/r3p-rec.log
```