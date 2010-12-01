# Generic leshakmod product
PRODUCT_NAME := CyanogenMod
PRODUCT_BRAND := criminal
PRODUCT_DEVICE := generic

# Use edify for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=amend

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.heapsize=30m

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# mobile interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0

#scan interval
PRODUCT_PROPERTY_OVERRIDES += \
wifi.supplicant_scan_interval=90

PRODUCT_PACKAGES += \
    ADWLauncher \
    CMParts \
    CMPartsHelper \
    CMStats \
    CMWallpapers \
    FileManager \
    Stk \
    Superuser

ifeq ($(BOARD_HAVE_FM_RADIO),true)
    PRODUCT_PACKAGES += \
    FM
endif

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/spica/overlay/spica

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    device/samsung/spica/prebuilt/common/bin/remount:system/bin/remount \
    device/samsung/spica/prebuilt/common/bin/compcache:system/bin/compcache \
    device/samsung/spica/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    device/samsung/spica/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    device/samsung/spica/prebuilt/common/etc/init.d/01xmister:system/etc/init.d/01xmister \
    device/samsung/spica/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    device/samsung/spica/prebuilt/common/etc/init.d/04apps2sd:system/etc/init.d/04apps2sd \
    device/samsung/spica/prebuilt/common/etc/init.d/05apps2sdoff:system/etc/init.d/05apps2sdoff \
    device/samsung/spica/prebuilt/common/etc/init.d/07userinit:system/etc/init.d/07userinit \
    device/samsung/spica/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    device/samsung/spica/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    device/samsung/spica/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    device/samsung/spica/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    device/samsung/spica/prebuilt/common/etc/profile:system/etc/profile \
    device/samsung/spica/prebuilt/common/xbin/bash:system/xbin/bash \
    device/samsung/spica/prebuilt/common/xbin/htop:system/xbin/htop \
    device/samsung/spica/prebuilt/common/xbin/lsof:system/xbin/lsof \
    device/samsung/spica/prebuilt/common/xbin/nano:system/xbin/nano \
    device/samsung/spica/prebuilt/common/xbin/powertop:system/xbin/powertop \
    device/samsung/spica/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

SPICA_WITH_GOOGLE:=true
# I'll always build with gapps :)
ifdef SPICA_WITH_GOOGLE

    PRODUCT_COPY_FILES += \
	vendor/spica/proprietary/CarHomeGoogle.apk:system/app/CarHomeGoogle.apk \
	vendor/spica/proprietary/CarHomeLauncher.apk:system/app/CarHomeLauncher.apk \
	vendor/spica/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
	vendor/spica/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
	vendor/spica/proprietary/Facebook.apk:system/app/Facebook.apk \
	vendor/spica/proprietary/features.xml:system/etc/permissions/features.xml \
	vendor/spica/proprietary/GenieWidget.apk:system/app/GenieWidget.apk \
	vendor/spica/proprietary/Gmail.apk:system/app/Gmail.apk \
	vendor/spica/proprietary/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
	vendor/spica/proprietary/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
	vendor/spica/proprietary/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
	vendor/spica/proprietary/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
	vendor/spica/proprietary/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
	vendor/spica/proprietary/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
	vendor/spica/proprietary/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
	vendor/spica/proprietary/googlevoice.apk:system/app/googlevoice.apk \
	vendor/spica/proprietary/HtcCopyright.apk:system/app/HtcCopyright.apk \
	vendor/spica/proprietary/HtcEmailPolicy.apk:system/app/HtcEmailPolicy.apk \
	vendor/spica/proprietary/HtcSettings.apk:system/app/HtcSettings.apk \
	vendor/spica/proprietary/kickback.apk:system/app/kickback.apk \
	vendor/spica/proprietary/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
	vendor/spica/proprietary/libspeech.so:system/lib/libspeech.so \
	vendor/spica/proprietary/libvoicesearch.so:system/lib/libvoicesearch.so \
	vendor/spica/proprietary/Maps.apk:system/app/Maps.apk \
	vendor/spica/proprietary/MarketUpdater.apk:system/app/MarketUpdater.apk \
	vendor/spica/proprietary/MediaUploader.apk:system/app/MediaUploader.apk \
	vendor/spica/proprietary/NetworkLocation.apk:system/app/NetworkLocation.apk \
	vendor/spica/proprietary/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
	vendor/spica/proprietary/PassionQuickOffice.apk:system/app/PassionQuickOffice.apk \
	vendor/spica/proprietary/SetupWizard.apk:system/app/SetupWizard.apk \
	vendor/spica/proprietary/soundback.apk:system/app/soundback.apk \
	vendor/spica/proprietary/Street.apk:system/app/Street.apk \
	vendor/spica/proprietary/Talk.apk:system/app/Talk.apk \
	vendor/spica/proprietary/talkback.apk:system/app/talkback.apk \
	vendor/spica/proprietary/Twitter.apk:system/app/Twitter.apk \
	vendor/spica/proprietary/Vending.apk:system/app/Vending.apk \
	vendor/spica/proprietary/VoiceSearch.apk:system/app/VoiceSearch.apk \
	vendor/spica/proprietary/YouTube.apk:system/app/YouTube.apk
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
	vendor/spica/CHANGELOG:system/etc/CHANGELOG.txt

PRODUCT_COPY_FILES += \
	vendor/cyanogen/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

#
# Copy bootanimation
#
PRODUCT_COPY_FILES += \
	device/samsung/spica/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
