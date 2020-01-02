INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = wiredock

wiredock_FILES = Tweak.x
wiredock_CFLAGS = -fobjc-arc


include $(THEOS_MAKE_PATH)/tweak.mk
