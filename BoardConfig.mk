#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

#
# Product-specific compile-time definitions.
#

# Define LOCAL_PATH
LOCAL_PATH := device/samsung/degas3g

# Specific Header
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert 
TARGET_OTA_ASSERT_DEVICE := degas3g,degas3gxx

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_USES_MRVL_HARDWARE := true
TARGET_BOARD_PLATFORM := mrvl
TARGET_BOOTLOADER_BOARD_NAME := PXA1088

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := initrd=0x01400000, 12m rw uart_dma vmalloc=0x10000000 hwdfc=1 qhd_lcd=1 touch_type=0 androidboot.hardware=pxa1088 ddr_mode=1 atcmdmode=1 androidboot.emmc_checksum=3 androidboot.lcd=WVGA androidboot.selinux=disabled

TARGET_BOARD_INFO_FILE := device/samsung/degas3g/board-info.txt

# cFlags
COMMON_GLOBAL_CFLAGS += -DMRVL_HARDWARE
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2224029696
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5230297088
BOARD_FLASH_BLOCK_SIZE := 131072

# MMC Device
BOARD_CACHE_DEVICE := /dev/block/platform/soc.2/by-name/CACHE
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/platform/soc.2/by-name/SYSTEM
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/platform/soc.2/by-name/USER
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw

# Audio
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true

# Camera 
USE_CAMERA_STUB := true

# Graphics

# Build and enable the OpenGL ES View renderer. When running on the emulator,
# the GLES renderer disables itself if host GL acceleration isn't available.
USE_OPENGL_RENDERER := true

# Set the phase offset of the system's vsync event relative to the hardware
# vsync. The system's vsync event drives Choreographer and SurfaceFlinger's
# rendering. This value is the number of nanoseconds after the hardware vsync
# that the system vsync event will occur.
VSYNC_EVENT_PHASE_OFFSET_NS := 0

# Build and enable the GalCore renderer. Vivante has an Tegra2 Extension 
# for graphics rendering and this device (red. degas3g) use
# Vivante GC1000 GPU.
ENABLE_HWC_GC_PATH := true

BOARD_EGL_CFG := device/samsung/degas3g/configs/egl.cfg
BOARD_HAVE_PIXEL_FORMAT_INFO := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_USE_MHEAP_SCREENSHOT := true

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# HealthD
BOARD_HAL_STATIC_LIBRARIES := libhealthd.mrvl

# Legacy MMAP for pre-lollipop blobs
BOARD_USES_LEGACY_MMAP := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/samsung/degas3g
TARGET_KERNEL_CONFIG := cyanogenmod_degas3g_defconfig
BOARD_CUSTOM_MKBOOTIMG := device/samsung/degas3g/tools/degas-mkbootimg
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/degas3g/degas_mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --dt device/samsung/degas3g/rootdir/boot.img-dt --ramdisk_offset 0x01000000

# LPM
BOARD_CHARGING_MODE_BOOTING_LPM := true

# CM Hardware
BOARD_HARDWARE_CLASS := device/samsung/degas3g/cmhw

# Dex
# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
    	WITH_DEXPREOPT := true
    endif
  endif
endif

# Vold
BOARD_VOLD_MAX_PARTITIONS := 17
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/degas3g/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl8887
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mrvl8887
BOARD_WLAN_DEVICE := mrvl8887
BOARD_WLAN_VENDOR := MRVL
WIFI_SDIO_IF_DRIVER_MODULE_PATH  := "/system/lib/modules/mlan.ko"
WIFI_SDIO_IF_DRIVER_MODULE_NAME  := "mlan"
WIFI_SDIO_IF_DRIVER_MODULE_ARG   := ""
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/sd8xxx.ko"
WIFI_DRIVER_MODULE_NAME := "sd8xxx"
WIFI_DRIVER_MODULE_ARG  := "drv_mode=5 cfg80211_wext=0xc sta_name=wlan uap_name=wlan wfd_name=p2p max_uap_bss=1 fw_name=mrvl/sd8887_uapsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/proc/mwlan/config"
WIFI_DRIVER_FW_PATH_STA := "drv_mode=5"
WIFI_DRIVER_FW_PATH_AP :=  "drv_mode=6"
WIFI_DRIVER_FW_PATH_P2P := "drv_mode=5"
MRVL_WIRELESS_DAEMON_API := true

# Security
BOARD_USES_SECURE_SERVICES := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/lt02wifi/sepolicy

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
TARGET_RECOVERY_FSTAB := device/samsung/degas3g/rootdir/fstab.pxa1088
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/degas3g
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/degas-common/BoardConfigVendor.mk
