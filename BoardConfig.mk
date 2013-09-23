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

TARGET_GLOBAL_CFLAGS   += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS   += -DQCOM_NO_SECURE_PLAYBACK -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS   += -DQCOM_HARDWARE -DNO_UPDATE_PREVIEW -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DHTCLOG
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DMSMFB_METADATA_GET

# Arch related defines and optimizations
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a5
TARGET_ARCH_VARIANT_FPU := neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HAVE_NEON := true
TARGET_BOOTLOADER_BOARD_NAME := protou

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel (dont use the kernel built because it is incompatible with 4.4.3)
TARGET_KERNEL_SOURCE := kernel/htc/protou
TARGET_KERNEL_CONFIG := cm_protou_defconfig
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x03200000
BOARD_KERNEL_PAGE_SIZE := 2048

# Additional libraries
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_PROVIDES_LIBAUDIO := true
BOARD_QCOM_VOIP_ENABLED := true

# Fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 419430400 #it will remove the large boot.img error
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8909824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1004535296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1291845120
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
BOARD_VOLD_MAX_PARTITIONS := 36
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/protou/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/htc/protou/bluetooth/vnd_protou.txt

TARGET_SPECIFIC_HEADER_PATH := device/htc/protou/include

# OpenGL drivers config file path
BOARD_EGL_CFG := device/htc/protou/config/egl.cfg

# Media 
TARGET_QCOM_MEDIA_VARIANT := legacy

# Bluetooth/Wifi
-include device/htc/protou/bcmdhd.mk

# Misc
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true


# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_QCOM_BSP := true
BOARD_USE_SKIA_LCDTEXT := true

TARGET_USES_ION := true #we have it on JB kernel :)

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/htc/protou/ramdisk/fstab.protou

#incase the above one doesnt work then use the one given below and put # behind above one
RECOVERY_FSTAB_VERSION = 2 

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USES_LEGACY_RIL := true

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true


# Add h/w acceleration in browser
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
TARGET_FORCE_CPU_UPLOAD := true

# Touch screen compatibility for JB
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Custom liblights
TARGET_PROVIDES_LIBLIGHT := true

# Keep Size in check
SMALLER_FONT_FOOTPRINT := true

# Power
TARGET_PROVIDES_POWERHAL := true

# FM Radio
#BOARD_HAVE_QCOM_FM := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED
