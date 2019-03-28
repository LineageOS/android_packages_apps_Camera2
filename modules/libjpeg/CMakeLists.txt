cmake_minimum_required(VERSION 3.4.1)

enable_language(ASM)
set(SRC_DIR_jpeg_static_ndk ${CMAKE_CURRENT_LIST_DIR}/libjpeg-turbo)

############
# jpeg_static_ndk

if (${ANDROID_ABI} STREQUAL "armeabi-v7a")
    set(jpeg_static_ndk_ARCH_SRC ${SRC_DIR_jpeg_static_ndk}/simd/jsimd_arm_neon.S ${SRC_DIR_jpeg_static_ndk}/simd/jsimd_arm.c)
    set_property(SOURCE jsimd_arm_neon.S PROPERTY LANGUAGE C)
elseif (${ANDROID_ABI} STREQUAL "arm64-v8a")
    set(jpeg_static_ndk_ARCH_SRC ${SRC_DIR_jpeg_static_ndk}/simd/jsimd_arm64_neon.S ${SRC_DIR_jpeg_static_ndk}/simd/jsimd_arm64.c)
    set_property(SOURCE jsimd_arm64_neon.S PROPERTY LANGUAGE C)
endif ()

add_library(
        jpeg_static_ndk
        STATIC

        ${jpeg_static_ndk_ARCH_SRC}
        ${SRC_DIR_jpeg_static_ndk}/jcapimin.c
        ${SRC_DIR_jpeg_static_ndk}/jcapistd.c
        ${SRC_DIR_jpeg_static_ndk}/jaricom.c
        ${SRC_DIR_jpeg_static_ndk}/jcarith.c
        ${SRC_DIR_jpeg_static_ndk}/jccoefct.c
        ${SRC_DIR_jpeg_static_ndk}/jccolor.c
        ${SRC_DIR_jpeg_static_ndk}/jcdctmgr.c
        ${SRC_DIR_jpeg_static_ndk}/jchuff.c
        ${SRC_DIR_jpeg_static_ndk}/jcinit.c
        ${SRC_DIR_jpeg_static_ndk}/jcmainct.c
        ${SRC_DIR_jpeg_static_ndk}/jcmarker.c
        ${SRC_DIR_jpeg_static_ndk}/jcmaster.c
        ${SRC_DIR_jpeg_static_ndk}/jcomapi.c
        ${SRC_DIR_jpeg_static_ndk}/jcparam.c
        ${SRC_DIR_jpeg_static_ndk}/jcphuff.c
        ${SRC_DIR_jpeg_static_ndk}/jcprepct.c
        ${SRC_DIR_jpeg_static_ndk}/jcsample.c
        ${SRC_DIR_jpeg_static_ndk}/jctrans.c
        ${SRC_DIR_jpeg_static_ndk}/jdapimin.c
        ${SRC_DIR_jpeg_static_ndk}/jdapistd.c
        ${SRC_DIR_jpeg_static_ndk}/jdarith.c
        ${SRC_DIR_jpeg_static_ndk}/jdatadst.c
        ${SRC_DIR_jpeg_static_ndk}/jdatasrc.c
        ${SRC_DIR_jpeg_static_ndk}/jdcoefct.c
        ${SRC_DIR_jpeg_static_ndk}/jdcolor.c
        ${SRC_DIR_jpeg_static_ndk}/jddctmgr.c
        ${SRC_DIR_jpeg_static_ndk}/jdhuff.c
        ${SRC_DIR_jpeg_static_ndk}/jdinput.c
        ${SRC_DIR_jpeg_static_ndk}/jdmainct.c
        ${SRC_DIR_jpeg_static_ndk}/jdmarker.c
        ${SRC_DIR_jpeg_static_ndk}/jdmaster.c
        ${SRC_DIR_jpeg_static_ndk}/jdmerge.c
        ${SRC_DIR_jpeg_static_ndk}/jdphuff.c
        ${SRC_DIR_jpeg_static_ndk}/jdpostct.c
        ${SRC_DIR_jpeg_static_ndk}/jdsample.c
        ${SRC_DIR_jpeg_static_ndk}/jdtrans.c
        ${SRC_DIR_jpeg_static_ndk}/jerror.c
        ${SRC_DIR_jpeg_static_ndk}/jfdctflt.c
        ${SRC_DIR_jpeg_static_ndk}/jfdctfst.c
        ${SRC_DIR_jpeg_static_ndk}/jfdctint.c
        ${SRC_DIR_jpeg_static_ndk}/jidctflt.c
        ${SRC_DIR_jpeg_static_ndk}/jidctfst.c
        ${SRC_DIR_jpeg_static_ndk}/jidctint.c
        ${SRC_DIR_jpeg_static_ndk}/jidctred.c
        ${SRC_DIR_jpeg_static_ndk}/jmemmgr.c
        ${SRC_DIR_jpeg_static_ndk}/jmemnobs.c
        ${SRC_DIR_jpeg_static_ndk}/jquant1.c
        ${SRC_DIR_jpeg_static_ndk}/jquant2.c
        ${SRC_DIR_jpeg_static_ndk}/jutils.c
)

set_target_properties(jpeg_static_ndk PROPERTIES COMPILE_FLAGS "-Werror -Wno-unused-parameter -O3 -fstrict-aliasing -D__ARM_HAVE_NEON__")

# jpeg_static_ndk
############
