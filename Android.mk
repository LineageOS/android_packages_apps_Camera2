LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_JAVA_LIBRARIES := android-support-v13
LOCAL_STATIC_JAVA_LIBRARIES += android-ex-camera2-portability
LOCAL_STATIC_JAVA_LIBRARIES += xmp_toolkit
LOCAL_STATIC_JAVA_LIBRARIES += glide
LOCAL_STATIC_JAVA_LIBRARIES += guava
LOCAL_STATIC_JAVA_LIBRARIES += jsr305

LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_SRC_FILES += $(call all-java-files-under, src_pd)
LOCAL_SRC_FILES += $(call all-java-files-under, src_pd_gcam)

LOCAL_RESOURCE_DIR += \
	$(LOCAL_PATH)/res \
	$(LOCAL_PATH)/res_p


include $(LOCAL_PATH)/version.mk
LOCAL_AAPT_FLAGS := \
        --auto-add-overlay \
        --version-name "$(version_name_package)" \
        --version-code $(version_code_package) \

LOCAL_PACKAGE_NAME := Camera2
LOCAL_CERTIFICATE := platform

LOCAL_PRIVILEGED_MODULE := true

#LOCAL_SDK_VERSION := current

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

# Guava uses deprecated org.apache.http.legacy classes.
LOCAL_JAVA_LIBRARIES += org.apache.http.legacy

LOCAL_JNI_SHARED_LIBRARIES := libjni_tinyplanet libjni_jpegutil

include $(BUILD_PACKAGE)

### FAKE RULES FOR ANDROID STUDIO SUPPORT

include $(CLEAR_VARS)
LOCAL_MODULE := GenerateStudioFiles-Camera2
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_SUFFIX := -timestamp

camera2_system_deps_framework := $(call java-lib-deps,framework)

camera2_system_libs_path := $(abspath $(LOCAL_PATH))/system_libs

include $(BUILD_SYSTEM)/base_rules.mk

.PHONY: copy_camera2_system_deps
copy_camera2_system_deps: $(camera2_system_deps_framework)
	$(hide) mkdir -p $(camera2_system_libs_path)
	$(hide) rm -rf $(camera2_system_libs_path)/*.jar
	$(hide) cp $(camera2_system_deps_framework) $(camera2_system_libs_path)/framework.jar

$(LOCAL_BUILT_MODULE): copy_camera2_system_deps
	$(hide) echo "Fake: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) touch $@

### FAKE RULES FOR ANDROID STUDIO SUPPORT END

include $(call all-makefiles-under, $(LOCAL_PATH))
