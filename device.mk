# Copyright 2014 The Android Open Source Project
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

# Device path
DEVICE_PATH := device/motorola/rhodep/rootdir

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=420

# Brightness
SOONG_CONFIG_qtidisplay_brightness := true

# Device characteristics
DEVICE_CHARACTERISTICS += hfr

# Fingerprint
TARGET_USES_EGISTEC_FINGERPRINT := true
TARGET_USES_FOCAL_FINGERPRINT := true

# Model
PRODUCT_MODEL := moto g(82)

# Modules
BOOT_KERNEL_MODULES := \
    sm5602_fg_mmi.ko \
    sgm4154x_charger.ko \
    bq2589x_charger.ko \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    touchscreen_mmi.ko \
    goodix_brl_mmi.ko \
    rt_pd_manager.ko

# NFC
TARGET_USES_SEC_NFC := true

# Overlays
PRODUCT_PACKAGES += \
    Settings \
    overlay \
    WifiResCommon

# Power
TARGET_IS_BLAIR := true

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml


# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4350-common/platform.mk)


# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/rhodep/rhodep-vendor.mk)

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages


