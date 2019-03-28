cmake_minimum_required(VERSION 3.4.1)

# include libjpeg-turbo module
include("${CMAKE_CURRENT_LIST_DIR}/../modules/libjpeg/CMakeLists.txt")

set(srcdir ${CMAKE_CURRENT_LIST_DIR})
set(CAMERA_COMMON_FLAGS "-Wall -Wextra -Werror -ffast-math -O3 -funroll-loops")

find_library(lib-dl dl)
find_library(lib-jnigraphics jnigraphics)
find_library(lib-log log)

############
# jpegutil
add_library(
        jni_jpegutil
        SHARED

        ${srcdir}/jpegutil.cpp
        ${srcdir}/jpegutilnative.cpp
)

# include headers from jpeg_static_ndk
target_include_directories(jni_jpegutil PRIVATE ${SRC_DIR_jpeg_static_ndk})

set_target_properties(jni_jpegutil PROPERTIES COMPILE_FLAGS "${CAMERA_COMMON_FLAGS}")

target_link_libraries(
        jni_jpegutil

        ${lib-dl}
        ${lib-jnigraphics}
        ${lib-log}
        jpeg_static_ndk
)
# jpegutil
############

############
# tinyplanet
add_library(
        jni_tinyplanet
        SHARED

        ${srcdir}/tinyplanet.cc
)

set_target_properties(jni_tinyplanet PROPERTIES COMPILE_FLAGS "${CAMERA_COMMON_FLAGS}")

target_link_libraries(
        jni_tinyplanet

        ${lib-jnigraphics}
        ${lib-log}
)
# tinyplanet
############
