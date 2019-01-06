DEVICE_PATH := device/xiaomi/libra
BOARD_PLATFORM := msm8992

# Get non-open-source specific aspects
$(call inherit-product, device/xiaomi/msm8994-common/msm8994-common.mk)
$(call inherit-product, vendor/xiaomi/libra/libra-vendor.mk)

# System properties
-include $(DEVICE_PATH)/system_prop.mk

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/vendor/etc/permissions/android.hardware.consumerir.xml

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/media/media_codecs_performance.xml:system/vendor/etc/media_codecs_performance.xml

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:system/vendor/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:system/vendor/etc/mixer_paths.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/uinput-fpc.kl:system/vendor/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/configs/uinput-fpc.idc:system/vendor/usr/idc/uinput-fpc.idc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/vendor/etc/permissions/android.hardware.fingerprint.xml

# IRQ
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/ft5x46.kl:system/vendor/usr/keylayout/ft5x46.kl \
    $(DEVICE_PATH)/keylayout/atmel-maxtouch.kl:system/vendor/usr/keylayout/atmel-maxtouch.kl \
    $(DEVICE_PATH)/keylayout/atmel-maxtouch-edge.kl:system/vendor/usr/keylayout/atmel-maxtouch-edge.kl \
    $(DEVICE_PATH)/keylayout/synaptics_dsx.kl:system/vendor/usr/keylayout/synaptics_dsx.kl \
    $(DEVICE_PATH)/keylayout/synaptics_dsx_edge.kl:system/vendor/usr/keylayout/synaptics_dsx_edge.kl

# EdgeGesture
PRODUCT_PACKAGES += \
    EdgeGesture

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8992

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Ramdisk
PRODUCT_PACKAGES += \
    init.fpc.rc \
    init.target.rc
