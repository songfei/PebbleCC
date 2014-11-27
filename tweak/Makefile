ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = ChineseMessage4Pebble
ChineseMessage4Pebble_FILES = Tweak.xm
ChineseMessage4Pebble_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 BTLEServer SpringBoard"
