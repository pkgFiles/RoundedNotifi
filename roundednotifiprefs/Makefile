ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:14.5

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RoundedNotifiPrefs

RoundedNotifiPrefs_FRAMEWORKS = SwiftUI
RoundedNotifiPrefs_FILES = $(shell find Sources/RoundedNotifiPrefs -name '*.swift') $(shell find Sources/RoundedNotifiPrefsC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
RoundedNotifiPrefs_SWIFTFLAGS = -ISources/RoundedNotifiPrefsC/include
RoundedNotifiPrefs_INSTALL_PATH = /Library/PreferenceBundles
RoundedNotifiPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
