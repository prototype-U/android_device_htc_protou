# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from the proprietary version
-include vendor/htc/protou/BoardConfigVendor.mk

USE_CAMERA_STUB := true
BOARD_VENDOR := htc

TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS   += -DQCOM_NO_SECURE_PLAYBACK -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS   += -DQCOM_HARDWARE -DNO_UPDATE_PREVIEW

# Arch related defines and optimizations
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_HAVE_TSLIB := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := protou
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_SPARROW_BIONIC_OPTIMIZATION := true

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x03200000
BOARD_KERNEL_PAGE_SIZE := 2048

# Additional libraries
TARGET_PROVIDES_LIBAUDIO := true
BOARD_PREBUILT_LIBAUDIO := false

#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 00c7f600 00000200 "recovery"
#mmcblk0p27: 00fffc00 00000200 "boot"
#mmcblk0p24: 3bdffe00 00000200 "system"
#mmcblk0p26: 0f000000 00000200 "cache"
#mmcblk0p25: 4cfffe00 00000200 "userdata"
#mmcblk0p28: 017ade00 00000200 "devlog"
#mmcblk0p30: 00040000 00000200 "pdata"
#mmcblk0p31: 46800000 00000200 "fat"
#mmcblk0p29: 00011c00 00000200 "extra"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8909824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1004535296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1291845120
BOARD_FLASH_BLOCK_SIZE := 131072

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/htc/protou
TARGET_KERNEL_CONFIG := atis112_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3

# Vold
BOARD_VOLD_MAX_PARTITIONS := 36
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/protou/bluetooth

TARGET_SPECIFIC_HEADER_PATH := device/htc/protou/include

# OpenGL drivers config file path
BOARD_EGL_CFG := device/htc/protou/config/egl.cfg

# Wifi related definitions
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4330_b2.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4330_apsta_b2.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4330_p2p_b2.bin"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/firmware/fw_bcm4330_b2.bin nvram_path=/etc/calibration iface_name=wlan0"
WIFI_BAND                        := 802_11_BG
BOARD_LEGACY_NL80211_STA_EVENTS  := true

# Misc
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := protou
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics & CAF
COMMON_GLOBAL_CFLAGS += -DANCIENT_GL
USE_OPENGL_RENDERER := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_QCOM_HDMI_OUT := false
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_USES_PMEM := true
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_GENLOCK := true
TARGET_USES_OVERLAY := true
BOARD_USE_QCOM_LLVM_CLANG_RS := true
TARGET_NO_HW_VSYNC := true
TARGET_USES_ION := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p31
BOARD_USES_MMCUTILS := true

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USES_LEGACY_RIL := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_INITRC := device/htc/protou/recovery/init.recovery.rc
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/protou/recovery/graphics.c
# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Touch screen compatibility for JB
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Custom liblights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_PROVIDES_POWERHAL := true
