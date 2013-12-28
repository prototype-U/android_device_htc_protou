# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/protou/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH  := 480

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Inherit device configuration
$(call inherit-product, device/htc/protou/protou.mk)

PRODUCT_RELEASE_NAME := Desire X
PRODUCT_VERSION_DEVICE_SPECIFIC := -Protou

# Product name
PRODUCT_NAME := cm_protou
PRODUCT_BRAND := htc_europe
PRODUCT_DEVICE := protou
PRODUCT_MODEL := Desire X
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=protou BUILD_ID=JRO03C BUILD_FINGERPRINT=ro.build.fingerprint=htc_europe/protou/protou:4.1.1/JRO03C/162361.3:user/release-keys
PRIVATE_BUILD_DESC="2.20.401.3 CL162361 release-keys"
