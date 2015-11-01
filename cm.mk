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

# Release name
PRODUCT_RELEASE_NAME := degas3g

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/degas3g/full_degas3g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := degas3g
PRODUCT_NAME := cm_degas3g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T231
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=degas3gxx \
    TARGET_DEVICE=degas3g \
    BUILD_FINGERPRINT="samsung/degas3gxx/degas3g:4.4.2/KOT49H/T231XXU0ANJ4:user/release-keys" \
    PRIVATE_BUILD_DESC="degas3gxx-user 4.4.2 KOT49H T231XXU0ANJ4 release-keys"
