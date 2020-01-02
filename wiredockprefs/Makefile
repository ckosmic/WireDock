ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = wiredockprefs

wiredockprefs_FILES = WDKRootListController.m
wiredockprefs_INSTALL_PATH = /Library/PreferenceBundles
wiredockprefs_FRAMEWORKS = UIKit
wiredockprefs_PRIVATE_FRAMEWORKS = Preferences
wiredockprefs_CFLAGS = -fobjc-arc
wiredockprefs_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/wiredockprefs.plist$(ECHO_END)
