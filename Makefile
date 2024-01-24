TARGET := iphone:clang:latest:14.5
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RoundedNotifi

RoundedNotifi_FILES = $(shell find Sources/RoundedNotifi -name '*.swift') $(shell find Sources/RoundedNotifiC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
RoundedNotifi_SWIFTFLAGS = -ISources/RoundedNotifiC/include
RoundedNotifi_CFLAGS = -fobjc-arc -ISources/RoundedNotifiC/include

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += roundednotifiprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
