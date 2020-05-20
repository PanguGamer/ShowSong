export TARGET=iphone:clang:13.4

ARCHS = arm64
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ShowSong

ShowSong_FILES = Tweak.x MusicViewController.m
ShowSong_CFLAGS = -fobjc-arc
ShowSong_PRIVATE_FRAMEWORKS = MediaRemote

include $(THEOS_MAKE_PATH)/tweak.mk
