ARCHS = armv7 arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = wiredock

wiredock_FILES = Tweak.x
wiredock_CFLAGS = -fobjc-arc
wiredock_LIBRARIES = colorpicker


include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += wiredockprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
