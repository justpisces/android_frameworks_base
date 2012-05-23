LOCAL_PATH:= $(call my-dir)

#
# libmediaplayerservice
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    MediaRecorderClient.cpp     \
    MediaPlayerService.cpp      \
    MetadataRetrieverClient.cpp \
    TestPlayerStub.cpp          \
    MidiMetadataRetriever.cpp   \
    MidiFile.cpp                \
    StagefrightPlayer.cpp       \
    StagefrightRecorder.cpp

LOCAL_SHARED_LIBRARIES :=     		\
	libcutils             			\
	libutils              			\
	libbinder             			\
	libvorbisidec         			\
	libsonivox            			\
	libmedia              			\
	libcamera_client      			\
	libandroid_runtime    			\
	libstagefright        			\
	libstagefright_omx    			\
	libstagefright_foundation       \
	libgui                          \
	libdl

LOCAL_STATIC_LIBRARIES := \
        libstagefright_nuplayer                 \
        libstagefright_rtsp                     \

LOCAL_C_INCLUDES :=                                                 \
	$(JNI_H_INCLUDE)                                                \
	$(call include-path-for, graphics corecg)                       \
	$(TOP)/frameworks/base/include/media/stagefright/openmax \
	$(TOP)/frameworks/base/media/libstagefright/include             \
	$(TOP)/frameworks/base/media/libstagefright/rtsp                \
	$(TOP)/external/tremolo/Tremolo \

ifeq ($(TARGET_BOARD_PLATFORM), sun4i)
LOCAL_CFLAGS += -DALLWINNER_HARDWARE

LOCAL_SRC_FILES += CedarAPlayerWrapper.cpp \
        CedarPlayer.cpp             \
        SimpleMediaFormatProbe.cpp  \
#

LOCAL_SHARED_LIBRARIES += libCedarX \
        libCedarA \
#

LOCAL_C_INCLUDES += \
        $(TOP)/external/cedarx/CedarXAndroid/IceCreamSandwich \
        $(TOP)/external/cedarx/CedarX/include \
        $(TOP)/external/cedarx/CedarX/include/include_audio \
        $(TOP)/external/cedarx/CedarX/include/include_cedarv \
        $(TOP)/external/cedarx/CedarA \
        $(TOP)/external/cedarx/CedarA/include \
#
endif

LOCAL_MODULE:= libmediaplayerservice

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))

