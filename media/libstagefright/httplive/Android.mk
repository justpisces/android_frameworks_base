LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_BOARD_PLATFORM), sun4i)
    LOCAL_CFLAGS += -DALLWINNER_HARDWARE
endif

LOCAL_SRC_FILES:=               \
        LiveDataSource.cpp      \
        LiveSession.cpp         \
        M3UParser.cpp           \

LOCAL_C_INCLUDES:= \
	$(JNI_H_INCLUDE) \
	$(TOP)/frameworks/base/include/media/stagefright/openmax \
        $(TOP)/frameworks/base/media/libstagefright \
        $(TOP)/external/openssl/include

LOCAL_MODULE:= libstagefright_httplive

ifeq ($(TARGET_ARCH),arm)
    LOCAL_CFLAGS += -Wno-psabi
endif

include $(BUILD_STATIC_LIBRARY)
