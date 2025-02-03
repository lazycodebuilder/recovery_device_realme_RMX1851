# TWRP Recovery for Realme 3 Pro (RMX1851)

A custom recovery tree for the Realme 3 Pro (codename: RMX1851), supporting TWRP, PBRP, OFRP, and SHRP recovery projects.

![Realme RMX1851](https://github.com/lazycodebuilder/devices/blob/e71f50743449fc5786d64df2d350b192b3d47373/RMX1851.png)

## Device Specifications

| Component | Details |
|-----------|---------|
| SoC | Qualcomm Snapdragon 710 (SDM710) |
| CPU | Kryo 360: 2x Cortex-A75 @ 2.2 GHz + 6x Cortex-A55 @ 1.7 GHz |
| GPU | Qualcomm Adreno 616 @ 504 MHz |
| Memory | 4/6 GB RAM @ 1866 MHz |
| Storage | 64/128 GB |
| Display | 6.3" IPS LCD, 1080 x 2340 pixels (24-bit) |
| Battery | 4045 mAh Li-Polymer |
| Dimensions | 156.8 x 74.2 x 8.3 mm |
| Stock OS | ColorOS 6.0 (Android 9.0 Pie) |

## Features Status

All core recovery features are fully functional:

- Display & Touch: Working with correct screen size, brightness control, and screen timeout
- Storage Operations: Backup/restore, MTP, USB mass storage, support for EROFS/F2FS/EXT4/exFAT/FAT32/NTFS
- System Functions: Data decryption, partition handling, ADB sideload, fastbootd
- Hardware Features: Battery monitoring, vibration control, USB-OTG support
- Recovery Operations: All flash/wipe/mount functions working correctly
- Additional Features: Screenshot capability, advanced recovery features

## Build Instructions

1. Set up build environment variables:
```bash
# Required: Set recovery project type
export LAZY_TARGET_RECOVERY_TYPE=twrp  # Options: twrp, pbrp, ofrp, shrp

# Optional flags
export LAZY_SUPPORT_LEGACY_BUILD=false  # Legacy build support
export LAZY_INCLUDE_DEBUG_FLAGS=false   # Debug flags inclusion
```

2. Initialize build environment:
```bash
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export SOONG_VERBOSE=true
```

3. Build recovery (choose one):
```bash
# For TWRP/SHRP
lunch twrp_RMX1851-eng && mka recoveryimage -j"$(nproc --all)" 2>&1 | tee out/r3p-rec.log

# For PBRP
lunch twrp_RMX1851-eng && mka pbrp -j"$(nproc --all)" 2>&1 | tee out/r3p-rec.log

# For OFRP
lunch twrp_RMX1851-eng && mka adbd recoveryimage -j"$(nproc --all)" 2>&1 | tee out/r3p-rec.log
```

The output log will be saved to `out/r3p-rec.log` for debugging purposes.